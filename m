Return-Path: <linux-gpio+bounces-3520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5D85BE9C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 15:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 498831C20D5E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 14:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383A96BB50;
	Tue, 20 Feb 2024 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1bGl4ldL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A017E6A8D4
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708438812; cv=none; b=OsNeOHwcZE+1Kmlv74I3z/QIoVIhzwcSZ1OuzHXhu2gZpNGVOafTh3lWXFmU4AI/aXBfJOJVWjmyJzm3CyMEXNHez+p+B/3X7o5CHS0+uFUd3owFwXXQ2Xvk7RybeAVnLgAJC8qdJLznwnVGC+sjmBk/IQg2DGx+c58AhTs593E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708438812; c=relaxed/simple;
	bh=48womPk9DGD0jZ8lhc8PlrjqWPDLdoKv+1RFlvmpOPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=du1fyFccfsT30cmOII5ljRvka0dvcmdx+mfM5EWdUEBZ1RBNZI4TrZ8r0BTbG3BlLMz8ZjEkFxHgzpuqgvunWA0n4VcBhdhJIVr+otjZYBhKC+MUWjKK1BfoupHxEUTlhnq95f3FZA/DVmgue4u5xX0MDAVRdPmEChYeWxT5mWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1bGl4ldL; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-59fe5b77c0cso943929eaf.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708438808; x=1709043608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k55yQJs+Dey36k/hxT0QeaBbeXBq2IfYIGNUVHLCfU=;
        b=1bGl4ldLAe3spnfpEOdNnc1ZKZNPWETkTqeLDkHo2E5/39v7W7OecYPU4pGJuQ1z28
         HS/NXVDOQb9jb+eDsaTie5d9fh9pzepLSjBzKsCAeWVKTfCJAva4Eew4e1fgFnfqmd8x
         4DZimRjpf+8jR8DaMWxv2pbOv4medEG64Bo/w548sIYn770NYZfZpTsdP4ChCUo6PONf
         /Yr/7j02JTAANis2JAuXtA4ITId4Xj/J4n7ox8ObdRR825c6dKOhcgKBKiKkppcc8FEr
         Yy767zbhx5zBCeEnpMmXy7OAgT0tp3hhTjQ29khw/9p9879pbwVpD6w4B/q4VdDlYxZ8
         aDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708438808; x=1709043608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1k55yQJs+Dey36k/hxT0QeaBbeXBq2IfYIGNUVHLCfU=;
        b=BL1ESZggKi8Kk1f1Yju8AGzsny6j6Ihos8L8Dm70ML6ozSJUVq480eqFTbsrsLMdZm
         yc3RQ8PmEZk6njiJra6QORmuwfiWku9Tzs+dkxm24DfaJ/VNBJZrJC75AG9ikwKfHRNG
         kTQ6A8mWfJliMmnfLU5+3sTUYT65BGjO9s/0n1qr00kbhmd6gq9TPLDURnnTdlGxav4l
         ixLBw3Uq3GmdKC2LHYpK/qN2dIy/itm9EUqzDG5oKqQHAMj1h9qWaQSLF1PrRCptT49U
         WECCCujpmz4cgqpNS8OfxHdMhSLzR4Fz4M5YrwtfofFt3IxbSe01FgFBTirZQAq30O9q
         /OHA==
X-Forwarded-Encrypted: i=1; AJvYcCXxy6RLWmdATGfDGjIvRinTA2sTZGKscM3JSOmtyQ7BGzXgEVbnuXo4/vkPlISa3+7roisfLPKGcf/vVtxHmV2umgoLLZ8SRCdGxw==
X-Gm-Message-State: AOJu0Ywa3XVcipSQQNsBu3R+5T1QQfMBemfUS3Nr6tIJ/L5iDUQvcD4H
	7AiXYl61aJ40vGu01BnzHNrd99mzzmO2bsqME/iypK6XmI3CmdyFkI2Ocakv1q/NMGHJcULaT13
	5GtE/y/+G91SlqkdmyX8Gi97rgT5YWus0fw6UEQ==
X-Google-Smtp-Source: AGHT+IFMnXiKG47gNdHQm7RVwIso6YbTWdIs9HphpyCnoOP6Xb45mzpZFaUrVrOl7nB1Bxt7pQX6gzBpMMRlDVBrGho=
X-Received: by 2002:a05:6871:5b1d:b0:21e:aca4:883 with SMTP id
 op29-20020a0568715b1d00b0021eaca40883mr9346365oac.15.1708438808666; Tue, 20
 Feb 2024 06:20:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220133950.138452-1-herve.codina@bootlin.com>
In-Reply-To: <20240220133950.138452-1-herve.codina@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 15:19:57 +0100
Message-ID: <CAMRc=MfWPEOHeNvAwra-JxHZBFMrQbP+273zbFLDZfxi7fx8Yg@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] leds: gpio: Add devlink between the leds-gpio
 device and the gpio used.
To: Herve Codina <herve.codina@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 2:39=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi,
>
> Note: Resent this series with Saravana added in Cc.
>
> When a gpio used by the leds-gpio device is removed, the leds-gpio
> device continues to use this gpio. Also, when the gpio is back, the
> leds-gpio still uses the old removed gpio.
>
> A consumer/supplier relationship is missing between the leds-gpio device
> (consumer) and the gpio used (supplier).
>
> This series adds an addionnal devlink between this two device.
> With this link when the gpio is removed, the leds-gpio device is also
> removed.
>
> Best regards,
> Herv=C3=A9 Codina
>
> Herve Codina (2):
>   gpiolib: Introduce gpiod_device_add_link()
>   leds: gpio: Add devlinks between the gpio consumed and the gpio leds
>     device
>
>  drivers/gpio/gpiolib.c        | 32 ++++++++++++++++++++++++++++++++
>  drivers/leds/leds-gpio.c      | 15 +++++++++++++++
>  include/linux/gpio/consumer.h |  5 +++++
>  3 files changed, 52 insertions(+)
>
> --
> 2.43.0
>

Can you add some more context here in the form of DT snippets that
lead to this being needed?

Bartosz

