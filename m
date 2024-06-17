Return-Path: <linux-gpio+bounces-7474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6890A6E5
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44B42281621
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 07:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730AF18F2C0;
	Mon, 17 Jun 2024 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="TbMb/VLB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3F318C326;
	Mon, 17 Jun 2024 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718608877; cv=none; b=ZGRjxyQIgjc7sJPfhX/qT5Aqqj/I2ji5LlmFQ7rSrhsGhnPj2mwWX6lxC0ug+E/d7d2YH13miGtH2gdxh7nnecItYgpJLYqyh19PTWB3lXPOnrzLOkN4C7riSodk6/OVGUg/PVj1D+1EDiNIAWlgdZLJqEuX+bHgh4eEOOcqxFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718608877; c=relaxed/simple;
	bh=4O1Yg19zvG/1BCea2tUlqBSAUzPuV9/WXaIGbdGrvU4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MY7mO/5X/bEwg2ojmNgzbgRewP8bdcYK/JFNcpy7cOjUjJL496mntWKx5zGjTjHFn7aKUj8ug1ZoMG4eyYMkXxyWyNWzaCwwNDKkzc48cHCVC/K0EQOLEPhQPA+0C8YgEEGLEiMpSHHs5OUbXJQ4UZI4+46eiFvkeDUjMK2NAcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=TbMb/VLB; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 70DCB2014A;
	Mon, 17 Jun 2024 15:21:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718608866;
	bh=4O1Yg19zvG/1BCea2tUlqBSAUzPuV9/WXaIGbdGrvU4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TbMb/VLBPIZdVWKQv6Pq9BqQTf63/B5/EwG7UiyQeT6z/FyqQMMCXEuD6jHztfmnI
	 hRM+73HNO1WNHiqbdoqNEQs7f4IRbdIG85AVhD2gwl1YFcMixfCAvZeRTT3DeFZulV
	 8JWH+T80+ubT0cmjz6FGC6QhdVYi27VhGNjICtzcp/R2kTY/Rgwm6Ox0qEiHejcpT7
	 ebC52k8USG+7lwkrqjB9zoSpyL9nIitIcPRaB4ZbfEQmBCqhsikgkQhAGtxsvSe/Eh
	 tE0u7IfUr34rKVJ9CehcdC0bP/M4Wg7euA2bQVZe8hjRD2V2jXbN7abOkzU31PeYDK
	 YUC3YIpy0DMBw==
Message-ID: <5bf8e1dddd2b958a102e7b1b9f9c080a34f9deff.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: aspeed: Use block syntax for
 function and groups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org,  openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 17 Jun 2024 16:51:00 +0930
In-Reply-To: <0908995dfd2181e687181bd1b075c4cb27624e94.camel@codeconstruct.com.au>
References: 
	<20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
	 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-1-a6fe2281a1b8@codeconstruct.com.au>
	 <20240604192755.GA1065421-robh@kernel.org>
	 <0908995dfd2181e687181bd1b075c4cb27624e94.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Linus,

On Wed, 2024-06-05 at 10:17 +0930, Andrew Jeffery wrote:
> On Tue, 2024-06-04 at 14:27 -0500, Rob Herring wrote:
> > On Fri, May 31, 2024 at 12:32:47PM +0930, Andrew Jeffery wrote:
> > > The expansion makes the documents a lot longer, but it's easier to
> > > review changes to functions and groups when we're not having to deal
> > > with line wrapping.
> >=20
> > Do you really expect to be updating this frequently? I would leave it=
=20
> > as-is, but whatever you decide.
>=20
> I don't expect to be updating it frequently. However it's happened
> occasionally in the past and the diff chaos irks me. So I prefer we
> explode it.
>=20
> >=20
> > > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > > ---
> >=20
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> Thanks.
>=20

Are you okay to apply these (I see they're not yet in linux-pinctrl.git
for-next)? Turns out there's another concern lurking in the AST2600
RMII pin groups[1], and it would be nice if we could rework the patch
for that on top of this series.

[1]: https://lore.kernel.org/linux-gpio/20240613080725.2531580-1-potin.lai.=
pt@gmail.com/

Andrew

