Return-Path: <linux-gpio+bounces-16725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CAA489F4
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 21:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1F6916878C
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 20:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A2622A814;
	Thu, 27 Feb 2025 20:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rx0mWpSS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018E21CC4D
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 20:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688503; cv=none; b=ANXugX0euwssByk+0vF9b+ixTRBwJT7vk6lbNDuKF/9q62lhCU+WirJ/xyd5PU54lDjcAqO52Xze6Kl++FGnrAkGwJjUoNhnvJuwGs9FJpTzZ7wFeWKOXvx9ngttdF5/UcjZFb+iKUMst09mF6TYSksks5lOA317Mzlb5lYmm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688503; c=relaxed/simple;
	bh=bXxSEzAG/4iUWducMgDBSPmkjWssMBKyphle7BJUApI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2gHusfaxFLUUter+f/DSGGjdL/cd73iOBuUytII73OXLq8QEVliuySLNHuBOV93n3jmC6X/MUzmoITNLkkQkp1gL1QeSOTj2O2TSf+0YfxSbYtsElIaHUZtLpxcWdp1n0veGUW3bGJaLcp+80hcvLOeFxJuN1w4Lx+k02gKgqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rx0mWpSS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5461a485a72so1324813e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 12:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740688499; x=1741293299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeuqxAmt1Qh978bgMpTPOmbEBFg9vrDCcgbGN4kik24=;
        b=rx0mWpSSCn/tf7BxgezhV8pgrg8Pku6GYqtxYofVYIP7CshX6/2xNv8k8aYL3rYKTW
         4DKmZA6PWCfd63arNbuBtE4Upqfo2pBIfYo75IKdK7PW85bM2P3z84UxvCBiKfS2Sjlz
         P/af4i12bBgctLOtcm0XXTHLTDgeoDANLhPKFqChhvlp/yVBtKEnoZ4pNLnbJ6XtgPy7
         KDqxPVXtnjizLdAUxaZqVWAUw5B/dvSiFgtJ5YKCinJfIfmICrntgNUIQmr8XAMpKPet
         hCmwO1WFbm9+N8PlSro6WbmVLsRdzSW+vb5w30HfmpXAutvrhqfRbJvtmzxyvf9w0fHS
         KePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740688499; x=1741293299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeuqxAmt1Qh978bgMpTPOmbEBFg9vrDCcgbGN4kik24=;
        b=udzHPqOpXc1LtWYQKnwJXjnkoFKDS5Fwtsa/F5k/uFagQzd8IflFd0KWIEm/WO1p8n
         9spDsHOVaPvOYmoPoXPMu9hIcb4wPzbNhTBwQ1PROWFpZ2WE8JKyF9j4lJHhvOf0IW61
         TG4D60k1/zW+ILVhV5rRQRAGEz1VaDXntychoxV7jShZgXnAEFi3MRUUQ1860QzxBxnQ
         ckeYhZoseIVAJNOv7ffUuBHWW6xw72zT7JDt2P7QzyHCEbT05kRgUPvaxhyhjeaDMavq
         VsEcE6bPDWothHUeOkj9RB7J29h+hNXMkjMN5h1iPrDyzoVZXVDQM6d4VhgAU+FQgMgx
         mOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEswfwP070XlHZ9I9VD1N1Bd8s58ErW7wX20ZWZ+wjM1Buo7ktC4L50tTbYIoTGDcELGIWh9IKXuCS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyafetj2Yd+PtmWgiCyta1ZG32fxdIGWAi5vMA1WLjfKurV7CC1
	py8YVuzVQ8Vu1Ty6HjPtQ8wO7JRVVR+MhK8vvMkTFwLvdp/tYeU6GnDM2LxycuJW8QcsMv09Yft
	G+gTRrgmnLpdGODnIW/BHfBWsgAF8rzhbxnX9cQ==
X-Gm-Gg: ASbGncvG7+V7Hr8dnaGsHzYEkRy/frbE1qeKR348TSBKIdyyeLH4Ss6+ZWL+fMw1jd4
	5oGimSi67f0jBoXemEdOKzG61mY0QWOGYrakuoti2N1thPvZddcEsbA3Fz0iIFIqfQoyfYiwGyV
	l5zNZV69U=
X-Google-Smtp-Source: AGHT+IGg4EqvzrAvnzj94K+52AOp6peQCUTUyjS5GdcexzC1jX0ldvgPrkj7A9gohmBANYoaKcLYCMjFpUrRRlAREJQ=
X-Received: by 2002:a05:6512:1089:b0:545:27af:f2e4 with SMTP id
 2adb3069b0e04-5494c3207e0mr295413e87.18.1740688499410; Thu, 27 Feb 2025
 12:34:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219145338.3306745-1-superm1@kernel.org> <20250219145338.3306745-3-superm1@kernel.org>
In-Reply-To: <20250219145338.3306745-3-superm1@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 21:34:48 +0100
X-Gm-Features: AQ5f1JqqOtUfQcK4ttKKJLnwL4MmovtUXV3akSvWi09-svI3CFHM7hoXCk9DBy4
Message-ID: <CACRpkdaCUx5EW-CzHgNiKgQF6FxKbFP0_pHC3LnfgEKpksTJtw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: amd: Add an LPS0 check() callback
To: Mario Limonciello <superm1@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Cc: mario.limonciello@amd.com, Basavaraj.Natikar@amd.com, 
	Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario,

thanks for your patch!

On Wed, Feb 19, 2025 at 3:54=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> During suspend the pinctrl_amd driver disables the interrupts for
> any GPIOs that are not marked as wake sources.
>
> This however does not prevent them from changing the wake status
> bit during suspend, it just stops the system from waking.
>
> If the system wakes from hardware sleep for another reason (such
> as plugging in the AC adapter) this wake bits might be active.
>
> This could potentially cause problems with going back to hardware
> sleep.  Add an extra debugging message when PM debugging is enabled
> to help identify if this is happening.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3929
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I don't understand the ACPI part of this patch, and I think I was
not even CC:ed on 1/2 so I haven't seen it.

Anyway:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

if you want to apply it in the ACPI tree.

Yours,
Linus Walleij

