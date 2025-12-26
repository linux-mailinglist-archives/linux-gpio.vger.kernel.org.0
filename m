Return-Path: <linux-gpio+bounces-29902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7ECDE8B5
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 10:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 967BD300D407
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BDC2882B2;
	Fri, 26 Dec 2025 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUCOWOnJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3148A1CD15
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766742019; cv=none; b=I24nh2UWHcgG37HmFVR+G6PoV3vqShEWBLvWbQXfFF6d1V4+PVu+P3FUpQVwmedQY0cRUMRElg/OZP2uHsWjyUkEu/FL5FxXhNiMUHi7xB8bngP2Ukxzjgmmn1t5ow9QrQESn3lNq9+JMwdRF8Nhz3xCQNRZuW6KM+fdrBfpgYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766742019; c=relaxed/simple;
	bh=5I7POZJE3YvoV+pQSYaW68qSelNdJuJ4iajk1o+KTpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJBDw2Md4QkyKbnl0QK7+UpOCgHuq2yZJmuTL3yqYg79nA2QWDCdd1PHM8Ju4D+B9lsRVjTvnkxTZk0fuedpE1vp3j/GE4dXiFWBf4tuc5DTwb1+nGhBOBeMe1dY4Aje8cjSZqozK8virmdyJ7vplHBfIKWh3Z5lVN7E6IAMakY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUCOWOnJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D206CC19421
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766742018;
	bh=5I7POZJE3YvoV+pQSYaW68qSelNdJuJ4iajk1o+KTpg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gUCOWOnJ21o0jarlXD+3Im4xfOsmn7kfuaofttyX6VJlqeNOWFUl3JApqsASR6BbP
	 FzlTrrFLia0HBEMRyQJnbsiIl1Cvl96iwg86IUvBX638WB+/Wf/dfC5X+o8s2wSZsm
	 VluJ2x4LWkUx8pCNK3dhHL9h2Fcs2pWZ+Znym1xd6SGX5ShuZUUPJLy26HgXSeWgON
	 stz9LLaTp7nMWa1sbGH9pjjMQYD1wFsMcX34lStVOUMd4TDFF21n0X2sbaXCP6Nuk9
	 kpWTcRja/QGR9S7VP0qOhrbKnMt+fIDsxEG/Bxe/bpKkKs02i5OEJsWisbWFpuhnb3
	 nUlrZPTU/glWg==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6446fcddf2fso6146160d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 01:40:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUys2DTJVMdU30gr+4OwCQzPTi+B6hEc52V8EYQcX8DUL8H1OuitisXpbdzL63vLd37awEEY/XWilp9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7bNLeIODYpJdStCPMLkvkgO6QrGVsTDnRzMx1BIqN81mXa0si
	pQN7+90pwrVObZARPBS8f2WUU/cz7o3flf7URVn/zzZ7TU+qkxQmbYlia0SGqqS34Ev0GRgW53o
	gxKhCGCeLas5Xsj2toLiCyHBJPmDrgE8=
X-Google-Smtp-Source: AGHT+IGcwb2TeHYDKNTx8CIo3l6BUNTefrHdtcjF0SPVuX6OipOL9CuqT2u8WnyVWqecxVQhOAC4cpRaKGBZHgLh6TU=
X-Received: by 2002:a05:690e:2581:b0:63f:b605:b7eb with SMTP id
 956f58d0204a3-6466a8ba610mr12258752d50.67.1766742018199; Fri, 26 Dec 2025
 01:40:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127-bogged-gauze-74aed9fdac0e@spud> <20251127-capped-prewar-99fd94faea24@spud>
In-Reply-To: <20251127-capped-prewar-99fd94faea24@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 10:40:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLkxLJRZocHenBASLzoUAbw=oPpMajNF6a5z-Lzds+5Ecw@mail.gmail.com>
X-Gm-Features: AQt7F2rK1JHkCZSXBra8Mc8o6eeAj4vJMJDNICdCzPbkDo6wZd0Gv1mG7Epb7uA
Message-ID: <CAD++jLkxLJRZocHenBASLzoUAbw=oPpMajNF6a5z-Lzds+5Ecw@mail.gmail.com>
Subject: Re: [RFC v2 3/5] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: linus.walleij@linaro.org, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

>  drivers/pinctrl/Kconfig              |   7 +-
>  drivers/pinctrl/Makefile             |   1 +
>  drivers/pinctrl/pinctrl-mpfs-mssio.c | 750 +++++++++++++++++++++++++++

Time to move the drivers to drivers/pinctrl/microchip
before it becomes an overpopulation problem?

(The previous drivers can be moved in a separate patch.)


> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCTRL_BELLS_AND_WHISTLES

Just the bottom select will bring it all in, right?

> +static int mpfs_pinctrl_pin_to_iocfg_reg(unsigned int pin)
> +{
> +       u32 reg =3D MPFS_PINCTRL_IOCFG01_REG;
> +
> +       if (pin >=3D MPFS_PINCTRL_BANK2_START)
> +               reg +=3D MPFS_PINCTRL_INTER_BANK_GAP;
> +
> +       // 2 pins per 32-bit register
> +       reg +=3D (pin / 2) * 0x4;

It's helpful with these nice comments that ease the reading of the code
quite a bit.

> +static int mpfs_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev, unsigned =
int fsel,
> +                               unsigned int gsel)
> +{
> +       struct mpfs_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrl_dev)=
;
> +       const struct group_desc *group;
> +       const char **functions;
> +
> +       group =3D pinctrl_generic_get_group(pctrl_dev, gsel);
> +       if (!group)
> +               return -EINVAL;
> +
> +       functions =3D group->data;
> +
> +       for (int i =3D 0; i < group->grp.npins; i++) {
> +               u32 function;
> +
> +               //TODO @Linus my new function being actually generic mean=
s that
> +               // the mapping of function string to something the hardwa=
re
> +               // understands only happens at this point.
> +               // I think this is fine, because dt validation would whin=
ge
> +               // about something invalid, but it's the "catch" with my =
approach.
> +               // The other option I considered was to provide a mapping
> +               // function pointer that the driver can populate, but I t=
hink
> +               // that's overkill.
> +               function =3D mpfs_pinctrl_function_map(functions[i]);
> +               if (function < 0) {
> +                       dev_err(pctrl->dev, "invalid function %s\n", func=
tions[i]);
> +                       return function;
> +               }

This is fine with me.

Ideally I would like code that does a lot of string stacking and comparing
to be using Rust, but we cannot yet use that in core code so that is for
another day.

Yours,
Linus Walleij

