Return-Path: <linux-gpio+bounces-15916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A9A341B6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 15:20:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758FB3AB695
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 14:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9246C242913;
	Thu, 13 Feb 2025 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Q08K9Ola"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA324168D
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739456007; cv=none; b=aYw3VaW/fPKNmDiSmPI5ZhL1Wh146ggfA2aJhSAXpGeqPkVlXcmpgI/WWaA4AcU3vOc5D+A00vjWTdRyoqZ1fKT0APTwYcQGaBI6eYObNV+6X4ZvoGH+PrFbM63KlmCz5qEuTHVrP1FWpV5nhFeaPGHBYOqbNX3xSPQ3WmBISoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739456007; c=relaxed/simple;
	bh=1AE/AsPkSseabBI+wh2PvqGe2nLuaypQ32OyGVYFAR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjo1/QvwVVSSde2Hscojh4n6mrIPw+/XUtmOqg0CpcnwC/g0Qru5f454/8X8cPoRmBqphl7Z3eFw87At6cEBhPmT7azqGK1xwlHs7RkwouR9tdH6RKc8cFsA+6158gcUrlDG4P7SPM77liZMlFYcYcwmGFLXCF2BxctDMXaqyTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Q08K9Ola; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 898443F2EE
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739456003;
	bh=2+kLF5rkSgLiqo+fczE/YSFAXYxJJU0YzdN5BTDcfZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Q08K9OlasAj6F38Jou3ZxMpriNYrLBBJq7wRqvR0TVQYHNOqkTH8C7P5p0Y4j80Wn
	 y/AZumHO9nF1psh/jTA0xeq9VRiI6EpT5/Y1VIGkAXFtwIxxVwaax4abCTVANQ0JnM
	 oQ6mciCTzL3rKfQ6fvOH1/Bw801hopMopnUnQurT0+q/Jgpoh3Yy+tSpXcVWNl/s9h
	 IjcWO56NYwGY9q6Ar0qpM1pQcl6xdIwhTxLXsIcZNBicQG3pKD66EPqm05QtNVldYZ
	 aSCM6Y7eG1zubvC/PgV06e4YpOIQVOxg63jpZST7bcQQrhwwrzHLzq3CdMjCU0qEb+
	 Qp0moEpRUpMYQ==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21f6cb3097bso23764285ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 06:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456001; x=1740060801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+kLF5rkSgLiqo+fczE/YSFAXYxJJU0YzdN5BTDcfZk=;
        b=GrtnhTd86mjLvN5K6rhtlXVwZv3gYUNI6LCy2EtJm0mDV1QbqLnMQ4yz1YM0uiHsxX
         XA99GHTh936hRlJHqpRcK9nUugKdJyZek2HgZquoAX7c6cPezpoooZMRd3mWxoFWcQ2s
         l4WSbSwsmI/OkxRaUm9FBt73zifz2/EqQApV3Tet4SuHDpB19VptSsyGpgI1hcYLbdrR
         fdlOUlsRwcdTLAYgPsYa8x/YBaYhoe/huKdzT1IRDnaaMA7vLJQfHkxww28ulau6w5F/
         oApCNSbwR2If47uXGM6n7vTEOU8J6tOn6RKTlIVbkaqER83rWsmpZHnpST0A7tZI8ofi
         DVew==
X-Gm-Message-State: AOJu0Yzkf8LrY1sWzQ0q1eveaH3I7EUlK2ppFnrSTGdN41yx0ApgFzEU
	rJU/vNLP6Q5WYqa40kYhiWmCKOSNanfDoPXSZP7m7c/H4jW0lXHv+Y0rscGHTaB3UkH1Ek4VTJU
	RFO3jZRLOUweLk2IOBt7IvQ45d8WdaXbBAmW4wTg790cYY9vRRsp2kT94PplwucrQqxPS6jYcat
	M=
X-Gm-Gg: ASbGncvZC0XDZPCXTV6wa4gc6dFAmsfKqRHbERZ0fxp8veh8oC47Ai9laI9Wny+Ip+0
	Z91ObgrdAvTlycB9IQ/bDVBGQAcx1j4yJxjyRbDyJXiADs2E98ddqZZrz+Hith+L/1f0jE0y3ph
	hV0nHEASVY1HbgQ3HuUh6+g6Hxk25V1De4U7sMYb1iwYty1Htc0u+Oz3/DfUp9ce8p4BBGKgxQL
	aZYQsn31LUB43+HtFS6YeOlggbY07Uc9VDFVYa+9kJoVv2NebK2hvQjoHj8GdjP+AlGH1IAVqs5
	hkXMQSE=
X-Received: by 2002:a17:902:c949:b0:215:9642:4d7a with SMTP id d9443c01a7336-220bb549c13mr127075265ad.0.1739456001010;
        Thu, 13 Feb 2025 06:13:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+6zs49M6gIxhUhV5iCA4V7nz6hQfz8nMDkXeY3LDocSmpDY11OSi671TMUo2n19ACuaX3gA==
X-Received: by 2002:a17:902:c949:b0:215:9642:4d7a with SMTP id d9443c01a7336-220bb549c13mr127074865ad.0.1739456000686;
        Thu, 13 Feb 2025 06:13:20 -0800 (PST)
Received: from localhost ([240f:74:7be:1:5439:d90c:a342:e2bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d468sm12688925ad.167.2025.02.13.06.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:13:20 -0800 (PST)
Date: Thu, 13 Feb 2025 23:13:18 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] gpio: aggregator: add read-write 'name'
 attribute
Message-ID: <u5ymxczuu6xa2zhuoebasysham34fqokg52rmspropouxgkgaz@w52wq77dpxvw>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-5-koichiro.den@canonical.com>
 <CAMuHMdXnST1Y3oxEz_r59urauZ42nrtL5P4+rnPEsgiKgENOOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXnST1Y3oxEz_r59urauZ42nrtL5P4+rnPEsgiKgENOOg@mail.gmail.com>

On Wed, Feb 12, 2025 at 03:27:50PM GMT, Geert Uytterhoeven wrote:
> Hi Den,
> 
> On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> > Previously, there is no way to assign names to GPIO lines exported
> > through an aggregator.
> >
> > Allow users to set custom line names via a 'name' attribute.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -63,6 +63,8 @@ struct gpio_aggregator_line {
> >         /* Line index within the aggregator device */
> >         int idx;
> >
> > +       /* Custom name for the virtual line */
> > +       char *name;
> 
> This can be const.

Will fix in v3.

> 
> >         /* GPIO chip label or line name */
> >         char *key;
> 
> Actually this can be const, too.

Will fix in v3.

> 
> >         /* Can be negative to indicate lookup by line name */
> > @@ -678,6 +680,44 @@ gpio_aggr_line_key_store(struct config_item *item, const char *page,
> >
> >  CONFIGFS_ATTR(gpio_aggr_line_, key);
> >
> > +static ssize_t
> > +gpio_aggr_line_name_show(struct config_item *item, char *page)
> > +{
> > +       struct gpio_aggregator_line *line = to_gpio_aggregator_line(item);
> > +       struct gpio_aggregator *aggr = line->parent;
> > +
> > +       guard(mutex)(&aggr->lock);
> > +
> > +       return sprintf(page, "%s\n", line->name ?: "");
> 
> sysfs_emit()

Will fix in v3.

Thanks!

Koichiro

> 
> > +}
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

