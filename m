Return-Path: <linux-gpio+bounces-6831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE4F8D3602
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897FD2884CA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09841180A95;
	Wed, 29 May 2024 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D8FGKOsf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44952180A8C
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716984524; cv=none; b=DEW7Q9x3n6u9S97nW2616gK+IJ9q9dezoD970Dp80Od7YtEQg5OmM+o82MkuhHt8vrZzQEkSlSq/4a+Psn8JbfGEdek1YzTSKTg9uVL6WNSjtNXxhOtBx0MohX7M7EB+1+c/dOpg3n0TnUUUrjdb6BLmSh7YH/yEyojSEp/fpgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716984524; c=relaxed/simple;
	bh=Hpc7i4DE/SRzxSPvG9MuoN2CLGHMX/dqTuPNf7zscHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9oKOE3AAPpB/lR6ByfsM94ELs6vSA/jmHz9hTiL+30rFZCQHpYb3n0H13iCoT2g7XsHqddT3CLchVr07qBVGfxY0zMs6fm+tN4dJy2RYa4v3chIqKt30Xr5dgK3/RxP3U7DoY/q/gbr0Ffq1j2xU8QAm8hC+I/KwKRZ0t6E4oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D8FGKOsf; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e8a8ff4083so7020241fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716984521; x=1717589321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjE/8Hdmv5+qONkYGkMmdQo6qbVXwwAWCf8Z0CyKKLc=;
        b=D8FGKOsfI3yybqD6iQC64C+8BahIQUdoSvuZrEiWoAfKXFa+MtHNBjzcT9c1NolCkb
         QsSaOtrcn3R5FX8YnqDvNFp8EmxozHrDqXP68AXxMRwpys/9a3Ij2UqKjPngEIbWQyRD
         ZBJZlHIwB6FFwJXYeZTLErk1JeaXpSI9YobdWLeF76jdDi4bVNWF1kiX6v7G/vb3A5Kn
         7b6noByIwf2Ky+RoH8InUdrTL7g4MLWL2gn1hQiYz2d7LZ2mcMG2Fep3T8nGv9K4FoSG
         W+QvslnK8m+NUPa2+76zUbKRYBr43vI0aK5bk8d8TCncyBJK2Rv26UXt4dRwpD2wsEzJ
         Vkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716984521; x=1717589321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjE/8Hdmv5+qONkYGkMmdQo6qbVXwwAWCf8Z0CyKKLc=;
        b=aIRk7bPI9cznbU5xwSIHJIVxpQr6GZjuPJ2kXQkv+40AxZMY7BgUPaHwjQwzSh+pal
         QJdD0KqhDF3U2WsenFdUnQ7xYCWMLxd8tB7ahKg2QPosWMLly5hFtF5LVgeZYFVsJdUJ
         PL/93LRflD8g5pAjfj2qWqHhFnIdUx/LkHXL/g+kIxGZf5S9h8TMUdPnJhAMnQNa/AbL
         W110+O6RrxKLxTg8bqhXkMQ4H0DXxdx4L6YsQLx6WwpwAHL94Inc1GRcCcjtpxBYFi30
         HNLrXWZd9K9lnCp/M69RGoEAu7QX0ORtSOtyT2HNCdE6bNjPdJZnn1PGRxk3BuEQcn2g
         rp4g==
X-Forwarded-Encrypted: i=1; AJvYcCXDhZz6kJRcb6cSv11NHFVCA/NqKAObY8ZYIrrcbDkEQl6H9YQVF5KKb4xGUXevpS/9T5oArQ3dtqLNXqU8RHxTq6FmlX54IKAsGQ==
X-Gm-Message-State: AOJu0YwFe/DHIQZTWjY1S2zA+lSDBPZk5brEol0Xm5V07FyXMCP4vOko
	D5QO/dpk0YzsLxY8syQAWkPE/PWZTmasTrm8VAKVnmcwGzc/6lJcn9toNaCFjikeqUsdqUNqpaR
	am25vIDobPEIPkpc2EUi2FegD+6VpoSo2dYY7IA==
X-Google-Smtp-Source: AGHT+IG7Wet5A5wYUYvBaFU2dKtgqKHJmD4upJcCorxPS8FlmcX5p9nSHwp539xxXr71uaIXwfCD9my/qmuQdu233KE=
X-Received: by 2002:a2e:84d7:0:b0:2e9:8294:e6d0 with SMTP id
 38308e7fff4ca-2ea4c8a02e8mr4368731fa.25.1716984521398; Wed, 29 May 2024
 05:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 May 2024 14:08:30 +0200
Message-ID: <CAMRc=MeN+QzzSy1BwiD57Y3vTF9Ups=6dtWuFbPmxzOxic=arQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio-tqmx86 fixes
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Gregor Herburger <gregor.herburger@tq-group.com>, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 9:46=E2=80=AFAM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> This is the first series of improvements to the tqmx86 GPIO driver,
> which fixes some long-standing bugs - in particular, IRQ_TYPE_EDGE_BOTH
> can never have worked correctly.
>
> Other patches in the series are code cleanup, which is included as it
> makes the actual fixes much nicer. I have included the same Fixes tag in
> all commits, as they will need to be cherry-picked together.
>
> A second series with new features (changing GPIO directions, support
> more GPIOs on SMARC TQMx86 modules) will be submitted when the fixes
> have been reviewed and merged.
>
> Gregor Herburger (1):
>   gpio: tqmx86: fix typo in Kconfig label
>
> Matthias Schiffer (7):
>   gpio: tqmx86: introduce shadow register for GPIO output value
>   gpio: tqmx86: change tqmx86_gpio_write() order of arguments to match
>     regmap API
>   gpio: tqmx86: introduce _tqmx86_gpio_update_bits() helper
>   gpio: tqmx86: add macros for interrupt configuration
>   gpio: tqmx86: store IRQ triggers without offsetting index
>   gpio: tqmx86: store IRQ trigger type and unmask status separately
>   gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type
>
>  drivers/gpio/Kconfig       |   2 +-
>  drivers/gpio/gpio-tqmx86.c | 151 ++++++++++++++++++++++++++-----------
>  2 files changed, 106 insertions(+), 47 deletions(-)
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>

Hi Matthias!

Not all patches in this series are fixes (as in: warrant being sent
upstream outside of the merge window). Please split the series into
two with the first one containing actual fixes to real bugs and the
second for any refactoring and improvements.

Bart

