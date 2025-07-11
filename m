Return-Path: <linux-gpio+bounces-23166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CFB022AD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 19:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09744161D46
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 17:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D652F0E49;
	Fri, 11 Jul 2025 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5LzoRgk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548B2AE66
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255478; cv=none; b=kbYdHVROulA2wGYKXe5pBk46X1Yya9R9lwGDPVABg+CO0MMaIjCUKZekdQg4K/5vn8MOwzSpVPN7Xl/bGRxuyR8js9VY93kVyuRPFcyIFZD+sVHPO15GdBTJmkLTK/bqAJF1BR5n57v5wrpphmTGS8Na0w/FQRf89iUJwB8Wi1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255478; c=relaxed/simple;
	bh=WSWrLavcQ9CXJTlboRDcQK+c9Ni80a5/QZp2bnjwdSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzLenAv9GD9LfcCKJo3T+jyOtokQQpdbGud1JFPmLZW5+upnfA25BtIY3FWawv4B4FZDjfgdDwzPjSGaEic5U+hlqksbZd6JtBrY8P3JkmUFkaAe309IY3wflhJlKuyw5OrwZ8J+R2+fpcmea/YI5Cw+h/uaAkOjjC/SyTtt4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5LzoRgk; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso29908091fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 10:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255474; x=1752860274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/wPhaNRFFlkJO+qFiqBH2aleBY7cnhkdPVonssJv5Q=;
        b=b5LzoRgkHk8Q1oHEjX3v1VdpjCg0aukrD43iMhhYsRpgz7C7WK8kzvjM6raxgdGMe2
         pwcefArlBcc92UVxwHAW/WWSvuXKn2zUMleGsddAC4NO6Iw5+U/S6W1sMSsJdzRXswtF
         shjdgfUAkM0eM9hww9IcSgjAJPT1aJPdc5ch5AJ3C4A4VUkM4S0ck4IJcliqg9FojGgg
         oaAuVNImKWtiEvwrnf0vSp6n0qZ4UaQsy4FV/LVdHkRkIMBiNu5f+TsaxeN2mPv48qPH
         +HQ4m7L7HMvxRHayKPtH+R5Awv7v+Xgs+//mIuFp/ykryviNXlAirBmsjmzAPK/7iMXv
         Vn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255474; x=1752860274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/wPhaNRFFlkJO+qFiqBH2aleBY7cnhkdPVonssJv5Q=;
        b=E0wbtZx1SvmtymEzUBQ8XY+2uDFj5heb4P8CjKwqvY2QW+rox45UbxprnPdrOQ+h3o
         twrZ1bKBoaG2N9Mk3G77Z7lEAn4v+N+xFCYDiJpUCetGm3Qie3jzvscfHS31MmES8tT5
         juVzifU+tTKOyVhMolpGy4qPpILfJQxVJgA73DK2hbyRJXpZ1t3G0I4AimVSY84gnDd2
         DSrIaAJAQ0BVUl7lRUJBYRndk2ihCIb632ohdFpaDraVmnbM1SoAIeMbFPCf0jVvM0Il
         qmTuQyX6nIA0AWpF5qX63lmDYT0oyDoFW5ZbH97fDcoFG2Jo5rVF7xGEWJ3hz0L1XvVL
         MMZw==
X-Forwarded-Encrypted: i=1; AJvYcCVnOJuB7Ak119hMz5pge6dpQJKNr5fCggrk/wZ2D0kVLedofnOhdVAOFw/g/OJ/fuSn9DLvRBR2Kwlq@vger.kernel.org
X-Gm-Message-State: AOJu0YwP2O5jUjXmBatVTuSSSKqtJb+nV4gM5Ep7sv0fXBgSKBhkolfO
	BKao34WdDlaZvPNdf06dmRxRerEgXreC6cH5zvNPpnkbj1/ctzMFrNVDhw7KAww65Cu4BYXTSAz
	4d4Whb1c2mFV3Nv0jtsLQK/ZBnWzBXHJ3KmsfL9excA==
X-Gm-Gg: ASbGncu8fZ/RgwGjPe0rWQWsIpLS5nzwYbmBHI/t8QOawspwm0SmPFKXs5JxURZ9OTy
	LUtkmNqtepY3b45w2rHQML6senjcw8NLXJjVLd936N4BHPnXaGXCGARlkDZUdvahjo3hs1z4Lg3
	87zCeUkKhP5j5UP6lY77KAUkSxSDqzMeaVYTU9lJkszSM3WSPT0XmJfD50jQNmsPvq3qo1QH2RL
	t7VbQo=
X-Google-Smtp-Source: AGHT+IF+cfvK3eLqa9K9L6DPCT6kgf+Ev/B+izhCVZVm9WicyNxBl8mVC5xyefEXRVZSA1/13oXp75ELxU2ct8lREZA=
X-Received: by 2002:a2e:8716:0:b0:32b:952f:3e0 with SMTP id
 38308e7fff4ca-32f50c498a6mr25667221fa.7.1752255473954; Fri, 11 Jul 2025
 10:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613114518.1772109-1-mwalle@kernel.org> <20250710094906.GG1431498@google.com>
In-Reply-To: <20250710094906.GG1431498@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:37:43 +0200
X-Gm-Features: Ac12FXw8EnbD9g212rQmKvQg1i0JlZJ9eQIjIj5cqOOd4iGxNk4FlRT64r5hG3Y
Message-ID: <CACRpkdaQdV-baLz9Deh1AK8Ujd_QRnk9ViHJzqerH4vdrwCEOQ@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between MFD, Misc and Pinctrl due for
 the v6.17 merge window
To: Lee Jones <lee@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 11:49=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:

> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-misc-p=
inctrl-v6.17
>
> for you to fetch changes up to d90171bc2e5f69c038d1807e6f64fba3d1ad6bee:
>
>   dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC (2025-07-10 10:40:21=
 +0100)
>
> ----------------------------------------------------------------
> Immutable branch between MFD, Misc and Pinctrl due for the v6.17 merge wi=
ndow

Thanks for shepherding another successful MFD driver!

I will optimistically assume that this merges in under the pinctrl
umbrella without any snags, or that I can push any merge conflict
into Torvalds' lap during the merge window, it usually works.

Yours,
Linus Walleij

