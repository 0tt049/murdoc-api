module Api
  module V1
    class NodesController < ApplicationController
      def classes_at_depth
        class_list = Node.to_depth(params[:ancestry_depth]).where(category: "class")
        render json: class_list.sort_by(&:id)
      end

      def subclasses
        sub = Node.find(params[:id]).children.where(category: "class")
        render json: sub.sort_by(&:id)
      end

      def path_to_root
        class_path = Node.find(params[:id]).ancestor_ids
        render json: class_path
      end

      def instance_methods
        inst_meth = Node.find(params[:id]).children.where(category: "instance_method")
        render json: inst_meth.sort_by(&:name)
      end

      def methods
        meth = Node.find(params[:id]).children.where(category: "method")
        render json: meth.sort_by(&:name)
      end

      def show_doc
        node = Node.find(params[:id])
        render json: node.documentation
      end
    end
  end
end
