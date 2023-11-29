Return-Path: <linux-gpio+bounces-652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA207FD42E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 11:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7459428339B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 10:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1421B282;
	Wed, 29 Nov 2023 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iqK5PCgQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74304E1;
	Wed, 29 Nov 2023 02:32:14 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A184FE0003;
	Wed, 29 Nov 2023 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701253932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AQWLTAi/kFH63piYrCOLoe9cLcpZEYdoGnno5qNn/0=;
	b=iqK5PCgQPERsEeGyBLIVzQiwbgw6FnuNHNsyXxtLmbxTb+m18bbsx5EPx2JIb51kbmlPGZ
	v0zSdbGydbfI6lHbknqW2yg1VOyPO4kK5vhu2fCTqXzTyvFriB62AHm2aeoycahLn73XWM
	eDJFWUZ5QObQqmapvsRK155GziR5a5MHbG+jBadIg8f2rDIkWYoR4Qa8TVVf+T/Mya5+FZ
	r2oHQrJ6ageQ+/iQfuSp1ZlKTfeIwXXJPwwkqnE33yPpJXfvztrGIhzsg0j2fL99rnkNuZ
	lmgFW6jUxsdZ1G2FH1hotwp6wAKwfUyDuzAvdylrNFH4qvVBWov49awq/8OOiw==
Message-ID: <9806d838-3eb8-406c-8ef9-f75ebe664078@bootlin.com>
Date: Wed, 29 Nov 2023 11:32:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j7200: use ti,j7200-padconf
 compatible
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, thomas.petazzoni@bootlin.com,
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, u-kumar1@ti.com
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
 <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>
 <20231129101905.GY5169@atomide.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20231129101905.GY5169@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 11/29/23 11:19, Tony Lindgren wrote:
> * Thomas Richard <thomas.richard@bootlin.com> [231128 15:35]:
>> For suspend to ram on j7200, use ti,j7200-padconf compatible to save and
>> restore pinctrl contexts.
> 
> Hmm are the mcu registers lost too? Anyways presumably you looked at it:

Hi Tony,

Thanks for the review.
Yes the mcu registers are lost too, as the SoC is fully powered-off.
And I did the test to confirm.

Regards,

> 
> Reviewed-by: Tony Lindgren <tony@atomide.com>
-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


