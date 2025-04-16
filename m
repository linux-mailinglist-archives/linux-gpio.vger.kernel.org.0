Return-Path: <linux-gpio+bounces-18911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B622A8B1D0
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5DEC3AE63F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 07:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BB61DE3C4;
	Wed, 16 Apr 2025 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmMuePer"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0124B34
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 07:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787944; cv=none; b=jRes2upRWwK99FQb1fOSUvakJmMqzbINvoaH3ZgNY01/hoLQ2huLjyTZwHEFumAqaltJyytKMZAsR/tw64hpZ7WsWHgWzUNeQ5JfAspETuiRipMTKMVGPSHZ4WG84yJDe52TE+zzNbFcJGGVSCDFTssMEUwSTasfx/1wnIxIKdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787944; c=relaxed/simple;
	bh=BkS4uPdvDvbJ2DALywXghgt7BHAXTRGcUTYN61PrStQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjOjjfRjPsfYQEimIh+dFf8qGLSpXP+32aD2Z//Ys0eOITrgpRzQ388dv4bONOZKTETSWR/1Ixvu+CMIoHP7IJuJGEbSJa3xlm6tTUV2ACicR4Z0p9cw5y8FcT3m0Tq/23TfLli1Hz8aXJXirgtyr4ueqbRbjZ4VYzKXshEwGTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QmMuePer; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so60175741fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 00:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744787941; x=1745392741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=;
        b=QmMuePerU5PTXo6HR3Aucz8SUf1KcCN2TT/OeBAiY9HiWr+bPpONikh8N57kgWYfLj
         9WQjJpi9y7tEypx8b59qUamD39j9gy2tl2PNvodN3Y1lYwhmIzG090L/z+CTsH8N5xhu
         bEx8h/GbWfcy75gMxf6jBGQ1KZFJkY9of0+26wFP0W7WnbILGUsXXDmPngwsLtFWL5cJ
         IJcMmKV8GPkBEN+scLMXesR2Oi+0cKHl69+KNLeVdTtIBhLGi8lvxjlhBX9VisyMiFBu
         OFKBW2GMMlPKlwR0RAvUr04Yftl9iJb3LwKDQ2F2EFDU6PSdPO8/On4QdCt7fv3IsKpV
         zTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744787941; x=1745392741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFJXzkHk3Kj2IxuOJ/Ep1Of/eMdCvzxnv7r1gWoCH1U=;
        b=M6yjNrbDAlmDZz/s4udW/+VKCxnMs/yfHkfHUSFSq66caGygLvNAqOPuBtIwr8f0SI
         pVODyZk4+K0lFxhYNcB8bNMKO5m0tlX3jfKs8bGZx2uV8Ia3jZf2Hlud2YaAcSYygLuQ
         fdO1Z+r8ACBEulyXQECFrP2rFikAs06EKFpNDG19f2a+16ZD7+3gOQsh2th6QK3Gb6me
         750xjCZrTI2sgUBTalu7fKVCymPxbpQzGTs56rfP1O6PwdjWuxVYi+e9qq+dGUI+PEMn
         VZZlEsJlxO3aGq8skibco/z0i+2839iXL6hTA7ShLx0Quhw5A75KQXVCgW3bq8xSxik9
         hYww==
X-Forwarded-Encrypted: i=1; AJvYcCUyUJERpwI7vOBPEFwRH14izKnZePa51FHTNNTb5FCQDDMOjD1M5EO8ykUOm/EHijnwRfTkkYXodfB5@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjxbHTC4ur1uwKH+awcZbC0QXswqMp+K2R+LL/KHHefEAFwvD
	vVVh7jxCLaGBNpFaYohp8N/hODMfMgWJMsuI56GM0o6Yl+JBGBBUTibIgYYwFzWv8GFXW/FkONJ
	lK3Tpg59Q1laT6U3I91F0R6E2D77sGZR4lakz1g==
X-Gm-Gg: ASbGncsmEcwKOhVEWhCqUXjlszaJB+CF/tBycz7wdIsdam0lHbWmBg9346KU7RDHIAN
	XrS7KeDpJAUoq1cfzNuh8adFkTLpoCz7ph7kVjcMQ1vaKH1juI5I9zlu3DMaYuXZqqN5LM8RjhQ
	f+HVbCki7whbdjcfv8c/CBUvbTdHrcnztJ
X-Google-Smtp-Source: AGHT+IEwGuf6I9l4WitaTnVvA0VbevlCNH9pw1Uf1YwESFwjIdIWV04UPwa2Rl6g3j8USJoLTzOTQddgM+ExezMBQpQ=
X-Received: by 2002:a05:651c:12c1:b0:30b:ed5a:6f3c with SMTP id
 38308e7fff4ca-3107f6bcf91mr2027921fa.10.1744787940653; Wed, 16 Apr 2025
 00:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:18:49 +0200
X-Gm-Features: ATxdqUHFBx4p6s8-l7d5L0o8ZWLKTNSVqhv1VO0pGzs9J7s5wacyrKjxAz3vpys
Message-ID: <CACRpkdbKXfQVNGm=QoCHE8xeMKDi5Z1jCmk18XAaTzCcWCDjuA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Pin Controller support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the pin controller
> of the MediaTek Dimensity 1200 (MT6893) SoC.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: pinctrl: mediatek: Add support for MT6893
>   pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200

Patches 1 & 2 are clean and simple to understand, so
I applied them to the pinctrl tree!

>   arm64: dts: mediatek: Add MT6893 pinmux macro header file

Please apply this through the SoC tree.

Yours,
Linus Walleij

