Return-Path: <linux-gpio+bounces-17349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB5A590F0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 11:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F319169DA4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 10:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B15226533;
	Mon, 10 Mar 2025 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EU7gtP7m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DC2225A24
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741601997; cv=none; b=Jn0+dUF9+ju59qauyMPcU0F60lOFZqiGLgE7KKLmzcZRlr7ITtJXWj3CJ+0xrMqJ/7eQ3nJBM15zJWJywpC3XP3SpppLTHgyzvTIn5x2iXTdZYnLaaeNnVOtuxBExrRMbjKjk6P6wzTEODNFXgOcacWFV/EBO9qmYbrYopuENr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741601997; c=relaxed/simple;
	bh=RtaFekXwblCL5xny0i+OXnePQygCdXhoaFdr38QCXa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azwoNak1xTsS6etQAdf7l13PzfvmBba11SjcvrgabVW8n72nhwKXtFLfGCGGpR39daIYnXW0Gs144sDmRosM2w0l1dO25dsrtq0A56IoiRHPoQ1GCo+FF6w7xCs+ikEYZamqdxAJca0lMhBTyhuosf5CYYOVfP1jxro8nZC0RvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EU7gtP7m; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30615661f98so43729911fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741601993; x=1742206793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0ea9rpf0RxfT/Vd6N8pCsCd6Ja9SG7q7xyK1CsJvJg=;
        b=EU7gtP7m6FrchmHkLoDjBWXHJTJuJSS/sLhPBK2EW8YJrDzNSZ+QegDw/UenAubybC
         YI+rtmhIw+XEQ+FCfVUvSApNRgz4sXlTakjoGXw4R1RlFBD4BYh34FHu2vHvsQ5ZO7nA
         2ffCyeD5H1NmficwKGbQK8VYtxsbtaA1uTw/YthBqJTydt84qKs6MjzEGW+7B9J4J718
         PnKIhw+f+J95+ZooFcxtJMBJeIph9OUq3siCm+hhjjxDg3PxKFAawWcpQ0eBlBMv8kHq
         A1cYl8Vw27peUnoWNgIpEE3PPQbBfAzg/pF/0pwf4MNBJvmQ2crpKpLCxRD2zdUgh0Pw
         BBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741601993; x=1742206793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0ea9rpf0RxfT/Vd6N8pCsCd6Ja9SG7q7xyK1CsJvJg=;
        b=ig7m32DCPKBuA67aEgw2KKM3byPVdJvtrEFu2igRXfMzG6ruoNc06xRRos9HYB6sR2
         0h8wJ/RuMwyJLXf7yjGo8yp/2l9PHfdnq3PIKADAIRW8/Ech0osIlI/HhTnrJuh4KuVe
         omOdgnqWPiJS5PIrkTOAgyFndlcLPBt2YhAJ0SE/WW45YFF1bVfgMmAmrpJB32GLvF9k
         jW83JsuESApwet95vP0BP7Xniq93CgqJNDSW6SEKqf6120dmRaMtfd0yksrYUMW/+1Fe
         pxSIBjsPu8m/PSTiaJjKWOgnMLFfoqTmH3CoVVOFQQYn3JY8X3qWIQS1NZes8A8Nmf8z
         ByBQ==
X-Gm-Message-State: AOJu0Yy85BvNpXVk3wqdcq9H6ITUXrx3tRm1iJIUyo+z/Ux5xGH0z/vE
	2hZ7P7G0YVufO+0VAniDX0hsffLaRXOt8AabGGkgVwOrghz1HaKNM8uzYmk+iMNxptqitbH1ler
	MT3sDm1wlBDX1z8RwXDmzwfvEjnh7zgMNh9IXrA==
X-Gm-Gg: ASbGncsgyKPdqKfScJAeesB7nWmn1SQEs7d/CSCj+wMZhQ1o3BFNoZEOYvX2uSg9Rmb
	hBqVX/I2q5FZx+s9KLPOYcKcT/qC1JFUIFa51m93KB8TVxqYGyXKXUThUe/ebmX5g9jHcjIwASY
	cfn/jwqhC4wSbcjXb33BkWU3bnVi5J/Gmkmq+l5hmrHk6Lk4yYdZoKhZxkpgiUQUaIDsPX
X-Google-Smtp-Source: AGHT+IEABh8IrPMTThOhDVsksod2Hr14fbs/1C61hSgDvNeuiLAsoP+iy1hA2dllbYoJaGeIioTibtolKmO543XJ5zY=
X-Received: by 2002:a05:6512:1112:b0:549:5850:f275 with SMTP id
 2adb3069b0e04-54990ec8e60mr4130983e87.50.1741601993369; Mon, 10 Mar 2025
 03:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
In-Reply-To: <20250224143134.3024598-1-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 11:19:40 +0100
X-Gm-Features: AQ5f1JoGOup15qJPVY7rRCGOZp1japOrRce4fQGe-xgPn_abAC22timyMKW0Csw
Message-ID: <CAMRc=Me9_EvVj2U-wGWjoVyH_igZBtUs1ymtE=4_r2EkSBAAcA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 3:31=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> This patch series introduces a configfs-based interface to gpio-aggregato=
r
> to address limitations in the existing 'new_device' interface.
>
> The existing 'new_device' interface has several limitations:
>
>   Issue#1. No way to determine when GPIO aggregator creation is complete.
>   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
>   Issue#3. No way to trace a GPIO line of an aggregator back to its
>            corresponding physical device.
>   Issue#4. The 'new_device' echo does not indicate which virtual
>            gpiochip<N> was created.
>   Issue#5. No way to assign names to GPIO lines exported through an
>            aggregator.
>
> Although Issue#1 to #3 could technically be resolved easily without
> configfs, using configfs offers a streamlined, modern, and extensible
> approach, especially since gpio-sim and gpio-virtuser already utilize
> configfs.
>
> This v5 patch series includes 9 patches:
>
>   Patch#1: Fix an issue that was spotted during v3 preparation.
>   Patch#2: Reorder functions to prepare for configfs introduction.
>   Patch#3: Add aggr_alloc() to reduce code duplication.
>   Patch#4: Introduce basic configfs interface. Address Issue#1 to #4.
>   Patch#5: Address Issue#5.
>   Patch#6: Prepare for Patch#7.
>   Patch#7: Expose devices created with sysfs to configfs.
>   Patch#8: Suppress deferred probe for purely configfs-based aggregators.
>   Patch#9: Documentation for the new configfs interface.
>
> N.B. This v5 is based on the latest gpio/for-next commit as of writing th=
is:
>      * 45af02f06f69 ("gpio: virtuser: convert to use dev-sync-probe utili=
ties")
>
>
> v4->v5 changes:
>   - Rebased off of the latest gpio/for-next, that includes the patch seri=
es:
>     "Add synchronous fake device creation utility for GPIO drivers"
>     (https://lore.kernel.org/all/20250221133501.2203897-1-koichiro.den@ca=
nonical.com/)
>
> v3->v4 changes:
>   - Splitted off the introduction of gpio-pseudo.[ch] and conversions.
>   - Reordered commits to place a fix commit first.
>   - Squashed the trivial update for gpio-aggregator's conversion to gpio-=
pseudo
>     into the primary commit "gpio: aggregator: introduce basic configfs i=
nterface"
>     as it is only meaningful when combined.
>
> v2->v3 changes:
>   - Addressed feedback from Bartosz:
>     * Factored out the common mechanism for synchronizing platform device
>       probe by adding gpio-pseudo.[ch].
>     * Renamed "_auto." prefix to "_sysfs." for auto-generated
>       configfs entries corresponding to sysfs-created devices.
>     * Squashed v2 Patch#3 into its predecessor.
>   - Addressed feedback from Geert:
>     * Factored out duplicate code in struct gpio_aggregator initializatio=
n
>       by adding gpio_alloc()/gpio_free() functions. Note that v2 Patch#7
>       was dropped for other reasons as mentioned below, so aggr_free() in
>       v3 is unrelated to the same-named function in v2.
>     * Removed redundant parsing of gpio-line-names and unnecessary
>       chip->names assignments; squashed v2 Patch#4 + v2 Patch#5 into v3
>       Patch#9.
>     * Updated to use sysfs_emit().
>     * Updated Kconfig (select CONFIGFS_FS).
>     * Fixed typos, coding style issues, missing const qualifiers, and oth=
er
>       minor issues.
>   - Resolved an issue that was spotted during v3 preparation. See Patch#2=
.
>   - Reordered resource initialization order in gpio_aggregator_init() to
>     both eliminate a potential race condition (as noted in the source cod=
e
>     comment) and simplify the code. See Patch#8. This enabled:
>     * Removal of v2 Patch#7.
>     * Merging of aggr_unregister_lines() and aggr_free_lines() into a
>       unified function.
>   - Disabled 'delete_device' functionality for devices created via config=
fs
>     for simplicity. It was mistakenly allowed in v2 and proved buggy. See
>     Patch #8.
>
> RFC->v2 changes:
>   - Addressed feedback from Bartosz:
>     * Expose devices created with sysfs to configfs.
>     * Drop 'num_lines' attribute.
>     * Fix bugs and crashes.
>     * Organize internal symbol prefixes more cleanly.
>   - Split diffs for improved reviewability.
>   - Update kernel doc to reflect the changes.
>
> v4: https://lore.kernel.org/all/20250217143531.541185-1-koichiro.den@cano=
nical.com/
> v3: https://lore.kernel.org/all/20250216125816.14430-1-koichiro.den@canon=
ical.com/
> v2: https://lore.kernel.org/all/20250203031213.399914-1-koichiro.den@cano=
nical.com/
> RFC (v1): https://lore.kernel.org/linux-gpio/20250129155525.663780-1-koic=
hiro.den@canonical.com/T/#u
>
>
> *** BLURB HERE ***
>
> Koichiro Den (9):
>   gpio: aggregator: protect driver attr handlers against module unload
>   gpio: aggregator: reorder functions to prepare for configfs
>     introduction
>   gpio: aggregator: add aggr_alloc()/aggr_free()
>   gpio: aggregator: introduce basic configfs interface
>   gpio: aggregator: add 'name' attribute for custom GPIO line names
>   gpio: aggregator: rename 'name' to 'key' in aggr_parse()
>   gpio: aggregator: expose aggregator created via legacy sysfs to
>     configfs
>   gpio: aggregator: cancel deferred probe for devices created via
>     configfs
>   Documentation: gpio: document configfs interface for gpio-aggregator
>
>  .../admin-guide/gpio/gpio-aggregator.rst      |  107 ++
>  drivers/gpio/Kconfig                          |    2 +
>  drivers/gpio/gpio-aggregator.c                | 1129 ++++++++++++++---
>  3 files changed, 1050 insertions(+), 188 deletions(-)
>
> --
> 2.45.2
>

I did some more testing as I want to pick it up for v6.15 but I now
noticed that we're hitting the lockdep_assert_held(&aggr->lock) splat
in aggr_line_add(). Could you please look into it?

Bartosz

