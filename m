Return-Path: <linux-gpio+bounces-16307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA54A3DB7B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE533A43FA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5991F8670;
	Thu, 20 Feb 2025 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="bF76R3DK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BBB1F76B6
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740058805; cv=none; b=keAmDhoBa4Mep1TrWMvH7hJXfvGFgJ1cISOiIa1NwbiZdtFRIsj5Bbn5CqB9P1yxkrv+GQs1IzpqmcFczdyIy4G9Vm350QO4dPF3gJp8ODdBD3W4fPSIVI7G8MWPO0bH2SnYCAQoi2xWWl4fD2DiKeGEx2MKtVJKTVcmm3Abxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740058805; c=relaxed/simple;
	bh=yjEUde99KgzakBJbQx6a/8UMTsQ+4EbwER2WXeBEkDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDZSXIp86PAq5XTsI9CV2ZLdi+iz4XIfc3EgB68UfIv7hgOuEvgg5ZCL352VByhxk/c0xLpXtYEoEg5iqBCOTJbrzB5NMGRtaHTvLtnQn4CdX1xLdwAw8Uf7moQQHUb6LIxYZ1xGVqMdqJGOiYznsuUvduKI6YtiWD1RLil27XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=bF76R3DK; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 375FD3F2C8
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1740058789;
	bh=iiP50cFP789o1GE1IPKlebj+94gihSf8dowgIFkuU9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=bF76R3DKVxKUeT4FmUW9e2yoN/NIrMcWMSe69Amqbvk/hpZlwNlzjwtAHf2bFi7Ao
	 7W3E2Cj7PTj+DTaeQVae3hxaHsmdAMc/yF7XENe6cnylk9cyzwj8Q6BdYIoj90K90F
	 IWkkNWBcYLjWiXaWzgRiF7cAblAEB9ZXSxPqNy/WmI2rDcsuRx05lB/Tha3P4stlTr
	 elGY/dXDigyG8mIHwE5sGdoXoAo+ZRJslZIDajGRsQCtiiNj47hBMj1ruEbUNe1tYI
	 vhokx71gC2pjZQxW4egYG7pk1Xp3AOBsilY0HiEvnfdP3untlWpNbHF8KDCpc82VA8
	 S9HMo06FQxaFw==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22114b800f0so28469435ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 05:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058787; x=1740663587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiP50cFP789o1GE1IPKlebj+94gihSf8dowgIFkuU9c=;
        b=BO/Tzaab3IkOwbWsu/6GEJWnG0bcaIMnPuyyzpBL5W3r3bZQtkGnbDawyTQh6ahzcD
         VdvVOjrJOsq+ra2pWWlxI8DSKbs1JQJNqbsf24pN43ihuh2NWZvpm9Qyy3Xrj0rQc3HJ
         zynApOACiXyG6bK1/FGdwND08x9iQXtUTr4neb285t+LKzTn0xpmg8EUBYEcxElHY3jx
         mt6OrTBOXj54CnV6Y6zBGNtyeqKx3eGcppEp3pwZlS1kOJxh5UokOsrYGwMKtWuHupuJ
         AuqF8a4OPezUD6tqIGjrTYWntTY3Go4J4ZN4kUtsJ1gxsEMZ+x0UfDUWVtOAO+sXzoCp
         D4xw==
X-Gm-Message-State: AOJu0Yy2KOsXi/xxH1YZ+gR+/3lU9f9Dapdb1MBJqcGHjh5az+n4tW5A
	KK9Z4Bfrru/lZes/JBZeyh2A4Wxrjft0NYsHtSew39qvKQb2Um334fNdFlzu6Nrdg3r15xFH0qy
	oIr5/Sd88I/pSYQ7w9VpOEO40DPBeVHDezxc9W8hoLL8SUOf9s58Edme53Is1HM8x9cqgiLY95P
	o=
X-Gm-Gg: ASbGncvzp2h1T2dbXAd3dj+nKxfDZTz+FyRr2XweVxTsoreZDb56QEgK+FST4fao2C8
	m0uZ0AB4WLW3NP2LSBapqytBeV69cNhGhVoOuqnZCIfwmu5Bj9lUX+RTAo4mYrsPcKB8yJ12ZvW
	qRQlyUh4gZNH80LOF1FcmMDOs95HpG7iMzL5licY6/j+EnxjhiPLqyK7KhEhoFwxRU/sMIfIMeN
	tLI1pMcH8S8EXUxiLkNEIGqWiB3wiVonV3BFpch6fBX9Xjc9cMHf8D5HxVf8aiaDLhskKd3PO8U
	K7XTs/M=
X-Received: by 2002:a17:902:e801:b0:216:4064:53ad with SMTP id d9443c01a7336-221040bf829mr387389335ad.48.1740058786686;
        Thu, 20 Feb 2025 05:39:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhmAlPudojVgfawOJMuWdHGMWxc9h86if7RnadO0XpKZaLYbOxk06f6NJUmK9czRHJoKzPdQ==
X-Received: by 2002:a17:902:e801:b0:216:4064:53ad with SMTP id d9443c01a7336-221040bf829mr387388975ad.48.1740058786301;
        Thu, 20 Feb 2025 05:39:46 -0800 (PST)
Received: from localhost ([240f:74:7be:1:256c:5029:b967:ebb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534db68sm121209445ad.39.2025.02.20.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:39:46 -0800 (PST)
Date: Thu, 20 Feb 2025 22:39:44 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: introduce utilities for synchronous fake
 device creation
Message-ID: <fcfanp2bfokggj3dhzdceaza2bhxo7xrbru5cy36ciaumpfua2@kvabbos3znjt>
References: <20250218160333.605829-1-koichiro.den@canonical.com>
 <20250218160333.605829-2-koichiro.den@canonical.com>
 <CAMRc=MfmG0okVjV1nH78Aw18dFcoOAZ-UwU-iFc1VKb-BVcTxQ@mail.gmail.com>
 <wyicl2dgxkwxzfwd37cmhgshnqb3phmpeboz3gwqqfmbabaegy@tkjx56nj423u>
 <CAMRc=MdhkiaDs8t9BYveYhy86+svQkHnPxhGx56AMOs=7n9mcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdhkiaDs8t9BYveYhy86+svQkHnPxhGx56AMOs=7n9mcQ@mail.gmail.com>

On Thu, Feb 20, 2025 at 02:13:42PM GMT, Bartosz Golaszewski wrote:
> On Thu, Feb 20, 2025 at 2:07 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > On Thu, Feb 20, 2025 at 12:06:33PM GMT, Bartosz Golaszewski wrote:
> > > On Tue, Feb 18, 2025 at 5:04 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> > > >
> > > > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > > > platform device, wait for probe completion, and retrieve the probe
> > > > success or error status synchronously. With gpio-aggregator planned to
> > > > adopt this approach for its configfs interface, it's time to factor
> > > > out the common code.
> 
> [snip]
> 
> > > > +void dev_sync_probe_init(struct dev_sync_probe_data *data)
> > > > +{
> > > > +       memset(data, 0, sizeof(*data));
> > > > +       init_completion(&data->probe_completion);
> > > > +       data->bus_notifier.notifier_call = dev_sync_probe_notifier_call;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(dev_sync_probe_init);
> > > > +
> > > > +int dev_sync_probe_register(struct dev_sync_probe_data *data,
> > > > +                           struct platform_device_info *pdevinfo)
> > > > +{
> > > > +       struct platform_device *pdev;
> > > > +       char *name;
> > > > +
> > > > +       name = kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo->id);
> > >
> > > pdevinfo->id is a signed integer
> > >
> > > I'm also wondering if we could avoid the allocation here and keep on
> > > using snprintf() like in the existing drivers? On the other hand,
> > > memory is cheap so no big deal.
> >
> > Are you assuming the following change?
> >
> >    struct dev_sync_probe_data {
> >           struct platform_device *pdev;
> >   -       const char *name;
> >   +       char name[32];
> >
> >           /* Synchronize with probe */
> >           struct notifier_block bus_notifier;
> >
> 
> No, I was thinking about a local buffer in the notifier handler, like
> what we do currently in gpio-sim, but no worries, you can keep it this
> way.
> 
> > >
> > > > +       if (!name)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       data->driver_bound = false;
> > > > +       data->name = name;
> > > > +       reinit_completion(&data->probe_completion);
> > > > +       bus_register_notifier(&platform_bus_type, &data->bus_notifier);
> > > > +
> > > > +       pdev = platform_device_register_full(pdevinfo);
> > > > +       if (IS_ERR(pdev)) {
> > > > +               bus_unregister_notifier(&platform_bus_type, &data->bus_notifier);
> > > > +               kfree(data->name);
> > >
> > > We could probably simplify it by using __free(kfree) with the name
> > > variable and just setting it at the end with no_free_ptr().
> >
> > platform_device_register_full() call path might finish probe so before
> > calling it, we need to make sure the 'name' is filled in. That's why I
> > didn't used __free(kfree).
> >
> 
> Not sure I understand this. Would you mind rephrasing?

dev_sync_probe_notifier_call() references dev_sync_probe_data's 'name'
field. In dev_sync_probe_register(), platform_device_register_full()
invocation can possibly succeed in the initial probe, meaning that
dev_sync_probe_notifier_call() can be invoked before
platform_device_register_full() returns. So, 'name' field must be set
beforehand, and I located 'data->name = name' as shown above;

If I used __free(kfree), the number of which I needed to write
'no_free_ptr(data->name);' would be the same (= 2 times). So I thought that
calling kfree(data->name) without __free(kfree) was simpler and better.

> 
> Bart

