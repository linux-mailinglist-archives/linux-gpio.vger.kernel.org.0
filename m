Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EAD3369A7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 02:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhCKBaF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 20:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhCKB3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 20:29:35 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E98C061574
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 17:29:35 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so2461914pjb.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 17:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wjdYBjcZC3ieNdzUXqsnMw8ogtN08sKrBilA9O+EKkk=;
        b=XZE69Gi4RJOQ3ejhFAWjz9ritQAdN5VSSM2YQX3z6mmwiF6GGwoeIUFQK/Fx3nTyY5
         Ut38H/V5uMs4u/eGyX8n0XHH+0c6DyLHSSTK0vng+A8uyGQ8LAmsIFxvNq8D/JfsDZVH
         WGHX9sEmyTC+q53Wwb4vVxm7O95lUHD8JBZok193EHVugLhI7lUTJ9W8F4LXKLDB+am1
         cTK54IsoNlFHWQpmbrhaIG8AggGkbIHORbUSaeEYufk5S/aovpJzL6+Ijwm+S9jsSOne
         N9P3XM5BsEkINc6F9HPkI1n2/CPM7ExxRglLBMl6QN2RwBI4ngDBfuMzeqIRkWpJD98q
         Z9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wjdYBjcZC3ieNdzUXqsnMw8ogtN08sKrBilA9O+EKkk=;
        b=dcNZo93e2VuQDM+CSLhOxdnf9uiGcslwNjcLQTW0zzei78RiA0qYDdnbzTQqRD9sC7
         ml8KiXu+0CvZlZxctCagF3cjTN/IliRv4PTMLY65ofDNGRZkcPKDhAxRxe37wOVLL9av
         bfDVwaFDyhp6kv5raiu2EyZVWrwZS5isSbLZQv5TV3GZJH0G203bEes4swTHmIaszc8S
         jN7i1mn7fFTVUnuFSxh82MjmZFI82yzjeo7MR+7MyEXShQV+VAy3wzfjU+LTSERCtJJ6
         AfpbAzqSfbcDYnptjGkGwnNpFB26RV1c8bhF8oRGclEgDc1Oi0XJlZfcPdUXseGbUfct
         79Ew==
X-Gm-Message-State: AOAM5311pn3KkhEjTiuLD57AThvLHeg7BWRf0/Mw3R2i9GXT861ijbL2
        Rm3A2SD7GDI5gxhA/Q2fKtFkww==
X-Google-Smtp-Source: ABdhPJxiAYbD18VWCp0M7kbtTitIVa555AjDHtXz9vtWi7urpJBTTNLdrK2gHNtXMcEW8fN+DK38Dw==
X-Received: by 2002:a17:90a:ff0f:: with SMTP id ce15mr6466525pjb.15.1615426174615;
        Wed, 10 Mar 2021 17:29:34 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 63sm645692pfg.187.2021.03.10.17.29.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 17:29:34 -0800 (PST)
Date:   Thu, 11 Mar 2021 09:29:29 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <20210311012928.GU17424@dragon>
References: <20210310111210.1232-1-shawn.guo@linaro.org>
 <YEkdAbWC8/Vszvba@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEkdAbWC8/Vszvba@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 01:24:49PM -0600, Bjorn Andersson wrote:
> > @@ -1588,13 +1610,105 @@ static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
> >  	.nwakeirq_map = ARRAY_SIZE(sc8180x_pdc_map),
> >  };
> >  
> > +static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
> > +	.tiles = sc8180x_tiles,
> > +	.ntiles = ARRAY_SIZE(sc8180x_tiles),
> > +	.pins = sc8180x_pins,
> > +	.npins = ARRAY_SIZE(sc8180x_pins),
> > +	.groups = sc8180x_groups,
> > +	.ngroups = ARRAY_SIZE(sc8180x_groups),
> > +	.reserved_gpios = sc8180x_acpi_reserved_gpios,
> > +	.ngpios = 191,
> 
> As I said before, there really only is 190 things called "GPIO" on this
> platform - the 191 thing is a hack of mine, but it's inclusion here
> should depend on how the ACPI system would reset the UFS device - if it
> does so at all.

No, so far I do not see reset is required for ACPI boot.  I will keep it
as 190 to match hardware spec.

> 
> > +};
> > +
> 
> A comment describing the purpose of this function (to split the
> IORESOURCE_MEM into three) would be in its place.

Okay.

> 
> > +static int sc8180x_pinctrl_add_tile_resources(struct platform_device *pdev)
> > +{
> > +	int nres_num = pdev->num_resources + ARRAY_SIZE(sc8180x_tiles) - 1;
> > +	struct resource *mres, *nres, *res;
> > +	int i, ret;
> > +
> > +	/*
> > +	 * DT already has tiles defined properly, so nothing needs to be done
> > +	 * for DT probe.
> > +	 */
> > +	if (pdev->dev.of_node)
> > +		return 0;
> > +
> > +	/* Allocate for new resources */
> > +	nres = devm_kzalloc(&pdev->dev, sizeof(*nres) * nres_num, GFP_KERNEL);
> > +	if (!nres)
> > +		return -ENOMEM;
> > +
> > +	res = nres;
> > +
> > +	for (i = 0; i < pdev->num_resources; i++) {
> > +		struct resource *r = &pdev->resource[i];
> > +
> > +		/* Save memory resource and copy others */
> > +		if (resource_type(r) == IORESOURCE_MEM)
> > +			mres = r;
> > +		else
> > +			*res++ = *r;
> > +	}
> > +
> > +	/* Append tile memory resources */
> > +	for (i = 0; i < ARRAY_SIZE(sc8180x_tiles); i++, res++) {
> > +		const struct tile_info *info = &sc8180x_tile_info[i];
> > +
> > +		res->start = mres->start + info->offset;
> > +		res->end = mres->start + info->offset + info->size - 1;
> > +		res->flags = mres->flags;
> > +		res->name = sc8180x_tiles[i];
> > +
> > +		/* Add new MEM to resource tree */
> > +		insert_resource(mres->parent, res);
> > +	}
> > +
> > +	/* Remove old MEM from resource tree */
> > +	remove_resource(mres);
> > +
> > +	/* Free old resources and install new ones */
> > +	ret = platform_device_add_resources(pdev, nres, nres_num);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "failed to add new resources: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int sc8180x_pinctrl_probe(struct platform_device *pdev)
> >  {
> > -	return msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
> > +	const struct msm_pinctrl_soc_data *soc_data;
> > +	int ret;
> > +
> > +	soc_data = device_get_match_data(&pdev->dev);
> > +	if (!soc_data)
> > +		return -EINVAL;
> > +
> > +	ret = sc8180x_pinctrl_add_tile_resources(pdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "failed to add tile resources: %d\n", ret);
> 
> sc8180x_pinctrl_add_tile_resources() already printed an error when we
> get here, so no need to print another one.

Sure.

Shawn
