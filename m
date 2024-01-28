Return-Path: <linux-gpio+bounces-2666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A480883F258
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 01:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D658B2452C
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C238833;
	Sun, 28 Jan 2024 00:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dtaMBdPj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A302CA7
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jan 2024 00:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706400028; cv=none; b=VLKh/ri7XRln8yzSQVKJezi0XK2pe+B94gCAD/+6F5BMzF+kDFW1Y2cS/9IPt1S6rc/i91s4m13OxRlWNj2F2bWwJ3/khkC76NTIc04CZ8V8tSyvk3iflTbZXRoZtoFjgBMM3qY4L+WRXYXb9KmTetLT6UyQcPI0UYM2IEJXoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706400028; c=relaxed/simple;
	bh=sY1l7+XC9yKlNuncRpX0ecXxvcWalBX216swQb7T9gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMD63CdGOpZdHfCGk4bX19GSpf5B9IGefFekacJrfb7og0hJ1v7Z9/eGVXBvg0IaTp8yMLFt3cyYPa/bbJY7Y2LSoEwT/xCYLyUGtg0f2cMFSq5Xhky9Tkv3ZvMMLCnglul8rE6kKLZmvA9UaFuirpxId9LDzDIjiWHzfe+RFOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dtaMBdPj; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ffcb478512so11159727b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 16:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706400025; x=1707004825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwZ+aD9QBLOziLPzTO4pYk2Gycq9K7r0N1zt2tyeI/U=;
        b=dtaMBdPjRLstuDqbT7ZsGgPmaWiRYBYCitHytS2sHWQajJiP+n6rTZES6wxYBeJBKa
         qHuxX/RR4XpbPIYHDUP9kCZ2yZSj4l6gPPDKgeiT6lUfwrDjTNVXfjdfE11PoL/gfYuM
         PYdGAx2ZOWSiprd8o5gSJ86G/B2PqTrdoGQsJ9mmPqUdr/Q8v0ZxkXkZIfh7uFQ1SnKT
         UnsvOUxPG2Dr22PCn8DgGGhaZO4W75TbF+ZfPdTx7UDzXokrspmPrUnHt0+8n7zPyd8l
         B0NzE381lQUpBX0cBhpO45NTiDPjzUKnnRIIFqoTvKmyES+o5gnYd7Z31ORPETY6kUie
         TH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706400025; x=1707004825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwZ+aD9QBLOziLPzTO4pYk2Gycq9K7r0N1zt2tyeI/U=;
        b=PbTF9fP6/uyr2HhyOgr2a+EgYHOUEaSfmcQ/7qgBzvLQ3eeEEenyWK+QtNdLvBAPBN
         pVgu3SO3jMZ+Tz1BOI4DJHTygIJb13cbOSqWGDxbYewXPPLO0SyRpwqjJSvhlxq8hNbR
         AXs8ov3soIW9EmCM2E/DmGNK1uI3fr89c9qxc/0GPEkocpa705ZM/X75Qg3kFlRCuyhu
         h5C+utblJsrJwhEzqTsNfkU6t4YN3A9tLC/c+sRldFWNS+KUioSXchoX1jrlKzumbk3H
         6mExBlAMtiS2SBuqsvMjbK/4jJib+3Hd9SE0Lv/YevXQrUeaosZ0FY/SstPz7kkvKoDm
         yvtQ==
X-Gm-Message-State: AOJu0Yw1mDfjMeVnkr5t+pqxFrATYcQx92WxSPU6JSUKdtcTeMht+72+
	ZqhZfemVB7eddPD6L6zA6lHwzJVOt66VPH5x264d6PD1Ifyk4fZPLk2LV+MabgQnA8Ip78QcA6W
	bdjtqcfAoh0UO0keB+xzvPAlDKeTmdYD5kQMUwg==
X-Google-Smtp-Source: AGHT+IG3SYuQFXSkdR3Vjmgdk7vc+4aQDsKRYDx1jiggGeitw6h4KCbhwZteVkZrqdroTvOiKheGFWj8cxt0+vB3fQg=
X-Received: by 2002:a81:6d46:0:b0:5d6:2ebb:3b5d with SMTP id
 i67-20020a816d46000000b005d62ebb3b5dmr1915253ywc.21.1706400024016; Sat, 27
 Jan 2024 16:00:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104-pinctrl-scmi-v2-0-a9bd86ab5a84@nxp.com>
 <20240104-pinctrl-scmi-v2-3-a9bd86ab5a84@nxp.com> <ZagsxLBw3eZCpafI@pluto>
In-Reply-To: <ZagsxLBw3eZCpafI@pluto>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 01:00:13 +0100
Message-ID: <CACRpkdbgexr-GT9c_PCoL6hNK+w-eS61EgXEsO8Bq7gcKq2aqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	AKASHI Takahiro <takahiro.akashi@linaro.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 8:38=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:

> > +SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) PINCTRL DRIVER
> > +M:   Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > +L:   linux-arm-kernel@lists.infradead.org
> > +S:   Maintained
> > +F:   drivers/firmware/arm_scmi/pinctrl.c
> > +
>
> I've got to check this with Sudeep since giving exclusive maintainership
> of this bit could lead to troubles if the assigned maintainer becomes
> unresponsive, and it seems this is already the case indeed even before
> this thing is merged. Oleksii and EPAM will anyway maintain authorship
> in any case; I'll check with Sudeep, as said.

As maintainer I regularly just lose patience and apply patches if the
driver maintainer becomes unresponsive so that's what is to be expected.

That, said: the more maintainers, the better. In this case some co-maintain=
er
@arm.com would be nice. Just list several.

Yours,
Linus Walleij

