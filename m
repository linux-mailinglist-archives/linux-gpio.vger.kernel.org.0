Return-Path: <linux-gpio+bounces-6339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F286E8C4364
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 16:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B0A1F21AF8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 14:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6191C01;
	Mon, 13 May 2024 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xAPw15O0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F311859
	for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715611236; cv=none; b=WMlhqu93gugrY6xpni9iF/PAclA+0HArW0JuXeGNJ12PyqdvF3w2fxoDjRnyd9QT+tIVzxcUePReJn3axjf7eBdyDAREDu9/Wd0M5CDEUVPiTTwBqul+77pnpoQKPWTxfgpn/e+8UQxe0h5FFyMKsHgtggVdVeScKBNGnt0Z010=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715611236; c=relaxed/simple;
	bh=RR+FvSe6PreSIlJJZUiEFi2zgORXY/2RQNOZhVNzURo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=k993xpnjd9FHaipWlhvnzrVEyO8Slr03CBK7VTuQyDhahQdA35ooGyreZeY7VzLpCKL6fomjllhH+e8MUQoL3X1dcqYMDlXOLhNIAWxnFeoOuBssIpvaxcrkLOYB3KpurxU3cLqHqIKK91+Fs+ahn6WMLTBIzpOdeIW1MsD1/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xAPw15O0; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso65313171fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2024 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715611233; x=1716216033; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJZwp0seGlB/jzhkQ5Y+HidZv7cCxncq0/tJbVWAKEo=;
        b=xAPw15O0QUSMYye2skVlocMAQB7F3uTyvqBKsV28QsvvkzO7NNOBk1dntmQOzkzW8k
         xP3v9KsUd7xR6K4uA/Q3o0k5AUDloe316IPLcknkgx6gwQ3dfrpSd659Mv3Xtredai48
         RZjZ10ZKC2C0OF+KV4YmEngIkcO4CL2uxxC/Z3SIrJ2BeIMuRaN/CfACC7h03SpGJfDG
         tZA/WsSl8fA79RnuEjlnhW+M3cWzqZZXfvS7thKlNQTnbY+rdSinKCOqMjLStDDDfu0O
         MlZACyxN6jc1FADEgOmQ/nOOZWKJ9r57q7p2XTl2pqjFXOChojktHoVk79M9lkaBNqhU
         gZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715611233; x=1716216033;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJZwp0seGlB/jzhkQ5Y+HidZv7cCxncq0/tJbVWAKEo=;
        b=PKwPbmopSHWtheH1ULnFFkUSZGNk6oVzIJZInjT3pttcuQz/WSF39qsqsUykPb1s17
         zSbFXOKITR4I8Vot02ktVVo/CQ4e2IEJko5k+z24zlPJt6yjhfZMK1Aoi/XWjfGAUHy/
         jWecS+TFI3Rj2dor2iLoFYvs9vL8P/kZyfjvSieVSTVEtFIeRtG0h+wtS22Dvler+/Fs
         g2RLxpwxycxO5IiVSSr+jQq+748EFmqAgNRkQP51B6yPChrtWgSCx3OGUdTIwrS5Fw/x
         rLMt2fwTmo9Q0VSffZFPomFD07JswUA8aW9bdgsVPbbTdNBVfFw+mn7Pupo77/GlUdRK
         KGjA==
X-Forwarded-Encrypted: i=1; AJvYcCUNuKOacK/ZOovTrRXBXphjZbtWg9ymLRw84WO7Lkh/tA3pFPjrS/0SJnHpirxSFMniougBx8c9qd7NrN0Bmvjx0qfNTG6KVeO2BA==
X-Gm-Message-State: AOJu0YznLGmhtf6erLpWBCofCcXSq4Z0uWpCwa+n4gAKo5d0avkJ6Yll
	n2Hf91pcb/2Wek4S9SGst7O+/xqswsTz8hnNz15fsaQRLFVqLu3H4lveDFL10uuUwaHGqJpJ67S
	5ZaNEUKMaK6WB+fG/T2G+17tj4CyetyIBzxGGHQ==
X-Google-Smtp-Source: AGHT+IHxCuLpm4IulBnsKetvV5ifAyUozwLm3CsA9M2AGmsza/OqaDOtQw0zMpp0VpkMf9ZJlEwpkklIaKxy+ZOtm/w=
X-Received: by 2002:a2e:8949:0:b0:2e2:1a8b:e2f with SMTP id
 38308e7fff4ca-2e51fd42b4emr64871511fa.2.1715611232847; Mon, 13 May 2024
 07:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZiJkxBU3bYNWOdbK@Z926fQmE5jqhFMgp6>
In-Reply-To: <ZiJkxBU3bYNWOdbK@Z926fQmE5jqhFMgp6>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 13 May 2024 16:40:21 +0200
Message-ID: <CAMRc=Mft4MJVx9bvO6Ab=2O+WC0oG19SbYquuh2AOBNi=Mqmww@mail.gmail.com>
Subject: Re: [PATCH v2] gpio-syscon: do not report bogus error
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, etienne.buira@free.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 2:35=E2=80=AFPM Etienne Buira <etienne.buira@free.f=
r> wrote:
>
> Do not issue "can't read the data register offset!" when gpio,syscon-dev
> is not set albeit unneeded.  gpio-syscon is used with rk3328 chip, but
> this iomem region is documented in
> Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml and
> does not require gpio,syscon-dev setting.
>
> It has been suggested to automatically detect if node has a valid
> parent, but that would defeat the purpose of error message, for example
> arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi could then be used
> without gpio,syscon-dev, and lead to funny results without error
> message.
>
> It has been tried to mandate use of gpio,syscon-dev, but that raised
> objection.
>
> So while this patch may be kludgy, it looks the less bad to address
> the spurious dev_err call.
>
> v2:
>   - changed flag name
>
> Signed-off-by: Etienne Buira <etienne.buira@free.fr>
> ---

Linus,

Do you have any objections? If not, I'll pick it up after the merge
window. The patch does not look very clean but I cannot find anything
obviously wrong.

Bartosz

