Return-Path: <linux-gpio+bounces-17093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D2AA4F8AE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 09:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B065F1890EE2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD031F63E1;
	Wed,  5 Mar 2025 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eGyYNpcm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7119614658D
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741162977; cv=none; b=qEZjRUqItn6GBOleXawhkkWtIlvf0reRFi0y6UHN40BnXRhOl94we7artRx9w2QK0KAYGwEVExM2CYstacK7+SbzfPx4cZJs5Er1ybanIJ6owajpyedh+KNfnqKqYrIfKyld73gnjN+1CrGI3UKdAEnaZUmVxhBHG2vkuKh47nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741162977; c=relaxed/simple;
	bh=vfgLt+ajkididAHWR3Bzbqkcp4ViH04QZ8Q8oWp6k0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mP0MhtrOXpkVvh5+jE7HSTwAqbP6UQC1qFuorfQGFaYQctL/hEVsEdJemJmftN5M9GzoSpDswuOi8DTo1IzUYBBgSihb7oHixehhcuvlswHUwXjlnAfT3wSSj+FzhE2sSERL8xOBLDxDbeBOEbrw8jR4Mjzi2y6Wbl72SM0r4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eGyYNpcm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so486594e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 00:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741162973; x=1741767773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfgLt+ajkididAHWR3Bzbqkcp4ViH04QZ8Q8oWp6k0A=;
        b=eGyYNpcmGd7FnlTCqzWYPUGlhq/YgAYQXTuciQI1tB0j6xytR+9H6miozHXCxURHjC
         4v0DXBL7Kyqg6YDzIvWkNQVSgo9ARsz28FzcMVnUlNmlf4JUkRfr4VOOohpWGBsj0shs
         1+nJgDIXRUmechoySmBybcFR3ZW7mM+iKHvzaxt/JhSbMN3rEH4r4FNsL+W5Z1Ewt0sK
         UsG0buIXoUAMtJeUUS1FK399k5Um297mG3jfa/am2K97+/TUi8wgKiWP1kmxP2Pe0+CN
         Jc+9NeuTIDG4sbZKNWjU/JeONDvYVh7bzTdijr0u1Q7L91tc1WTRkHZ5wYbwbzD4rDAy
         wHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162973; x=1741767773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfgLt+ajkididAHWR3Bzbqkcp4ViH04QZ8Q8oWp6k0A=;
        b=WldT8ryM+6Vz68OpxpShKGgGVSkcnRHjB3mP+87rE/Fe5dzzNCVIFTGdCGB3TQPNd1
         VM8DWWgNEP1ubuo96tbQHP0KlqwMcLrnVYl7kAPimEMd5BSfYT5fk0Id68KcGZsTkJ4m
         o6YVCQSqSN4QsYA5DPBMsEd3pygDbfsOPh3g+qz3Ut2fqrT+hBS005MytGpsM1SEh7tX
         8zgl7nHSONAacbFlFCaCXDPP0WnAohiq6aRDpoxvb/c26MvLRq0ZkL2v3tN53pNNkhBi
         y4BSQ3Nl6AhiPcj7g2iW9GMY7ZzLKiVJdwDVTcDTvM9ZcCDy+FF6AfsYClp8VDPPUXTw
         hybg==
X-Forwarded-Encrypted: i=1; AJvYcCXhhNa6z7A1LeeKBKWvAJsPKBk+idpdEig8xGSmkxMaSXhNkS8OcvOTplKsYsoPjbOPKh51vPw8+yEY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vmYlZXDJ1e4viUJa5E57+LlB0Vnl/qIqN1IIqrzaGur4awgb
	+zznR2xy+LdnPps/3i5Gqyg8cG9LV2u2NjQrRMGB77Ef74SgUdpvmlpriBGuI5/XSfY6cMlW9zI
	5LAn8ota5CPgy6+eWRFr5AJLSMogqNx/Q6bW4ffP0eWagU12J
X-Gm-Gg: ASbGncvTmphxkauDW6bJ79NvHQV821UeYoPd8fNnjTIuW864lXWOrhYM/zbw4LahDrN
	yGYCw3QhXL85S3rBzmLe/wamT5zUvY9Plelv1sk59Dl1/PiMUsdwCe550yrk6ECNLPzav+i19ev
	jq59UZBN4G1uJ8KEBJaKzb7c89Ig==
X-Google-Smtp-Source: AGHT+IEY4K9o3Cw5/pNNYPYQy7iU+isD4So/5Sram7NjDen7jd2G1TjR37uKjA4KnkE9soy2g3jG6GrNYGi/X0FRCt0=
X-Received: by 2002:a05:6512:31c6:b0:546:27f0:21a7 with SMTP id
 2adb3069b0e04-5497d38379amr910366e87.49.1741162973387; Wed, 05 Mar 2025
 00:22:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de> <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
 <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de> <CACRpkda-0+9u1mu8gJPwE_2ykY0TeoDS3t2_D-HoPgUQ45gfiw@mail.gmail.com>
 <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com>
 <CACRpkdZ4XOrcSOawd551tNx7qzexOguzboaA_6Z36QPfK7a0vA@mail.gmail.com> <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com>
In-Reply-To: <CAMuHMdXbY6J9HGM_WP+9tJ8LDaZP0=XrE3dciWX8Qmiss2spZw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Mar 2025 09:22:42 +0100
X-Gm-Features: AQ5f1Jofh-RUjl1bvypprlBC1Z8_nYor4vnlEC1hdNHgpBT4dou6GnKoAShS4fM
Message-ID: <CACRpkdaQ6EwkN+139Gn4Xe=RsOthv-GNwaFJGvUdDF53SL9BMA@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marex@denx.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 10:53=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> Let's keep it simple, and similar/identical to the existing API?
>
> Is there anything in Documentation/ABI/obsolete/sysfs-gpio
> we can drop? edge?

I suggested dropping all of the irq stuff earlier in the
thread, given how bad quality it is. Especially if it's edge
triggered it can easily squash 100 or 1000 IRQs into one
fsnotify event.

Yours,
Linus Walleij

