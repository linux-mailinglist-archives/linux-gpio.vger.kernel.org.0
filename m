Return-Path: <linux-gpio+bounces-17834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3179A6AA6C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 16:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCBC51899F29
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 15:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C26E1EB5D8;
	Thu, 20 Mar 2025 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UkFNKTiT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5B814B08A
	for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742486195; cv=none; b=W4fCI+5rLbyPg/fLyioVbDEwuEmWOboXqxIgkfIcYqQ6muEx1r7lxkYqhCUCoQ3fq6lTL742mlxXXlrV/nOUhLdBGxAOqnbHITXIBM4f2/oVXg32ZQWRygRR+p3vLhDWQle0pTAXvVu/HX4Xpfp6ocT51bC/7rLl0HR/GTiuzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742486195; c=relaxed/simple;
	bh=Pg+8432XIY1RmD3o7Gs+WGJlVnBjwftYIj/Xx29MjkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oic8Qzjw36635ANoE/E2GwkOzYMnKGphiwXgoYjsNQ9EfdxP2k2/yVjEFEm44u07N5c+Cse9nec/uYeH95ph7drsqHqW563RTp/ufmyYxi+zIZc24+ph/bcLq1TSQiGAj7tMhrrJ5xbTQO7a2b7VRJcHmYkbN094ijh5Gmoc/9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UkFNKTiT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30762598511so11637391fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742486192; x=1743090992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8n8TNAgQeXDINcAz9ek7HcTAkZoaBTVAa+vhgGh7zC8=;
        b=UkFNKTiTk2jcOiBYGxDE9VX2UvjeBF8GiKO6NUAylRBDnP0mLMC86FkXN2uKPke7gV
         Q40snUHHAMqDQGeupeqw0sPFHt+A7Xw0xiPWsn4mgDCeZ3Oc3FlZEsdXDgBXoEe96HJ+
         21aoEGr9sUc2j742dizqI8m9gkdMTgrv39bkqNoNo9Fb+b3ye9RljZtQTvySh1/HYvXs
         fCdxISB+cAKyL5nl6DWmcPEEJ+oTdoXWbqoB5xxFK1ZmtANwIHiN8jaN+J/vhWb4g4Yj
         cWnzh+j1HJxAgphKj4gByYlrywmbgJ0FGaFflM2mvj/FHEf0cTEnnAKnDgO5V58ZXHuR
         Uvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486192; x=1743090992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n8TNAgQeXDINcAz9ek7HcTAkZoaBTVAa+vhgGh7zC8=;
        b=WQpGDGHhC8+DmV5H4T5sBkklGZTdfNthcHBETzUd/91OQJu/O2XuZIut4wlAGhKsYy
         fNV2n+gTNRYsTjRKa/rVW9ulRl9sOJV5lyTLcn85OvocYsNNFjPenAbfCyloHTMgm919
         vc0ycJiVW9JJWc1vJElZ5Zhql76YQ9LEQebRF6dH4MqiHzJhL/FYbrW6u3uQqAwumhrS
         yhFHQEymGdNQH1uKqpwCPh8zYJsDzJW5cKuBI5nI0/Moq9Yo8clsgjJaRLO0hZVqZXI4
         hOV6o/EiqeKO34xhJnI34+3doi3OomtmtESmgcB/Ai73+EVeY0n452ZtRGddWYjTJEpf
         Ix+w==
X-Gm-Message-State: AOJu0YzSH3CuxV9LqsfMegqX1/CRLtEqW79GeKgzseLfHmxK8WP24l4B
	LuxcC7pcmv8/kpkHxrH44fPn0epDyjA4grnSUPP8VzWDup78+5BnCtQH7fxmPKAiUJgbCEAMGPI
	3vc2uB/Md2vggCeN7zkui8ZrGoumQXM2IQ0iviz61wTAxa8ps
X-Gm-Gg: ASbGncvLJRXZS2XeDRvRmv9mB/PJbOD29+wigIVRSUtoWiXo3Ngm0kbIh9p9ndmMtR9
	j0GqY/lOwpetOYaZugEhxH+LWzleWyBwPZEmI3qcXcP0zQL8DvBkhLqBJAmBD6obWFTWK9rMW6H
	1LrnbhYMrmic5ZSjUykGqYCUvM61GyXE1nkPTWpLD8g6bsEx4+5OEQp9HHTQhQQSYo6G4X
X-Google-Smtp-Source: AGHT+IGTwvnzBedelgYeIG2XIlrHeQ96Vy3zCeIi71ifL5+oZNFvcJoCUD0BJMTuIVRe2FGR3+BTabWjimKS/VvsbXc=
X-Received: by 2002:a2e:b8d6:0:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-30d6a1efadbmr34464451fa.0.1742486191822; Thu, 20 Mar 2025
 08:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
In-Reply-To: <20250315164123.1855142-1-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Mar 2025 16:56:20 +0100
X-Gm-Features: AQ5f1JowFng81dq75UDfEEYlHxIDBQIW-PBU1W4Hva1SRz22XpNprkVHqgRNKUc
Message-ID: <CAMRc=Me=um+=uAKxP8enVPQ4gZvKgtsmaT5m0tM_=7-xGRVY3w@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 5:41=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
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
> This v6 patch series includes 9 patches:
>
>   Patch#1: Fix an issue that was spotted during v3 preparation.
>            (Not present in gpio/for-next, so retained in v6.)
>   Patch#2: Reorder functions to prepare for configfs introduction.
>   Patch#3: Add aggr_alloc() to reduce code duplication.
>   Patch#4: Introduce basic configfs interface. Address Issue#1 to #5.
>   Patch#5: Prepare for Patch#6.
>   Patch#6: Expose devices created with sysfs to configfs.
>   Patch#7: Suppress deferred probe for purely configfs-based aggregators.
>   Patch#8: Documentation for the new configfs interface.
>   Patch#9: Selftest for gpio-aggregator.
>
> N.B. This submission is targeting at gpio/for-next and is based on:
>      commit 21c853ad9309 ("gpio: adnp: use new line value setter callback=
s")
>
> v5->v6 changes:
>   - Addressed feedback from Bartosz:
>     * Resolved issues spotted with lockdep and kasan.
>     * Added kselftest for gpio-aggregator.
>   - Fixed a memory leak in aggr_free_line() (missing kfree(line->name)).
>   - Fixed a bug I mistakenly added in aggr_parse() (misplaced scnprintf()=
).
>   - Eliminated a potential lock inversion deadlock by removing
>     gpio_aggregator_lock acquisition in gpio_aggregator_remove_all(), whi=
ch
>     became unnecessary after the upstream commit 12f65d120350 ("gpio:
>     aggregator: protect driver attr handlers against module unload").
>
> v4->v5 changes:
>   - Rebased off of the latest gpio/for-next, that includes the patch seri=
es:
>     "Add synchronous fake device creation utility for GPIO drivers"
>     (https://lore.kernel.org/all/20250221133501.2203897-1-koichiro.den@ca=
nonical.com/)
>
> v3->v4 changes:
>   - Split off the introduction of gpio-pseudo.[ch] and conversions.
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
> v5: https://lore.kernel.org/all/20250224143134.3024598-1-koichiro.den@can=
onical.com/
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
> Koichiro Den (9):
>   gpio: aggregator: protect driver attr handlers against module unload
>   gpio: aggregator: reorder functions to prepare for configfs
>     introduction
>   gpio: aggregator: add aggr_alloc()/aggr_free()
>   gpio: aggregator: introduce basic configfs interface
>   gpio: aggregator: rename 'name' to 'key' in aggr_parse()
>   gpio: aggregator: expose aggregator created via legacy sysfs to
>     configfs
>   gpio: aggregator: cancel deferred probe for devices created via
>     configfs
>   Documentation: gpio: document configfs interface for gpio-aggregator
>   selftests: gpio: add test cases for gpio-aggregator
>
>  .../admin-guide/gpio/gpio-aggregator.rst      |  107 ++
>  drivers/gpio/Kconfig                          |    2 +
>  drivers/gpio/gpio-aggregator.c                | 1155 ++++++++++++++---
>  tools/testing/selftests/gpio/Makefile         |    2 +-
>  tools/testing/selftests/gpio/config           |    1 +
>  .../testing/selftests/gpio/gpio-aggregator.sh |  723 +++++++++++
>  6 files changed, 1800 insertions(+), 190 deletions(-)
>  create mode 100755 tools/testing/selftests/gpio/gpio-aggregator.sh
>
> --
> 2.45.2
>

It's too late in the cycle for this to make v6.15, let's try again
once v6.15-rc1 is tagged. I've tested it and it now seems to work
well, I've been unable to trigger any issues even with corner cases.

I still see some nits I'd like to see fixed but I think we're close to
getting it into the tree.

Bart

