Return-Path: <linux-gpio+bounces-6895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 349AB8D4293
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 02:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0121F2147A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 00:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97264D520;
	Thu, 30 May 2024 00:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QTtAPQh9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0554C2579;
	Thu, 30 May 2024 00:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717030448; cv=none; b=DFlRf/AK9hzwAkyhQL5vdRmx+JHBJMhAdg9EkIF8E/EvVQyp80JuQj1L1V6l49bioCIEDt7Fc7qNNapmznb4a8+Dqx8J+8oroSmyEm0Ui1seV8rq7PtkaZYrd/YuJVRPkO+6ChyNqdBIEOI8n9iFBxBAFMXiZzdGrsNXIkhe7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717030448; c=relaxed/simple;
	bh=jucTk2EQ1n2sUx5/LWV9se/pvXVCkWtzGs16Zhspsyo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YHJWeIVo9RMoqTDIYEIbhqa7mT/3ayqFYOY720w4tgY3/+b3De349oA2w/R3n7rnsa8Xm6OaL6qRsC+vYG4KGcTQ1Whp8k9HCcI3ad4qsEjHV/RH+DpCCoeaQxDMPHkOtCGWQuByG9wU6+9ZxloYnupdmy0I7R2Jl/Rku4K8xYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QTtAPQh9; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6263F2012A;
	Thu, 30 May 2024 08:54:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717030445;
	bh=jucTk2EQ1n2sUx5/LWV9se/pvXVCkWtzGs16Zhspsyo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QTtAPQh99AiaNfgmIUF0m4A/WZjqMBKQt63D53vySo01wzWNpKIFPtCKQaKaO/+Fr
	 d7SoCzo/q94LAO0jRhzz1MPYOTqZfAM6hh2dblbzlGF3D5Gxtbxm1F5W8sEJEySewn
	 PblGOAih5Oqtlpv+DQL5jEFtZNrRmJVe7u8emVhLwoOSRK2CcOZuBZOoz+QpLeuukF
	 hdxQnLx1v9kv1u6GUcvJN9xW2IEXJ9ZstD3zbVJK11dFYXcFZBJZZ83uvJJeIiSK4p
	 A5jY1v1sjpAuQQwVKbJBTVrFmBJ94/48Dp5NfwBAT+BGLTrtKcLDq/UpyQkNHLH5OR
	 BX6Cgb5zezvnQ==
Message-ID: <957a8999b0b0ed31949619913887c944bdae1a9a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 4/4] dt-bindings: gpio: aspeed,sgpio: Require
 #interrupt-cells
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 30 May 2024 10:24:03 +0930
In-Reply-To: <35b39da8-4efd-44ae-bcc1-7f4d501e0873@kernel.org>
References: 
	<20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
	 <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-4-91c42976833b@codeconstruct.com.au>
	 <35b39da8-4efd-44ae-bcc1-7f4d501e0873@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-29 at 09:28 +0200, Krzysztof Kozlowski wrote:
> On 29/05/2024 07:13, Andrew Jeffery wrote:
> > It shouldn't have been the case that it wasn't required. The kernel
> > devicetrees already specified it where compatible nodes were defined,
> > and u-boot pulls in the kernel devicetrees, so this should have minimal
> > practical impact.
> >=20
>=20
> This should be squashed with previous patch.
>=20

Sure, will do.

Andrew

