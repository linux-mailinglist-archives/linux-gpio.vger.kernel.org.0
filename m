Return-Path: <linux-gpio+bounces-4401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B787DDD1
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Mar 2024 16:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBB61C208BE
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Mar 2024 15:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752B61C69E;
	Sun, 17 Mar 2024 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="i3G//zfv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506B1BC3E;
	Sun, 17 Mar 2024 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710688351; cv=none; b=W/6zoCGGw6GO0s7KOEgWt1M9ursHudw3QPv5mqbj++E6eBUumXd4JL/AidZQxG85EBkSrd4yTOzi6ufV1f0jsca+C23c3PTOOOSuCW+8RFEC2BbGiML8j/0QdTSSbCr+7/UehwCFZpY93H79j9/lW/+MR7GzWfMCztx6FW7F0mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710688351; c=relaxed/simple;
	bh=7D6rUs7oxFVkKkNiFleJBun4VT034Uea7yEgWMsWmlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mq4FYHKQTqVPGlAi5FNwfSua9Gjer3QQFrgSrrRV8uIpIAfnAMdpno3ZgPOMXaj/fttWyED8+D7GGAqirz8zAlLMdi2Cdh0SSeRB4nn4TWZQY77XGZ4b3nTObxPbM1UJs0WKpFjit6e9xIQcezlKiKEu1zMhphFa3cAZ2pdkGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=sberdevices.ru; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=i3G//zfv; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CD12E120006;
	Sun, 17 Mar 2024 18:12:23 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CD12E120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710688343;
	bh=vuhFTgRx08IRoav35YN/UioWYf2u92NjCnQaH1ojeG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=i3G//zfvC8D25R7CeiPqgfTYLeC1qWFZb4cP+lom1aRx85YIxRzgmxU3gi1fDQbCC
	 FEWDKcilb3Q85z+4Mw5WaWRNsztDe1af8+3dhhpqnBxsTVOSPymdOH6yq1g5Zxjy6a
	 GN33MnDQpD9srrr1P5ZmWs+zVitGL0ZLyVh684TnWlOs0Ml7K0lcAsPNBm5SGB5tH5
	 rRYc7EssYUt+6JUSq5ei4AZWv9iJ1eoGkzqUc7cpgI2IfJZUk4Y7Drr/yIMc4fDtiH
	 8+ONekataCh0QleERya7UP7hwSWekqrJFjvMUWJkyF9yOrxgLvLfDs8WAyXZciHY4U
	 GHsupLqGtGiMw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 17 Mar 2024 18:12:23 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 18:12:23 +0300
Message-ID: <5ca8e65f-9e65-45d2-9bb5-10be3eea2e0b@salutedevices.com>
Date: Sun, 17 Mar 2024 18:11:40 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/25] ASoC: dt-bindings: meson: g12a-toacodec: add
 support for A1 SoC family
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-9-jan.dakinevich@salutedevices.com>
 <f91ea77c-8170-4ae6-850f-3d5715d83855@linaro.org>
 <5a541ea3-ac4b-4606-9b6a-b103084b30b5@salutedevices.com>
 <83c5f475-6cc5-4084-a54e-1ed7c71735a0@linaro.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <83c5f475-6cc5-4084-a54e-1ed7c71735a0@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from}, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped



On 3/17/24 17:46, Krzysztof Kozlowski wrote:
> On 17/03/2024 15:29, Jan Dakinevich wrote:
>> I mean the following... This commit adds new defines to
>> meson-g12a-toacodec.h header. These defines are used in the following way:
>>
>> sound-dai = <&toacodec TOACODEC_IN_A>;
>> sound-dai = <&toacodec TOACODEC_CAPTURE_OUT_A>;
>>
>> So, can you make an advise how to call something like "&toacodec" to
>> which I declare new parameters.
> 
> &toacodec is phandle but it is not really relevant here. You should
> explain what these defines are. DAI ids?
> 

Yes, these are DAI ids. Ok, I'll write it in next version.

> Best regards,
> Krzysztof
> 

-- 
Best regards
Jan Dakinevich

