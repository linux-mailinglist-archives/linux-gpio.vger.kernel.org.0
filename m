Return-Path: <linux-gpio+bounces-3108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77C84E084
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 13:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 522D21C23634
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 12:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1741471B48;
	Thu,  8 Feb 2024 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iILUfuwv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B14671B38
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707394645; cv=none; b=bIh7kuK/6x+Zri2Wy7IHWL1hgMh0BdSJaRkV230PXcxDIsFLfpJ41zumwVWi60+o+zh1+uOAPEMAbn3B+2mNj5k1USfBZfUcxfsQTu1Ja6ge5kHYBInGA2CDvwrzBgHClmEC61Cg4zXfFyLArjLsmspjYU72omf3DrxXQT/tBCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707394645; c=relaxed/simple;
	bh=SDnWvrHwmJuabSaX8EENCVvt2o1aCWKM+am/6SnCsUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1L+tkgEJp0Tc2kFBspWZ5e+Y5/cLu6GUg6fbWwMHuUOJDp+/YKr4xoe9z8DPCKbd5XeJBjDdN0N3AwDcCcQRJCPfOUWAV6jkQjN2hEHRfCCVAYwd4kQdZy7xN7nYMkQRgZOUAmv58r+od+F+RQn6oDRXZJb56XFl/Zaz2rCTRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iILUfuwv; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-604b23d91afso839307b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 04:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707394643; x=1707999443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3fTgipKA1mJUXQgJrotu1G7J3bgKYDJrXjgYc5OGnw=;
        b=iILUfuwvqOJAOhIZ6E2NT1GVm4gnXkfOQkP3MpgHfRT6vx042QILCOoaYBJTDN/PY0
         0jZO9yYJ41at8si+56yNziOd9xqbNA6McKdXP6cuq0NYJykgfONwzeNuzkD0L8MztNAF
         v4zIRTZN3kdT2J2tQVo8kCk3Ong6ONGYFpck6M6SxsPSMaPYe5OSvml0XofjvVea+HTD
         a2KKQX4Qp8QVZ3/AG2Ww5ere2H7vTFosrEEHeibrV8+2V0FoyM2zj/+gawjtpJWf7wCR
         PK1JMgGWR0R3UEgeDKKw4ze6g8B/BYch8Tu9cY7in7hmE+iziv1kEXFqZ+vgaju15Kg1
         EWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707394643; x=1707999443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3fTgipKA1mJUXQgJrotu1G7J3bgKYDJrXjgYc5OGnw=;
        b=IingH8FWJZ4UHC+nttfSwbh2kpN6ZZVe3sJRyo7/fvMMUK7Q/s5X4GH6cVsRaiE5Ev
         eGmaq2YVhK4bje3L685z5m8nwc8Zroam+qodFPD8kJRcKi+fdQUEot/zgf56jARLrgId
         bvFwUgkQppdraKuupvninu/7yk69kVYxEsXwQ/KDrKrH+ViPjHIQ3r+PgQEVOKL7Pilp
         xf+X3CrVd8t2dHPeZ7Zv4v+8GL48BFBfGK9M/qlOfXZqOzrzGr86RTcb/TbVCf7b9lVL
         z08AlSOFwQ8gOUIvH+fQo6uI5zhk7U6BP+W0L6D2YwC+8iOuhOsns2qzRbS0yiHYNvHs
         8UUA==
X-Gm-Message-State: AOJu0YxC86CDBn+XoHUF147ZlBNDLAcuUN1iSzjyHpJli3bp6QcKd0lz
	AMbDwDMGUjniSTz75Kz9wUzwKl0Hv6w4Wjg8vppdcpi5wXOfBhxDwZn5QL7fnWMSiOAMpj/SFyz
	oCYBv0/S/NA7dd/l4RlbiXMH0rN+xujUxUdMQSw==
X-Google-Smtp-Source: AGHT+IFONrZpY1udiH7GcMjBcvJphOhY9RJjFSlOalpp3vCebWgXF4IJOzDsqHtiVRo+/UzSburpcEr9MeKGwCIf1QA=
X-Received: by 2002:a0d:ec43:0:b0:603:fd67:a5aa with SMTP id
 r3-20020a0dec43000000b00603fd67a5aamr8835247ywn.19.1707394643231; Thu, 08 Feb
 2024 04:17:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240121-pinctrl-scmi-v3-0-8d94ba79dca8@nxp.com>
 <f88d07ef-83b2-4d14-976a-6dbbd71e036f@oss.nxp.com> <CACRpkdYV=qYQ9qDUWYTLDAV1niay30gYH5S=zjfi31GpeY5o-A@mail.gmail.com>
 <DU0PR04MB9417A9074C5DC49AE689E65288432@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <Zbt-QkWhz5d9P-v6@pluto> <DU0PR04MB9417CA6CF089B264112C32A088402@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <CACRpkdYCrbNB8wu4rO3Yx0qomxR3kTt0P7YH7kc2HPCbrgt=tg@mail.gmail.com> <DU0PR04MB9417335A3A41BE4E373B915188472@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417335A3A41BE4E373B915188472@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Feb 2024 13:17:11 +0100
Message-ID: <CACRpkdbguqMvx5w2fEDaNkNTmNtwphns-W1c2i+ntoi1CHqaVg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	"souvik.chakravarty@arm.com" <Souvik.Chakravarty@arm.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Rob Herring <robh@kernel.org>, Nitin Garg <nitin.garg_3@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 10:11=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
> [Me]

> > This is very much to the core of the problem isn't it?
>
> Yes. Code size should be as small as possible.

This is a valid argument, I don't know how big your SCMI FW is, or
if it has to fit into some on-chip memory or so.

> And using SCMI generic pinconf, there will be multiple
> SCMI calls(not MMIO access), such as setting mux(ops->set_mux)
> needs an SCMI call, pad settings(ops->pin_config_set) needs an SCMI call.
> And maybe ops->get_function_name  needs an extra SCMI call.
>
> With current i.MX design, only one SCMI call is used, which
> use less time.

I think this could be fixed in the spec, let's see what the spec author say=
s.

In any case: pin control is pretty much never on a hot path, a few
microseconds more or less doesn't matter. It's usually just used
and probe, suspend/resume and maybe shutdown. All usecases on
the slowpath, so I think it's a premature optimization.

> > Over the years I have come to regret it a bit, I think insisting on gro=
ups and
> > functions as strings is better for abstraction. And the point of firmwa=
re is to
> > abstract things so they work the same on all systems.
>
> With current:
>         pinctrl_uart1: uart1grp {
>                 fsl,pins =3D <
>                         IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX      0=
x31e
>                         IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX      0=
x31e
>                 >;
>         };
>
> It is very easy for people to know the meaning from reading reference man=
ual.

Yes If the defines are provided it's quite readable. And I think Freescale
people really get used to it.

But from a maintenance and standardization point of view, it's nice if
everything works the same way and looks the same.

> If using generic pinconf, the dt node will be like
> Uartgrp {
>         pins =3D "uart1txd", "uart1rxd";
>         functions =3D "uart1";
>         bias-xx
>         drive-strength =3D
> };

Well that looks good to me :)

It looks the same as e.g. Qualcomm or nVidia pins. So it's easy for me
to read and understand, and that's my perspective as a maintainer.

> The firmware needs add more code to export functions, pack the conf setti=
ngs,
> each pins needs a function name per current i.MX HW logic.

Indeed, but I think any standard requires a bit of code to implement.
How much is "too much" code is a matter of taste and physical contraints.
(A PC UEFI BIOS isn't exactly small either.)

I understand your point of view, and I think it is pretty much
the same stance that the Freescale maintainers put forward for the DT
bindings for Freescale.

Yours,
Linus Walleij

