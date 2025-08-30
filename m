Return-Path: <linux-gpio+bounces-25224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667ACB3CF25
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 21:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5F653B3CF7
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 19:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414FD2DFA32;
	Sat, 30 Aug 2025 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k+xd4gYP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D12DF716
	for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756583401; cv=none; b=WDs/nd5CgKe2R8o+S+0v7QcEAglq3NMHJguU64ji4sT+J3Z41/whuElL5icZPk93xdp8CI/YstvdpHZelJTwmvc65b5WPXtn05M7vOpiRVuOYd0CaRWMqRKtyaFpzT6yXgK6n3DlkRxAdON0AbUIku6pp9N2wC4hPKtnhN3Q1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756583401; c=relaxed/simple;
	bh=RESvPL6lZSU1LVrX5w1VrBJByLVlXWsRl2ULoQXIrYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTGHrXjjfoxxkgvFHT/JwlhUvS+PeLZzI/kfMdkR448EJT0T3BsNrBYr+V2AN/xW2LwDjY24r5w2aaPJS0qj2To5x/CKaORK5Nd5FSVO5r7dblml0SnpyRGN659XP71sNAMjA2BWPWyGGJwFm6prDgvbs3+1e28ZIy8kJrxVfBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k+xd4gYP; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so1864140e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 12:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756583397; x=1757188197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RESvPL6lZSU1LVrX5w1VrBJByLVlXWsRl2ULoQXIrYw=;
        b=k+xd4gYPPID2fGD2mriQ/uWrl5Rij0kxv7aV+7AothtEwbuKIR5bBrefwe5my0dN0W
         dC0Hkv+TONrXPf/rhC0/LTwZTwyTex+MZ0OvVQDpGfTCkpg98DtppVN9N82cN1GwyyBr
         CO8dKAeYRXykeGNW/7N3ST2CFG8/KaYvTn82dX6grVGet5dVM3pdHzl9pJyMfJ6C1648
         iTEEw9t3Q0M9LMZEYis/KK4GTTrTnqia+fpXV1/wernfdD/fS71PwYGP2N95WmdkozYr
         TNB5i/RVoSW7R2dhUHb61ejRVeJIRqATDF0Na/enuuary5EGq/f353g9qSz0hk4FTTw0
         0nEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756583397; x=1757188197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RESvPL6lZSU1LVrX5w1VrBJByLVlXWsRl2ULoQXIrYw=;
        b=b4nGpLzYRW9WjjJLC60HCvfXCsTzdQi60s6IDFl4A3juAF27zgMhjMMs4PGX/5ojNV
         SuuantthaJZ2pPW/dLVDdRNrOM7hb7yHTDl3bS1J1Gf+31hTq8a5APXJGyFdu6kgGAa0
         2/c7n+ccmpeAyrpWWgqlmAdy/grLEp2oXNwC8ldNc6gj24jriFUrvJtKnJaqWwHBc8cg
         yND4Pd9w+yZDsatH5goJPyr3nlhFT801CiqCACxaMPk9z7v4sZC1shBvL3XVvIAc10PO
         xviM/O01pNn/PTSDRzs63aoHsRlVvq8hlm1s++sG/MVTGizJ37H4p3lbnwns5fPmoFoc
         jFTw==
X-Forwarded-Encrypted: i=1; AJvYcCUCnLYRtvtUQQn44o3Gu1FDGdQOgYzBeI1c8ZUWbdOuu2jLbV4fBlNqTZJCwLXD8vFp/2FN3qzgAPBz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxsy7CAIyTQIIsDTEkYrYjTfhFpG+kLkEJXCURY1jz80C/xBVS
	YdGlTM41woG+9pGLXUwOC6nIDYnqxUwwt6d3BlZ0K7/jRNXxv6CbumQ4vsyD6VCjiFrSRPMy1bM
	tzo2L34fNycRnOqd6d25XsE6TiZWvxWVLNC4NeGcKgQ==
X-Gm-Gg: ASbGncsl6WicTv3i4JiqX2RRLU85TpZQ/y/6jIzxVU1IH8aIUJx79FemtpMSNWBZutq
	MLiCurwgM/upTH8rF5Dp4A1aCuBPgRsN9UkmAApGZRSHB5eRpq8IkD8DDELbee01sU4tLNyitTI
	E4XNt5FfIHbG3kQjOEjRD7A6OtJP/phcOHGeBMvOULZTppAJYJk8+eT90MivN+d1BjuE91dhj+S
	w2Cxem1jSF0cJlk0XBX+3N0SezaO7scpazc7CpZswQMPmz7sg==
X-Google-Smtp-Source: AGHT+IE50mGD6Wsp5fjlHRmoMQ5rebLnfakE86Vnr2ujarxjBgcFlbm1KFCExKkXTA2m/S8rPEWfnwfaAxEiJLlgF8g=
X-Received: by 2002:a05:6512:3b9e:b0:55f:486b:7e44 with SMTP id
 2adb3069b0e04-55f708ecf52mr685020e87.37.1756583397500; Sat, 30 Aug 2025
 12:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816035027.11727-2-ziyao@disroot.org>
In-Reply-To: <20250816035027.11727-2-ziyao@disroot.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 30 Aug 2025 21:49:46 +0200
X-Gm-Features: Ac12FXyuG3vAb6oO4Z4zArYVmCFaF-tcxGvuqQuACijURT9dTtrTa_sARjkZMYw
Message-ID: <CAMRc=Meed_x_OODv1fw1m7rpLY4uGic=0pacjV+Mj147_WMZPg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support GPIO controller of Loongson 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 5:50=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> This series adds support for Loongson 2K0300's GPIO controller. While
> being mostly identical to previous implementation, its interrupt
> functionality hasn't been implemented in gpio-loongson-64bit.c. PATCH 2
> implements its interrupt support with an IRQCHIP, and the code could be
> reused for other Loongson SoCs with similar interrupt functionality like
> 2K1500 and 2K2000.
>
> Tested on CTCISZ Forever Pi, reading/writing GPIOs works correctly, and
> both level and edge interrupts could be triggered.
>
> The devicetree patch depends on series "Support reset controller of
> Loongson 2K0300 SoC"[1] for a clean apply. Thanks for your time and revie=
w.
>
> [1]: https://lore.kernel.org/all/20250816033327.11359-2-ziyao@disroot.org=
/
>

Hi!

This doesn't apply on top of current gpio/for-next. Can you please
rebase and resend?

Bart

