Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DB93F10E8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 05:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbhHSDDm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 23:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbhHSDDl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 23:03:41 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748DFC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 20:03:05 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id r26so6573370oij.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 20:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oLtmGWWWFpy0RrcCLUcbKoN2iq+DyMnqMq+mMo4DPc4=;
        b=eangeZEGbtS69BS4hN/L+x7MnIZ8dMi46+6iuZFfHLBX2wwl5y6oWH6Vf6wOLJayeu
         OPfonrfs7f+MMVUmvYb2sEH+dC2baGKAn1mqncorX+ueqV2rLSfdAs/U5xZSC50XLC/w
         N7YXYEIrK2+JqGNPOPEeByI756min3FkQJ9UgtutLBuNYOwQ4rCUcXyJAvFPrgw7RIrY
         H7Zpp8R5MJZz21lamrc8IJCO8BAGVEY7xd5FrcVrOqkNLIPTvS5esUDmP8UBqO1yJ8i5
         EX31ASk7UEpM1JNc41WXtS6UyDJQtT7Qb1Y5zrbiuUH6cbE7vSZIKiQ/JeKLfOenHeuP
         eL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oLtmGWWWFpy0RrcCLUcbKoN2iq+DyMnqMq+mMo4DPc4=;
        b=q8Y+rhSfxfwY3rdUgnmvMBpdYWFdsxv/Gm3dPAF5V1gfel69ORMaTR80334qRUGP1P
         x3GJT96iXrCaZSjGLzt3Itgsogsbdwrft233GA4T3/QeqJftDQ1E6L1iyMCjurHpNQX9
         E7AArKGMZdi9xtsKOA+RBbXhrIg2a3M9tYhYYWiJTNCCbLwZzLUWxF8ws8AjT0yDfC/u
         GaUA9L3i6HZleGZXtgcP7pHjv6IotJrQnAX7bTC62HYDEltZopAtUYOCLAC2aJcWqnmm
         arJT+6meqFq1hqTSuoStofz/uyrcMwTgBD5OXTzzUVOy/IZus9OoMeNwNwMjduC0ozAw
         9ylg==
X-Gm-Message-State: AOAM531HkSEwpUQ6u57QTzOm0X3rmbUFYTH6a146liYEFJUk+hxs2jra
        mifDEDh5caw2t1pfOZ5vuJoFzw==
X-Google-Smtp-Source: ABdhPJzCCQcupwH4mOOFBHjl11BaWd+S5X0W91b9Y+9RFM8yUV8G/G+t8Ov9Nw/Bu8UbM4AsfBGugw==
X-Received: by 2002:aca:1a0f:: with SMTP id a15mr991874oia.42.1629342184854;
        Wed, 18 Aug 2021 20:03:04 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w14sm436276otl.58.2021.08.18.20.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 20:03:04 -0700 (PDT)
Date:   Wed, 18 Aug 2021 22:03:02 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SDX65 pinctrl
 bindings
Message-ID: <YR3J5jHr2CTTU92D@builder.lan>
References: <cover.1626987605.git.quic_vamslank@quicinc.com>
 <341f8af967fb0c699996a8f73d34c2b8bd0789cc.1626987605.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <341f8af967fb0c699996a8f73d34c2b8bd0789cc.1626987605.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 22 Jul 16:18 CDT 2021, quic_vamslank@quicinc.com wrote:
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
[..]
> +'$defs':
> +  qcom-sdx65-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"

The last part doesn't seem right and this gives us the following
possible values gpio0-9, gpio10-99, gpio100-106 and gpio110-116.

I think the correct pattern would be:
	"^gpio([0-9]|[1-9][0-9]|10[0-9])$"


[..]
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        tlmm: pinctrl@f100000{

Please include a space between the unit address and '{'.

> +                compatible = "qcom,sdx65-tlmm";
> +                reg = <0x03000000 0xdc2000>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 109>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                serial-pins {
> +                        pins = "gpio8", "gpio9";
> +                        function = "blsp_uart3";
> +                        drive-strength = <2>;
> +                        bias-disable;
> +                };
> +
> +		uart-w-subnodes-state {

This line is indented with tabs, the rest with spaces.

With those changes this looks really good.

Thanks,
Bjorn
