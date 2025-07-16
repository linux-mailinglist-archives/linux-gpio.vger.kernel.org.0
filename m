Return-Path: <linux-gpio+bounces-23349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD3B0710F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 11:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1272189E2D4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 09:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34C22EFD9C;
	Wed, 16 Jul 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N4r1M3ps"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87328DF1F
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656508; cv=none; b=KfYYWovl6zC57EtVCXj3xjLSLMmkHhowu5HbgsR7CnpL0izh7X0DJqbge3VMMAHeA8L1mhvnDn/cfb31FNcScU5cXXJF6LLvuDPdIQkigGihjwn52UX6a4+tq7RpWDD7dA0lGtGF347sdxRDYe0zh6ptHzFRN7/tJmNto+aD8KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656508; c=relaxed/simple;
	bh=BBcKoS7mi4jDnSONYu8FV3REiwngoHRNGrFQArPrUNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv1iqpSAvT29j9WRxeIp6X11N/UkcqByG/cpLT9DQilpBM6PLyeWzJCkiAsB204HOsB4FIz1Pd2v94YTJmMOPezG+rjwon737SuokKEO4Vdl60m+XXPzbkW9r7uNM7WVUKWTbxwnkUZVOg4Wb/tuM3qS14QBHdUPrlyxHWfSSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N4r1M3ps; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6641532e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752656505; x=1753261305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBcKoS7mi4jDnSONYu8FV3REiwngoHRNGrFQArPrUNY=;
        b=N4r1M3ps487+YG6/t5s+O8JfFHTszqneEwHC8R6ib2FSIhkSbsm+GGsfASN9mwtfVu
         qBrSR145tJXW9yW+r3WyTkHAHyMULTyUP648hH63P+PlR/St6mPXmZ72YqdSQyWLAA/w
         dwJDiPDfqf28ypb7zfaRv9xe6daxB2OGCliTbxDt54orTv1ahsfYgTykwn8Wzh/qhuio
         MUE2d0yqeVwgIlg7W1D8DsPl9/Yh4YZtFNShwGe6ultYuepTznNbHUfhkyBbY42GGoAu
         4bgqj3ARU8+BYZvGOyTTF6BSJTsylGv139V89X35PDyxqHA5tN9Bit1abs5VEF2hO46x
         Cz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752656505; x=1753261305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBcKoS7mi4jDnSONYu8FV3REiwngoHRNGrFQArPrUNY=;
        b=ejUQN2WnnhFBNSCS7WMJZ6daaue1ZHRIXUN4Ygm1N0EVkEyZWR5sKPj/H00KYoctbk
         V7lusSt5MHmWbFFDbadoC29+Bb0sGsA94j75FxgY3R4XelRO9REswBg86X2P45uuleRo
         EJV0tQLbYSYDOSERHidmeyJINuDnT23KhNXrBn8pKoYp79891oUjnYOGFthaBz45Zo8i
         5ayk482o0oc8QAD5TjJhf/xVh6ZesLHDRum3Oi2tiCQI64hOB320LDshrY8Bq/1fcwxR
         OzUSquEfRuC1D26hggOUlKhbRqeD9qCmtDFuaETsrEFXeSJ4w6VKK+sCo8U2PQaQxh65
         VSDA==
X-Forwarded-Encrypted: i=1; AJvYcCWsvEbp8z5jlvfXGr2dGk5RW2pvq7kyF/kE+v8PWCEhWoKIZY/nSQnPoPHwIEL67Rc1A1ju7nygVPqv@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPUg/ssz6ehAyg0NuzkWlvl351Gf+jVlEtui4+tuPYPhyKyF/
	xOhVBGm9bG/8yohngL98g89/fq8pqX2HwDWy3NkTIZjnV8FG9QdNFBhTPR4HWlxUlFtUNgLtyLW
	1x9/+5rDZTMO3u1PQM7p9xkJl306SSXwCajnUF/zGBg==
X-Gm-Gg: ASbGncuKC1r7PExlMo67uxakYJyEvizPPqC2DrxcqILLDFL030psahDEGDw+JSmIE/k
	lncLWxGUStO0GuZyeUtRM5hHgQN/d0BhAWcPJpTPhBqPzVyRXdMR1bLGDzGL8ah4uHxJdh+pP3s
	2ginWxTBtgg7x8U0deMdC/BiptXlKdWN/k/i8JiI/12CP//AGBhc5AVp1+t/oQQ1MYE6TK/sll4
	DutActi7aoboQJ/CZ6vHsjlyPO5UDHgRQ4JcEc=
X-Google-Smtp-Source: AGHT+IH/HqqTPSA+WjjhNwxXEZwMLBXc7WD1Wy0HoAW8jP2TlQfLe3IFGFYU6dKiGmXNLufx3R4vkNSthgn67WJdtOs=
X-Received: by 2002:a05:6512:61cb:20b0:553:6570:1999 with SMTP id
 2adb3069b0e04-55a23313441mr550901e87.13.1752656504801; Wed, 16 Jul 2025
 02:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Jul 2025 11:01:33 +0200
X-Gm-Features: Ac12FXyKoTxRlLERg0vHtq1S74vPG2R2khlX23aGf2OGOaYX8tkkvgqZ8Tb9bCU
Message-ID: <CAMRc=Mch5d3=vbRqCohh8viPpp_dTOd8iQBD1fEQVeZrRJD90w@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Add loongson gpio irq support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Linus Walleij <linus.walleij@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 8:45=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Add the interrupt enable register offset (inten_offset) so that GPIO
> interrupts can be enabled normally.
>
> According to the latest interface specifications, the definition of GPIO
> interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
> listed one by one according to the GPIO number, and the corresponding
> interrupt number can be obtained directly through the GPIO number
> specified by the consumer.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Seems like the message should say: "Extend loongson gpio irq support"
or "Add loongson gpio irq support for mode models"? The driver already
supports interrupts, you just seem to extend the support. Tell me if
I'm right and I can amend the message when applying.

Bart

