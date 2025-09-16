Return-Path: <linux-gpio+bounces-26224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0EDB59E4F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AE1C7B6AA2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AECA301712;
	Tue, 16 Sep 2025 16:50:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from duck.ash.relay.mailchannels.net (duck.ash.relay.mailchannels.net [23.83.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886CE3016E3;
	Tue, 16 Sep 2025 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041428; cv=pass; b=eBEv/VXT1EH+zDq5LqBnC8Rom8wdCAT3ZQdQ9o1PZx7ehITtEJlImQfclycOgsSOnxHfkZmOYlbzOVyeyWBe66yu0hryiZE3xZvuwwOIyZvpi52m1gu8TAJS65Do5KwFwC5LEqNcYpy69Pq3S7HCDMLGxqMWb8qPnNsWrSt4zWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041428; c=relaxed/simple;
	bh=yhXVa71sDBUgi0LPtey2+2lzNURpCWB+Qkf4tQIq4Kk=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=hGZ0Cc7kB6nr5eyxkjDWr7qvoeeACne0mtUXbtil9c/Mx7CADCMkcQGlNCoyqdWwSzZBxBhscXuiLsU+gOR1bZidQs2ZtKBZbyH2J1dD1KsS4FyXYpG2W/VxKK75g9fw9aV7c23ttNYsj13zhOOyFsFM9RgofbapfSXtVFc3v9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 70E05501331;
	Tue, 16 Sep 2025 16:42:55 +0000 (UTC)
Received: from uk-fast-smtpout7.hostinger.io (100-107-230-183.trex-nlb.outbound.svc.cluster.local [100.107.230.183])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5A548501D00;
	Tue, 16 Sep 2025 16:42:52 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758040975; a=rsa-sha256;
	cv=none;
	b=ePmlcPRtCV/0ShNdrgD1Mjg96XQJvym93uOpBeSpFzQ5w4sdYLqPhf3J+URcBQ0/m/gmSf
	pDPYCHvlTSrUuVoSmXG3AzTEKSBD5r/xuL8WOmJ/6frznMqKkwg/VIzRBJdgxNJHsKDFo0
	IxaylrrIInilLlsvIyk5um9ukOBZ+AjyNlFPWHa5dV6E8ikgOW9EmfwU2w73mH0VKaTryR
	hJHLkDRRsYGRxehVJTj3o69bRrpd5bqVLIac93kwaGvixdfl4qaaw3I1OPoLU46nh/vNSP
	E/nLIBJuv1y+8iofbLxR9cRuFJC+bxQJ7kBjkVvKJJibilgZd6ohK3btypd+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758040974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxOgn2m3Ie6XRNXGpzXojSezWCxjH7PiZ55WICf67Uo=;
	b=f9k17mgZoziwe6TbxuSvwG/U/GPHYy7L0haf5OUWiqKYfOcjw87HGh3orreJ3fEeRhkpUV
	i89R+HLNnrow15OafKDrKIovz+4ruXQKdCshaQhddCxMnj3uh17tnkzSDjaH78LQnI8xGA
	SD46cEk9isU3TXtcU5jVNUxxhMl6INkssRzhtWPrQoMpBJOs8UfTh7ynNcCqGMtxC/hqn2
	OE78050lzrCHoJo2RsLsH5PpNINq1rK8P6MPGMLi37Tr3G2TukQI7ZwuP1gJgv2CbpQeGf
	1msn79uui+KLXDaIjvRFsRr81Roy3BYRRpdHu9xwURLI8EoErUUmyd6xPnkLkQ==
ARC-Authentication-Results: i=1;
	rspamd-76d5d85dd7-nns68;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Obese-Vacuous: 0200e2b907012c5c_1758040975185_202464574
X-MC-Loop-Signature: 1758040975185:2572315587
X-MC-Ingress-Time: 1758040975185
Received: from uk-fast-smtpout7.hostinger.io (uk-fast-smtpout7.hostinger.io
 [31.220.23.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.230.183 (trex/7.1.3);
	Tue, 16 Sep 2025 16:42:55 +0000
Received: from [IPV6:2001:448a:c020:7f9:78ea:f170:5907:64ea] (unknown [IPv6:2001:448a:c020:7f9:78ea:f170:5907:64ea])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cR74570KgzHTnHl;
	Tue, 16 Sep 2025 16:42:45 +0000 (UTC)
Message-ID: <1a0ad7a7-7119-4df9-9f26-c2cd7b4ad084@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ARM: dts: qcom: msm8960: cleanup and add missing I2C
 nodes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>,
 Shinjo Park <peremen@gmail.com>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <5ge4fmciy5khy7axvzapmdv55abouzmr6t5j7irz2glznetr6y@ky6v43cyf6ir>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <5ge4fmciy5khy7axvzapmdv55abouzmr6t5j7irz2glznetr6y@ky6v43cyf6ir>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 16 Sep 2025 16:42:45 +0000 (UTC)
X-CM-Envelope: MS4xfInjyC6GXOUoTNbBFng6dnayO+J969j96SunuboAQ5W8qKsAtxlEBSkbRdMDkmYkqPqtW1WKbsiDhgoHQ8YBCXlw2QXjYkU2/lg94QSJsGw6ezJ1UFnL Aqnbn+oGRcv7z/Yma9stlx0GpCkuxHxLAUcnxQ75KxjwctUa6FylOXvvXM8gVA9GQ6ZZIufs3/6wmei9W2FrB0uHxMIyTOZIOxjVJaohiSdNb46VzRPSx1Ao xqA0Uk1A9fduPn9jyN2OPIyT8K5idX8K1EM2i1g13/erkWOdhc96DJVn2sd9pvQY4LmnABSyRkO+PtG+ovf+/6GM0foxZaWAuwhmnUYiHnGRC5xHx3LHKPl+ ETaDMYk+Dnh3bu/+UiHuDiHywHIGIFIHiClMOXrnnPVny2LyPhJO+o+F/v4OCkxxscJj58VfY4umIirzu5mdvS2CdEaZyJPKdMlg9MgcV45XKcJ2z3XGUfy5 3pyP0M4eDXsWNuG/VQpYKUsl1CVwVP8vPEMUkDXdS9A4/KmWof3X3bqF6E0LGo9OzJLyQ/5NF2c/ATVChc2f0Ue8xqGAIc9Iypre3ZGX5/cGezRXRZM7nZ5c 2ynicQdoZYGFCjFyE46JUiCl0Ap7S7O+QYMSW6yVdeXGT0rUp+Ymm87Sf4RtmyKtQ+WYhFh9oidFEURmA42KMfYhaJ0P+Qf6tOIg3JzuTW5rcEwGr+CSOf8f eNmVYVnhg0/OergMIFsf6UX+7+XBgya/H0nhp0oiYihkgPN5fHLE/9eyj+dhaYkqbh3JkPEvbhk=
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68c9938a a=bykdxRat2dt2OE9oJy4UGw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=SGA4CQ9yz7DMjX97Oe0A:9 a=QEXdDO2ut3YA:10
X-AuthUser: linux@smankusors.com

On 9/16/2025 10:24 PM, Bjorn Andersson wrote:
> On Sun, Sep 14, 2025 at 06:34:38PM +0000, Antony Kurniawan Soemardi wrote:
>> While working on adding support for the Sony Xperia SP (msm8960t), it
>> was pointed out [1] that the msm8960 dtsi could use some general
>> cleanup and reordering. This series applies those suggestions and also
>> fills in missing I2C nodes that are required by several phones based on
>> msm8960.
>>
>> Changes included:
>>
>> 1. Reorders nodes by unit address and sorts properties to comply with
>>     the Devicetree style guide. Cosmetic only.
>> 2. Inlines qcom-msm8960-pins.dtsi into the main SoC dtsi. Most Qualcomm
>>     SoCs embed their TLMM definitions directly, so this removes an
>>     uncommon split file pattern. Cosmetic only.
>> 3. Adds I2C child nodes for GSBI10 and GSBI12, which are present on
>>     MSM8960 and required by devices such as the Sony Xperia SP.
>> 4. Adds I2C child nodes for GSBI1 and GSBI8, which are present on
>>     MSM8960 and required by devices such as the Casio G'zOne. This work
>>     was contributed by Shinjo Park.
>> 5. Updates the binding documentation to rename the GPIO controller node
>>     from "msmgpio" to "tlmm".
>> 5. Renames the GPIO controller node label from "msmgpio" to "tlmm" to
>>     match the convention used by other Qualcomm SoCs. Cosmetic only.
>>
>> [1] https://lore.kernel.org/all/rcazqdcr747ujkba6z2j2oci27ajkqfi4hydgc2kiavm73y37x@g63jga2fcwmo/
>>
>> Thanks,
>>
>> ---
>> Antony Kurniawan Soemardi (6):
>>        ARM: dts: qcom: msm8960: reorder nodes and properties
>>        ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
>>        ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and gsbi12
>>        ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and gsbi8
>>        dt-bindings: pinctrl: qcom: msm8960: rename msmgpio node to tlmm
>>        ARM: dts: qcom: msm8960: rename msmgpio node to tlmm
>>
>>   .../bindings/pinctrl/qcom,msm8960-pinctrl.yaml     |   4 +-
>>   arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  10 +-
>>   arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  59 --
>>   .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  12 +-
>>   .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |   2 +-
>>   arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 727 ++++++++++++++-------
>>   6 files changed, 491 insertions(+), 323 deletions(-)
>> ---
>> base-commit: 9e410f58e82ea0c0e865f688d84edad1da7824d2
> I unfortunately don't have this commit, and I can't fine a branch where
> patch 1 applies cleanly. Can you please rebase this on top of linux-next
> and resubmit it?
>
> Regards,
> Bjorn
ah sorry, I was using Rudraksha's branch. Should I send the dt-bindings
patch separately now, or grouped together like this again on resubmit?

Thanks,
Antony K. S.

