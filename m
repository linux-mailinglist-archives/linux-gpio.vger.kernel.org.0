Return-Path: <linux-gpio+bounces-17044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64164A4DFED
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 14:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D293F1897885
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 13:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52578205ADD;
	Tue,  4 Mar 2025 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WX25qcRE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B91205ADA
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096519; cv=none; b=e6mvQIwrSTjBr+pRR3NvejjtYLu44ItnFNDJpm+YPfsColVrRzWTxiXgWF3nBSLC6dibl4KXd9wnXH6IXPAdbYXmzLQJAQoqJ3jfxjl7+NFRHoprsvb35OxzAIKRmm4okdkPr1ZO8ON1sJwZtUC/ybpJUJARMWbvG8wkkklYpI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096519; c=relaxed/simple;
	bh=daPsAr0QyWYFS5jjyXv44luCd7G6VlWVIOU58rRGji8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKKCwOcT2snfXiK2iRc9Q6GkTItV/LTo9CZQXVyQYLH1jLKmMur4u1xfNLeX0oKyI/LKto9i1twy5vrnR0sQ5BXsBrj6WM9Gj8kjMgBBod000M4NCSf5V0TbuiwJdp65EDupMVgXTtM5zVwvoVyxUhJ4q7pJ/FQqVori5dqJLNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WX25qcRE; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30b9f7c4165so31772391fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 05:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741096515; x=1741701315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daPsAr0QyWYFS5jjyXv44luCd7G6VlWVIOU58rRGji8=;
        b=WX25qcREIZo/NXHGplaqZj501fgKIsN0WQf0pHmAM76sWaRiarYFIliopumHx/OMqF
         Qa/7mD6hAQIbfwEG2RGdeqhSFGwUH/1EqPNWOw42mSNXygxZYuodONydbq5KG2fuR64j
         lmN1GiXTHX/4QswAeEczT49vSFGVdSAcWZmHPFc5dCU14DM6vmpndf7tnEVGOpHAavUu
         ixq49VmDTAR0p2MVf+ORnXeGK3kXtjxdEx1b5mQeUg6wy1oQDmGOhS/l/D4UeHo/6YjY
         h3WYRtuihhr39kT3KMclEG/J2ewziHZwko/vadmqD1tYCgSbzlyfDz4b0fB2wg9Ddl7h
         iACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741096515; x=1741701315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daPsAr0QyWYFS5jjyXv44luCd7G6VlWVIOU58rRGji8=;
        b=VI0AQIa5esBl73iXUjT8P3vocT4ZYQLkeqkE2sedPs7NkKwK3nkp8SL9B5uLN8B9U/
         uHb2tYBEC9jEWpgQoTJIWaw66NJUJFyJsapX1/i0VqZCDMZij6BrooQTK4IgboBXnLmb
         WdrhjL10GOydO0zLvTQi6AvYZUL1so6kWRoQKL4TxCq/9iyrrW8MUhKQR2a+o/yWZjfu
         +Q0hyAJ0SzY3SP/oS2+i5dvgluz+3aWLvTH92/Rht0IyLaUq60c0EhZysyuWeaTTClzI
         aIcubxdPDSQVPEvSTDD2aiSU3J2NvEB+9XaVps4asAPL0+r9Qus+7tpT+17CDhgBE/IN
         qy5A==
X-Forwarded-Encrypted: i=1; AJvYcCXdIU4H7NSwAOqAzHK6DvS+GFi1ntrO630k78AlF8trKm+kLjqYCqxWT0xOWHZ4dpLZuUq2ZA5EO5MN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5CuZZi3DneOJPG40hP8V8MMjiUepzXcHpThxqPSoK2rkVYaAc
	XPZqTU1pztdIRo4UW6C7CYfGliCvZ1EQy5V6riUawNNrdPp/tYJ1Lnql3SfblMqPJgf6mQcyXzX
	Yz3hySPiSGDHUZCFAPznfM4nl/dFdd1CokpUeCA==
X-Gm-Gg: ASbGncsoPYx4Mq0ax+crmQdsepgm00MBEuKiIh7njif9ngn1GJabhj0s8ehXD3Vjr6C
	tyLJRjeW0aUxqPI1qmiv3VapWSj6pFcLLV5xl+64W3UmzKtEs1A2XleghX9muvFO0IZb/om153C
	24lRpEDiduacVYO3OAwEp5pn0m2G0Av8Uhyst0y3pmqiXJiW3qDGQIjrC7sA==
X-Google-Smtp-Source: AGHT+IGuRU1Vuf8+fuEHnhHSx+k25HlH5VEQgaMjDprBjLt370BR0zDP1aHnTzboH+gvPRQqy10QPp0xgCH/Kjy+Yeg=
X-Received: by 2002:a2e:bc12:0:b0:30b:cc6a:ffd9 with SMTP id
 38308e7fff4ca-30bcc6b0ebfmr11371201fa.0.1741096514955; Tue, 04 Mar 2025
 05:55:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
 <20250303074552.3335186-2-zhoubinbin@loongson.cn> <CAMRc=Mfr5PCuad28dL19iZrpA-qkL7x0W-4Lt3SZyVfXPP-ipw@mail.gmail.com>
 <CAMpQs4+5165E35oO_p-pE8zDNo2rPT-gBqueA_ynW8FYJHV18A@mail.gmail.com>
In-Reply-To: <CAMpQs4+5165E35oO_p-pE8zDNo2rPT-gBqueA_ynW8FYJHV18A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 14:55:02 +0100
X-Gm-Features: AQ5f1JrOEFVlIEX3WtfwovJiCXzyB6KvYp0MW4h0lr7l7aVdvgOyvVX7gpUTEeA
Message-ID: <CAMRc=Mc6Fz-HkFc58_a7iakhVAOBRN34JUHX93K6tCTUNkp_AQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: loongson-64bit: Add more gpio chip support
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 12:55=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.com=
> wrote:
>
> >
> > The naming convention here is a bit confusing, can't we have the
> > naming of variables reflect the compatibles they refer to?
> >
> Emm...
>
> I named them that way to be consistent with the previous naming.
> Of course, we could name them something like
> =E2=80=9Cls7a2000_acpi_gpio_data=E2=80=9D, which might be better understo=
od.
> Also, do we need to rename all instances of =E2=80=9Cloongson_gpio_chip_d=
ata=E2=80=9D?
>

Ah, nevermind then. I will apply it as is but yeah, we could consider
something better in the future.

Bart

