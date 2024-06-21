Return-Path: <linux-gpio+bounces-7612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B770912587
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 14:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 560B3B29276
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 12:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2ADB15AAA6;
	Fri, 21 Jun 2024 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4szMWK/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F2156F2E;
	Fri, 21 Jun 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973285; cv=none; b=MneeH9CAqXD5RtItO/Y7lCpee8PEhwKbI/bqR2C40XpJdD7azpsIjnZku2m8vWn2M2t4bs0AyWHmCWZqhA9DeweXmhCR2gO2siZAYvk09rQWbi7lK41YIRFXRGI+XNCUU+pqgIXFAhYObQHGGaKBK/oEeXA1TOGzjGqD16H0WnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973285; c=relaxed/simple;
	bh=CIgDx30yAa1sR8deuaj4qk9N2731ImBGhxLurlUpk6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTVDe0u7bMIrdjLm8hQ9HCxv3OkGo759Lxrount+DoTygVljm/yqiRrWMD4oQkzw/cwZ3duk8ZAIRQzKl4VT0nj+K24RjtIPMc/lzM2rFuO+XztDjXoPy06BF5NpqbUCj03Jm5gGQIvWuK1vUynD09cKf+h47q3Io2g6MG2U/0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4szMWK/; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-25cc2eb593bso860780fac.2;
        Fri, 21 Jun 2024 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718973283; x=1719578083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIgDx30yAa1sR8deuaj4qk9N2731ImBGhxLurlUpk6Y=;
        b=A4szMWK/bqHZZwfcLqyeyuDLpa7zSKN6j50eVsCrZA6Y2Gxu3GN5bHPqyXWQ/VW7VH
         Bus+kUb1FBISMfakAKsmKIW+59Wsyty5xwM6iQY/DfYDdeYapb/sFPw9PszcI1cmlAPT
         4P/xmG/OMsR+mx1rFpzNe4m7EHNe9wUZtvpX6bAYAfneWIOncb3SRRHuSvig6FCnv/sB
         t8MVmQ9CIO9qiBCHnw3qzYpLWB9XvkUKs4jb3IOmbXfEmFOarfu5+YV+eJGewOKXl6er
         ooNPw87w97GO1ybsDt9nRfnuJ5Dv+kdGpf6BI2i6mn33P8havpzKGqClZ8yTYXteVRui
         OWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973283; x=1719578083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIgDx30yAa1sR8deuaj4qk9N2731ImBGhxLurlUpk6Y=;
        b=gHZa5lHZAhGz6+k9WdqU0mQ2HjyEo/EFuagHMZ7pRNZp80B43XaPZjlI22htLjjFcj
         8mvJqLSNXuNzUt6z202HjfrMv1IHr3Zmi4kO5KiLrmZi3s1Hyov0BsOsXaoRft0p19t3
         4sJ0fcTW9cDmDTVRnrQagqUfoJWtFp7YsGClOm7iZYFruwyTRoWO/WgiDcqNy3kz0oA3
         Wfi1pAn7rrU0Ry/So8nkYMvGD9O+ujXguMebmkOJdejoyQVPr4K9gd7UjnzsnZiMrfpy
         oqNSIgULm4+6z5/7P0XJKAneF6JQIU/zschxrLi2Z6lDB/tn/tZTrrwnRHo6tCVq7/QY
         vUTA==
X-Forwarded-Encrypted: i=1; AJvYcCWSgbjXtQ5ZE/TvC5HPYohEPZP6oiZzwRhLF6fXSY2VgNOGmbFlbFuvUawTMRjTEYtec5rgi8hoDoN62LTjkANU745hfwx4Jx+r8vg0GAAXS1ghKi7I46KXxIvO2KY5/MOL3105/fle2sbx+lCCyD+aQpr/jmuaOExO987KDUAi3A+7ulu3O7nlci4Z
X-Gm-Message-State: AOJu0YwZX1ShEbuCJyA7f0vmMUOyDz1GL4ogrBWeyxhvTdkDO9ajb/LV
	2qT+j5dQTmqdCBPiLzIPdODH2HvHJAUqePk+Rf6lkAzCBkDbWz4B5a0qmj2kP8Ofr/zEEOQbTwV
	kTD8yw6nCTNT1GQhKo2gbrqjelsU=
X-Google-Smtp-Source: AGHT+IE+61U/C9byz53CAsKSRKq4MjgZrMsonDyrzzk/HDDAS2EqT33hCN2usyYYuYOjPubvfE2BlsadvhfbbzmRD7g=
X-Received: by 2002:a05:6870:f110:b0:254:b299:47b with SMTP id
 586e51a60fabf-25c94d74c77mr8724920fac.58.1718973283445; Fri, 21 Jun 2024
 05:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240618174831.415583-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV16Sd5HoJr-td+OJJ8gCesbCzz3BSXNFpBpd1iR9=u4w@mail.gmail.com>
In-Reply-To: <CAMuHMdV16Sd5HoJr-td+OJJ8gCesbCzz3BSXNFpBpd1iR9=u4w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Jun 2024 13:34:17 +0100
Message-ID: <CA+V-a8scaP2uBV7u-BH3WE+3_eOOQv7Z+_7is2ohh+aGNpM1JA@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: renesas: rzg2l: Reorganize variable
 configuration macro
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Jun 21, 2024 at 1:17=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, Jun 18, 2024 at 7:48=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The `PIN_CFG_VARIABLE` macro did not indicate the capabilities of a pin
> > but served as a flag indicating that the pins of a port have different
> > capabilities.
> >
> > To better reflect its purpose, move the `PIN_CFG_VARIABLE` macro beside
> > `RZG2L_SINGLE_PIN` and rename it to `RZG2L_CFG_VARIABLE`. Additionally,
>
> Do you mind me renaming it to RZG2L_VARIABLE_CFG while applying?
>
Fine by me.

Cheers,
Prabhakar

