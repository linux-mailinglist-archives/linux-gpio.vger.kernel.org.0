Return-Path: <linux-gpio+bounces-30237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA13D0069B
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 00:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20E533029B9B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 23:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC632F693B;
	Wed,  7 Jan 2026 23:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="M4uB9ZZP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E88828B4FE;
	Wed,  7 Jan 2026 23:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767829470; cv=none; b=Y7iVVaLIuVxFSyLrb8bvuQIrxTdCe+UmjlxNbQuTuko6rQZh9ATt1COycnF/Bi1iY9PccIgGbta4cU1lHyJslXma3/9A+8Tkbn7BjcI7Ie3y/ZAcFFCIAEgZIDom1w4dHZAl7TcWbcZQARhMwTznQzVQ82pfhq6fkHorH+nzLmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767829470; c=relaxed/simple;
	bh=oEpYS0+p12KjtD1xjYH6uX4JLkjrqmw8h27UjRsu9RI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rtXC6qQ4UdtyS5knD+TrYArrYaSnLK2h2C194+OAF9Z9t/DPr4GtE3jlXXoeiq+SCDLcaojwj3DNvqbuvYSEh3w21/63VbBWmDlACaLGOI82tihWmOGJvlwGjRtn6afWun/C3+R4SSPBVdhXv+AEEiwdShuCOZWJdKbtt9qWm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=M4uB9ZZP; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767829460;
	bh=vvbUvshcKay+5SyzipSpDu2A7P68B5vbaeosqp5G+WQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M4uB9ZZPVsPXY6riJWKTZi9afSO24SmdJ5MMFaOwN3rouRWR5waBAj2H4hjNLawRM
	 ZJzz7xC13YYt7/R065LFCDhNv7Vp07k8CK0xHfTgbenYVw3gDPCCHlKw/QzXzX4MgT
	 tolqAxGati8jljrqUv5Y8lBIUc6yr/q7JeoeTB6282y47EHXOdU5QpmdI3RMbUFfpg
	 /1GiryloDRy6NI38fkGfFuQGc1PQvVg9MrRZOdZQ2iQCjN048LDo+eDLS/kfAIfi1D
	 ngkxKedmntRuoWPybC08mbY7EAn+gdJbyVzihucVkEZ1cZ4L9jlZKsTmatsnhFaeD9
	 QKzVOIbpc0Wdw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 65D5479F8C;
	Thu,  8 Jan 2026 07:44:18 +0800 (AWST)
Message-ID: <245bb0d1cfc1dee91baaab7c1fd73bc264586a0d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Tony Lindgren
 <tony@atomide.com>,  Haojian Zhuang <haojian.zhuang@linaro.org>, Linus
 Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
Date: Thu, 08 Jan 2026 10:14:17 +1030
In-Reply-To: <20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
References: 
	<20251222-upstream_pinctrl_single-v1-0-e4aaa4eeb936@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Billy,

On Mon, 2025-12-22 at 20:04 +0800, Billy Tsai wrote:
> This series updates pinctrl-single to behave more predictably on
> bit-per-mux platforms by making its DT interface more flexible, its probe
> path more tolerant of pre-reserved resources, and its pin configuration
> register addressing consistent with pinmux.

Can you provide some more context here? For instance, this is motivated
by the AST2700 - can you talk a bit more about why its design needs
these changes?

> It extends the driver to accept a per-pin <pin_index func_sel> style
> description for bit-per-mux users while keeping the existing
> pinctrl-single,bits binding as the preferred input when available. It als=
o
> relaxes probe failure when the I/O memory region cannot be reserved
> exclusively, allowing initialization to proceed with a warning on systems
> where that region is already reserved.
>=20

Can you unpack what's going on here in the context of the target soc?

Andrew

>  Finally, it aligns pinconf register
> offset computation with the pinmux logic so that both muxing and pin
> configuration access the same register offsets, avoiding incorrect pincon=
f
> operations on bit-per-mux configurations.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> Billy Tsai (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl: single: add per-pin binding suppo=
rt for bit-per-mux
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl: single: Allow probe to continue i=
f mem region busy
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl: single: unify pinconf offset mapp=
ing with pinmux
>=20
> =C2=A0drivers/pinctrl/pinctrl-single.c | 150 ++++++++++++++++++++++++++++=
-----------
> =C2=A01 file changed, 110 insertions(+), 40 deletions(-)
> ---
> base-commit: dd9b004b7ff3289fb7bae35130c0a5c0537266af
> change-id: 20251222-upstream_pinctrl_single-99e8df1fe2b9
>=20
> Best regards,

