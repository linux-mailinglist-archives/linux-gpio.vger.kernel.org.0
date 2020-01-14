Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84429139F87
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 03:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729190AbgANCdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 21:33:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:56613 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729074AbgANCdd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Jan 2020 21:33:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 18:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,431,1571727600"; 
   d="scan'208";a="219456993"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jan 2020 18:33:31 -0800
Received: from [10.226.38.63] (unknown [10.226.38.63])
        by linux.intel.com (Postfix) with ESMTP id 8856C5803F0;
        Mon, 13 Jan 2020 18:33:31 -0800 (PST)
Subject: Re: [PATCH] pinctrl: dt-bindings: Fix some errors in the lgm and
 pinmux schema
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>
References: <20200113213458.74175-1-linus.walleij@linaro.org>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <c05327e6-f5e1-6b7b-3d56-5a780e20dcaf@linux.intel.com>
Date:   Tue, 14 Jan 2020 10:33:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200113213458.74175-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Thanks a lot Linus. Sorry for the inconvenience.

Hi Rob,

Sorry about the mistake. FWIW, i did run make dt_binding_check and ensured
that CHKDT step passes. But its obvious that i missed something. Let me
figureout what i missed to avoid making same mistakes in future.

Regards,
Rahul


On 14/1/2020 5:34 AM, Linus Walleij wrote:
> This fixes some problems that caused build errors in the
> lgm-io schema file:
>
> - No "bindings" infix in the schema id
> - Move the allOf inclusion for pinconf and pinmux nodes into
>   the patternProperties for the -pins node
> - We want "groups" not "group" to be compulsory for a pinmux
>   node blended with a pin config node.
> - Fix the generic pinmux-schema to list "groups" rather than
>   "group" for a pinmux node, this might have led to some confusion.
>
> This is a first user of the generic schema so a bit of a bumpy
> road.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Rahul Tanwar <rahul.tanwar@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This was applied directly to fix compile errors in -next
> so please advice quickly if I added further bugs...
> ---
>  .../devicetree/bindings/pinctrl/intel,lgm-io.yaml   | 13 ++++++-------
>  .../devicetree/bindings/pinctrl/pinmux-node.yaml    |  2 +-
>  2 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
> index a386fb520510..cd2b436350ef 100644
> --- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/bindings/pinctrl/intel,lgm-io.yaml#
> +$id: http://devicetree.org/schemas/pinctrl/intel,lgm-io.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Intel Lightning Mountain SoC pinmux & GPIO controller binding
> @@ -13,10 +13,6 @@ description: |
>    Pinmux & GPIO controller controls pin multiplexing & configuration including
>    GPIO function selection & GPIO attributes configuration.
>  
> -allOf:
> -  - $ref: pincfg-node.yaml#
> -  - $ref: pinmux-node.yaml#
> -
>  properties:
>    compatible:
>      const: intel,lgm-io
> @@ -28,13 +24,16 @@ properties:
>  patternProperties:
>    '-pins$':
>      type: object
> +    allOf:
> +      - $ref: pincfg-node.yaml#
> +      - $ref: pinmux-node.yaml#
>      description:
>        Pinctrl node's client devices use subnodes for desired pin configuration.
>        Client device subnodes use below standard properties.
>  
>      properties:
>        function: true
> -      group: true
> +      groups: true
>        pins: true
>        pinmux: true
>        bias-pull-up: true
> @@ -46,7 +45,7 @@ patternProperties:
>  
>      required:
>        - function
> -      - group
> +      - groups
>  
>      additionalProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> index 777623a57fd5..732d9075560b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> @@ -114,7 +114,7 @@ properties:
>        specific binding for the hardware defines whether the entries are integers
>        or strings, and their meaning.
>  
> -  group:
> +  groups:
>      $ref: /schemas/types.yaml#/definitions/string-array
>      description:
>        the group to apply the properties to, if the driver supports

