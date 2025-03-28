Return-Path: <linux-gpio+bounces-18097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EA4A74D72
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 16:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEB1E17641C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 15:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6D81CAA89;
	Fri, 28 Mar 2025 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHLVAD+L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92F81A9B5D;
	Fri, 28 Mar 2025 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174599; cv=none; b=dQCRNr0nB5BTjzSR24lW2ZcjBXdTjijn80c+yptxSoJnitvCsyBRzsCkEme2VdL/eBcRH2bwj762FLOvPD5d3WEM0DrDVDWN8otqVxV24EXX8vcDOnqisuMiqNIELV60VzUIqJnMWyfqTTEl3PxBdpzsIX/Ad3wEvGRSF4zLqyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174599; c=relaxed/simple;
	bh=ah3hu0AHfgkkvSk7ohighiuYRZJ2eQBgx9wMy2atfE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CWj5/ZuSM9jUS4WaWlqbjfAYF5eghbHMdVt+aNHZouWnlxRb3PIApixP5uzoogwRE9LPeXOIXspMZEAAXdPycC2G/W7X3hIkfsCRFOK1Gmz20rwvxqUX7L7ZdBaM2n4V2iJ2sDxj1rv9TQ4q4nO3bj8jQTBDI1xFzcVtbASkuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHLVAD+L; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476b4c9faa2so30278521cf.3;
        Fri, 28 Mar 2025 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743174594; x=1743779394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHMi97rW5XnYmsHSdrUIP8vR+FvAoZCe/aUt1UwDlcM=;
        b=FHLVAD+L6FJ+TMxJVfnj+uKJ8j8MiRsOgoZk/Z7nZiC2SoD3TS2zw+d7GDp0ZWhwaA
         UyLlP8WCPvmEnOKB+LFgHi+19fiUSVwW3FObjtWAocAxXsLHiLJuUwZYwohVuGnyluze
         0fyxaGCXZOjXSZbWrDQekCvAuyStvLRZAgDSoCpTy1NoER9e+47v0ifO63a0FtSwJab7
         flBt+5/GswLgGEQQ2GyfVfgVuj4+a++0iaUz4fIIVWXlj/JZ4PUZ0pa3hiVNqbxKDbrv
         vIsOuGZBD+bz+F26qVn/nvb6wvtonysnYL3gE9k0vxQN1NbN72R3ENi/5sTmIntJC83B
         hvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174594; x=1743779394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHMi97rW5XnYmsHSdrUIP8vR+FvAoZCe/aUt1UwDlcM=;
        b=d5wLI3vhHM6mgjS+YYCbdm1EKEFXl76Sxo5lLOGXdrDa2Y3igN+O+Xx7F+DDS+yQOS
         suwIC7myMqsk60txl1e2armLcOBww9oN0uEZQPSzeX1wuRY4RIUa09zlUIr443/8hJSV
         hhpXVXzR3d2eCAbP9OIloCO+sfdfwNuD4QNYogbu6BgCJa07wx6K4PKU/NQ1qO+L0ZO3
         2EW7PRH4aLKnhocuedPdMJtH7IAQMx3WL85L1erjksoHNKuLMmgaAnbMlasPin4Nv2Ca
         KplwA0qa+CYoQtzVeXgcUBskVBZDq1ck2IVqfP2Gkee5AeOIVDAFmQ03QZn28/W4y90L
         wi/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQHjnqiXQFXGT1ATOmemmUzX4imCM7AtNWk/NH1y3gUu9nA9LlorcSjOQ639Jjw7dLE1pH+YID5+uB@vger.kernel.org, AJvYcCW0TjCmEtPTDftIgDYU86jo45b8jtLtnPifLsrLOQAaEBhY6BpUS7PpNpRAPIfaLJVDpGyYveElrCPf@vger.kernel.org, AJvYcCWBXWZ1mSf8c0n4KVB/z5nYg4iWWyDStZkVvy6/xmrPbCYv0JQWyxtAmDaUxzPbH8k/Q++nJ613tZuAyba9@vger.kernel.org, AJvYcCWHB+sCY+l3BS/OSL4m0YLxuysErqQzm9lglTzTjyEgVYj+vkjXneit/aYOyzFs0/GLbc8MhG20TM049A==@vger.kernel.org, AJvYcCXMNhrz7t4pWfoIqZiADf+8EbU2lr+WyJ0gR/Bf+0b3lNm9AAKdqbEjC5lnaU/7+PLKvBTSzX1iq7X9LKiI@vger.kernel.org, AJvYcCXUIJ2/ugWvsbgDJsyHnxUH5A4H3eVAo1j5Oa09fF1wAYsE8k2xMSOZGHFQvts46VRGd1/8aVHazqzk@vger.kernel.org, AJvYcCXhyStjkeOs/BJCk3WahDm8wIEV2LMtGMQz49SRZaduktziZaLISJmQss5GPFNT+Q+/led+9DTENgfJBOl57+Xt1oc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG32a+CugVQugGqzVQKta+XQwWfSWSBorp8Nj9XL03uL9viayy
	wAVYqvOsCkFJK0eMX+DR3bQ+SyFaf2VEMiAGkH9B6UOtbrtCc4u0A2a/Q8qBiehKRzdAoUUWVG1
	V7V07e12X6GkqbbpY4yqYhAFG/4g=
X-Gm-Gg: ASbGnct4K+/9UAQNiSZBfGDbIi4p9G2OAmo4QObrl8CQ/PB7hIKVGlRTdJan+RMjD3H
	XZA0jCup/hIgRlaJwc67xv9/pXnFQGzQUzdJCn5aTsn6VGGHfcXpWD23UY8ExZBC8Z/ae/ZQ03p
	/q/ytbRFaamVyZO+KYpsd5pebMG1BQ32XP7XjyWMVhXa5jnK72qVM/SVhM
X-Google-Smtp-Source: AGHT+IG4QqpaNQDy731U58i3bQqCRBN4wxgf2WnACwyQB2g5h8HohI9uM8ZQbNABaLBYgrNgY/+RPwYvoW7m6YupGso=
X-Received: by 2002:a05:622a:580c:b0:476:b3f0:a905 with SMTP id
 d75a77b69052e-4776e07acccmr119111651cf.8.1743174594347; Fri, 28 Mar 2025
 08:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
In-Reply-To: <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 15:09:28 +0000
X-Gm-Features: AQ5f1JorkyU3M-MDsNZEjTYwlCJiHquCQUVcPMiTcuQthITmDLDNSbYjZqb0KuM
Message-ID: <CA+V-a8sT3sV4D-i84G8D1q1s_PBGCQagc=YGSvTfTWVYJsHoeA@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
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

On Thu, Mar 27, 2025 at 7:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2025 15:39, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable support for the Renesas RZ/V2N (R9A09G056) SoC in the ARM64
> > defconfig.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
> > index 11e7d0ad8656..c7b41f86c128 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1483,6 +1483,7 @@ CONFIG_ARCH_R9A07G054=3Dy
> >  CONFIG_ARCH_R9A08G045=3Dy
> >  CONFIG_ARCH_R9A09G011=3Dy
> >  CONFIG_ARCH_R9A09G047=3Dy
> > +CONFIG_ARCH_R9A09G056=3Dy
>
> So the pattern will keep growing and none of you will ever bother to fix
> it, because you have your patchset to throw over the wall.
>
We are working on this internally, upon approval this change won't be
needed anymore for the new Renesas SoCs.

Cheers,
Prabhakar

