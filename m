Return-Path: <linux-gpio+bounces-7052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1278D7E00
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120481F210E8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 09:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DE258AA5;
	Mon,  3 Jun 2024 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A4X+8xUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84460537E7
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717405344; cv=none; b=Caq3Dck0tfhLj9/MsPJdExTIZQfYVs5T0NMc6JmFB+lfBzA7GhH5SkhrzMw+iBKrchDk+vX+16F7P5xbinPpWymI7YN+HagVtEd6EzxP3aTMmbT0NfAANzOQMWuDAkdv6FEu3gM8bV+WffkyQdV7+TtaQs4KYC2H24F8revcirE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717405344; c=relaxed/simple;
	bh=AcydM7QsoGt9wsjKnGfhQXGfHg0USww1QuCKbjHudHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiyIFre0X4rD3ljzEg8RZrLSEgXad/D9gkDRvBo/1++VWkA4hBOKy4gCyN5WoX0NHdr+brOMJA39j2mEQxcsLskRYsJVl6HVD8KtU+S29OP1+6C7Ir7POgYZXlH5fz+ozHP2tS7pE0+dJyADi8xFOxm1szH5XhvvIQMlNwmeuuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A4X+8xUo; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ea9386cde0so38010971fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717405341; x=1718010141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcydM7QsoGt9wsjKnGfhQXGfHg0USww1QuCKbjHudHs=;
        b=A4X+8xUokr0JXk57wO3Lo3dxNBUuwPKtS3mKsYy3xPmJzSbPgSt4ofBkH2teDZV0VI
         G6cm6B2ztHoLC57IHKeQ9/cLGMTmiTHyXs0xEirJt8A4cRa7pwmZ3hgkACs2DTdIT0yt
         YPdKVO090l00ubcmpWFNWtg6VMiW6EbM9Qiyu7PxTATxbsYoOpoHKQWBX0sBYgwKBaY4
         8mZ9r4Fjut3qTBPNaO/178EkoxLm9koObr6OfXbg5zqx9imLh0D1KBSvSPX2c8icauYs
         HUnwjC5Q0U5g0fvojJ9MmtQZWseFwEI/dCikyq7uPtw1IGwZj/wAP4QNW0tJt0eRg0nc
         AOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717405341; x=1718010141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcydM7QsoGt9wsjKnGfhQXGfHg0USww1QuCKbjHudHs=;
        b=OgcNATPUulO9sLJOkZ3lWo2yPaL27FfTT0iTxLpg2n3zOPZEyBWat5G5/bfyYD48q4
         TYzkEuWY00WaYiTLufJEguvR8n2be5Ym+FIfwzgJkbBzmmkQwOlKdQrAE938z0UXR1Fa
         qcCyYLEXFYDiW4OvZz4r6if+yDzVQY+x7BW/bvlQQBB3O2yKwcukrxUaMx4J3xy4550U
         6kuZbM5B4Nm8YP1rnca39sPm+CcFskTERtTdhwAJzSD8Yd86I1r9myo/nzloDvr7Ttf6
         dX02KcPiXKT/oE4Q3/KdtaVpHojCqLFqIgWpKui4umxg2TmCAm3ulcO6K2IsgLi7Z8bf
         3+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVAvZ87I9/5wp48yZ7xuAxhxmvEQKGSXTXh9QwE9rQWg6SIsFsrOanY8Hw38TbprwL0Quv4K3mc60IRWsSZ9BspnSBMvTYGCrTciA==
X-Gm-Message-State: AOJu0YyuJffOV9gEkaWxcVWpbBP4SR72Ad47NHRpAA/7pYly+Uuv4d9m
	bHNVeX4K/wgnafHZcLtyS4pO33fJoqOwN43b0Le8HU953VMERL2oTw1ZS4LRiVWq7dgQwldKXaN
	ey6tCzPRxhv2IReSRP+JiRqE64kc4AIz9HK80XA==
X-Google-Smtp-Source: AGHT+IEVI3F0oXXlsedQRXHnOmAZNvZf/Ix2jmEABaS7X8f8bO9zDtlbkikRksb5ReaaWxEFK9ztgDuFWCd8m7IkxTE=
X-Received: by 2002:a2e:9f14:0:b0:2ea:83b5:40cf with SMTP id
 38308e7fff4ca-2ea950c8010mr49046331fa.3.1717405340591; Mon, 03 Jun 2024
 02:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <CACRpkdbOAoSDNFhXfz3djUZh1_MQ_T75CC+-LmojRXvyCbUusA@mail.gmail.com>
 <06a4e5fd-3d26-4923-bcbf-0bdd66d756c4@linux.dev> <CACRpkdbSsgxtKqF6ORXubufTaegjysHU7zH-tJfDfKNd=Kdoeg@mail.gmail.com>
 <51d984f5-896e-469f-914d-2c902be91748@linux.dev> <CACRpkdZ19+zUCEBCJJ+MBnnaF+caZKFTDxYiWZ0BRGx+PxN3bw@mail.gmail.com>
 <e4972a07-18d6-4a8b-bb5a-4b832aa2d20e@linux.dev>
In-Reply-To: <e4972a07-18d6-4a8b-bb5a-4b832aa2d20e@linux.dev>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Jun 2024 11:02:08 +0200
Message-ID: <CACRpkdbL63ZWcopgBbANKzr476rO6_cwZL6JLqkvTDXbzzpkpw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: zynqmp: Support muxing individual pins
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 7:08=E2=80=AFPM Sean Anderson <sean.anderson@linux.=
dev> wrote:
> On 5/29/24 04:38, Linus Walleij wrote:
> > On Tue, May 28, 2024 at 4:28=E2=80=AFPM Sean Anderson <sean.anderson@li=
nux.dev> wrote:
> >
> >> Well, perhaps you should have reviewed the original driver more
> >> closely.
> >
> > Do you want to push me down and increase my work related
> > stress? Because that is the effect of such statements.
> >
> > It looks like criticism of me as a person, so explain yourself.
> >
> > Writing this kind of things looks to me like some kind of abusive way
> > to express your desire and that is what burns maintainers out, so
> > if that is what you are doing, stop doing that, adjust your behaviour
> > and focus on technical issues.
>
> The technical issue is that the driver does not match the hardware. We
> must maintain the existing set of groups for backwards-compatibility.
> But this should not prevent improvement.
>
> Saying that we cannot have both group styles means that the driver is
> permanently stuck with whatever was picked when it was submitted. Hence,
> if you want to have only one style you had better review new drivers
> very carefully.

Actually I did say you can rewrite it to the other style, it's just work.

If the previous approach was wrong, just redo it as it should be,
and rewrite the DT bindings and the existing device trees. If
backward-compatibility is so important, add a new driver with a new
unique Kconfig CONFIG_PINCTRL_ZYNQMP_V2 and new bindings
on the side and select one from a new compatible such as
"xlnx,zynqmp-pinctrl-v2", problem solved:
new driver new bindings, can be used on a per-board basis,
can be compiled into the same kernel image.

It may be embarrassing to have to tell the device tree maintainers
that the bindings got wrong three years ago and now we need to roll
a v2, but worse things have happened.

I don't like the approach
"this was done so we cannot redo it", we can always redo things,
it is even expected as proven by Fred Brooks timeless statement
in "The Mythical Man-Month": any team *will* always design
a throw-away system whether they intend it or not, there will be
a second version.

This approach will be more clean, I think? Also it will be
possible to phase over more boards and perhaps eventually
drop the old driver and the old bindings.

I'd like to hear from Xilinx/AMD how they want to solve this
going forward.

Yours,
Linus Walleij

