Return-Path: <linux-gpio+bounces-14438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 330889FFEE4
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6921818838E7
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FCE1917ED;
	Thu,  2 Jan 2025 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIA59CgJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90767EF09;
	Thu,  2 Jan 2025 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843919; cv=none; b=tJ9wkvhsdc+QY0pybOhOKqewxqvz9lUa+xws0fJeGWCE0MwBm4LKuALgNIFbWt7hO8FVtlz5Vy6nqS/FzSWbSh+do4MUASJP4aftOUTgS/ztRX4vR7Dzg8yeJikikwEF7K7xz3PNQ6aRAyrGSd0EmhHWNkQmwtCq0Olv4v4aOv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843919; c=relaxed/simple;
	bh=9o9ycyiMUSNjTVnycTsJDeHcaJxmcLIi5oOVn068Vn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o681iFQn6zdtWLe4hkZL+hk61Zjkg7wgR0c2wg7uAGAgxpERMAmI+5pmf2sQcaKv+Ywylw73nDQZnlYMHFPdwlnyOVyWnSm3QKg6qyqigv8gLvBRF+Rtz4A5WySgGIKoY8iT2N9/Xk/+qyNvuYVlNHbQBhDf195PQmWHrcnj1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIA59CgJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3E7C4CEE1;
	Thu,  2 Jan 2025 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735843919;
	bh=9o9ycyiMUSNjTVnycTsJDeHcaJxmcLIi5oOVn068Vn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YIA59CgJVPlcy7BsCXqkArlhXX/KjGyVK4OmBDMShoKC7rKy9cxcVG1yRUcdG3Bgp
	 3W2b9ipl841HWrkRWvmAjuoCk1c+KDHclzuxtNcDc4jnd/56UggDUTi9lKliAtEDZP
	 74cN0w+pDBZhn5fk78MX0qqiMNSIP9/+39mKT7WZqVquFpMFB2YMIBeUj5HY2rypP2
	 qljlHXe/BSsBcLJrNFCNle2V2yiDTLZn9b6Aio1jmP68buPz4hH7GcRq75JeOmxDB4
	 H7bpzxH57cFiGA6i8b4I5RLbK2ozclLUJz4sUIwA2lbtwmArae2VLR3IE1k70sFnME
	 hinTSZEnXX7eQ==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e3983f8ff40so12595049276.1;
        Thu, 02 Jan 2025 10:51:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPiOvE4NrRfm0RGTxMHwujgU+2kqAshDD1e7BRRfilxty/jKRzag8iS8kCkG9nWvjEb4gwh59Y9S0MAtkm@vger.kernel.org, AJvYcCVFly+V8YJ4V1kTN1wCVFWPBJ32Hgu10VRMrIjrP53jt7/JroYnYMpbqsT+sAtvM4Fqf7GGhBgVxb20FA==@vger.kernel.org, AJvYcCVHBumkWLkgrLGdHr27BhDwc5O45TDoEBwd8sX3IlBkHkXp+9wdUIkubRX+itK3Pkb5FzzJN4WAP2Mv@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeB320CNESxvVcoXQtJidjnDOw2IcgMhWJt4VnPLaXAtVhv8Q
	NDeGxCqDpmFGc0QfQAGFpVf25m+PTS8WsnCgYNNo4wTJha1P99ntYgBUIftKPcw+t8hnbPG0VYc
	UaZg0rVTg0+VTlO7pFlknpK7Umg==
X-Google-Smtp-Source: AGHT+IHzv4tTwd37ygG8C4NPOdk5dyiaF86SEGEk3rQ9YxK7q5xujQyWmcs9lZeqreVVbljcu72dVaYtdMN8q030Y/I=
X-Received: by 2002:a05:690c:600f:b0:6ef:6ae0:e9d7 with SMTP id
 00721157ae682-6f3f82388b1mr294833037b3.36.1735843918368; Thu, 02 Jan 2025
 10:51:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net> <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
From: Rob Herring <robh@kernel.org>
Date: Thu, 2 Jan 2025 12:51:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
Message-ID: <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
Subject: Re: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
To: j.ne@posteo.net
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 12:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Quoting from drivers/of/platform.c:
>
> > of_platform_populate() - [...]
> > Similar to of_platform_bus_probe(), this function walks the device
> > tree and creates devices from nodes.  It differs in that it follows
> > the modern convention of requiring all device nodes to have a
> > 'compatible' property, and it is suitable for creating devices which
> > are children of the root node (of_platform_bus_probe will only create
> > children of the root which are selected by the @matches argument).
>
> This is useful for new board ports because it means that the C code does
> not have to anticipate every node that is placed directly under the root.
>
> As a consequence, the of_bus_ids list can be much shorter, and I've
> trimmed it to the necessary parts:
>
>  - device-type =3D "soc" and compatible =3D "simple-bus" for the SoC bus
>  - compatible =3D "gianfar" for the Ethernet controller (TSEC), which
>    may contain an MDIO bus, which needs to be probed, as a subnode
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  arch/powerpc/platforms/83xx/misc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/=
83xx/misc.c
> index 1135c1ab923cc120f377a0d98767fef686cad1fe..bf522ee007bbb1429233355f6=
68fc8563d8ca4e2 100644
> --- a/arch/powerpc/platforms/83xx/misc.c
> +++ b/arch/powerpc/platforms/83xx/misc.c
> @@ -94,18 +94,14 @@ void __init mpc83xx_ipic_init_IRQ(void)
>
>  static const struct of_device_id of_bus_ids[] __initconst =3D {
>         { .type =3D "soc", },

of_platform_populate() won't work on this match unless there's a
compatible in the node, too. Can we use compatible instead or are
there a bunch of them?

> -       { .compatible =3D "soc", },
>         { .compatible =3D "simple-bus" },
>         { .compatible =3D "gianfar" },
> -       { .compatible =3D "gpio-leds", },
> -       { .type =3D "qe", },
> -       { .compatible =3D "fsl,qe", },

Better still would be if we could move the remaining ones to the
default table and just call of_platform_default_populate().

Rob

