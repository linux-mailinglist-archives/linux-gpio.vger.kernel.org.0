Return-Path: <linux-gpio+bounces-30585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C6D220D1
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 02:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0D59301A225
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 01:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F457256C6D;
	Thu, 15 Jan 2026 01:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="i9X1/Q4u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4864224AF9;
	Thu, 15 Jan 2026 01:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441303; cv=none; b=FMt3tx/ohl4jCpINJ3jgBhnFOGVytI5OaO4Y1M6UkY91+c0Vd4Xq51nM6jFW+NWNhDMnPcOKjYwJTzBWr7eRzHnwjGlH/pxr29CUVspbVG3QK/PSQ3SddgPSDJgSU3s5Q4u9qMvG3lJbMSrSVZ1fdv7t/U8RfwGsAL9+Bu7qgv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441303; c=relaxed/simple;
	bh=YvL196Y8Jf6UpyplUKqHRSkjNlU+qv/HoPgPsGaW3/U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MCE8OsEHPUVqeC3J1giIkkxCe4Toeg1GuyXcshFDTLtbE8kQpRxRiBmI0WvLQ53qjmwlXdRCoJPODy7Xf2iURAmxrcAVagpHXtM4cRWHzsUwAtftHGhZ/XH0udoFbSUxudm1bptcOPwsCX/zyOZPBFm8J1UqhoaCxQV5QNWptpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=i9X1/Q4u; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768441299;
	bh=YvL196Y8Jf6UpyplUKqHRSkjNlU+qv/HoPgPsGaW3/U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=i9X1/Q4uIVX6nV7K73FQ4EyscmGIdjxu1kCH754NihRYkeb7dOwpfGrIDJ1OGo8Nu
	 olTR17Xtj1um35SV+M3fPOmZpV7qMGjPYxzNQmxIjMelob3kXWx6fdop7BCdE4FdJT
	 YTllNZy8ElszhgX+fwMlcXV9ihLywCpSZy5NDQEKiwwzS+sl+H1A9Bh/muszYezeUp
	 3/qBPsAHAj1i1rVq9QOZ3AbKsBYHzBnqEuuobRpD3SaxLUZx/oIlU5MDa5I5FUU5X7
	 YaLzNnvSnX9MfCcVaeGL7AieKlSkWPSvoKav3xITpDeHyO4lU1UBw2qcBGbJdUrSKw
	 s1oG7FNxfJo9Q==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D96D16472A;
	Thu, 15 Jan 2026 09:41:35 +0800 (AWST)
Message-ID: <88ad862c8d68853eddfd17c7588cad65b3e104f9.camel@codeconstruct.com.au>
Subject: Re: [PATCH 01/11] pinctrl: aspeed: Cleanup header includes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus
 Walleij	 <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, Emil Renner
 Berthing	 <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Chen
 Wang	 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, Steen
 Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Thierry Reding
	 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Heiko
 Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Thu, 15 Jan 2026 12:11:35 +1030
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-1-a14572685cd3@oss.qualcomm.com>
References: 
	<20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
	 <20260114-pinctrl-cleanup-guard-v1-1-a14572685cd3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-01-14 at 16:30 +0100, Krzysztof Kozlowski wrote:
> Remove unused includes (no mutexes, string functions, no OF functions)
> and bring directly used mod_devicetable.h (previously pulled via of.h).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 4 +---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 3 +--
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 5 +----
> =C2=A03 files changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

