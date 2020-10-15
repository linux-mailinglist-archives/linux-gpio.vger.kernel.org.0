Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8AD228F1CE
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 14:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgJOMFI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 08:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgJOMFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 08:05:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD41DC061755;
        Thu, 15 Oct 2020 05:05:07 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a5so2830754ljj.11;
        Thu, 15 Oct 2020 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b84hsRMoXS6GSIJgvfo2S0Egn1CWq+Hpix6sK2IAdUE=;
        b=M9pJeRxWl/yzHIyVox8DH1/36P4oGErk7sMFdyEZekt4dWZSdmimLtSAx+AVZmf29u
         j+8kssj4JNre8sIqmrLLZElE9YkOeSjXvejl/F1a5MryXWtsdg5I8BgEo+ospPwV+VwC
         f7NVefdUm+SkIPSkOmoWF5fUjO/Ugjx37AgGm/sVpMVB5J3OsfSXF8RGdzVAFwb50oU1
         ZXTRFtX3qtNLgoLtvewOvHwDDY7tPS7dyYA/Yye62dAhp40wo13id8JKWEq8jCkd8D21
         RKerY4o82571VLersFP83OuHuOrND8iT1eME1mpPn0B4X+v90jcbB09ont9P3Bf5G1BE
         baoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b84hsRMoXS6GSIJgvfo2S0Egn1CWq+Hpix6sK2IAdUE=;
        b=U3zRRhB62QQpvrt4s5z1dDsQliPw9jCgiUbuoDD6kyuTDY/sMsh8FApqxMM9QwYZB/
         GbueC+OMdwOGTFxoIiLllR9K/pnaVyG7oEdiasJ4M17JDUZy5jN4tMhPwr7Dg/IR+Do7
         UBIhnLZrmjjJXIpkLUJ5IEH9xAXZmcLxEY414f3tYW5taE98LIAucynsYrBNYRgGpmv+
         GiMAM4BH8qqlrduZIKnKrLgRb5RNLY+XLY2dU3p6vRoOEa50573VomB5xf9xcAYwTn9f
         lGlg81xTrV0aqxlgZkF8zGe0djW8inAKJcEjqkGJAVLgJCkCbsHw05c1SOruRSWf01rH
         ZuBQ==
X-Gm-Message-State: AOAM531ct0URv4LeyxkALFBwLnk9YWgL4PJup+WHJ0I6BXlOwzIJHQ3i
        5AkUvFub1gmAN+BDVMJjUN0=
X-Google-Smtp-Source: ABdhPJwwt3EyjuYq57Lukv1Wqv/KyjW0MQ9OTploRIduCcyLajK657qmY9eO1Kj6MoiwK7QuR74ZqQ==
X-Received: by 2002:a2e:864c:: with SMTP id i12mr1075757ljj.396.1602763505518;
        Thu, 15 Oct 2020 05:05:05 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id x4sm1213347ljj.62.2020.10.15.05.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 05:05:04 -0700 (PDT)
Date:   Thu, 15 Oct 2020 15:04:57 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] dt-bindings: gpio: dw-apb: remove never-used
 "snps,dw-apb-gpio-port"
Message-ID: <20201015120457.qaooft5y5dzl4z7s@mobilestation>
References: <20201015115524.24e3c36b@xhacker.debian>
 <20201015115903.2a782f78@xhacker.debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015115903.2a782f78@xhacker.debian>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 11:59:03AM +0800, Jisheng Zhang wrote:
> The compatible string is never used.

Before sending v2 could you run "make dt_binding_check" for the DT schema
modified in this patch? Like this:

make -j8 ARCH=mips CROSS_COMPILE=mipsel-baikal-linux- dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml

> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
>  Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> index 1240f6289249..76e7b07d592f 100644
> --- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> @@ -50,9 +50,6 @@ patternProperties:
>    "^gpio-(port|controller)@[0-9a-f]+$":
>      type: object
>      properties:

> -      compatible:
> -        const: snps,dw-apb-gpio-port
> -

Yep, you've removed the "compatible" property but forgot to do the same from the
"required:" property of the sub-nodes schema. That's why the suggested
make-command above would have failed during the DT schema examples validation if
you ran it. Please, fix it and resend the series.

>        reg:
>          maxItems: 1

Yeah. Here I've forgotten to add the "reg" property constraints. Since certainly
the controller won't have more than four sub-nodes by design, could you add one
in an additional patch of the series since you'll need to resend the patchset anyway?
Like this:
       reg:
-        maxItems: 1
+        minimum: 0
+        maximum: 3

-Sergey

>  
> @@ -111,7 +108,6 @@ examples:
>        #size-cells = <0>;
>  
>        porta: gpio-port@0 {
> -        compatible = "snps,dw-apb-gpio-port";
>          reg = <0>;
>          gpio-controller;
>          #gpio-cells = <2>;
> @@ -123,7 +119,6 @@ examples:
>        };
>  
>        portb: gpio-port@1 {
> -        compatible = "snps,dw-apb-gpio-port";
>          reg = <1>;
>          gpio-controller;
>          #gpio-cells = <2>;
> -- 
> 2.28.0
> 
