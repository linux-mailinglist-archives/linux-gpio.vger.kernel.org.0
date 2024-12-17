Return-Path: <linux-gpio+bounces-13964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F193B9F4D4D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3DBF7A8944
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBD71F5421;
	Tue, 17 Dec 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ud2hNPr5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C5B1F4274
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444686; cv=none; b=kNiS2KaYudRAJH3BBAfhx1b2rCaOJG2DrGD2+75z2i+7Du3zhu8hnZJo0Z0NNLCX/thhEf4H8PTVOd9J3n/ZHuDASvXPEDqFWdhRnXbtGrx1naM23o73s3nh6mVG656dvgyCyhk9Ra6w/0GON6sYs7V+An54JLnNV2oxywQ0jDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444686; c=relaxed/simple;
	bh=8LEMCHKRS+LE1RqUP1A6fftRK+VowhA6EuhQTuy+2Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEcUZCP+Km3vpEapIgJc8pkmW52J4S0oOVysf8f+TgrFvUuFdNytYZLUylYfurODptzfkF0LWyP02v01WM+0MbS0br4P2hAVSNRVH/8S7bnwcdRE+uOtu8Uhj8yO68Nfo79eOP3pOtA0T5RBU0vm4+N8AQ9rjco8rB0i28tXivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ud2hNPr5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53df6322ea7so7270230e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 06:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734444681; x=1735049481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAhkRZI/DJr0Mto92qRa3lv3xoIGjVxLYwjI1gESl2o=;
        b=ud2hNPr593IfYLfae+AirxmVozIu63PrP2mj2oaROzkn7kr0YZZW9B7qGJnAfHrvhV
         woX7hC3aQKnafZlm2Qku/iQ1rVC5qfkqqHmT+HBAHBLOxHA2D8lizfgyspOtdmHxnD93
         ChPg60sCJQeJEQE+9GHed0XbgoDUSOJ6oamZ3eYP+Vmc/j4onwDuUn9x1QLrSYc6RjfD
         FcUK6v7Uep2gSc0upbBTwDPigpm2NebVl+Jb9jpN8taTIrQ3tvIlcZfsp63Jpp3cg3IL
         x1HaCAEj1NmgijAPbKHGz99f0tQIGkCpne6NusfUyssv4pKjvmfLlPBauyxe8+JtAc8T
         1XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444681; x=1735049481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAhkRZI/DJr0Mto92qRa3lv3xoIGjVxLYwjI1gESl2o=;
        b=abfFTA8IYobH3SHmUxn9TLDFsZEpfvpl4EZx86YJGEhEDyVlsa6zE2Gdbc3Gj/8H95
         wWiuBIgRoY7lE2w9+ExQ+9gZbRyPDG5IrsW4VCdn3H7mqpMmTd/FrrAcGtlHjqU1LJMJ
         1TPPSKHj8lkjqZCiiC4NMSZ3Nfk/GWA8CMRMlP88zaCTtUUEv7XZO8BoBspjQffCv25E
         2zdeSkDQp6rbbkVMsufXfStNsXkn34xTfx2IhbYaBCZmxbsqRGS1e5Tzei1c61p+iEEF
         8AMlDm2Y8AXoU2kUVhKmBvxmzBhm2/1MgOjCm9+O2gIa+60+N7DCyTTflSYqkFv5ybn9
         rvqw==
X-Gm-Message-State: AOJu0YyTdko0BixS+iPqH+fH98sp7q/C6t8ai2yUCR4qDKJtx/AinWjN
	Q1L4qUbr/FV1555xc3zRd9sZlXKlFJKzfFNmtSMj+v4yHHYdifyT5iX4lvr7ec2ckIVAGsumxM4
	I0tYSlpCIP2rAW8Z2FZEL40IdIqIDUGdwWgzRCA==
X-Gm-Gg: ASbGncsWVnzTrDIX7HN81HHexHoxfinhs+/hEDjHsVLEtX+RvN6JZhXQHk2kbK510DF
	wPdXciFyNwW3BbMYv2adTI5dzAHzTAxsv0AsKmg==
X-Google-Smtp-Source: AGHT+IHlfNzVpuZ2mLV9cI8GhXcm+Cf/+nMgpvHestuuhPJYfxjJ7mzNvXw2jesvGX1QEluGHQQrwnwpLDCfoloHMOQ=
X-Received: by 2002:a05:6512:10d4:b0:53e:3988:f682 with SMTP id
 2adb3069b0e04-5409054c38amr5823134e87.18.1734444681539; Tue, 17 Dec 2024
 06:11:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209074659.1442898-1-e.shatokhin@yadro.com>
In-Reply-To: <20241209074659.1442898-1-e.shatokhin@yadro.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 15:11:10 +0100
Message-ID: <CACRpkda4UGxAjXFOAu5SA9GX=9eNpXcxqUzkabmtA_sCqUG7=Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Fix sleeping in atomic context due to
 regmap locking
To: Evgenii Shatokhin <e.shatokhin@yadro.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nikita Shubin <nikita.shubin@maquefel.me>, linux@yadro.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 8:47=E2=80=AFAM Evgenii Shatokhin <e.shatokhin@yadro=
.com> wrote:

> If a device uses MCP23xxx IO expander to receive IRQs, the following
> bug can happen:
>
>   BUG: sleeping function called from invalid context
>     at kernel/locking/mutex.c:283
>   in_atomic(): 1, irqs_disabled(): 1, non_block: 0, ...
>   preempt_count: 1, expected: 0
>   ...
>   Call Trace:
>   ...
>   __might_resched+0x104/0x10e
>   __might_sleep+0x3e/0x62
>   mutex_lock+0x20/0x4c
>   regmap_lock_mutex+0x10/0x18
>   regmap_update_bits_base+0x2c/0x66
>   mcp23s08_irq_set_type+0x1ae/0x1d6
>   __irq_set_trigger+0x56/0x172
>   __setup_irq+0x1e6/0x646
>   request_threaded_irq+0xb6/0x160
>   ...
>
> We observed the problem while experimenting with a touchscreen driver whi=
ch
> used MCP23017 IO expander (I2C).
>
> The regmap in the pinctrl-mcp23s08 driver uses a mutex for protection fro=
m
> concurrent accesses, which is the default for regmaps without .fast_io,
> .disable_locking, etc.
>
> mcp23s08_irq_set_type() calls regmap_update_bits_base(), and the latter
> locks the mutex.
>
> However, __setup_irq() locks desc->lock spinlock before calling these
> functions. As a result, the system tries to lock the mutex whole holding
> the spinlock.
>
> It seems, the internal regmap locks are not needed in this driver at all.
> mcp->lock seems to protect the regmap from concurrent accesses already,
> except, probably, in mcp_pinconf_get/set.
>
> mcp23s08_irq_set_type() and mcp23s08_irq_mask/unmask() are called under
> chip_bus_lock(), which calls mcp23s08_irq_bus_lock(). The latter takes
> mcp->lock and enables regmap caching, so that the potentially slow I2C
> accesses are deferred until chip_bus_unlock().
>
> The accesses to the regmap from mcp23s08_probe_one() do not need addition=
al
> locking.
>
> In all remaining places where the regmap is accessed, except
> mcp_pinconf_get/set(), the driver already takes mcp->lock.
>
> This patch adds locking in mcp_pinconf_get/set() and disables internal
> locking in the regmap config. Among other things, it fixes the sleeping
> in atomic context described above.
>
> Fixes: 8f38910ba4f6 ("pinctrl: mcp23s08: switch to regmap caching")
> Cc: stable@vger.kernel.org
> Signed-off-by: Evgenii Shatokhin <e.shatokhin@yadro.com>

Excellent analysis, patch applied!

Yours,
Linus Walleij

