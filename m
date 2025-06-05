Return-Path: <linux-gpio+bounces-21048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 079AEACF039
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD641888C02
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3B322D790;
	Thu,  5 Jun 2025 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIw4aSdu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A8E38FB9
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129591; cv=none; b=ovO8XO4X4HeFf+0tcTC+VaetMu9u4b0ClpDKZptbt2syElxZ0tEJFWDT1vPa/t/oMvJTnBc7SVAHlkROjtJUuZ8PiB7wMcO2juBoa/6aYh73pWCtE1tYJhBl2wwq20517V1Rny1rbU4wg/fQKJbPQEdT1c46vfHO3SHdfeG7xwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129591; c=relaxed/simple;
	bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ut11OcvBzzR8kTI/CsK8LlR8Quwwf3p3eSU0SRh9zJ1JSNgM2RqdLoyCZe4h37M8Hk/1DiuoYhUPYLyoT3StanYAjjJldmbjTO3JSbx172M2+mmWlevz8C8OqiG+T4qaTgtltAU3utoWIdAnyBIWczukxnm9Aldj/SejG91v298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIw4aSdu; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55324e35f49so1029852e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129588; x=1749734388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
        b=GIw4aSduJaHRZqHhbhmNcIhOuzisxSXLzMTlkl6S7WAJVWCCuSNGNr9gZNLvaoCVss
         OXV9R5LqviINNmIXXP61p5qU2CoMjRZwHQj4MqqoZG2XenzkMb8AaECym/XCYtBueNpu
         loPECGK7Xeqfz+zzaRRvbS7HIKc69uwG6xMa1r8EbOW2uIpdLSk/kO6pnn6m5Aaq+7p3
         dRTtxrHVn01scW0VYgnqPYoxRz77DyWQDwaiYZ/eYpL5LqVCq9/oMKfxInfb73abWJq2
         eLl6t7NLk2gbsebTtgbZ7MEc22+EyzhpLtDbfdVTEisovqPxQRvXyKcqzSRF9MKzk60c
         5bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129588; x=1749734388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
        b=lAhkuLr6U+7+tDjutaQC08qDWTMdW1fAFDt2TX/Ki642S5lCUyicjkgf2l1rnv1HP+
         /PornJB0uQmBEMXuelhVPiCUFRDHCVLwczkkpOXFopHqqfXh+5AWuTT1zkzTJLKtf3nO
         kQCRJ/5vm6kF66s3d+moZS/LZN9ilf6tspm7RKT3OCcV30GlGy+6DHM2IiZ01RRWhgFd
         VuZsfO/MDCdt+uDJoQukDY8Y6QcHZrDmhSTY1uNnRVYTLrhVtp5gEdWWtu1VtWtvxJqF
         f0JVsIYSkEscc3Mmnq+BK0+ewJu/74yyAkB8NAckrXq96FPivKX+uaHSLwEOw1ZMsRum
         oSeg==
X-Forwarded-Encrypted: i=1; AJvYcCWefejQerXj+/rzdZgMUw1I6dR/AWRoBnEb5vGig8Xps+hUxniFQwCOMzkXRtztmIOTMJSUIrYplz8B@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLlUpfA6l9nI0cVruGD1k79YAJ/SHN1xoj68EoHUDwXPYmQCu
	BeQX3HhBsapffqauB9DSGg7C4HeGmb8A28jBO6hsIJgMoFrgkhtPIVMrKjvFMKqy2qS5hWW/vqQ
	6/R2Z19t/4p8ZCPfBA2WLjyiKOoNZYkwAW+Smvslwfw==
X-Gm-Gg: ASbGnctaK/ZAVFs8lw4sbFcPjsz5uxLORreaP6zwXY8dQ0cnrZ7YDuvdHK86I/wdsdQ
	10VxL7WCYpHXRZmE0tbSpjZ9inp+RZS12fgOula2zBx2gVEEhHCbdJynmbjtt/K3ZKLHatg7U69
	teh5WyGbPVrSCZBVsB4neahri0RxPit4SB
X-Google-Smtp-Source: AGHT+IHwUg8EOutUqp3GD21CE8boOlewudk+gIWQR9a77PpxijELTwnpqH+LGR5idjK89e9n3Wb11FOM+mCZanmNr04=
X-Received: by 2002:a05:6512:224c:b0:553:29a6:3398 with SMTP id
 2adb3069b0e04-55357bd6ee1mr1908588e87.55.1749129587841; Thu, 05 Jun 2025
 06:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
 <CALHNRZ8ndcd3mvGP+W2DVFcm65t4Ai4epNeGigPv=Oo8Cf3LkQ@mail.gmail.com> <CALHNRZ91nUSUNPjMNF-4ORvVRCaBSKG+0UKzG4T=ehPaHwBTgA@mail.gmail.com>
In-Reply-To: <CALHNRZ91nUSUNPjMNF-4ORvVRCaBSKG+0UKzG4T=ehPaHwBTgA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:19:36 +0200
X-Gm-Features: AX0GCFsdxa_RA3yrubFbUtjyotAsDp7hdaFyuBIGBs0nGmLZ3CxnTUhX5K5TYXs
Message-ID: <CACRpkdb6Qaa_0wahFLG4o7-3gBGAzdKDMVb=ohgiN20dKbrNTw@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: tegra: Add Tegra186 pinmux driver
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 7:37=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:

> Friendly reminder about this series.

Can you rebase it on v6.16-rc1 as it comes out next monday and resend?

I will apply it if noone replies with review comments quickly because no
way you should have to wait so long for reviews.

Yours,
Linus Walleij

