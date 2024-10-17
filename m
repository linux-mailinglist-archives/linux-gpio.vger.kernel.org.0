Return-Path: <linux-gpio+bounces-11486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7559A16EB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1321B286F21
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9459F469D;
	Thu, 17 Oct 2024 00:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="dgljaq/6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEC8B660;
	Thu, 17 Oct 2024 00:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124690; cv=none; b=FizZd7EESE08K6RWDrHcEXzVCcG7+DgHLuTQyLSlnUo1GylF/2JnyFWLQgv/8U/t8h3miUBbQCV3vEYXgRdS1NWpJdqcOv4LaGHaGFcGbIXJ6dSrraIbxnL8olml5wLRg4M2Mt85RKisjBfIKCZFe54HweWXlPQ2wld6vdZnI24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124690; c=relaxed/simple;
	bh=A/IqO8K6EFlPSYsWJ4Qpsk6V+kuikeOlBQai75+rwcE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tNnw6t7+Z7Lec8irT0QkKfY2juPcUVmOteoumwV8MFow5LsdkxEkkWheVOHtfWVP3IiIljGig0Bmh7/IqxESf+AmQ51E557vi80DH4ufz+0xD+ldWePDKfmFM8L3cMf8FRRoe6gae+jQigQ9lcMlq5hXyBnZapCs19YsYGbV2Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=dgljaq/6; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5C02088E39;
	Thu, 17 Oct 2024 02:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729124687;
	bh=Ej059yhD8UQ7rHWLZdDrM5XQ9BKv6qsJ3wCC0H41ABY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=dgljaq/6Pw+ojbHeGw4GDxiUrxMx9Vko5W/sm2M+lzRQq4epaNaG43DK78Ue0EzRg
	 pDoNwOOf72ku5H3pYWNCtG/XEFSYw0qYA3qS1F3OvelGX0K0TRf66f9uKTZrI959xD
	 ic8UsbwqcatqIfeyuk4CMkwNrMncP/PbrBLYjR9k2yLUDMKzg0Ri9/fb/fcwkt8ytW
	 jistIL6x2TZa9kpNe5BLFqGuydvt+jL/7ClGLiwPkWLO+ff5zBsipZIJYm37AL5RF3
	 eQ9NJnSy1to0sg1aRomJIQgCtfVvNFkNEoWBGhML3wsqtURtEMxxp36o3Yj1Pw+fn2
	 P+0XAkId7stjQ==
Message-ID: <b757f4b5-b6c7-4a0e-b362-56375d1ada79@denx.de>
Date: Thu, 17 Oct 2024 02:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: fsl,imx6ul-pinctrl: Convert
 i.MX35/5x/6 to YAML
From: Marek Vasut <marex@denx.de>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Jacky Bai <ping.bai@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20241015232107.100771-1-marex@denx.de>
 <20241016172642.GA1991636-robh@kernel.org>
 <9265a263-ccf3-4e9f-b7e0-69f62ec61eba@denx.de>
Content-Language: en-US
In-Reply-To: <9265a263-ccf3-4e9f-b7e0-69f62ec61eba@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/17/24 1:16 AM, Marek Vasut wrote:
> On 10/16/24 7:26 PM, Rob Herring wrote:
>> On Wed, Oct 16, 2024 at 01:20:51AM +0200, Marek Vasut wrote:
>>> The IOMUXC controller description is almost identical on i.MX35/5x/6 
>>> SoCs,
>>> except for the configuration bits which differ across SoCs. Rename the
>>> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
>>> strings for the other SoCs and fill in the various bits into desciption.
>>> This way, i.MX35/5x/6 series SoCs can all be converted to YAML DT. 
>>> Remove
>>> the old text DT bindings description.
>>
>> Just a nit, but I prefer 'DT schema' over using 'YAML DT' or just
>> 'YAML'. YAML is just the file format we use and YAML is a lot of things
>> that's not DT schema including other uses/attempts with DT.
> 
> Fixed in V2 and also in the LTC3676 conversion, thanks.
> 
>> This generates lots of warnings (patchwork has the output) for pincfg
>> nodes which don't match 'grp$' node name convention. Do we really want
>> to "fix" all of those?
> 
> I had a look and many of those are simple, so I would say yes.
> 
>> We could allow anything, but then we don't
>> enforce anything on new stuff.
> 
> We do enforce grp$ on iMX8M , it just wasn't enforced on old DTs yet.
> 
>> Or this could be split between new and
>> old platforms. If we decide to fix any old ones, then just have to move
>> them to the "new" schema.
> Strictly speaking, iMX6 and older are all old platforms, but I think it 
> should be easy to fix them up.

So, it seems like fixing most of them DTs up wasn't that hard.
But I am worried I might've broken a few in the process. I guess users 
will complain and then we fix them up ?

