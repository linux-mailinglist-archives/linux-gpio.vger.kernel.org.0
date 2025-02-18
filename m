Return-Path: <linux-gpio+bounces-16197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447BFA3A074
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 15:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0904D174F97
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 14:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD7D26AAB0;
	Tue, 18 Feb 2025 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="YU6QiWjP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CAC26B09B
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739889910; cv=none; b=ttXVk8R6LDepBaPRqWFEz7JBz8ZhmsZ9gpjeX5PdZ21+WFFHBj92bqpHl1PX1OPP0h5NWV9onROJpij0DCFTGRI9ZS07Z+rV+vM0hFoRlnHv9GA/NIKWDHrKHScBFVwlbnWPApfV8RVSxzfIdVcCi//X9TF47oq4czdTNBpvmh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739889910; c=relaxed/simple;
	bh=NbvVt7BZF1i5sDpL0YhX6xjDp5pujBMRRwFAm4iHKtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNlKSEfRgPoSaB0JC15LT+Lk7DC0u6RZoT+THDrtSD6nEutUZllevmMkNXyJkk/cm6ahtAB7c1x0riYo+KNWr7ZC6i0w9hfsAC6/uXeVMYyRbcOSVPjdFj3gPES7wHWFW8V9juzWVH+p+ENVkOwjV3q0pukPFfTjiFMiIu+nKkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=YU6QiWjP; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 54A573F868
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739889899;
	bh=2wnnPPobX2+s1VhoPCe771be48GL2/WpZ73Ug6pSCno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=YU6QiWjPO2tjUbNNQQCvG4B0Hl1fjriFE2yB91Z9ZMyIkJsOE0G7GeiiKKMQGttEn
	 9D3Ae2XlenTg+nqK9GBnJLauPqEPlQxPMQD7OjvwptDiOQgyeWloo+U0QtWtqwvhl0
	 Hssi/6JHBsGYTeHPWh77/5uMkF47AWFRGnEay8N/Kj61mThuCchSqQumNZnF07wohE
	 z6+AdV9U+0yrYz3GgTl7Nwu7SSSfbUu6Y7+OhG8Px9MJTB6i3cAT3uoluhXSX8KYL3
	 uEWh8J+QVLVhwzuB0hDopk4qtWNWWAjzmAhMqzxNbVMMVG4lmr6TcKp5BorU+PjkRI
	 0KZTu5wZ9zu4w==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc0bc05b36so17743145a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 06:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889895; x=1740494695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wnnPPobX2+s1VhoPCe771be48GL2/WpZ73Ug6pSCno=;
        b=twf3NOO5KUBIi4Z19uQuo55Oo2KbbxDQcdUvWtd3xURvN8ltkmYaizv9DnQDeBCEt3
         THPGh+Y5WML6TWOSQErMjDohuJthUteJeelKoYs4st7qQpPc2tcphltqP+to8Qugu/Jb
         GT8B4hPQiXgItKAE9aSY9Tf1/9mr5tXT16dU6CQtf7GApikcrd3HxECOkVngiuooeSfV
         AJQ9oCco9Qh+yqur7NbcGHzf70cU6nrSLT6x/RWK3KAvGFMvRlAwOx+lJ4yQ0GaD0ROv
         X+WrnkSyndcqj/Cq4dRGTk+tdr+vq0iEdni0k3ntmRnQraVKFMekNYBj2e1WRVUHuYZq
         dbYA==
X-Gm-Message-State: AOJu0YwApqXyaNmfV7hXwrZzA0B82vlMFeNXPHiiJUjcCTJu0GXd41SE
	XrXTeRIQBlLiCM8NDxt7sSFgWtTqqmN53wLJVSqr63KhHOZ4KYE2KXL8N+5n4mdv+E1cRMqDinc
	1mtBJsEKtZdzXJwvNuEPWoFuPfrYF43gsIVMW1YUU4B2DoGU8WEOqTF3+uz1m18jNAL7eHAQ4pa
	t1oJl9EKo=
X-Gm-Gg: ASbGncurDVXFE2fpqCHYOOD1J26gQnW0Pa6VkOD+z6NN2PlKDvI07+1hWfGmY/NPciV
	io8e0Hs8kwyJXUVKCBo4DMGXifhPobwiXS2ChMPDSC45j9SwOcQyyo9X1mEbyrxnFQoNwCSuBbf
	EzWcIBlhS5QyJ6GFD98aq5HK5z5VNPA2fxa0JMhOlT5WQ48GNv4s54KQ2eVqW1Arnb5skmV0cFX
	B9vVZmJgK7Oa8hSsMoql7nu9+gwEo6Cs5GHCP74cnRj1EKUixHSyGX9JuGOSV8w4E1MQf9HU0wm
	TX3x0rs=
X-Received: by 2002:a17:90b:3c82:b0:2fa:13f7:960 with SMTP id 98e67ed59e1d1-2fc40f0e9dbmr22090215a91.13.1739889895159;
        Tue, 18 Feb 2025 06:44:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESbv8ZqGzwl13GA+Js7FWx5Lo/XTUtgadox++6SX63lhnE16lduw+yIem+lsV7vCbgIXUszw==
X-Received: by 2002:a17:90b:3c82:b0:2fa:13f7:960 with SMTP id 98e67ed59e1d1-2fc40f0e9dbmr22090187a91.13.1739889894839;
        Tue, 18 Feb 2025 06:44:54 -0800 (PST)
Received: from localhost ([240f:74:7be:1:ad3a:e902:d78b:b8fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5ddsm12120512a91.37.2025.02.18.06.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:44:54 -0800 (PST)
Date: Tue, 18 Feb 2025 23:44:52 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: pseudo: common helper functions for pseudo
 gpio devices
Message-ID: <osk442flgow3px5jilhrn57xm2ha5wyrsnjae2mz4ht2dvgg2t@e7bzgjqawgik>
References: <20250217142758.540601-1-koichiro.den@canonical.com>
 <20250217142758.540601-2-koichiro.den@canonical.com>
 <CAMuHMdWSBXHE9t2pMV+9iZRzrTUGVG+dnxxOMWbVF+HeCpt-xA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWSBXHE9t2pMV+9iZRzrTUGVG+dnxxOMWbVF+HeCpt-xA@mail.gmail.com>

On Tue, Feb 18, 2025 at 02:24:32PM GMT, Geert Uytterhoeven wrote:
> Hi Den-san,
> 
> On Mon, 17 Feb 2025 at 15:28, Koichiro Den <koichiro.den@canonical.com> wrote:
> > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > platform device and wait synchronously for probe completion.
> > With gpio-aggregator adopting the same approach in a later commit for
> > its configfs interface, it's time to factor out the common code.
> >
> > Add gpio-pseudo.[ch] to house helper functions used by all the pseudo
> > GPIO device implementations.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-pseudo.c
> 
> > +int pseudo_gpio_register(struct pseudo_gpio_common *common,
> > +                        struct platform_device_info *pdevinfo)
> > +{
> > +       struct platform_device *pdev;
> > +       char *name;
> > +
> > +       name = kasprintf(GFP_KERNEL, "%s.%u", pdevinfo->name, pdevinfo->id);
> > +       if (!name)
> > +               return -ENOMEM;
> > +
> > +       common->driver_bound = false;
> > +       common->name = name;
> > +       reinit_completion(&common->probe_completion);
> > +       bus_register_notifier(&platform_bus_type, &common->bus_notifier);
> > +
> > +       pdev = platform_device_register_full(pdevinfo);
> > +       if (IS_ERR(pdev)) {
> > +               bus_unregister_notifier(&platform_bus_type, &common->bus_notifier);
> > +               kfree(common->name);
> 
> On arm32:
> error: implicit declaration of function ‘kfree’
> 
> Adding #include <linux/slab.h> fixes that.
> Probably you want to include a few more, to avoid relying on
> implicit includes.

Thank you for pointing that out!

Koichiro

> 
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

