Return-Path: <linux-gpio+bounces-25834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CECB4FE70
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 15:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 573B5164D1A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 13:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43116341AD2;
	Tue,  9 Sep 2025 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WshGuwoP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73715341AC3
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426217; cv=none; b=AeOQqeFOuq4fFAwOSt5H49dLT7iF9ymdI2EyP2zRxYivQNe+kM8wkQfsgjCW8UVKp6oJjeQxTNJATaE0ujErNjgovvyfrWO/v74CzXn4hPtu2cdjGfyG50KvLlLuOcaEYPNchsu7wC0qWEvaat4m8vqLlD3XIi3Js/Md22xR0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426217; c=relaxed/simple;
	bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8ft3yNqzIppt584s4KkReu+T7lmRtcDQ8pRHA9mnLeQA+lgXFXR/PiC0KdvgJwjpHTKNpeB+VBxnnlK12R6G1+FjQYjmTEzyTNUdIC29yKFFojqOV/niKWN8hhldDKhJrjOKktEv/VU9QHxzx0Yp7nw9rev6NulHMiBzc/TWs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WshGuwoP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso6682761e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426214; x=1758031014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=WshGuwoPIVsb9lFy2eO/07IyciUutK7uuQEzLrSTUSjfNKPS5wMpQEXrjv0NeaGdI4
         c3TspzI3Xx4JxsLMCrHx2SjoAgubjCg4jQgdrlsl1oXQFC5P852zHoPA7bR24/YCbBcA
         I1XdtZlv9Xjv2ATUJk3NEB8lgddayESWcvn1bKOltvSyl6zwIQM0DbITSlBHpsyWne5y
         HUuK6CgsEu4Xqyp1Ym+0rMJS0UlW5r2c2TVaKifxEMAA2IXIfVCAulOl4gbCWJDT48iN
         gX8xeYRZdAxI0Bx8h1SIaS6Pv9DarT+jOs+0IaBBNvPI2xTr9Xzi+WkMAhhjGCABzpu/
         tz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426214; x=1758031014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=PCK/z7SyyU+yzfftlN5NaLxqQGPC1PLWe6wb4481yI3e4R2SR1T0FsyOQBXb5xWR2m
         z40opF6nWMEHYDjfTN/1erb1gSWyHGtU1WDN24vnYmfBNgBIaFSFdDQxD5tjM4165kR7
         Eu5pbBepCKL6fzj1ggMEGvx/KtS455Z1iko/qHmXWuvRkagrqWZ1rcOvA7a1haP7+6e6
         OP9mB5QaAf/cHjKEECTa5iovuuEm+J8CTWPGQgZYPPzx7Z0mJa6Xb4WnxNWLOVhMFc2d
         w1SBgftK7Vsdw7CpK7RhFp7EqcZOHYwaOLIxpYJyvnEDiFbWDm3Fn7S3wIkJdiCzYTPX
         gv0w==
X-Forwarded-Encrypted: i=1; AJvYcCXDZxfxhTSTmLEfHZkATD1H3YXLiJXCCqG/lvFe5vhzvNc2IUrdibg4pJH+95tJUj1CU4iWr1phO0zF@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbwkMQmV1Ggk1ISfppn8q5WWPgDBhcnaH3DIwB5FQhwD/HQ+B
	ZMkZl0xawlQd2ZZVqCx9yJb68LX+8S6zV8ujSsF9XomXK6cVa5Pg5k9Jjs576wvzschlc3JAZtq
	LkAMCtoKpq0D5kBmte4n90Tavkx1bIOlFMLgkSLg/yw==
X-Gm-Gg: ASbGncsusYx0S0hQeqv6dbKd+MNRMZexqJlE7pPs4jAIodDlvbzAI2R5v2jImHfKk7G
	3ULr6OuvZ2hRBwl//y+d1kTOZrCmmd1Bf5goj5AVnt9XF6caVCCg6gdfRzWkplf+mV3iFKbXrce
	BgZGVaIJrJYeN+G/0+H0esv40CSSrt9Ez1lf2HFm8LHjhiwWXknngJGqPe8qOtsCIcvptPLiAXL
	f0q43b4RDiRxENVSioJZXdN+Mq/Kbi/rsIYwxzUaNhrED85vA==
X-Google-Smtp-Source: AGHT+IHBxkyJPoP3osXnpgBU6pdsryw/ot72GCgtbXz1ukCkdeMh24NQ6AJOJ87AcYe5pD0xcM8OlZUSXTQKermPfKE=
X-Received: by 2002:a05:6512:b8a:b0:561:9635:5af5 with SMTP id
 2adb3069b0e04-562619d971fmr3883543e87.48.1757426213571; Tue, 09 Sep 2025
 06:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
In-Reply-To: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 15:56:41 +0200
X-Gm-Features: Ac12FXw-xJdDcWBTzEH08jjeniZk8zNeWwiQ6jDsDwHAH3I_S_ZPt9IHyI66KLg
Message-ID: <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
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

On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> TBH, I think those 6 all made the same mistake, i.e. thinking of the comp=
ound
> literal as a cast. Which is not!
>

What do you suggest?

And are we not allowed to use C99 features now anyway?

Bartosz

