Return-Path: <linux-gpio+bounces-36032-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCUrMMFb+GnatQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36032-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:41:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F024BA60F
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B2753004F2A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 08:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD33344031;
	Mon,  4 May 2026 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdrSv4TW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021A340280
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884090; cv=none; b=DvI8VwoLBPEiyXqyduRpTt43b8I4GCLRJKC77gHdOghRHYHxgCs0i6y1G225Mb+e+F3t9tnwWz8cu9AXCHFyS4DnfLrdMlmzOk/ZbA5NeQZ53CFvrj8EFyoaqj/JMDqkxgmCyqJMHFYroZMai+QreyccjaHCvcr4WPPwELIIzAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884090; c=relaxed/simple;
	bh=+UjdPXgx40aGDQmYPDjrReOVwgfO07rl3A8FxXfkg2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MpCDBGB6reP7uFMoDYOlfWhRWnHVIjaIECjJKoxyxNq8vnkb+kgqzQUzLyBYeCf5aMUdPQh0naTV5pgSTov9K0PGAVnsOqB0gXk3Wnd7FFANFXtV7AshdePu169HGUn+UKKVlAmm8ICKYvvlH/TJPbON35djWJ4FQ7Ib9VuBIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdrSv4TW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FA1C4AF09
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777884090;
	bh=+UjdPXgx40aGDQmYPDjrReOVwgfO07rl3A8FxXfkg2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AdrSv4TWN8lvcDxoc1i8Njr8E3j/iJL2GQWDvt2jdR4Sh1WUwCH7qtXGYHnH/dpfb
	 fZx08dufJdeJuP8/Hi6+yj20J9pHG3/pkDiMCAaxTPZxmvWMFgkE+4EyvnVLmGMJhU
	 mwkysWUx9WkG4xizPltMPY8B+I3+AhtddA49e0fNXNLVd032W1qCHfH9mMQ05YbGBb
	 4CcutFrpIAqWSLHdJ8w5hPn/zQ+2Qgs0ZUYLIldQNc2igxVr+yiMjdPWdKyhXD3ruJ
	 CtK/N/Xy0Kn82MPao191aJfri7DU/okb8daoY9xK5tz+KVMdn6KtML9outiV22sUQ1
	 aJLfcB0GwFqMw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so1767426e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 01:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jEX8N8PvEmE7grqVKuZS9PM+GHKQPXtygVZYJtuCfyjWBrNr2ZsZsR31IONIo/HoC9N1mQHLRvaDR@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8jGzwcfI7jXboC8hdde2qtOFPhd1DVDikAJc0FTwi2yXAYXP
	0DVgMG5vyM6pn6xr0fp47NuIlikxq5fWinCbmVLa4kSmkkn/gJDBBfGgDM2cf5rtPF/e+7vRquO
	pwo/ophvXWprbb8n97uaegoCRJ2As1Ic=
X-Received: by 2002:a05:6512:1193:b0:5a8:74c3:5d9b with SMTP id
 2adb3069b0e04-5a874c35f1emr460528e87.0.1777884088510; Mon, 04 May 2026
 01:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud> <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260428-hardhat-both-1c9aa594a45a@spud>
In-Reply-To: <20260428-hardhat-both-1c9aa594a45a@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 4 May 2026 10:41:17 +0200
X-Gmail-Original-Message-ID: <CAD++jL=96gzBL-VzNi3WtZQvhVgqATV1GwsnyZkTzNC1OiMa5g@mail.gmail.com>
X-Gm-Features: AVHnY4LuNknvAN1JKPIs7fCl3dSCfrsEmP8h88LbnEyxp4JJXZMfI_swQ2zu-2g
Message-ID: <CAD++jL=96gzBL-VzNi3WtZQvhVgqATV1GwsnyZkTzNC1OiMa5g@mail.gmail.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 09F024BA60F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36032-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 8:51=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Tue, Apr 28, 2026 at 01:28:05AM +0000, Changhuang Liang wrote:

> > We think that implementing this in the pinmux will be relatively simple=
. It avoids
> > the need to create a large number of mapping relationships in the drive=
r, which
> > simplifies our driver implementation. I'm not sure if you'll find this =
explanation
> > acceptable.
>
> I don't really see how pins + functions would require lots of "mapping
> relationships". Instead of having
> +/* pinctrl_sys2 pad function selection */
> +#define FUNC_SYS2_UART_CTS                             1
> +#define FUNC_SYS2_UART_RTS                             1
> +#define FUNC_SYS2_UART_DCD                             1
> +#define FUNC_SYS2_UART_DSR                             1
> +#define FUNC_SYS2_UART_DTR                             1
> +#define FUNC_SYS2_UART_RI                              1
> +#define FUNC_SYS2_UART0_TX                             1
> +#define FUNC_SYS2_UART0_RX                             1
> +#define FUNC_SYS2_UART1_TX                             1
> +#define FUNC_SYS2_UART1_RX                             1
> +#define FUNC_SYS2_UART2_TX                             1
> +#define FUNC_SYS2_UART2_RX                             1
> +#define FUNC_SYS2_UART3_TX                             1
> +#define FUNC_SYS2_UART3_RX                             1
> +#define FUNC_SYS2_UART4_TX                             1
> +#define FUNC_SYS2_UART4_RX                             1
> +#define FUNC_SYS2_UART5_TX                             1
> +#define FUNC_SYS2_UART5_RX                             1
> +#define FUNC_SYS2_UART6_TX                             1
> +#define FUNC_SYS2_UART6_RX                             1
> +#define FUNC_SYS2_UART7_TX                             1
> +#define FUNC_SYS2_UART7_RX                             1
> +#define FUNC_SYS2_UART8_TX                             1
> +#define FUNC_SYS2_UART8_RX                             1
> +#define FUNC_SYS2_UART9_TX                             1
> +#define FUNC_SYS2_UART9_RX                             1
> +#define FUNC_SYS2_UART10_TX                            1
> +#define FUNC_SYS2_UART10_RX                            1
> +#define FUNC_SYS2_UART11_TX                            1
> +#define FUNC_SYS2_UART11_RX                            1
> +#define FUNC_SYS2_UART12_TX                            1
> +#define FUNC_SYS2_UART12_RX                            1
> +#define FUNC_SYS2_UART13_TX                            1
> +#define FUNC_SYS2_UART13_RX                            1
> +#define FUNC_SYS2_UART14_TX                            1
> +#define FUNC_SYS2_UART14_RX                            1
> you just define a function called "uart" and have a simple map of
> that string to the number 1. You end up with a single array with the
> relationships, not lots.
>
> Frankly, pinmux just does not seem appropriate to me when it looks like
> 90%+ of the pin mappings for a peripheral share the same function value.
> There appears only to be a rare number of cases where that doesn't
> apply, but that could be handled by having them represented by a
> different group/pins node with a different function.

I share Conors view on the muxing here. Using functions + groups
as strings looks easier for this hardware, and the driver needs many
changes anyway so I would say just get to it.

A common problem among upstream contributors is pushback that seems
to mask the fact that your organization has already decided to use this
scheme before discussing things with the community (based on previous
work and assumptions usually), and I'm not
happy about such situations, so please take this time for an internal
discussion about community work if this is the case.

Yours,
Linus Walleij

