Return-Path: <linux-gpio+bounces-15915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8FAA341BB
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 15:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A25B18935B3
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 14:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5B523A9B8;
	Thu, 13 Feb 2025 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jemejRhw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCA6221541
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739456002; cv=none; b=gPZgxm3PG/e7fY1+MGhXPfFlZwlxCojXofCLMEoaE09LUcNb0xDAe+cJmO0RzXSWqA2W5R+acmrwyqjLf6jpgG+U5rN9lvYx0huauXZUXe8vA1HFTkgJhp7YPZcZ1/mer5QJVcJlvlk6wwj9K87oBGBmLJfepTTO2vFAG54U26I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739456002; c=relaxed/simple;
	bh=uvwJ81+uWpJgvczZfhN1U6bHIxTEKtHvjxJuBbDwwtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMfK51ROcIuKS9krU3ReDxH0eFPO7RoPoqt5MJ6FUOZ4+Yi61OkXKeAEeLrOE8PJyYODTnrRz7gNdNd8mHV90w1e4dUmq0FBRTioAKIOY2vrXdG81hIAIlNlS3VwA/gTZ35P0U5lKIWN2KSEJBckVXiYA0b5x0t2+aytC3Uk1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jemejRhw; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8902A4013E
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739455992;
	bh=wAYCS0tXykg6XPNKlmOCWk97LsyZYiej+hy/OfVM+AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=jemejRhwWNpJgZiGjAkXQy6wAxKaX2oZPip3TdOt3hE4T6ILSNYVPtOoLsKe8YhLf
	 ci3T2F7yNB0ZAeS32VydKsef07NWf5Prnd+VHak47HOibO7WzA2T2tSOXzGv9Mx6Rh
	 lI58x+uoF3H26UJiWi51vcDa8Wo/4U3flDc0y6XX/OhTRzp5RpMMcpbrvxfT4HawfJ
	 QDVTc/9vCmA1bLBr/hDl96Ge5XhvQ+4b3YXMhwXqJwEQFia5JKc50AZFwZJznlb8Tk
	 SSK2murRMA3wFetypetWgQAnlJVEY4s30yu9JCwxb6px/MODP2+P6sFQiZi6q0p0Rx
	 ZOHQKfWdB9ZPg==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220e62c4fc2so2652505ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 06:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455991; x=1740060791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAYCS0tXykg6XPNKlmOCWk97LsyZYiej+hy/OfVM+AY=;
        b=Zjo0VkbaLdJa4ghmByFGAKOFT0ukftzmfC+QF8n652yZAaISlwVGFT2Gj1H0GfXvbo
         KCzE7/Gfi8bHaNlaadipqlu4wu/J1RJyQOIqzKKdj4HcpDl+JZVCprAzQKvD73oXP9KI
         iGIUat/xoiCUXFO70RYNJ2/in6v29LpHAbwvlxolenmVItIyVXiyCOX3JgLGfoOCunDk
         L2HLufuU229Tg6sxDWPmqgzihcJJUU7AuiaGMBa9pbl3fhHbOs3wFyvSMPcFLsAbG5a4
         Da0HX0IxEqLuwYK2TDLVBMz0C+86JPO2/EGmPBUiml6lbyAtUbfOyvou1IUHs+hTADyD
         H00w==
X-Gm-Message-State: AOJu0YxHb6z0ecBJZQ20Cp1DBaJP5WYbqQiXAdWWMYiWdkYCI/3REJB6
	ssg0dbPfn0d8licd8fp3k326q6J+ZXyU/B58UawannnWkWBnIyxFqLesxalrZ38rwi7TwV1igwN
	Q2fqol0g1FPKTOEgC4ZBysXBAVyOeDut4sgvZboN2f+rLyuZKqqTZAw0Q+QjMdFrQdZoiwVU4GB
	U=
X-Gm-Gg: ASbGncszKp7h5ipv+ofFbz9C1lCSdmo31H1BGmJjULjzKsuNYfKyJ3HcQSql6uEz6//
	Fe4nMbmiAZ45azpyUDNbHAN/tntS/3uMdnb5EznW6HmixVHpaR/UdOj+wBcvg0W7potphJ2PWSl
	I4wsWFIK2Lfs+MnpuN08y+vFyemKMXpo5IR8DS6SmR288+udkhIPQjtz41YJaMmqUSmrRVjXOLP
	WWcpCKimoMCvm+D8JxDE0pdHK4G7sLjWi1HFNDANXWvK0e2j7SjMy7zeb0bgbfN0x/zjp7x1+XC
	gYLtci8=
X-Received: by 2002:a17:902:c94c:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-220bbad0fd6mr96931855ad.18.1739455991009;
        Thu, 13 Feb 2025 06:13:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0LbYDKu6OhXYYnEuKg+BPRg/KVjt55CtvNx+dM4QFYUCz7MQa+kKnvg1dAzsvyRIFbMJtBg==
X-Received: by 2002:a17:902:c94c:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-220bbad0fd6mr96931545ad.18.1739455990704;
        Thu, 13 Feb 2025 06:13:10 -0800 (PST)
Received: from localhost ([240f:74:7be:1:5439:d90c:a342:e2bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536459fsm13047815ad.78.2025.02.13.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:13:10 -0800 (PST)
Date: Thu, 13 Feb 2025 23:13:08 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] gpio: aggregator: add read-only 'dev_name'
 configfs attribute
Message-ID: <k6hkhysiocawfv5oftzt3l5s3l4wzvpxmd4m4xex22sgp4gvzh@nxhsugpr3wwx>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
 <20250203031213.399914-4-koichiro.den@canonical.com>
 <CAMuHMdWUrHbizyKoLs-DJL43QvmE+Y=vCuGc+1yteYXYQOmURg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWUrHbizyKoLs-DJL43QvmE+Y=vCuGc+1yteYXYQOmURg@mail.gmail.com>

On Wed, Feb 12, 2025 at 03:20:06PM GMT, Geert Uytterhoeven wrote:
> Hi Den-san,
> 
> On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> > Add a read-only 'dev_name' attribute to configfs interface, which
> > exposes the platform bus device name. Users can easily identify which
> > gpiochip<N> has been created as follows:
> >
> > $ cat /sys/kernel/config/gpio-aggregator/<aggregator-name>/dev_name
> >   gpio-aggregator.0
> > $ ls -d /sys/devices/platform/gpio-aggregator.0/gpiochip*
> >   gpiochip3
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -732,6 +732,23 @@ static struct configfs_attribute *gpio_aggr_line_attrs[] = {
> >         NULL
> >  };
> >
> > +static ssize_t
> > +gpio_aggr_device_dev_name_show(struct config_item *item, char *page)
> > +{
> > +       struct gpio_aggregator *aggr = to_gpio_aggregator(item);
> > +       struct platform_device *pdev;
> > +
> > +       guard(mutex)(&aggr->lock);
> > +
> > +       pdev = aggr->pdev;
> > +       if (pdev)
> > +               return sprintf(page, "%s\n", dev_name(&pdev->dev));
> > +
> > +       return sprintf(page, "%s.%d\n", DRV_NAME, aggr->id);
> 
> sysfs_emit(), for both branches.

Will fix in v3.

> 
> > +}
> > +
> 
> Please drop this blank line (everywhere).

Will fix in v3.

Thanks!

Koichiro

> 
> > +CONFIGFS_ATTR_RO(gpio_aggr_device_, dev_name);
> > +
> >  static ssize_t
> >  gpio_aggr_device_live_show(struct config_item *item, char *page)
> >  {
> 
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

