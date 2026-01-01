Return-Path: <linux-gpio+bounces-30025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F1CED129
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 15:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E30E3006A60
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 14:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C119281368;
	Thu,  1 Jan 2026 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwWngGvH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBCF242D62
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767278372; cv=none; b=Ge/qaPZiilHxwTJWQ9jFtPoIaa2J7r/cc5dtC/A23u4KtTQ0IrGbbUD/8IuQfUVbXX2s5+kbPf8NunayxX0lKSESzFQZtESDQeYbmJkgxWaC4fWNS3ndLnP4Nh8OT36I1d/BFHK4MW08gJYeCSifIgW+hcNdRm4RQzyivhVZhfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767278372; c=relaxed/simple;
	bh=G22NoFIfnxEZGwQ6tAtIuLaQkO46dzLxaedEFtwTcC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JfWSntkKE9pJqPlXPWEllyDsUSilisqUKToME9p4IOkip9Ea+bklwevWfBDmCDjwV5FeFaLRGhnwwTlpdFzLOEoZyeQ4Hn70Q9aZNfPdD473YyzrJ5xmf0wLMv2IoqJewruW71b3Y/enjQVJMOik/fYw5Umx3Z4kvr4msPkwIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwWngGvH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7324C19422
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767278371;
	bh=G22NoFIfnxEZGwQ6tAtIuLaQkO46dzLxaedEFtwTcC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DwWngGvHdL4LRVL+W3/zGNJVIi2ueYKzZWqO6oar/5xbgPkJ7V02ldgGoGjP9LrU+
	 kEgcarLWZ6OlQgiF31k2CPqoxT2hzGVpAWagn38SfQt5FNCA5zV7Cp0hXh6NLEDfDT
	 twGhjSBiQNDUBCfwfSvq+Om0OQNBBb/QKqoncYeQlgziB21Zs+29HzP7/HIHWenuXN
	 xXKbULKBTwvLefsCKlYiz5KJ1LovChIXPAuDigDwJciutML/KS0OZGaUl9h5N65+m8
	 ePrCctS7UbkhWF9QBHdzFG8ABtFEhDqK6eCr3O+BEGqPzcH4BuOdzJI8oxz0RpDFNC
	 K+YiBbuzeBs6A==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78fdb90b670so70295087b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 06:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3ysbHRVf8ovXHkxe1UKc4WkS0MlDkEKh3SaLh9nuQGa4lPeE82uMeuzvlfQ6rYRqrHmLk/UUNqZru@vger.kernel.org
X-Gm-Message-State: AOJu0YwUMz3buqww/0a75TyWD/jNTsGG6Ka+1UnfKvdIeDxBbmR6Xi4M
	vm72EYw4uKECJb8FamNZeKRbIoxsDA2A1a4gSa9ycJMk9B4VQGjnhg05vTX8e0PF2CVqhZERFBn
	j/NtdpP5iDTXjepSIl/Gs+lATv8kuH98=
X-Google-Smtp-Source: AGHT+IEchp04KmAZ5T+gOBq+28XFhaa1bKaz5ZkO9N8HZ8/JFUpg+aWJY2a+WRe3EbLOGL4KfdGvOZjgCZzWV1MbKJI=
X-Received: by 2002:a05:690c:4443:b0:787:f793:b573 with SMTP id
 00721157ae682-78fb4091502mr326959257b3.29.1767278370986; Thu, 01 Jan 2026
 06:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-imx952-pin-v1-0-2747f09144dd@nxp.com> <20251217-imx952-pin-v1-2-2747f09144dd@nxp.com>
In-Reply-To: <20251217-imx952-pin-v1-2-2747f09144dd@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 15:39:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6bMXHp4KuVN7xxSidZDhuxLkuiJRnjybJxk4pVeeEFg@mail.gmail.com>
X-Gm-Features: AQt7F2rvyquc560DHr734TPz3A-2hmEAxTBsn2s_Ehck2JwoUtyVn6mnDzTXWW8
Message-ID: <CAD++jL=6bMXHp4KuVN7xxSidZDhuxLkuiJRnjybJxk4pVeeEFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: imx: Add support for NXP i.MX952
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 3:41=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

>  static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> -       "fsl,imx95",
>         "fsl,imx94",
> +       "fsl,imx95",
> +       "fsl,imx952",

Where is the binding for fsl,imx952 merged?

$ git grep fsl,imx952

on v6.19-rc1 yields nothing.

Yours,
Linus Walleij

