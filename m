Return-Path: <linux-gpio+bounces-30225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F304CFE884
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 16:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4CCA305499D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 15:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0E333F365;
	Wed,  7 Jan 2026 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0ddnArR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360832EC08C
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795379; cv=none; b=fTdbzRXZ9LC80KmFdAnmifcvu5+A9MwSk8nYHaEcuVLAfJYYiFYVNIPMH3D+9rCNvX6lGBemNH4c0bBhzi0ex5AYCWcviHyg4cAw3hIfTXsF4OM8c7B5wSRIKOdlJUQvgwZHUxLHeWfs5TW4vBHC9WRP6gKrT7PkvPvdJWcRiCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795379; c=relaxed/simple;
	bh=ZmdGc8RmqCWZSrmEh+UMwLfS0doFBmXM9vWAXEyLvms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0v/ujvCAsQ739GYdDIgW6nTXRVyJYoXa6yZY9eblFzCP5AaFBV8Z2vPTf5OV4c9XPtf0TljXnQ9G4WWnzXLYSMpCDLZ3wwsKHggXHyWaqtUMQlxdpYj0x38R2UCW39apQhRjNhVr9uLqczXaC+aWC2VRwMXgAnpuQTvbXKACdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0ddnArR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0794C2BC86
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795378;
	bh=ZmdGc8RmqCWZSrmEh+UMwLfS0doFBmXM9vWAXEyLvms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b0ddnArRLffghGDl9H67g9looF/o7iEk6VfWuNHhEw9p1mkK2qEuKd+TbVJzMEzuQ
	 ZWJgT0buOiaB38fRrktWid8LBGswC5XsJVTwcSCXfQztIP+nwOEe2QspYPGQ/FUsl/
	 6of8LkIvO3zHtEjliTYSSkHCmwzlySuNmH8HWnIBcbUwTEtcDPJ5e5o/UwkqkdNDrS
	 75Pmvj97Gm0CO4MbmcUNZcw3J9H+AqhfyYYLxldAn9DO/4M6yf7MtXNHdp3OMeSB4h
	 G1akDAskW40Gh7Bj5k1lBlw+/GjwR5B9jKBlETiFCKByaGSSijE8LJqVn4H+ud/dzs
	 HR4yihWji0AiA==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78fdb90b670so20321237b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 06:16:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7CvsWoiV7FMTj6ABhxacHWsp+TbIcKdQJe+sX1UlLFgUL6wHy4PJ95VLL+A7cMZ7KNPwWy/292wrc@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFZ3I0PYX3CcR6PeI3I4qSqvhWcinyFscJIK/TIg1fzjHi3i/
	IpagC4NunaI9XGx7gDWe+Pb9usBjl34DUjf361fJbqBf6yDsFYwx9Vji7WkJe1LYVn4ZgCZH9Ct
	1PvVu9ttNDJ42ByXu3PUCC1ooDAb/Gm8=
X-Google-Smtp-Source: AGHT+IFxG+Miu6GVJ6Vzdd/NVjY5a4LS9F0nizqhKCukNOAT0QGmncWBX5ttR8rNDEh4eEbH8NRqqqLm0PLu+hAnXf8=
X-Received: by 2002:a53:c706:0:b0:646:a1ba:7168 with SMTP id
 956f58d0204a3-64716c3c83emr1880656d50.67.1767795378130; Wed, 07 Jan 2026
 06:16:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
In-Reply-To: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:16:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLkvYffZ_QRyk6VwuM4bMQVpfxdS8s6DhupXxB1eVU9Mfg@mail.gmail.com>
X-Gm-Features: AQt7F2o1liqmjroptcTd4AFvMzhvkZhes7jvwtRZbA4ijFlbrYVTv9IpNfFQgCo
Message-ID: <CAD++jLkvYffZ_QRyk6VwuM4bMQVpfxdS8s6DhupXxB1eVU9Mfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: imx: Support i.MX952 and update for i.MX94
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> Patch 1:
> For the changes to i.MX94, some pins' mux options are not controlled by
> IOMUXC, they are controlled in WAKUPMIX BLK CTRL. SM extends the pinctrl
> protocol, by adding a new cfg option.
>
> Patch 2:
> Similar as i.MX95 and i.MX94, i.MX952 IOMUXC is also managed by System
> Manager(SM) and exposed to Linux through SCMI pinctrl protocol.
>
> i.MX952's select input register offset is different, so need to update
> driver to include it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Patches applied for Linux v7.0!

Yours,
Linus Walleij

