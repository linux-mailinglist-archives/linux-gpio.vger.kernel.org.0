Return-Path: <linux-gpio+bounces-26658-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AF0BA8D7F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 12:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13B451C07FD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Sep 2025 10:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51232FB962;
	Mon, 29 Sep 2025 10:15:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35002FB08C
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140931; cv=none; b=PLV74nbXcZL9FHmYGzB0ZjvqzUA2crUFl15Ny9TTatjPgFDP5ux5u2F776gNvzXHcCajgSx91uK7WWXLsTM2JLGtnPbMIISd/bf9MQ54xvb2MO0+tgP3xsHEghFZoUjOriMJqNXsHG7lZtISlt/WOjhl/sk1FJ4hoM+//uw6WBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140931; c=relaxed/simple;
	bh=VKeWPwCthMHrv46cS6qePKsRD0r2j4FUJoWvmC+PJk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gthLXgQuGHnRk513uuAmVUjL4xQay2RwVZ9jyAW7e2r3TECBzMl91ql6RzJsiAc4eRlp21FwVAYj2Y0ZVyqyJor61g4Jh4fDzOxkH8nC8/4/RgfX2GvOeSCftRL8uvdzigGAU6ACn96b5AXMkztcUNknLk+XCmNC7H+MpmNcxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54a9482f832so3285364e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 03:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759140927; x=1759745727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLywH616puogHM/w7g0w5lgJ4MaYI93I5ro3ENJXEGs=;
        b=e0lLTQ7Ofu1a0TYZIqbvyKH1YGaUr8fFdNC99IK13hWOQax7gM8YAy1liTaXVAC7u2
         pVJ/N0ACQkBQTG/kWUUrPt0oNLbbWloFrFgIvy3BqzZLKVZGWMdcI/qSZ6JNmeZ24igA
         WNh/1ONAUIJ8RVLEkAOc8gdDQPL2/HBIjWvEFOdRB48oAbMkWF5wGbdEzGiV3xXvUndJ
         JF/2cFB1DGDrh+Fow7DqYMPAGW/eq1AOk9p+em1ZDbx4Sz4OaPlBD4dPuOWZBB7o2KtF
         6SEJtXtKR2sq6FHGtRVxGm7jAnjuBFihPi65ABNbECnEaIxnr84vDQ8FIOpmg8bMWB/8
         kSTw==
X-Forwarded-Encrypted: i=1; AJvYcCWi3O5GgzhewmZhQI4hNi98fW1ZW4kB4OjzElr69PfB7TCz4H5ggeTyYg6MkMIkpdkwjlSOFxKS5iEx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt1cTOFDnl+zPcXfq0cavn6k2dOFPDlv/lXy5T0Vclj+eFDPii
	OvrHuP7YUegjgmAOaqNHzZkVWsVyOHIIjEBk9/Gl6VftCC/SeOY05IrT/wsAgyEA
X-Gm-Gg: ASbGncs0Ah7DCPCcqzj+LkadynLklceY2CAzGWJEKthNAxxE8OAcSbnLtF+g6HdmS4v
	p9iPodkzilyaSa/2OXYxJweGyEHTFvJBHxYXQGQe5QFLrvmYPnC6go237HaUukCa+aDjs04LrZh
	xYSVxaASg8xooXqivBosFxRGodR0aajCSSyUwiiiLFd1k6tPUmDAG15++s+fWRyb2+604S1peZ6
	q0wWvCvuxfLgubf9ZVpIlj6AZRg/VmK5l1V1p42TUAWT2hx5IKy+JU4oIofb4S6IGthy2ry93uY
	Tkwy6w33LJXc7TVfgXRfYfm6DIv/Sq/VtB5RqXVtRoOed5Z16nlI8v24mhvLvGYsJPV6+Q4pagj
	Fua7WI11tBLXYbxi3kUVy6rImZNZ1O3DRYgSRHczkdoKNwXtSLJm945fXJoVZcU6R
X-Google-Smtp-Source: AGHT+IF0nCwUaMeNZG402pH1pvZ4ku3fCsG98/kAl/gAua2JvB0zokNSx/Iv1YEVFCUtXsB17vMeIQ==
X-Received: by 2002:a05:6122:82a1:b0:541:bf69:17ac with SMTP id 71dfb90a1353d-54bea380af6mr7036187e0c.16.1759140927542;
        Mon, 29 Sep 2025 03:15:27 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bedc9f653sm2142273e0c.16.2025.09.29.03.15.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:15:27 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54a9482f832so3285333e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2025 03:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3ziaijcbaU2yuA8FbrJIPoDXTPd+NkI772PrMyXqEgWqd459QVt2eWubm4i7CG5ZWqt6mCdM95c61@vger.kernel.org
X-Received: by 2002:a05:6102:f11:b0:5a3:d554:8409 with SMTP id
 ada2fe7eead31-5acd634005dmr6695044137.25.1759140926458; Mon, 29 Sep 2025
 03:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
In-Reply-To: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 12:15:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5HXx2HSAHP-H1EEKO-csBku_cMm-OaacE7GZLXwBxOg@mail.gmail.com>
X-Gm-Features: AS18NWCqCPvheA4EHmzGW4vCHywVYoZXOJht6RqD_H4VpVYB8jhcuEiZQ8v1G8I
Message-ID: <CAMuHMdX5HXx2HSAHP-H1EEKO-csBku_cMm-OaacE7GZLXwBxOg@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: restore the set_config operation
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, 29 Sept 2025 at 12:03, Thomas Richard
<thomas.richard@bootlin.com> wrote:
> Restore the set_config operation, as it was lost during the refactoring of
> the gpio-aggregator driver while creating the gpio forwarder library.
>
> Fixes: b31c68fd851e7 ("gpio: aggregator: handle runtime registration of gpio_desc in gpiochip_fwd")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202509281206.a7334ae8-lkp@intel.com
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -723,6 +723,7 @@ struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
>         chip->get_multiple = gpio_fwd_get_multiple_locked;
>         chip->set = gpio_fwd_set;
>         chip->set_multiple = gpio_fwd_set_multiple_locked;
> +       chip->set_config = gpio_fwd_set_config;
>         chip->to_irq = gpio_fwd_to_irq;
>         chip->base = -1;
>         chip->ngpio = ngpios;
>

Is there any specific reason why you are doing this unconditionally,
instead of only when any of its parents support .set_config(), like
was done before?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

