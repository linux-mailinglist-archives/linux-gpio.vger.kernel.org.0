Return-Path: <linux-gpio+bounces-11532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E889A2240
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 14:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BA421C22732
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 12:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4691DD533;
	Thu, 17 Oct 2024 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="tM1Bkw9x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C18B1D45F2;
	Thu, 17 Oct 2024 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168280; cv=none; b=upBQZp6nHYGSy8PmZR3+e1pw06oAEWwXxsXmJuSC3lKLZRhrrjKsSvRMqZDQAZQzdfSC7frOARXbY4eSYv+db91CnrRI91ez5FrX4ObzYV/5hLe3HdmX4SKVF3JPwojgZM6bs38mrIptnM+ZxmBVsj2xP61JKTNmbIs9RvQsGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168280; c=relaxed/simple;
	bh=UCHkoWv0f7C6RcPeKm6BpQfxLrwr9T18h2wATPAVOoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQfsaIgvu86vDblIvOITshLGMJ4PSe0+hMXf0viub4Hx0InM0WEUWI3Iult8/ZVyS/EbSKXGmpshf4OV/fP4Cm/p4n8p7nN3Jz/FHsBbJEAunF/GChiimptekKEZCauBxhZT9OCI6i4ewx3Ppjh4FR+dvzhOuNQAAOTHJ7Sqhjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=tM1Bkw9x; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 93D1E88FA4;
	Thu, 17 Oct 2024 14:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729168274;
	bh=Qi5y9EZv18ibABwGnmoS2RLBz9Wj7c4GFFGidKHjp6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tM1Bkw9x2w20/Ojj3Tr0AE9o7xuu9EOOQgyj4xMP9Aindvue51ag2vm6Xssgd28D3
	 p2jaH8CgRcOC2dOkoBeZLjBZWs8j1WFSDw+8SeLQ2UT0XARbytakcxR/8mOd3nmzuX
	 9HxLprYegZGwQPuJssV6hoFoBCsQyumko4u09IiM9WaaohvWI39pKXPL/5h3GWPOiA
	 kDXWVlNoAtKeO5XU9JGEIJWIVNxnVN6eqTVTQ/VgENF81QPKerLUMYRlH9bTTs4kKq
	 wPfwyEkXTZdACqq/+cUipVwBNWnv9YQZD8v5Kpbb7uZBTQq8OEb3h9i1n+au7mycet
	 XI5kFq1tcvKBA==
Message-ID: <f8b129c3-aea1-4f28-bf14-dd281cc09ade@denx.de>
Date: Thu, 17 Oct 2024 14:17:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] ARM: dts: imx6q: Align pin config nodes with
 bindings
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
References: <20241017000801.149276-1-marex@denx.de>
 <20241017000801.149276-7-marex@denx.de> <23695903.6Emhk5qWAg@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <23695903.6Emhk5qWAg@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/17/24 8:55 AM, Alexander Stein wrote:
> Hi Marek,
> 
> Am Donnerstag, 17. Oktober 2024, 02:06:53 CEST schrieb Marek Vasut:
>> Bindings expect pin configuration nodes in pinctrl to match certain
>> naming and not be part of another fake node:
>>
>> pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
>>
>> Drop the wrapping node and adjust the names to have "grp" prefix.
>> Diff looks big but this should have no functional impact, use e.g.
>> git show -w to view the diff.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Dong Aisheng <aisheng.dong@nxp.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jacky Bai <ping.bai@nxp.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: imx@lists.linux.dev
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-gpio@vger.kernel.org
>> ---
>> V2: New patch
>> ---
>>   arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi     |   2 +-
>>   .../boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    | 232 +++++++++---------
>>   arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts     |  92 ++++---
>>   arch/arm/boot/dts/nxp/imx/imx6q-h100.dts      | 200 ++++++++-------
>>   arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts   |   4 +-
>>   arch/arm/boot/dts/nxp/imx/imx6q-mba6.dtsi     |   2 +-
> 
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx6q-mba6
Thanks for keeping an eye on these large changes, it is much appreciated.

