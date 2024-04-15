Return-Path: <linux-gpio+bounces-5503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A258A5200
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Apr 2024 15:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 596651F23601
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Apr 2024 13:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6AE71B3A;
	Mon, 15 Apr 2024 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2WMb8IX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A4C2B9C4
	for <linux-gpio@vger.kernel.org>; Mon, 15 Apr 2024 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188612; cv=none; b=MHgBEJQvMVqseJenv4RVvp6ZUyw9u5gcFxWpXAOsdcGvB5te00ootRFOjOxKI9smo9XtJGrlzsNg8DJMxOnXEIrV9sbC9Yay3fkI9/7LCGFOY7BCTSq3CpU7jCJzrl8VhA/edRhUbxpliKkM8mhVG1X5e/n0AWX4ZK9JDHuU9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188612; c=relaxed/simple;
	bh=sEDCxjxDH5mRXI/IrV6BojjRAEuqHVsh2sMpVg0j2k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+xL52I0LaezADJpUOMbeUR5AYQupMCpZEkIRK6Wd+mOR4qakYtI/dX23AAqNSRwwbYVOxJJPOZayns0xaWuLs7/qLXdHcjz4FBOll0PAm8jGLBno3njjh7skGfoOIJWTptwjlv+4AWGEPW6yDGrVvvEroyNesGNBa/D8WhAN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2WMb8IX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a52582ecde4so174985266b.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Apr 2024 06:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713188610; x=1713793410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5agVIUntGcqet4xEAqpjWc8ya7IY8Ph+fSaGKkgBck=;
        b=d2WMb8IXAbBtaupejMFNzqeUWMPhDyldln87zoytivNfJgKGvLSERofqnyfA8bzpbD
         rHYDNyDt0WLfwe10986JjBixesl5nlfCy139oRc+ReyCE/j/xRKaJtlFcswPV7SdUJJJ
         5hpML0s8KLhZXhiNa0T0vGbpNC84FI2zdSV0C4K6nInfaBsTV+pIEKopbjwVXHb3f61k
         AzjPzo1rF2HBdSSOi384dayAX+NOweEw+gZtCJSlMUIEokg4rR+zUSRDV74yl7fhC8ET
         iz1XujqxRjVZVB4sBaZ2pQeAmSzjWgct/i3wAbclJ+0eMYFjt6RXUMkuDBz2KBdZu0k2
         s/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188610; x=1713793410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5agVIUntGcqet4xEAqpjWc8ya7IY8Ph+fSaGKkgBck=;
        b=F0JsGy4evXemP3cxym0Wu3VDqyj4X0xHBvGq5Nfac+roTXC20tUyPacPUssDJdblV9
         uGPw/F0hCx7JpYIzJ337f3WQhYuVd9cJPanxtR0fgiKq2FoI5kqyp+KedCuw8DnGJQma
         DmlLefiKyiat2adx76JkCTYfkngSqtbqc7Op9OZ6HuqAWhGtOLiVf9/LF8/443Wos1xw
         wuIG7P+5rg/YIEC1UtPUks4HVPOZaxFv8REMqlFnttWuB3wR7Q+pVY9cfv6MJjiSCTQY
         t9PMVxGgJ1i6F01FWHIchxq25ImaTGel1tUJdvt6yb4/kQnwDS20OkJUn9TmZ5oqbqT0
         VR/w==
X-Forwarded-Encrypted: i=1; AJvYcCXAmTJ1GhRKy4WtLAkvOjAb5GCNCLCsjhYtgWwTFI6rfmf93GrhiTwaYBJIsI6MYQeCNrGI3wov/smPfac3/EyQVP6jfxyzWWlc5w==
X-Gm-Message-State: AOJu0YxTDHYkxiMWCc5kkqo/c1C75RUpWRwpy/WRNhrQqZsMkbFV0U6U
	GslHTnPfxhmMj55VJPbpp633/raQaJWxBPz+oarnWZ0t90wtzz07HWtiHSNOkg/0W4+K7iCTKyW
	n
X-Google-Smtp-Source: AGHT+IHFKdoXBJF4YQ8aEdmBoKEuHa7gbFkEhwvJQYaDbhuwQaH9FyeA7B8SJVfb2EwwfVADOQdo7w==
X-Received: by 2002:a17:906:abd9:b0:a52:6c74:a29d with SMTP id kq25-20020a170906abd900b00a526c74a29dmr1657489ejb.76.1713188609502;
        Mon, 15 Apr 2024 06:43:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jy3-20020a170907762300b00a521603e14csm5514073ejc.138.2024.04.15.06.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:29 -0700 (PDT)
Date: Mon, 15 Apr 2024 16:43:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Robert Marko <robimarko@gmail.com>
Cc: Hanna Hawa <hhhawa@amazon.com>, andriy.shevchenko@linux.intel.com,
	wsa@kernel.org, linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
	talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
	farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v5 2/2] i2c: Set i2c pinctrl recovery info from it's
 device pinctrl
Message-ID: <f7069e5b-0678-4f78-b06e-dba16c5e6088@moroto.mountain>
References: <20221228164813.67964-1-hhhawa@amazon.com>
 <20221228164813.67964-3-hhhawa@amazon.com>
 <416340b6-33a9-4b9e-bdc5-c5a9cffb3055@gmail.com>
 <ac51854b-09a6-4b79-b409-b950929655cb@moroto.mountain>
 <CAOX2RU6YOBBgEuwdp8P0GTJ5vB0M5Cbqf5SnVJ9Jbou9w5405g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOX2RU6YOBBgEuwdp8P0GTJ5vB0M5Cbqf5SnVJ9Jbou9w5405g@mail.gmail.com>

On Sun, Apr 14, 2024 at 07:47:50PM +0200, Robert Marko wrote:
> > > > @@ -282,7 +283,9 @@ static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
> > > >   {
> > > >     struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
> > > >     struct device *dev = &adap->dev;
> > > > -   struct pinctrl *p = bri->pinctrl;
> > > > +   struct pinctrl *p = bri->pinctrl ?: dev_pinctrl(dev->parent);
> > > > +
> > > > +   bri->pinctrl = p;
> > >
> > > Hi Hanna,
> > > I know this has already been merged, but setting bri->pinctrl breaks PXA
> > > recovery.
> >
> > This is patch is a year and half old so it's a bit late to just revert
> > it...
> 
> Hi there,
> I know it's old but I just tried it on 6.6 in OpenWrt.
> 
> >
> > What does "breaks" mean in this context?  Is there a NULL dereference?
> > Do you have a stack trace?  It's really hard to get inspired to look at
> > the code when the bug report is so vague...
> 
> I admit that I did not explain this properly, but if bri->pinctrl is set then
> PXA I2C is completely broken as in it doesn't work at all, there are no errors
> other than trying to probe for I2C devices will time out.
> We had the same symptoms when PXA was converted to generic I2C recovery and that
> had to be reverted.
> 
> I think its probably some pinctrl issue but nobody has been able to
> track it down.

If you wanted you could try the following patch with the change to
i2c_gpio_init_pinctrl_recovery() and without it.  (It won't fix anything
it only prints information to dmesg).

regards,
dan carpenter

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 888ca636f3f3..f9477089b980 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -34,6 +34,7 @@
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include "../../pinctrl/core.h"
 
 /* I2C register field definitions */
 #define IBMR_SDAS	(1 << 0)
@@ -1345,6 +1346,12 @@ static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
 		return 0;
 
 	i2c->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(i2c->pinctrl))
+		dev_info(dev, "i2c->pinctrl: %pe\n", i2c->pinctrl);
+	else
+		dev_info(dev, "i2c->pinctrl: %s %s\n",
+			 dev_driver_string(i2c->pinctrl->dev),
+			 dev_name(i2c->pinctrl->dev));
 	if (PTR_ERR(i2c->pinctrl) == -ENODEV)
 		i2c->pinctrl = NULL;
 	if (IS_ERR(i2c->pinctrl))


