Return-Path: <linux-gpio+bounces-17379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF60A59666
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 14:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E1DD7A2079
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE661226545;
	Mon, 10 Mar 2025 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="loGHcEf0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD7F22A7FD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741613547; cv=none; b=cgVl5JKBUHVrslLqNiPteIFD3rpGxprERQFbuBi2mAFdmVZKlfe8KG0TJhxkdol3zePQD+iTOmZsiJEdqUnt66f563mzGHlgAec+hrvVJoau55/yvPH4uqgPFr18oT5SrhRlfnhns1KldKxUDt3FPUatTWgHMbPicQif+N2VT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741613547; c=relaxed/simple;
	bh=mLdxVos0hPyLd2bmuvUrymnzAJjvTnjjfAT+4GunGm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URjiuFYos6PcV34oik7AwJ2cQe64OPuEz4FLam2iXIK1zgtRvyMEwFWhdBoTMg9Gl+KgKJuPijUNQ02fni0B6lEtAIe9jC8cxoWzAHMen3vYSeo6gvBJeSoYiJNYMMJ66uGxlrBTmDwo22zvQER03q3TuzofKF92S6iISys2Okg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=loGHcEf0; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CAFF23F85F
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1741613536;
	bh=HaCDmfpp8ZRPXhUw4ZNlmKPznZLLlpm1APhqUxOUw6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=loGHcEf0YAv1ppFDAeIRIRnx5q+dbD9a3fuw83OK50wvYOC00Pf62JnW3qgi9NGBM
	 OjmBE2kBej3NtHu1QIV8dQ2yx3sVM42XGwPhJtZujjgWiTEwv/1CSZMC9lWGisf9uf
	 oz/GS5ZpU2lH+/jHv/xH6fBrpm6tBMog2t0YVib/1Rtc5+bH7HrQhzH4MukSodpcqd
	 qKHR/hz23omI40dOzIcJhurftwH0WmLF11EsutTvOprCL26AbeCiBO6hgcukU8OM51
	 JBl2E/IZ5x2Zq+5dk4RK9s41WcOCP+BfAjyniuOZvxik0TuIfqeNCHpkCoPtoyF5Pg
	 s1r5RiEKcvSoQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so7183095a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 06:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613535; x=1742218335;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaCDmfpp8ZRPXhUw4ZNlmKPznZLLlpm1APhqUxOUw6M=;
        b=GxuBjE4bDR8TPX7VH30QkUi8WGp2d+rVwdsSaLD33nsGrWOdJyOiJ8at+4nBmdQpAg
         hZaoyclOcqWaBkxN/NfNZqu2m3ucoR/asujQquCyWyt44fl+7c1343LrPO7PPaoOLyMH
         +CPaefjV7tJxCv4T8aR8KDcVtT7Fx4teGHINcU390wGub8QeXGjIKhcw0MvezcJAZCsk
         13KCFr8Zk3Ay0b6t7jEEghyyKDwhSEdqUG4alRNjyy2ZTw0xRJVkEEIHSTmcF+FGn7uC
         YGmUw+WYl63JFfd6ued10YE5MXzMpXYOzwkgUWTTnb0j93zh8JE4wmEYBSYwDjM0r8SZ
         HlTw==
X-Gm-Message-State: AOJu0YzG8ivWHUI/HnBDPgpMYP/lEC/b2RRTwQhQ/F2vzvLdNOyyXPrJ
	RLlv7Vc+HsdTcZo8NW68JLllurgL6Iz5AM2vajC/Xe51u0g941JHUIwSoBJWfjNDe8wlAdC8H/2
	dGb2SXIB78EuZwua5DlrtlYiETw/QhQ6qoatvl/NDrh3NovrflYZ3+osKBq1vN18YHNNmAbCPOS
	M=
X-Gm-Gg: ASbGncu0EF7yJIBWsdei7u3yLhNK8uJTSsX7d0JjkROn7CzC6bKHcQBokkJeJmsaorY
	AOWuqU18dtIO8gWNjddlL1k4QfT+XBTjDmxhNvwCvfWOr8v+czlUjwDNYnC8nVPsrwSpw1onJb1
	7LAKKVE5t3EJYfML/DwDc56LJQ8ykxQdLYwoA2QBdFSwrPU/gf+R8d5uJxGru1Npcck1NXLMoNV
	isVG9QPfBuo8Yf3zyobP9MeaaiIUdaFFiHi4XiYzI6LjxaEZayR/fPauKnhN5oyfVgWRCChT4kR
	YdupxXyXEUDKDiFXUw==
X-Received: by 2002:a17:90b:394d:b0:2fe:a545:4c84 with SMTP id 98e67ed59e1d1-2ff7cf13eddmr17068168a91.34.1741613535216;
        Mon, 10 Mar 2025 06:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHz263sGPsYQaHEeN0+wO5Ne+rOpPHxsfXurrvf0VqTDGXjQ+3335KRj6Lff0lJoRAFMdhBw==
X-Received: by 2002:a17:90b:394d:b0:2fe:a545:4c84 with SMTP id 98e67ed59e1d1-2ff7cf13eddmr17068137a91.34.1741613534819;
        Mon, 10 Mar 2025 06:32:14 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:55b0:de12:de5a:26cc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7747aesm9740634a91.20.2025.03.10.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:32:14 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:32:12 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <oedikhiegt3iqj7xg4vtfhlqxihicd7bdtaglk73q2m3c42zla@roh336fpkszm>
References: <20250224143134.3024598-1-koichiro.den@canonical.com>
 <CAMRc=Me9_EvVj2U-wGWjoVyH_igZBtUs1ymtE=4_r2EkSBAAcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me9_EvVj2U-wGWjoVyH_igZBtUs1ymtE=4_r2EkSBAAcA@mail.gmail.com>

On Mon, Mar 10, 2025 at 11:19:40AM GMT, Bartosz Golaszewski wrote:
> On Mon, Feb 24, 2025 at 3:31 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > This patch series introduces a configfs-based interface to gpio-aggregator
> > to address limitations in the existing 'new_device' interface.
> >
> > The existing 'new_device' interface has several limitations:
> >
> >   Issue#1. No way to determine when GPIO aggregator creation is complete.
> >   Issue#2. No way to retrieve errors when creating a GPIO aggregator.
> >   Issue#3. No way to trace a GPIO line of an aggregator back to its
> >            corresponding physical device.
> >   Issue#4. The 'new_device' echo does not indicate which virtual
> >            gpiochip<N> was created.
> >   Issue#5. No way to assign names to GPIO lines exported through an
> >            aggregator.
> >
> > Although Issue#1 to #3 could technically be resolved easily without
> > configfs, using configfs offers a streamlined, modern, and extensible
> > approach, especially since gpio-sim and gpio-virtuser already utilize
> > configfs.
> >
> > This v5 patch series includes 9 patches:
> >
> >   Patch#1: Fix an issue that was spotted during v3 preparation.
> >   Patch#2: Reorder functions to prepare for configfs introduction.
> >   Patch#3: Add aggr_alloc() to reduce code duplication.
> >   Patch#4: Introduce basic configfs interface. Address Issue#1 to #4.
> >   Patch#5: Address Issue#5.
> >   Patch#6: Prepare for Patch#7.
> >   Patch#7: Expose devices created with sysfs to configfs.
> >   Patch#8: Suppress deferred probe for purely configfs-based aggregators.
> >   Patch#9: Documentation for the new configfs interface.
> >
> > N.B. This v5 is based on the latest gpio/for-next commit as of writing this:
> >      * 45af02f06f69 ("gpio: virtuser: convert to use dev-sync-probe utilities")
> >
> >
> > v4->v5 changes:
> >   - Rebased off of the latest gpio/for-next, that includes the patch series:
> >     "Add synchronous fake device creation utility for GPIO drivers"
> >     (https://lore.kernel.org/all/20250221133501.2203897-1-koichiro.den@canonical.com/)
> >
> > v3->v4 changes:
> >   - Splitted off the introduction of gpio-pseudo.[ch] and conversions.
> >   - Reordered commits to place a fix commit first.
> >   - Squashed the trivial update for gpio-aggregator's conversion to gpio-pseudo
> >     into the primary commit "gpio: aggregator: introduce basic configfs interface"
> >     as it is only meaningful when combined.
> >
> > v2->v3 changes:
> >   - Addressed feedback from Bartosz:
> >     * Factored out the common mechanism for synchronizing platform device
> >       probe by adding gpio-pseudo.[ch].
> >     * Renamed "_auto." prefix to "_sysfs." for auto-generated
> >       configfs entries corresponding to sysfs-created devices.
> >     * Squashed v2 Patch#3 into its predecessor.
> >   - Addressed feedback from Geert:
> >     * Factored out duplicate code in struct gpio_aggregator initialization
> >       by adding gpio_alloc()/gpio_free() functions. Note that v2 Patch#7
> >       was dropped for other reasons as mentioned below, so aggr_free() in
> >       v3 is unrelated to the same-named function in v2.
> >     * Removed redundant parsing of gpio-line-names and unnecessary
> >       chip->names assignments; squashed v2 Patch#4 + v2 Patch#5 into v3
> >       Patch#9.
> >     * Updated to use sysfs_emit().
> >     * Updated Kconfig (select CONFIGFS_FS).
> >     * Fixed typos, coding style issues, missing const qualifiers, and other
> >       minor issues.
> >   - Resolved an issue that was spotted during v3 preparation. See Patch#2.
> >   - Reordered resource initialization order in gpio_aggregator_init() to
> >     both eliminate a potential race condition (as noted in the source code
> >     comment) and simplify the code. See Patch#8. This enabled:
> >     * Removal of v2 Patch#7.
> >     * Merging of aggr_unregister_lines() and aggr_free_lines() into a
> >       unified function.
> >   - Disabled 'delete_device' functionality for devices created via configfs
> >     for simplicity. It was mistakenly allowed in v2 and proved buggy. See
> >     Patch #8.
> >
> > RFC->v2 changes:
> >   - Addressed feedback from Bartosz:
> >     * Expose devices created with sysfs to configfs.
> >     * Drop 'num_lines' attribute.
> >     * Fix bugs and crashes.
> >     * Organize internal symbol prefixes more cleanly.
> >   - Split diffs for improved reviewability.
> >   - Update kernel doc to reflect the changes.
> >
> > v4: https://lore.kernel.org/all/20250217143531.541185-1-koichiro.den@canonical.com/
> > v3: https://lore.kernel.org/all/20250216125816.14430-1-koichiro.den@canonical.com/
> > v2: https://lore.kernel.org/all/20250203031213.399914-1-koichiro.den@canonical.com/
> > RFC (v1): https://lore.kernel.org/linux-gpio/20250129155525.663780-1-koichiro.den@canonical.com/T/#u
> >
> >
> > *** BLURB HERE ***
> >
> > Koichiro Den (9):
> >   gpio: aggregator: protect driver attr handlers against module unload
> >   gpio: aggregator: reorder functions to prepare for configfs
> >     introduction
> >   gpio: aggregator: add aggr_alloc()/aggr_free()
> >   gpio: aggregator: introduce basic configfs interface
> >   gpio: aggregator: add 'name' attribute for custom GPIO line names
> >   gpio: aggregator: rename 'name' to 'key' in aggr_parse()
> >   gpio: aggregator: expose aggregator created via legacy sysfs to
> >     configfs
> >   gpio: aggregator: cancel deferred probe for devices created via
> >     configfs
> >   Documentation: gpio: document configfs interface for gpio-aggregator
> >
> >  .../admin-guide/gpio/gpio-aggregator.rst      |  107 ++
> >  drivers/gpio/Kconfig                          |    2 +
> >  drivers/gpio/gpio-aggregator.c                | 1129 ++++++++++++++---
> >  3 files changed, 1050 insertions(+), 188 deletions(-)
> >
> > --
> > 2.45.2
> >
> 
> I did some more testing as I want to pick it up for v6.15 but I now
> noticed that we're hitting the lockdep_assert_held(&aggr->lock) splat
> in aggr_line_add(). Could you please look into it?

Thanks. Could you share with me a sample splat?

Koichiro

> 
> Bartosz

