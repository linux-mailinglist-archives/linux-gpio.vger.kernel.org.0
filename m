Return-Path: <linux-gpio+bounces-21754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672CADEB6A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11E723B2C03
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835D62E54D5;
	Wed, 18 Jun 2025 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jidkm8EA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B9285CAE
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248248; cv=none; b=EwpJa4FTyodfRWz6uqszE1+f78bo/ufs7lt2gER99OgEwmYg93bDzIsVNwF84Zea4Vx/wjNqHtOPfSKJQIlAyCJC45dsPem/sEx0hbKqC/iqUfI3ZCU8TWXqEIDW0tghBzsX8XsrQWjaUotepjo6H+0A3yot8c0pf6Xjw2/HJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248248; c=relaxed/simple;
	bh=PTmy0HiGv1t5sWFCZ17SXK1kqhYyZoQXdPJkkAc72Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0jsqxEFnPVha7dr+gMNq4RReAlpIvN5JJ1hzjSjEy9NpRti2vxfHyIwsJgyHyrQ0Ofn49BPlnynOo9vrH8PlsumbpTYehxsMHNbmAA/A+eu5RVCR2+LI7nXmsY9x2UW2C+pJHnDuYmF38EoT2FwkOl0/fCGzlXn5RRvkicZdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jidkm8EA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10594812so7061492e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248245; x=1750853045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pw5lDMVe5PLgX2ttnQHBMbMYq8dC4LdNA8jYmEuyK2s=;
        b=Jidkm8EATPRg5VHH9TIMoiDnXjer4MuzmtdWCu8ovDjoAewYtg0zRrCaCnA7GwrbRo
         utF38UuVM8BP673WDjLNIhX4SsS6OPbZvCBNI5fpl4xUqmKh9yotim8urM6kosvGPgon
         a5npIovo9kYBfOynwlUzLAjJRehzQXiNWmWThS782P/qxdIiKZ1LCb0WnLE28oCRmaZI
         +Ue3+9zmBrW4cUKL7kgaitpg6VGu6gBU3BHjL8E0ghjbiHEbF38RLWIXUiDWiPYZMvce
         qyiZIpDOeQ3wKT2o4P7WmSWZ6oYe1ja3y9hclBcaztzb4c0krzIBBlf6JrXNr+HMXxyA
         0jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248245; x=1750853045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pw5lDMVe5PLgX2ttnQHBMbMYq8dC4LdNA8jYmEuyK2s=;
        b=JpDMjPA/n7LtMT4M/oznxBDJKEcUcy4WDkvn2dwRkVl97lThLXGodV4W1Jwt6ycPPj
         ql/AAQYF57JevSgR4GgWoB1vqsRfTdkoJyYfqhxRtaHfsg6eJCPJCrWI5GVc5QYIcoOi
         S82R7HvPcmJBNf86CghpPwnKEj18T5Mq1zK+VHdM7Grnn7vjM+YOahWI+kcmzCWwAjWa
         ztMd3hGB5Sr3Yq2Zdxkvg+d7mYdeUCNMDGrcdxrH8F/LqxHuTHANSP0yFVVVs2bYh1Bv
         F+Fn0B7xSPQiUsQHxXIxyDHiAj1D0pG/JO62eP5fSbZoTbehbk8zgTrNoX/hJ2vsRQio
         z5GA==
X-Forwarded-Encrypted: i=1; AJvYcCW86JY8Nfqro2jsWVGZtgVwZ9AEWmp+TyppDBHosCPxWC4Os7TGtUejCTIO1HwOXtmEWFIjoFlbaweo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+dyteoyxHFjmHWerrHZ4GnuR4BC0LBAelzqCJxfUy4i7hClz
	tumUixMZJXaoNRgXfOykhdWanwkGtMFCAzJidQSS5nECNObJVCSWF53iX7i0dVTovetgAhp+enU
	rkgvfD8/0ZpwVXPyRxbLcoBO4SPeH/8suAo3vFd66cw==
X-Gm-Gg: ASbGncvDvNkyIyxEg3JsoSWreqpOkcFOuVMWQk/k+StvEkkvN/dRrO8y+jK9FjakWVT
	SvVl6lqyn0zKjBkU7eBm330tEwiHCTUzODymW8rCJqmWANge4hopNoDWCQpHgX7xljUqV87vidS
	BvAYkbOZjaM1guKyKxinujK6KJSfx6YaPELFI7ANRyV54=
X-Google-Smtp-Source: AGHT+IEU7+cVw8RWzajvpd9J/titbwGwZeEUiqB65UOF2F1fN9VnyfLkaqO2QVzTwOrXfsDFPTbPA6/Eswa3w/UmtNQ=
X-Received: by 2002:a05:6512:3e0d:b0:553:2375:c6d9 with SMTP id
 2adb3069b0e04-553b6f4ee07mr4818857e87.55.1750248244152; Wed, 18 Jun 2025
 05:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612104539.2011-1-luyulin@eswincomputing.com>
In-Reply-To: <20250612104539.2011-1-luyulin@eswincomputing.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:03:53 +0200
X-Gm-Features: AX0GCFu7uLyX_FQipTQ9KLFWtnjX7fYjtMWgaWxutCWJs9ZMNam2b8u2qEvrRTQ
Message-ID: <CACRpkdYQBdkeJjAkTikxgQBHJLQUmgGSq45kGMGzJ9Hm9OAERQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] ESWIN EIC7700 pinctrl driver
To: Yulin Lu <luyulin@eswincomputing.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kees@kernel.org, gustavoars@kernel.org, 
	brgl@bgdev.pl, linux-hardening@vger.kernel.org, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, zhengyu@eswincomputing.com, 
	huangyifeng@eswincomputing.com, fenglin@eswincomputing.com, 
	lianghujun@eswincomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 12:45=E2=80=AFPM Yulin Lu <luyulin@eswincomputing.c=
om> wrote:

>   Implements support for the Eswin eic7700 SoC pinctrl controller.
>   Provides API to manage pinctrl for the eic7700 SoC.
>   Integration with the Linux pinctrl subsystem for consistency and
>   scalability.
>
>   Supported chips:
>     Eswin eic7700 SoC.
>
>   Test:
>     Tested this patch on the Sifive HiFive Premier P550 (which uses
>     the EIC7700 SoC), including system boot, networking, EMMC, display,
>     and other peripherals. The drivers for these modules all use the
>     pinctrl module, so this verifies that this pinctrl driver
>     patch is working properly.

This v5 patch set applied, any further comments or snags can certainly
be addressed in-tree.

Yours,
Linus Walleij

