Return-Path: <linux-gpio+bounces-25931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400EFB52A37
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 09:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F7E16EC54
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 07:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C60273D7B;
	Thu, 11 Sep 2025 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wCZbMyiZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845BF1DBB13
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757576309; cv=none; b=KeAKvypXKLmgNipWBEMKW1VFc4TgBK5wG4jaFdF37SlC4qeph8HqDt6ji5uL5nRFY+y/nhQgrE6qe24JZD+3kkmKifj8scAeJWunBsKq8DICVd7ymgvVCR531W57GUcBgm3jByYgI06bNwnqUa8kXWiozSzNbQqLvfN+tg+kP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757576309; c=relaxed/simple;
	bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3Kf/5Cf84bnJ/+A8XSWx5K8I8QEzY4PbVSW7cLLzRZuE8bAROz0TAT5eWjZI1XzaRsJlaO+g43oT1Ag1cwdRuCQdue4q2Lecti8G5FjrKuW4ZU2qSOebJiYaZuytNgDkKos639kze3a1a0mBpAaPR9p6DPLEk2i+jFLx5p2rlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wCZbMyiZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-560880bb751so381859e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757576305; x=1758181105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
        b=wCZbMyiZTwJnq9pS7/KeUMs+A7K9WGJRXQ5wonRBAknPQ201tGoLXhinlxKm1zXhWe
         Xc31QrJO0CjLxC6AWuLfc50kiBT8sDV11mv9jWVsa6D00hYWx1riUdBmeEw0V/IREp9q
         5oQoBmP9Y4wnjXcls6gxP0vdNV/BHZHoDGTSQ2/Ie4x0iNplUTRE5wMUxgzrUw9vnGms
         9zof++aiF99/+XvbCkQGKJlYOvX657iPx2MDmQXOxI+lzfWWgtt4l/P4aHhnxAtjELej
         hMUpL8dYFM3uUIFTXerUetDPXV8pOfq3Bw3g+tQK5Rr17bLia0tbNU42Ol6IPqPLUeGL
         x71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757576305; x=1758181105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUK8rXo2J6tdIuNkdbMKBrXU6Rird8FTI89p+KzSTdU=;
        b=Rp3Q1vZHXrn1g0w1yNWaV5QwFtPk+j+/eunPXnsPGM/tvTNBWT3H2JJ2/fI6XbEXxS
         2l9xKr1O8GektV0PL7xhWEozwn3xsIcESxxeRN8x5eJXbkf/9nEX7eOVgu96yeE8BFhr
         JR+oLhyDP3lJcGB+Dm82QZ4zIPkhRVLWWeBPQVcvHAhsCmSkJb1c9k7gXj19/cAhudhr
         VAuBGGqQPR5oVT6MqpTY5WqyuP69umyA5ffLDFwMD579GsiCfFrcHeBQWvUxBFsKr/a7
         bbaprpZh4KzFdwh9uGQnRFCMDqF4nF827oP/d7DLghiO7GMjux2JX9LHae6tp10oKesF
         jtow==
X-Forwarded-Encrypted: i=1; AJvYcCULq/sxkE/pMSghftAiSDN9lcrP3b7K9QSsQCc5W/Lhp8lRKsAear8Qgqi1BBNOmOmSe/voZWe5lTZy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj+g65ea0Btigsm0TGSx6jHgEmUlEI9ToG6CxZi85umF1DKQpl
	U+WuIYaJ9mIUkHRqVT5gh/3zclPJWrqS7J0CP6jIVQiZNpQb6NbxXBo22iS5A8aI7z/hYqmmpOz
	dLD4XyBnmaT1s3tnFce77uLorOFIkeirnI5msaqgnUg==
X-Gm-Gg: ASbGncuZ+rN0FgBBPCex1CwwIXNaDs+Y1CrQuYncWgLkyuPHSdOsjQaZrYO1XEqX8bk
	vqHpIu5TNrz4BjD6HtzW0JIs5nVaR3is5duSfVgLaVvdJbVIWds50iqqeDxnFjdOSYMoHENC+cC
	IWeHPEf3t+mWtbqAnaDRbHk+4tYIizMbZFhjL4v13DLNGD5IQtwm4VTw9u4g8tgb0BPWcOwH8oC
	Kc1AOi/PQrvXp47crmJbput8yjDtRCdEQyrXZA=
X-Google-Smtp-Source: AGHT+IGFKCUUrJkt+A6v+xuc1LQXhwUm4KpMBhnA0hSfXgMQG+z+UHy3svEwymKETUJXd9ilc9E5haoHU8vK2eJzapg=
X-Received: by 2002:a05:6512:b17:b0:55f:498f:f08e with SMTP id
 2adb3069b0e04-562614ff71emr7447870e87.24.1757576305171; Thu, 11 Sep 2025
 00:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org> <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
In-Reply-To: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:38:12 +0200
X-Gm-Features: Ac12FXwiBbcmTD8LlFccmOHZdwwoOfYFi61pHLgjut8Pxa8sFHcycGYwle9xiUk
Message-ID: <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 11:32=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Sep 10, 2025 at 9:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > Here's the final part of the generic GPIO chip conversions. Once all th=
e
> > existing users are switched to the new API, the final patch in the
> > series removes bgpio_init(), moves the gpio-mmio fields out of struct
> > gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> > the new situation.
> >
> > Down the line we could probably improve gpio-mmio.c by using lock guard=
s
> > and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" o=
r
> > something similar but this series is already big as is so I'm leaving
> > that for the future.
> >
> > Tested in qemu on vexpress-a9.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The patch set is a beauty, hands down.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I especially like where you caught local spinlocks being
> (ab)used instead of the generic irqchip ones.
>
> I don't know about merging patch 15/15 into just the GPIO
> tree, that can make things fail in other subsystems depending
> on merge order into Torvalds tree or linux-next if your tree is
> merged first.
>
> I would merge the first 14 and keep the last for the later part
> of the merge window when all other trees with conversions
> are merged.
>
> (You probably already thought of this.)
>
> Yours,
> Linus Walleij

I already have both pinctrl and mfd changes in my tree from Lee's and
your immutable branches. I pushed this into gpio/devel and it built
just fine.

Bart

