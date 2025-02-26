Return-Path: <linux-gpio+bounces-16616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB86A45BBD
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 524581889FDB
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1A02459E2;
	Wed, 26 Feb 2025 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yBridAji"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D76238171
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740565747; cv=none; b=l9lL1lV9Il8t7exEVwiFh7OPf4wFqfx517IO7ZCeOB48DLoShx3BkOALEiT9zyxUv17QJo2n4tgcCVcTx5uxNM6wrDRXLN18iraR+8kgPymveblKZBl7ozz7S822UvUNhb+tFN7hRs2HDZS+hr31SlLcYNsUDokHvKXRwO1FLmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740565747; c=relaxed/simple;
	bh=jd6d/YrQJp7u3Y35vAF2ccKmJq+B0QJtfHp4EK5whA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffMCu3AXzfqoTWgQTxGT8z1qgasXhSR9Soz/tlceIWbvvv/xWkvR7innImxJZVqFur09jpR91fJaVD/8urCBMbXTTwT4vfAnUI0sW3Ttzhr+IhiYrckSdO2/648VBgM2FvN3DN685LLHpt4uetuJZ7MRD39etXke2q9Uhvu3cBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yBridAji; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30a3092a9ebso75610681fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740565744; x=1741170544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd6d/YrQJp7u3Y35vAF2ccKmJq+B0QJtfHp4EK5whA8=;
        b=yBridAjiaILeMGd5v9MnMGozwOkxf3NcMPkpgosgBDi7C/oU3htIPLR4LXK2C9OLjh
         WOODerMRvsC5QmvKhUbDLBQGmLQ+OMPpL930iZg/DdLAxiSh8koQT/Vcz5Qn2WYZ1SWs
         d/7Dc/aECZIvNk2ZHIDCHoIMUtINilP22BKVqDbTtFDn4RCg4RvMV38olNUu2Xw6mA69
         Msuh6boaw80Rtsqw2yex/z2hlrUFyiJtBdJgUMevSbWlYHOfBF9Mni4ujNB85S8duX87
         GnLnMJ49wy3/TRUAdKOJvSVDc9AN/bxb0N9Uzx+XorfZUTTGjbA8tsvmYYHaTqTkwUmw
         0xYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565744; x=1741170544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd6d/YrQJp7u3Y35vAF2ccKmJq+B0QJtfHp4EK5whA8=;
        b=FvrD0R3okzPvzTwjtmuAOFVlkhXAt3SGnPKcQhP6dNJdajUPWFZg+hHzR/aTgehMGz
         2ocx7FUFlhH4RWAEBZCOyBVF1Cryg0gYbPdBtS/AVhFtYhyOQ71LnTJaOQnfV9g9xyZF
         np86NJuIvXnp0RLYBuGGUaX3pgC/u4eysNdWAaE8eN19vvE60oB2834QXRHtGvFtM1xT
         42YNaDR/gy9duLjRPygKivGSXXqyjMNVNppWV3TwKfDVKJZp3Gaj7ufzrxdHt4XoYOg2
         seVSaEXaQeSaHCaW/BCSti6Jyolvxlr12tcBoGoXcx7GqOgKSbj2+Y9IeO+rGtz5pE9g
         GPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV94E/8pp86uCFdDWXnLlAkkVT/FYul99GDmvUnMk32feQdEmtmuXFGWUpTEnXkCINHKdBMh4mEzV9x@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDUf9+57xxFqTSFtH4R6VrwJ5GCOwKxUb5DJ9asE8XrPc9GcP
	smDwB1Ecj0uBToYzc7ipvg4Cbb2HJenZR5pnhEpDfRj+5SZaUwg6HwrcAfaNwnROSDDOOlZxL5q
	yFwEbFIo+UU/aa8eqP2vVKNIp9moZwe3uY7cA+g==
X-Gm-Gg: ASbGnctNC/rL4zEifyjn1bm/5hNSynPGzafdUU2FvV7MrccSkFHMT1RzcLqawzSCesv
	T+ZuAKw9WaHRW7zRHUVNg0Xc7Ss2m2aG8VmVDnop8C4kcFqBU5shabcqZGrTFS4n/H0ks4vwLq6
	K4r0c/+9m5j77hBRp6xq6wPZegZyQucsyX8VF8
X-Google-Smtp-Source: AGHT+IHHpGE08k0eF3GlP5E4RiiF0DoICSftFLqWpeYwYEYJllw2uhxtszoAU4mx0vs+6OEdCixULAjPR4Rd+B9jS3o=
X-Received: by 2002:a2e:98cb:0:b0:308:e803:118e with SMTP id
 38308e7fff4ca-30a5af477d0mr82028861fa.0.1740565744057; Wed, 26 Feb 2025
 02:29:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250223121931.579031-1-salah.triki@gmail.com>
In-Reply-To: <20250223121931.579031-1-salah.triki@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Feb 2025 11:28:52 +0100
X-Gm-Features: AQ5f1Jo2WoZUN5CqFOCb6NBQfPETkTmOZejfsXHK-3TG35mQ7MQv0u6erKTTILU
Message-ID: <CAMRc=Mdn1NNKz+2-aA6qCcu=TMDvD8KcbWYgryhi6XDk72Zd1g@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-stmpe: Use str_hi_lo() helper in stmpe_dbg_show_one()
To: Salah Triki <salah.triki@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 1:35=E2=80=AFPM Salah Triki <salah.triki@gmail.com>=
 wrote:
>
> Remove hard-coded strings by using str_hi_lo() helper function.
>
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---

This no longer applies, can you resend it rebased on top of current
gpio/for-next?

Bart

