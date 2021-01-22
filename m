Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2210630090E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 17:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbhAVQwh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 11:52:37 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:40287 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729445AbhAVQpD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 11:45:03 -0500
Received: by mail-ot1-f53.google.com with SMTP id i20so5656648otl.7;
        Fri, 22 Jan 2021 08:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pnrEQfhYuBrzK0vLqeOqp/B/gAHb1xQ8W9kS69q0vhc=;
        b=pI8W10DMWEQAItnG4UPTtU0UcZJFUzaFSgeQZTOzZqIMh8CB/ujfPW0DT/VMgEU4x3
         zYTc2S8Y6Ghlle8LSs3oda6PAqW1GlE8eVbW+xSXeqLy/s1K26mI4fy6e7vAVz9AOVNk
         yZ7mAkEUBrt7LuTHmwM5ehoK5j+cdZaX9kOBAfJLg9mKbFK0FrQ4JuECFCOdP/ujwu+a
         3+9J8xZAX/UgubvUCkGoOWaBcb9jjQrqm+/rNQ0I6ErM4ChAQEFJljpW21FPHheOjdH5
         b9VGkuo5ZW079u0g2yxHhxhPMThE65/3i/qxPi3JmpsrM+8dmA9JJOtwisiz87EfCQQ0
         9NaQ==
X-Gm-Message-State: AOAM531stR6Ex3v644ZZr76dFZhJGGvzOa0tpfA/zpD0dPYrAVoiHsfD
        DWTX9+9uuuqD8izccRWgmg==
X-Google-Smtp-Source: ABdhPJxWCkx1VUfDE7OUA/3RFJiCyA1xvZdIVdEX5OCRqoTUAmSOU6tAx5Dp0yfPw2mcrQ4TgUl56g==
X-Received: by 2002:a05:6830:838:: with SMTP id t24mr4018961ots.139.1611333865388;
        Fri, 22 Jan 2021 08:44:25 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q77sm1688312ooq.15.2021.01.22.08.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 08:44:24 -0800 (PST)
Received: (nullmailer pid 939438 invoked by uid 1000);
        Fri, 22 Jan 2021 16:44:23 -0000
Date:   Fri, 22 Jan 2021 10:44:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl
 bindings
Message-ID: <20210122164423.GA931999@robh.at.kernel.org>
References: <20210121171747.3161543-1-vkoul@kernel.org>
 <20210121171747.3161543-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121171747.3161543-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 10:47:46PM +0530, Vinod Koul wrote:
> Add device tree binding Documentation details for Qualcomm SM8350
> pinctrl driver.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> new file mode 100644
> index 000000000000..706bc79db60b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sm8350-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SM8350 TLMM block
> +
> +maintainers:
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer (TLMM) block found
> +  in the SM8350 platform.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8350-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  '#interrupt-cells': true
> +  gpio-controller: true
> +  gpio-reserved-ranges: true
> +  '#gpio-cells': true
> +  gpio-ranges: true
> +  wakeup-parent: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  '-state$':
> +    oneOf:
> +      - $ref: "#/$defs/qcom-sm8350-tlmm-state"
> +      - patternProperties:
> +          ".*":
> +            $ref: "#/$defs/qcom-sm8350-tlmm-state"
> +
> +'$defs':

No need for quotes. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

I'm assuming this passes checks because I can't check due to the 
dependencies.

Rob
