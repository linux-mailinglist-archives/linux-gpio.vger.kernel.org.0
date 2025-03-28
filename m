Return-Path: <linux-gpio+bounces-18096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16402A74D64
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 16:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A32A417ADC3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 15:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDA01CB51B;
	Fri, 28 Mar 2025 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2oS+8Qa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011831BBBD4;
	Fri, 28 Mar 2025 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174448; cv=none; b=GFO1ben2ZoX/GQ0xZdmc2mrc+2QEAisLiR2OjX2K1si6JhWMYJRsr+XZDBv7gQAdq1aSrEY8J5NFawJLAQFkeOy60HWrdJW7duAqAQdyIh81phM61YnwpbseJTKwXcNO1oXGCdcK7cUUmzLZOC4oysZqQyZIDjsCj1fT6HqoB1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174448; c=relaxed/simple;
	bh=e5NOeIL567HYWuMb2bKfSLHEdZwzaRkfdpsLM/ilX2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vg58wqa8P+XLVINWw4bdA+4YAgU9kdVCmSwnkGF0DXTSqwPyUiCBFE0+d5XR2cv69TC8+FQ3OGx98293hnq1jDeO9v4zuG5pLSOX0z1bqA5hwpBRH7yHBs9QsXmGKvrxYM6dKmN3EmF6QnuzDWB5etb2dqn7Hb680eHlkxwRhUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2oS+8Qa; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4774ce422easo22848121cf.1;
        Fri, 28 Mar 2025 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743174446; x=1743779246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8SqECOv0O7fVnnTWDWZ8wyu7bAlxfC76iF8P0q8bMo=;
        b=C2oS+8Qap6Vm0LbJHqmVF89uonah2WQ485Ug/3MzVZEfatT4utYMuShtG6ou5D0rB/
         ZptR4JVn8xEN2y4hyJVkcq3ooRvK58AxqQFPl41Fp+qq3EFgUEOlnSdK3YZzibg+g71a
         clBlVZMWuMkSBLY2asliNzGt26BWiXFwEtdK9gCU+z1nAFNx0gQOP6qz+x6xad7TNGIg
         t+ENsExf98zfYLmEo4jhq8GkOkHGavByjBkinGlvGUFQi1rdV/OIcTQ9KH0J6ZeVg5K7
         3sPX3hIXZ055QkcgUOTnG+87LDwp7+Xavnx+3ibZv9P8lH9pfnfahWA6/DN2F6P6wAur
         FrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174446; x=1743779246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8SqECOv0O7fVnnTWDWZ8wyu7bAlxfC76iF8P0q8bMo=;
        b=hS1ZBGhefA0SyfIZEt3JZ68GGgh9oRNANl8cKOBOzvU0yKF3FpzYBtgZoBodBixZtH
         nlYQjvc0ry92fdQhv3qlSzlXrC5PQYv9NkzG7o3sCmtggWOmaC8O4c25r1u2k2SIinjy
         /blo96H78opUcZ4TVum7LJjVX35bvBU8If+v5xMF3Y1brH6Unm/fd/8KOvexbGcQTRiA
         6JV9UzlYcQfZKf0b0mYY3Fr1mTdRS25In72C6WUk/5FiTIh+TSVqE945nqd9AH7OvQp2
         njPKaAzEv5kzxJq4likzfhoaoV6GnFh6wpmc56tKZ7BgpDMOiCZC0pZwRMheofcZgnmS
         8Pdw==
X-Forwarded-Encrypted: i=1; AJvYcCUgu771fx3lLJHnja7MWfJlkuq0ekYHA4sNJuw3nEOQT89Yyed5IMFyHLxinYsD0KfxAy+s575I4kbk@vger.kernel.org, AJvYcCVz93NJhffU9oUhHntZzOtqI/ikGSf30mKsuFp+ebm4g3fE5KJ7gywjAJYrDSF1zAjaIRV9odZT+3CM9w==@vger.kernel.org, AJvYcCWSUtU6HMgkJE4wA14cUF+XuMnDEn8WimFd2RbMbPxD136GysA1g+RDlDG/HBop97a+6XqxPYuM6thM3Iezebzbwok=@vger.kernel.org, AJvYcCWXho0LavIrXUmNfQUhIG4IGYair47awqzW3KE5he/oyR+Woh4eUZVlIjbmVqKFQKEY1+gBADQRKq9Z@vger.kernel.org, AJvYcCXH5ikLIxoEdS/be4aHqXsFLiZm9M5ZLv96UH1xDzy2Z/wwnzzn8cg4xaHi26Yn1XR4ebU9cBwucdxSPPZE@vger.kernel.org, AJvYcCXmf+bLZbBBmT16HIsh+TY+xuWuYVpdI/hXWggRH721BbcBz6n/AFoZd4BOOdgChgHPDgisHJrh+shR@vger.kernel.org, AJvYcCXz1jevehhAvhqT42rLxcs2OdaHriS5i6SdLdAg5Z+ftRl9QAO9P0kWv3EUSgNyI1AXeOtUYu1tplVHMP1E@vger.kernel.org
X-Gm-Message-State: AOJu0YxlvYUFfIH9NT1QU0bebcJiIa/+pmVSavfD1T2so+65Y3Tl62RE
	cVqJvXFgs7fgGAxH+UcIzsuLS6iwSdoY39XuNghIsXfoEvQ4lxh6uxXVAPrhXZWlfBNGmfTVRay
	+94jNTC5+LB/cwkR55416revtvrodRZsh
X-Gm-Gg: ASbGncsYSYMOey5T6gtnvFC/i1M3SF4uLW5L/T++sroikop+x/7easPRpwwBxoxxAgw
	D+FBbQifVxXx3/Ae1/oXaRYanvZ84y+7cYg/AMjE1xV/ZvSm0n3hY1lL70Jlm06GkzgIR/4Zfqi
	8F9oBBIeqXz54uFT88Hnw3E8jQkew1DVQJ304gclsVY/7eDi/g1O2Vv1Hw
X-Google-Smtp-Source: AGHT+IEFQp+Cby6HiGCfeAk7cmSpHEGKzP8//Qi1usTxz78XXYaOJxvsMppu3V273yn8LVP1qJjyhVwAo0Hz34FL160=
X-Received: by 2002:a05:622a:418b:b0:476:9474:9b73 with SMTP id
 d75a77b69052e-4776e206ff2mr122423331cf.42.1743174445583; Fri, 28 Mar 2025
 08:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-15-prabhakar.mahadev-lad.rj@bp.renesas.com> <dab9b294-b635-4bd4-986d-0c0671eae6a2@kernel.org>
In-Reply-To: <dab9b294-b635-4bd4-986d-0c0671eae6a2@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 15:06:58 +0000
X-Gm-Features: AQ5f1JoruPtRoSZk--apVQ2hKRTdRqkBTHUcuumb74_fLpm1bI2BZKaLDy8CY00
Message-ID: <CA+V-a8v50bLCSWRDZ+CwV+1re3SApzFW5kx-T9sJb=kCJ45zKA@mail.gmail.com>
Subject: Re: [PATCH 14/15] arm64: dts: renesas: Add initial device tree for
 RZ/V2N EVK
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Thu, Mar 27, 2025 at 7:44=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2025 15:39, Prabhakar wrote:
> > +
> > +     sd1-pwr-en-hog {
> > +             gpio-hog;
> > +             gpios =3D <RZV2N_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name =3D "sd1_pwr_en";
> > +     };
> > +
> > +     sdhi1_pins: sd1 {
> > +             sd1_dat_cmd {
> Follow DTS coding style.
>
Sure, I will do that.

Cheers,
Prabhakar

