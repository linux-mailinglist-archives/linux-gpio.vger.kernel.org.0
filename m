Return-Path: <linux-gpio+bounces-27858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 731A6C1D572
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 22:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6843C4E27C3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 21:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A65313532;
	Wed, 29 Oct 2025 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cTD92XaC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19229BD9B;
	Wed, 29 Oct 2025 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771779; cv=none; b=o/kt5gjJDnuqgCdCVFBOaQZMXnQDFTKPgmLPEiaiix+BwlyHCHOtCPUyRORSJ1oD0Lbs12m0yyCwOPqRtDoeeWZr/+Pqla9O4WUWmj9Xfsa93GJOBK6H7IzohJ8HBQ0ba8SJf8kVdP1u8Gyv3mcDRzAg38qwUUy5f8/WyPymaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771779; c=relaxed/simple;
	bh=0UNToemD7emOpt3lx4cLWDQg1wbn8BekjRhTd01LVtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ht0uh7QyA60WyR1EH8qxZ/Lu6FMqZWDk1aZ2zQGz3TbTC1++ltXojvWysGIZzjyNUuqqG6Iw9lZDkH0oY8h9V7AZSgj/GhSo5CnMbuSU1vpr58wti8kFCQSTNLgW7R9K3hxO5CujmDawj8AVRYhT/JTMRc/eEBrRoH6DsEf/SEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cTD92XaC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7IvXl2TzwOjo9Mm0noPrlRKot5iPpOVifikaYy/HK04=; b=cTD92XaCvXprttPJ39nDs9qUCe
	lG0MhkaLsdSa9Qz1rBxqlrl+669hm9IyWM+RWOKOIXlrWbJy8Y9mwptdl1GvlIK5LTtMj555il01i
	OVTL5Nl/lxl/nrTLBh/chFA8j8Qittv1M51VirxWuMRSROXnk/Z6tDewZ+/bInNkn2gVuZLCDC92s
	OSM+GgeIzueyNeSbB5uJGPypsSUrfVot0H14/1p7etE+diLDf78Un1C2eJXBN9hOZVkjGvfhUUV8P
	HO/FeWzn9K/BCzqhjjXrifAQFvATBtH2A3o0msEg23s9m2VkonSivCVTaIYexycu4hlrONkN/cYjM
	se/vUubA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDJn-00000002tTP-1rPy;
	Wed, 29 Oct 2025 21:02:55 +0000
Message-ID: <e4b63a5e-c549-4c48-aa03-e81ad694b200@infradead.org>
Date: Wed, 29 Oct 2025 14:02:54 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] docs: admin-guide: gpio: rpmsg: gpio over rpmsg
 bus
To: Shenwei Wang <shenwei.wang@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, dl-linux-imx <linux-imx@nxp.com>
References: <20251029195619.152869-1-shenwei.wang@nxp.com>
 <20251029195619.152869-4-shenwei.wang@nxp.com>
 <0b5feeb5-87b6-4f26-b9df-a23159b977e7@infradead.org>
 <PAXPR04MB918593CC07C246CADA458E4689FAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <PAXPR04MB918593CC07C246CADA458E4689FAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/29/25 1:52 PM, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Randy Dunlap <rdunlap@infradead.org>
>> Sent: Wednesday, October 29, 2025 3:47 PM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
>> <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Jonathan
>> Corbet <corbet@lwn.net>; Bjorn Andersson <andersson@kernel.org>; Mathieu
>> Poirier <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
>> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> linux-remoteproc@vger.kernel.org; devicetree@vger.kernel.org;
>> imx@lists.linux.dev; dl-linux-imx <linux-imx@nxp.com>
>> Subject: [EXT] Re: [PATCH v4 3/5] docs: admin-guide: gpio: rpmsg: gpio over
>> rpmsg bus
>>
>> Hi--
>>
>> On 10/29/25 12:56 PM, Shenwei Wang wrote:
>>> Describes the gpio rpmsg transport protocol over the rpmsg bus between
>>> the cores.
>>>
>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>> ---
>>>  Documentation/admin-guide/gpio/gpio-rpmsg.rst | 202 ++++++++++++++++++
>>>  Documentation/admin-guide/gpio/index.rst      |   1 +
>>>  2 files changed, 203 insertions(+)
>>>  create mode 100644 Documentation/admin-guide/gpio/gpio-rpmsg.rst
>>>
>>
>> I don't think this should be in admin-guide/gpio/.
>> How about in driver-api/gpio/?
>> That may not be perfect either, but transport protocols are not typically admin
>> material AFAIK.
>>
> 
> How about putting it in Documentation/staging directory?
> I saw both remoteproc.rst and rpmsg.rst are in the directory.
> 

Yeah, maybe. That's sort of a last resort location for things
that don't have a better place.

> 
>>> diff --git a/Documentation/admin-guide/gpio/index.rst
>>> b/Documentation/admin-guide/gpio/index.rst
>>> index 712f379731cb..9c8f4441038a 100644
>>> --- a/Documentation/admin-guide/gpio/index.rst
>>> +++ b/Documentation/admin-guide/gpio/index.rst
>>> @@ -9,6 +9,7 @@ GPIO
>>>
>>>      Character Device Userspace API <../../userspace-api/gpio/chardev>
>>>      gpio-aggregator
>>> +    gpio-rpmsg
>>>      gpio-sim
>>>      gpio-virtuser
>>>      Obsolete APIs <obsolete>
>> If someone thinks that it should be in admin-guide/,please explain why.
>>
>> Thanks.
>> --
>> ~Randy

-- 
~Randy


