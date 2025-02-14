Return-Path: <linux-gpio+bounces-15994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A0A35AEE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA1901892D64
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57317253B63;
	Fri, 14 Feb 2025 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/8soyW5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4604E257437
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526985; cv=none; b=Cs6iTdMNblMA+sZSnPzPVb2jinSEk/OflMC8cQv3vzW73T6sLxFnS8ksJ7E91Pn6s67BiwLfwiiu3v8ApmpbsiTqpPMd4TYpznCl2RGqxrRVkuRbYu6Vj5qDeJyERneDHlvYOrjCVTcASY8f0fgK17QEOgTJqST7VndAbNqbMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526985; c=relaxed/simple;
	bh=2AsCrWbVyGKPdXvfmBx4a9snB6Aw/WrgC/hdNdtKs30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0TpEzVjEFXhyD21CN0z9elePztMtU7HFJCZX1cK/njE93dKdVz73KoYqDKsxgezYaVFFnfz+goaIJldhdGaOqU2NR5rPFhhHR7MreqBoKHkzzRIxItJeR+PgHfaiz/IZ60JLKM6xTmrFTAY/AGZr3A5kTHUggyFduaT7uFHyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/8soyW5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5452d9d0d47so126477e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 01:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739526981; x=1740131781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AsCrWbVyGKPdXvfmBx4a9snB6Aw/WrgC/hdNdtKs30=;
        b=y/8soyW5CwNUoYqNTFX6lyGU8Qk9Avts8muHSffQeW/9/dTMOKJKVOg7Qok88c2s1V
         5nw4+Yi/2I18rJ727ag4Cpn1hS+I4uomvGEziAnRkXTRLM+TwzH1xW8X/zNtUQj8n7u5
         5Tz6GLZ0MnZlJJzbTRuEkPYhz048KOmgTgh9QngV9W/q9Mb+/x8+/o1OwBAAmT5QWO6L
         njNdK+QjD0AnWIttmNTk+qYIn7Qr1H+5nK/B0DZdHW4CQMA8yeGHO4eMyFAikSFo4TN7
         bCdquKPd4jaOl6bjjCWt7qpw53/ipnoEJ/6xD33MAGBCd/Jfi2fmt8gbX6kdrWz2lT9h
         YBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739526981; x=1740131781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AsCrWbVyGKPdXvfmBx4a9snB6Aw/WrgC/hdNdtKs30=;
        b=XlRN2q/xbC4Rh2SNylZEvm2lV0Ns6HgR9rm2JZ7yhnc5+LK+rTY58vmLu+j4rRZy93
         JGiDCf4aRUjF4QXwUx1la/QufqKITxTkULa4cdFcQVHGsY8G48cattpi558drv7jUeKW
         PxLkoSrI3Z1mPQCcbnslRZQ37feWwI+TaHNBK4WXuSrI7xfKLFbpGzn+OOlCkNSqdDio
         qEgDdFXHOdCMevYbeTCy3bKjeG1NuAZ0esNqiWbM+0/UAm8LtaVRHtD2eaDJ/bCgaN2V
         f7Ush4m8LRkaPzPvS0WdM8CLU+znyOZ7Q0dgT/Q4SHFKlln2e3crqGE/7x0iMooKpGeO
         5uKg==
X-Forwarded-Encrypted: i=1; AJvYcCXFHEBytc6xx06iX+0GLL2ix8plmJY52Ro9pgCWR6H55FzoPB8+vT4sIolF7+XewJpymERkReXDALZI@vger.kernel.org
X-Gm-Message-State: AOJu0YxfMPgoT/yvIUNqZ0BGtVS5P1KaKhgMpjqoSVV0bJRup3h8/nNE
	yuneVxC70V5jik0ZVc8yOjKaiqWozpAaKv/fv40QfmL/XmPuYIl2xmuuw7TVaPwnmoVz+bHhG21
	wiMscJvNPR/nuOFBbuHKvXV61pryDXFmljq4AbA==
X-Gm-Gg: ASbGncsZ3cVXLOo4u6d2dsqrSjdM33Ao1TdTiKDzkmAIG6sIDei6bxQXsnZNg+0PtHH
	MhId+Ka7rO+hQqQZ5VaTR7hsw203vbfhECCBFGvWGKOZbI/iPEIbO9qKp8CtZojZ9KabU5l9r
X-Google-Smtp-Source: AGHT+IGBcbrZEU3WtspasRr8y5DGBmF7RSzDcVPvB+A0GtrhyVirdFfGoibdROQWEv1N6aRSxdNWZYR6heUIRHTOP7E=
X-Received: by 2002:a05:6512:138f:b0:544:ead:e1d6 with SMTP id
 2adb3069b0e04-54518178efbmr3191247e87.38.1739526981311; Fri, 14 Feb 2025
 01:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 10:56:09 +0100
X-Gm-Features: AWEUYZmo1A8kyC_1nRo1MhdajxMnD6e7V4G-rNnAAebgBMCC6AkDlJN1o-MAiIs
Message-ID: <CACRpkdYL4odi-00YDi-cFuVgw8uBncA+ZxGYnRRhuYR7eZuBWw@mail.gmail.com>
Subject: Re: [PATCH 00/14] gpiolib: indicate errors in value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Walle <mwalle@kernel.org>, Bamvor Jian Zhang <bamv2005@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 1:10=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> The value setter callbacks (both for single and multiple lines) return
> void even though we have many types of controllers that can fail to set
> a line's value: i2c, SPI, USB, etc.

Yeah this is a remnant from the design that was done of gpiolib,
at the time (by David Brownell) assumed to be simple MMIO register
writes, so not much could go wrong there.

> This series proposes to start the process of converting the setters to
> returning int thus making it possible to propagate any errors to the
> user.

My worry is that this project will be another one that stalls at
85% completion (like with the eternal descriptor rewrite project)
but I guess the upside outweighs the downside, and I also trust
your proven grittiness so:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
for the series +/- minor nitpicks I may send that I am sure
you would address anyway.

Yours,
Linus Walleij

