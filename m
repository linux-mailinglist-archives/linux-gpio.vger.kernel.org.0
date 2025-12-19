Return-Path: <linux-gpio+bounces-29767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5ECD0D2B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 17:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3624A31C880B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 16:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D47B3587DC;
	Fri, 19 Dec 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hGpeRT2F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1BE358D00;
	Fri, 19 Dec 2025 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159868; cv=none; b=TxEaYwaWBbwbRyYtg9gyLZvnwOT5IkAV/zZEbHRWtiylTpBGEgxt6rGo9SetDr3NCWbdcH8kY1es88Exeevnb1yn62OTNXvUGaoJop3IPZIhwEtEVvDYju9zqBPH/wok4BbveLWSYBmXe9L0yG7LXbktYgYD8swqru/4exzBF44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159868; c=relaxed/simple;
	bh=iRJqmQ4e+Hp3wrgorJPHNmurkWfgKf9wBu3CT65wOns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWvquVQ+Vx5ElbZIf/AF8RgImoUVN+Fcy7d2piW+KhpRTynoNWhhJNe/BEzTYVGfBhH14rxKE1jE1D/OPKbajdyIOFmPSNS81qfuuMPGWRm763ZsPIwAYM/Bin3XHL8bZ2qiq3/061ZBCHs312BYgJXg2ZbkNQng/5iD6qiwg2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hGpeRT2F; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 50F454E41CB5;
	Fri, 19 Dec 2025 15:57:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22EC76071D;
	Fri, 19 Dec 2025 15:57:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FD9D10AA9501;
	Fri, 19 Dec 2025 16:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766159853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NzngRrOQ0FGBJop69+kzn2PDMAzp8J/n5FCRHG82X94=;
	b=hGpeRT2FIebkbopjMBbaqX2L0BPPdVeEPFNsm/PgUENY6vWeXmBeQS+kmS6cm/5Tp7Ucgi
	XRMxTrcFkigj/+5Mpr8GYvXVlQHlwV7wGrSczu2IK2rS13hKajzx1MQU0P6sAG7MI3wjEd
	agIadvyRCTuq02QBln7ozTl6LTATZeLpvE7Izb/Vu9fKmtCQ8KbRY5/nsxYItK19HPoDb5
	vjaJHKBlCO/78bfoIZFzD/W+cr/jBmdW34sfvLKMJ3+sTSrX4FMLdjPUa1C4/avygaOuou
	Nfv6bb+P3t40RJnw0JP7TJ2Wj5LWgxFQX+2c92u2486sT6GJCkwFA0dqXYviUQ==
Message-ID: <fe9e594f-9718-48b5-8208-fb567a54cae9@bootlin.com>
Date: Fri, 19 Dec 2025 16:57:29 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] MIPS: Add Mobileye EyeQ6Lplus evaluation board dts
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
 <20251217-eyeq6lplus-v1-11-e9cdbd3af4c2@bootlin.com>
 <38f097cb-5329-4b91-b1a8-3eb5fed05ad4@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
In-Reply-To: <38f097cb-5329-4b91-b1a8-3eb5fed05ad4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,

On 12/18/25 16:30, Krzysztof Kozlowski wrote:
> On 17/12/2025 14:36, Benoît Monin wrote:
>> +
>> +&spi0 {
>> +	pinctrl-0 = <&spi0_pins>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
>> +	spidev@0 {
>> +		compatible = "lwn,bk4-spi";
> 
> NAK, you are not operating an excavator here.
> 
Indeed, I do not (and I should have known better...).

> Don't invent hardware.
> 
In my particular case of a microcontroller acting as an SPI "relay" on the
evaluation board, what would be the best way to describe it? It connects
the two SPI controllers of the SoC, one is a host and one is a target, so
it behave as an SPI target on one side and as an SPI host on the other.

The trivial devices bindings seems to be dedicated to devices, thus not for
SPI hosts. Do I need a dedicated binding or did I miss something I could
use for a trivial spidev slave?

> 
> Best regards,
> Krzysztof

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


