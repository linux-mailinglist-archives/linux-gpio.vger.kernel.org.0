Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267152C4980
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Nov 2020 22:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbgKYVGe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Nov 2020 16:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgKYVGd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Nov 2020 16:06:33 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8969FC0613D4;
        Wed, 25 Nov 2020 13:06:33 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id s9so3722161ljo.11;
        Wed, 25 Nov 2020 13:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z65mTV3wd1m0+J5aDJbKl4qEAvdprN/YafrJptOgaCE=;
        b=cNFxf+LreIVXdicbngEWYJxwxsB0n1AllrBd6GvEHmadso6M7i36Hmy7PSPWftzs2p
         573LIX6iulVzlZUYv2yFZdZNzsxSjPZSL5Qc5RSMM2a3Ae6G5PA1vR/HELOtPsiUlDem
         VnG6lRCjl64LlyF6w2rtYocKvELznBZ06uUz/55gAjAsUDvimxr8Ec5zw/hCjzjz1Tbj
         /FZmcKISTcFW8Lqp7NCLXaXpMUrq6q0qxot/3t/LUbJGd/x8NYpdUbdg2uhvl26BYHLW
         5NU+R9G5uTRMjsNeGA0uaSw8TQpMGr/G8Jj7iGnu9kFioZCtiER3KdzzK9HjriM+AcKw
         F2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z65mTV3wd1m0+J5aDJbKl4qEAvdprN/YafrJptOgaCE=;
        b=qhnZetZiI+p1PiFxyNQc9byNUmKRzAyt2PC+QfP5jXYyXz4nTSX1JjY+I4A0HaGVCY
         dc6dHFUovNQdvcodFHME76aDtVRc5N11HoSbal3MCmzhAw6RQdpNmA4kNIyicehAAac2
         gVzWDLIitJyzpV0Mwfrm5AWh34vZ0XwT/X7mLD6/wMctZg9Jr1xRW3LoQSp+8tk44xwO
         8zhw0kZAunKrYFVBiix5WGZWVG9ptxwdiz3CC64VyOQ+iORaKtV1xf460A4eSfCWQX+U
         SlsnxIU2W4xJsbc1KxYDl7mIG5V7wtWZ8iYW0T2OvoKrMtHLOHTvGVtGJmu99Y1tu4YD
         FRvw==
X-Gm-Message-State: AOAM531/g3X3mJ7lmv7bKcTEs4X5G+y7MlgxGDxt+w1fa87pR5xfiY2s
        SpYaX4u02KcHyHEJl115N1U=
X-Google-Smtp-Source: ABdhPJzthi5Z1t/DpaFwQ0RgO9ztaq/WVepWIoUIhXI7ul/td9tXWiE8/EXJRuAvaaS4U8rT3oSkmQ==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr2039512ljj.347.1606338392063;
        Wed, 25 Nov 2020 13:06:32 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id w123sm54944lff.138.2020.11.25.13.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:06:31 -0800 (PST)
Date:   Thu, 26 Nov 2020 00:06:29 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] of: Fix property supplier parsing
Message-ID: <20201125210629.27al2cjp5jjuj354@mobilestation>
References: <20201119060921.311747-1-damien.lemoal@wdc.com>
 <20201119060921.311747-2-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119060921.311747-2-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 03:09:20PM +0900, Damien Le Moal wrote:
> The DesignWare gpio-dwapb GPIO driver ("snps,dw-apb-gpio" or
> "apm,xgene-gpio-v2" compatible string) defines the now deprecated
> property "snps,nr-gpios" to specify the number of GPIOs available
> on a port. However, if this property is used in a device tree, its
> "-gpios" suffix causes the generic property supplier parsing code to
> interpret it as a cell reference when properties are parsed in
> of_link_to_suppliers(), leading to an error messages such as:
> 
> OF: /soc/bus@50200000/gpio-controller@50200000/gpio-port@0: could not
> find phandle
> 
> Fix this by manually defining a parse_gpios() function which ignores
> this deprecated property that is still present in many device trees,
> skipping the search for the supplier and thus avoiding the device tree
> parsing error.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/of/property.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 408a7b5f06a9..4eefe8efc2fe 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
>  
>  static struct device_node *parse_iommu_maps(struct device_node *np,
>  					    const char *prop_name, int index)
> @@ -1319,6 +1318,21 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
>  	return of_parse_phandle(np, prop_name, (index * 4) + 1);
>  }
>  
> +static struct device_node *parse_gpios(struct device_node *np,
> +				       const char *prop_name, int index)
> +{
> +	/*
> +	 * Quirk for the deprecated "snps,nr-gpios" property of the
> +	 * DesignWare gpio-dwapb GPIO driver: as this property parsing
> +	 * conflicts with the "xx-gpios" phandle reference property, ignore it.
> +	 */

> +	if (strcmp(prop_name, "snps,nr-gpios") == 0)
> +		return NULL;

What about printing the warning from instead of doing that from the driver?
Like this:

+	if (strcmp(prop_name, "snps,nr-gpios") == 0) {
+		pr_warn("%pOF: %s is deprecated in favor of ngpios\n");
+		return NULL;
+	}

So when the property is removed from all dts'es we wouldn't
forget to discard the quirk?

-Sergey

> +
> +	return parse_suffix_prop_cells(np, prop_name, index,
> +				       "-gpios", "#gpio-cells");
> +}
> +
>  static const struct supplier_bindings of_supplier_bindings[] = {
>  	{ .parse_prop = parse_clocks, },
>  	{ .parse_prop = parse_interconnects, },
> -- 
> 2.28.0
> 
