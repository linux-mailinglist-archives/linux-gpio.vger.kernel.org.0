Return-Path: <linux-gpio+bounces-21660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B6DADB027
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 14:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D86273ACD3B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 12:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950CD27380D;
	Mon, 16 Jun 2025 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w/0ai9F/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3481EF36B
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076841; cv=none; b=miqeGXzSFjjKCZhsa4Z8e50PmBK1ZDjETbIpqbCn8JZvwGruNwn0aBc1POpeIJd82Ne+jkeN0qrdus6mJB3+DxlX7rzpLG5LFcSemtDuxVI4OTMVXASn5mcbmaeaRWHUQA5765xZ7T3KrX8XfU5J1sCA81zojLsqHKeL0lm+SNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076841; c=relaxed/simple;
	bh=2ZSVW7xdVqkJzk/JnmXPdnxEo5mO1cTfeEV5hSa3zGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Caw798LReKCshvFbv2FZcKa8Ix/+vJCfUcm8gzotBeIQCh7/phuuz6aLLe4c6b6sP3qEei+HkWkw7P/taN31RT0odVdXKKBUAEpEkeHGa1BZtBw4N0roE0IDi7XX0BtK1F+v3d3H9Borz5aFdBG4O/4xT8ZqeciduiiC6oMc55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w/0ai9F/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553644b8f56so4538172e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750076837; x=1750681637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZSVW7xdVqkJzk/JnmXPdnxEo5mO1cTfeEV5hSa3zGU=;
        b=w/0ai9F/1ouue8aP8TbGJVQbjyB2UDqm2QeFWXvQRbul16AkNaYo+7MQQk0QJ48nOD
         jp4FCyxgzY1wWV50R6bhFJERRtTvIaeHZGB+Cy/CTO6CvgPT4FwXvCO/7+FrNPkD63vD
         RT1I9KtQkDK8ZEDwjU/VooLFcH8FHHZEoekdkdBR1r/eeYW4f/hCZR6SS4wlKec6Y1cr
         x2BktdqszWovKUhXeUOjt+UyyR0iy/oCO/5pIsN1Ud/F+T3h3kd/F0UFRyXk/p4o8x9/
         NoaxA6mEVnnINHi1YBj4HaUTIFMPs7r/SLRFYv3nplxYQ9fmtY62hcOR7cOhsyD4aaQo
         5QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750076837; x=1750681637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZSVW7xdVqkJzk/JnmXPdnxEo5mO1cTfeEV5hSa3zGU=;
        b=bmUYlFPphyK5n+rjyon9Fa4bantd1js15wN1xSVX0H8OA/wwEhUb8x+CpufVI22eso
         WIJ6ehtL0WU8u/N12IlwThNs5Dws/gWdsEfnIlh1IsqanAzi6qxDY/RpEHu/73BdlY2r
         NuMITm+fZbvj7yE21qmtoYF+uni5zpiTP2J4WwNE2kU1LMD5DJF1PL9xQiTiZnh98oxi
         BneN0tCf7JWWwWHjfNiCQXD9Rtp1GethxdvZBmTLxOWhESMYbpzQph4zFxEg3SpNIe6h
         1ghcDZzcIZrU3MELxHuDXNRz77gOlTKvlKgzhI7ppQQfpAQ+NNBGXZskcJb3Okd/VDPg
         sGyA==
X-Forwarded-Encrypted: i=1; AJvYcCV/692uN/NtMR1wbnDieIh5T0mKDoEMpDN+Seo0B7G8RSVkYnVZJotYQ1e+Mqm2LrJle9YDN3x3X5t+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0NSngiQEZqpts3xgmUemEPSedWlkypzyn39rfoQgG3PsFlqwA
	kp4iT8ZhXIbreqfHZeGixT2G8wtmOwuB65hj6x0tgn0RkyVxM+odaVXRmNTc0R1rZfc9Ai6yPx3
	A78E3G6DOklFU7YqqY45z4USXwNlW22UDbqQUOl1uVQ==
X-Gm-Gg: ASbGncuQHKl3NoYScxK2gX53dFQ+Zcp0ao4ACrI4ThUGsA6hyjONv+xY26jqHBtHAll
	kG5gTOKIZOmcFkw4dBPINxTl1lyh4uTbzfRyT2ZkR22MaaDAyPRW5RaT1srfUVBw+KGhvzc0X/f
	fkCWFAsfkP6Nz4yebwBXdvIM+5M/4lMqRKGBVf0Oh9OgU3sBwd7hic68q+/uzUIWs0EyeCNgRfA
	eY=
X-Google-Smtp-Source: AGHT+IESdzbSr0hyb5ZTrddk2EekSKVqWpeLC69vtkyeTgrO9IfOok5XJzSK6MtFLNImcFxcWud6sO3MLnOLklka9Vc=
X-Received: by 2002:a05:6512:1192:b0:553:addb:ef51 with SMTP id
 2adb3069b0e04-553b6e8c2f5mr2040920e87.18.1750076837237; Mon, 16 Jun 2025
 05:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <CAMuHMdXca=EnNDE2doqUvu3dm7+aaWrG1nUYs3b08JCFqrKEvg@mail.gmail.com>
In-Reply-To: <CAMuHMdXca=EnNDE2doqUvu3dm7+aaWrG1nUYs3b08JCFqrKEvg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 14:27:06 +0200
X-Gm-Features: AX0GCFvBiJSrqsy2NmICkTOhhNTaArcZZ0rZD9G4yrtV8RBEldgTv4LBOcVAA00
Message-ID: <CAMRc=MdbYesiRDfvwSchZZ5jOnSRffS3JzUzQh++J1JZLwm1Wg@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:02=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Tue, 10 Jun 2025 at 16:38, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > Following our discussion[1], here's a proposal for extending the sysfs
> > interface with attributes not referring to GPIO lines by their global
> > numbers in a backward compatible way.
> >
> > Long story short: there is now a new class device for each GPIO chip.
> > It's called chipX where X is the ID of the device as per the driver
> > model and it lives next to the old gpiochipABC where ABC is the GPIO
> > base. Each new chip class device has a pair of export/unexport
> > attributes which work similarly to the global ones under /sys/class/gpi=
o
> > but take hardware offsets within the chip as input, instead of the
> > global numbers. Finally, each exported line appears at the same time as
> > the global /sys/class/gpio/gpioABC as well as per-chip
> > /sys/class/gpio/chipX/gpioY sysfs group.
> >
> > First, there are some documentation updates, followed by a set of
> > updates to the sysfs code that's useful even without the new
> > functionality. Then the actual implementation of a parallel GPIO chip
> > entry not containing the base GPIO number in the name and the
> > corresponding sysfs attribute group for each exported line that lives
> > under the new chip class device. Finally: also allow to compile out the
> > legacy parts leaving only the new elements of the sysfs ABI.
> >
> > This series passes the compatibility tests I wrote while working on the
> > user-space compatibility layer for sysfs[2].
> >
> > [1] https://lore.kernel.org/all/CAMRc=3DMcUCeZcU6co1aN54rTudo+JfPjjForu=
4iKQ5npwXk6GXA@mail.gmail.com/
> > [2] https://github.com/brgl/gpio-sysfs-compat-tests
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Thanks for your series!
>
> I gave it a quick try, and it seems to work as expected, great!
>
> Given the /sys/class/gpio/chip* numbering is volatile, I expect
> script writers should use topological path names instead, .e.g.
> /sys/devices/platform/soc/e6052000.gpio/gpio/chip*/export and
> sys/devices/platform/soc/e6052000.gpio/gpio/chip*/gpio19
> (note the wildcards).
>

Or they can use the chip label like what they would do with the
character device. The relevant attribute is still there.

Bartosz

