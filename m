Return-Path: <linux-gpio+bounces-20686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F5AC7524
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 02:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5552BA27F9C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 00:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ECC1A2387;
	Thu, 29 May 2025 00:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="lhVxSlw1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FCE15D1;
	Thu, 29 May 2025 00:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748479162; cv=none; b=GFUzsJr3lzTwNcQqJNUJwmyz6ULlLFwjJ03se62T6WrS2R59VnZ4viY5F3qoFL+YuEtU9wZ5B57XF/FqDMUvjL2AN/EPfimd92jLOWBwKI4jD2jRCZnYZfrn87P/3RQYK6SCD5x+Hi+1V8YkhQ9Ns357QqWt04Pp0DTFiHSkoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748479162; c=relaxed/simple;
	bh=ny8UrZV+yDW12ChrpSJinfCzQgq9Rotc7NxMtarbZ9w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Isryh8dVvRIo0GOcLHEkugyfzivdLZRuEI7FNY/booWa2ckNrRl9leH+ac6j0+pX1mY3UUaItyfe7vxdHzs0YfB2a4K6+BiK1QhUxY6Wim8X5WTVQ88vDkWve6ZuETbRUblYJ0yHa3qAIl0c2bEdCDFTCpwcVDYtjkRU632QXUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=lhVxSlw1; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1748479155;
	bh=ny8UrZV+yDW12ChrpSJinfCzQgq9Rotc7NxMtarbZ9w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lhVxSlw1XDyalKK+FYY9gimu5uKVHJnqaeDIt0HjfhB9x7uQWy4SQI/TGIY1Wadbb
	 OBr8B5u5921nStK7WPkz8zc4MGzv2ocjjcgGlJ5cdSLqKRB3yuwNNZFghEaoqXOuCU
	 XGaz4hQH9WJDhXlF8jAqHQVlbLn9J2xItnpaLWAaOSf8uRWGcOYpJzwJ/z8Yza+HV2
	 WSRl6+BECuvxv7ZqlPnd0zrRetMjz80rmuwva0+xhB1ZJ6+J3uQ3VeB2RJYY7yrZD8
	 LjDNdWRt2mnVqiGXOpycjhV17I3sk9KD2OTyKXx3l5mPgsYmNZWnz+Ux5vXkgut4Mj
	 cMaTpUDMxrqLQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE6426449F;
	Thu, 29 May 2025 08:39:07 +0800 (AWST)
Message-ID: <af3edc0a454eecbe52608e0bc16d82b99be6bad7.camel@codeconstruct.com.au>
Subject: Re: [PATCH 05/17] pinctrl: aspeed: Constify static 'pinctrl_desc'
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>,  Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,  Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal
 <dlemoal@kernel.org>,  Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
 <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, Jianlong
 Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 29 May 2025 10:09:06 +0930
In-Reply-To: <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
	 <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-05-28 at 12:41 +0200, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

