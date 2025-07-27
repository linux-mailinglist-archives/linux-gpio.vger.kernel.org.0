Return-Path: <linux-gpio+bounces-23856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF29B13186
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 21:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F7223BA925
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 19:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3A9223316;
	Sun, 27 Jul 2025 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRviUR+8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE6D21E0A8;
	Sun, 27 Jul 2025 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753643999; cv=none; b=OEzSPKAVVNB6a7oLtuSJsrdghi/tlJD9HRi1oGsXL91tFwW+5dlcVVojf+HNwFIvgHcZhki8sljt6XNU4h1KmVdJ3IVN0qBlT/8Y/S8XA8idfnFIz6qnbl+LEMZsRkz6naYiq+HYlJcCyg240K+IaomlboXZS7NN78zVfF8Zj/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753643999; c=relaxed/simple;
	bh=ODQad/kLebqtWcgou3DFGpBib/gjsX4M3+AiroUgXOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljwZo6Djn36OFF/DmOpu6+sceWB14mKGZyKk06kY0ejHdBKLtTzKKlPQ5ADMX1FjMlDU6BgjLlhloae0edfhTWBkWorlZ3JQgSpto8tHLVHfH2tzU2q/so9eKoa16XcNM2L46hOqC7+2yJsfYdh+lLHumX4gyS/V2kZMJJAdvLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRviUR+8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753643998; x=1785179998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ODQad/kLebqtWcgou3DFGpBib/gjsX4M3+AiroUgXOs=;
  b=FRviUR+8bGTISj1QxV+JqdMHItlTPdKDfFcPs5G3ilGiXupsgVDUEAjY
   vAOHPkSM/sTRJ2dedP2BQdnUWLd0WpzDXyoTwlR3SI1KT5mgZzwGgI6Sl
   aEUtEqmVvNo1RWSvm9r0otA4wi9nHVyQcMY5iPtvepufvvcRYmwS+C3JK
   IjguS845BrrUoZffosv/pZX6AAJusSJ7H/Vu8IqDSr9kU1/sq7taxWBq+
   VqKHYPdyhQ/agzqE6wP5cAn8RHY0gFMp14acuYOhRrIOfT/WRaaFJzmVf
   mG2vOzuPpKXZfS6VHO8k7FastxE6zSXP9G/ms8erY+gOTSiTf59Q6sNsP
   w==;
X-CSE-ConnectionGUID: /GPk1INoRFWR2vew0C/c5w==
X-CSE-MsgGUID: wzrn8mrsS4elBsrxTIabhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="58518747"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58518747"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:19:57 -0700
X-CSE-ConnectionGUID: Wlqgd4GMRi2rWUo+AG9GTw==
X-CSE-MsgGUID: ftSqS2g5RKOKTsUxssggWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193215578"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.124])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:19:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 821F111FAF5;
	Sun, 27 Jul 2025 22:19:49 +0300 (EEST)
Date: Sun, 27 Jul 2025 19:19:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 14/24] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
Message-ID: <aIZ71TZM9wUGlGoU@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <20250718152500.2656391-15-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718152500.2656391-15-demonsingur@gmail.com>

Hi Cosmin,

On Fri, Jul 18, 2025 at 06:24:50PM +0300, Cosmin Tanislav wrote:
> The MAX9296A deserializer converts single or dual serial inputs to MIPI
> CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
> in the forward direction and 187.5Mbps in the reverse direction.
> In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
> GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
> GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
> GMSL1 links. The serial inputs operate independently, allowing videos
> with different timings and resolutions to be received on each input.

C-PHY or D-PHY? I'd assume the latter?

> 
> MAX96716A supports both tunnel and pixel mode.
> MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/media/i2c/maxim,max9296a.yaml    | 242 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> new file mode 100644
> index 0000000000000..4f2b3b5b69cf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> @@ -0,0 +1,242 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Collabora Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/maxim,max9296a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX9296A GMSL2 to CSI-2 Deserializer
> +
> +maintainers:
> +  - Cosmin Tanislav <cosmin.tanislav@analog.com>
> +
> +description: >
> +  The MAX9296A deserializer converts single or dual serial inputs to
> +  MIPI CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps
> +  or 6Gbps in the forward direction and 187.5Mbps in the reverse
> +  direction. In GMSL1 mode, each serial link can be paired with 3.12Gbps
> +  or 1.5Gbps GMSL1 serializers or operate up to 4.5Gbps with GMSL2
> +  serializers with GMSL1 backward compatibility. The MAX9296A supports
> +  mixed GMSL2 and GMSL1 links. The serial inputs operate independently,
> +  allowing videos with different timings and resolutions to be received
> +  on each input.
> +
> +  MAX96716A supports both tunnel and pixel mode.
> +
> +  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max9296a
> +      - maxim,max96716a
> +      - maxim,max96792a
> +
> +  reg:
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description: Specifier for the GPIO connected to the PWDNB pin.
> +
> +  port0-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 0
> +
> +  port1-poc-supply:
> +    description: Regulator providing Power over Coax for GMSL port 1
> +
> +  i2c-alias-pool:
> +    maxItems: 2
> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^i2c@[0-1]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@[0-1]$':
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: GMSL Input ports 0-1
> +
> +      '^port@[2-3]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output ports 0-1
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              lane-polarities:
> +                minItems: 1

With D-PHY, 2 is the minimum.

> +                maxItems: 5
> +
> +              link-frequencies:
> +                maxItems: 1
> +
> +            required:
> +              - data-lanes
> +
> +    anyOf:
> +      - required:
> +          - port@2
> +      - required:
> +          - port@3
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +dependentRequired:
> +  i2c-atr: [i2c-alias-pool]
> +  i2c-alias-pool: [i2c-atr]
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        deserializer@28 {
> +            compatible = "maxim,max9296a";
> +            reg = <0x28>;
> +            powerdown-gpios = <&main_gpio0 37 GPIO_ACTIVE_LOW>;
> +
> +            i2c-alias-pool = <0x40 0x41>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    des_gmsl_in_0: endpoint {
> +                        remote-endpoint = <&ser_0_gmsl_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    des_gmsl_in_1: endpoint {
> +                        remote-endpoint = <&ser_1_gmsl_out>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    des_csi_out: endpoint {
> +                        data-lanes = <1 2 3 4>;
> +                        link-frequencies = /bits/ 64 <400000000>;
> +                        remote-endpoint = <&csi_in>;
> +                    };
> +                };
> +            };
> +
> +            i2c-atr {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                i2c@0 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <0>;
> +
> +                    serializer@40 {
> +                        compatible = "maxim,max96717", "maxim,max96717f";
> +                        reg = <0x40>;
> +                        gpio-controller;
> +                        #gpio-cells = <2>;
> +                        #clock-cells = <0>;
> +
> +                        ports {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            port@0 {
> +                                reg = <0>;
> +                                ser_0_csi_in: endpoint {
> +                                    data-lanes = <1 2>;
> +                                    remote-endpoint = <&sensor_0_out>;
> +                                };
> +                            };
> +
> +                            port@1 {
> +                                reg = <1>;
> +                                ser_0_gmsl_out: endpoint {
> +                                    remote-endpoint = <&des_gmsl_in_0>;
> +                                };
> +                            };
> +                        };
> +                    };
> +                };
> +
> +                i2c@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <1>;
> +
> +                    serializer@40 {
> +                        compatible = "maxim,max96717", "maxim,max96717f";
> +                        reg = <0x40>;
> +                        gpio-controller;
> +                        #gpio-cells = <2>;
> +                        #clock-cells = <0>;
> +
> +                        ports {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            port@0 {
> +                                reg = <0>;
> +                                ser_1_csi_in: endpoint {
> +                                    data-lanes = <1 2>;
> +                                    remote-endpoint = <&sensor_1_out>;
> +                                };
> +                            };
> +
> +                            port@1 {
> +                                reg = <1>;
> +                                ser_1_gmsl_out: endpoint {
> +                                    remote-endpoint = <&des_gmsl_in_1>;
> +                                };
> +                            };
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93e22dfd61c17..0eb1729ae1647 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14783,6 +14783,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
>  F:	drivers/iio/proximity/mb1232.c
>  
> +MAXIM GMSL2/3 SERIALIZERS AND DESERIALIZERS
> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> +
>  MAXIM MAX11205 DRIVER
>  M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
>  L:	linux-iio@vger.kernel.org

-- 
Kind regards,

Sakari Ailus

