Return-Path: <linux-gpio+bounces-11731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D53689A9754
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 05:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DA08283B7B
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 03:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E6EC2F2;
	Tue, 22 Oct 2024 03:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="viWGQv0u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE72581;
	Tue, 22 Oct 2024 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729569134; cv=none; b=Bazm59VfFQTPbrWbazOdgOvV28MdTQ/Y2MuWVrlIJRUdC0DbrJndYcxH+bZA8+FMLjXuiAsX0gOwDRd8Xcbsgz/tWEjRQZHd0h77zDe2Bq0HClVqt62yM/tYhPexA8CRcC81r2RSjQ7/fGh185AsCFphlPaatcinF2w/aTUftjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729569134; c=relaxed/simple;
	bh=MUYpnuFjFt3ygBsajP6juNZdxiMZBMbq7BM7akgjMg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbGoRWuylINLJJ/R/zLBGjDYDJUm4bWSMbiioq3WyuJ6UOm2hHvVsR2CBZBhOYK477ap13lDE/bH6QJ82CznntxkagO3/JZKD4DnaawstYfwtem9VuGRduBy4g494ntZIK7jhjp/JcZlZHEZ4i8ltUPn39tnZJ7DCFM7X/nTP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=viWGQv0u; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 59DDF88902;
	Tue, 22 Oct 2024 05:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729569130;
	bh=Umf7TLwtKK9RcFrydoWjKJt1hSkVZJy2+GeO0IW5JS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=viWGQv0utMZnwygMCW2TdsfFpP/gpID6PFMCo04FjOjuiaf6O05ELxMf5oesmvGGw
	 PO9IHu7SlRBGiCOWbXvcI+gUhXkXYCGwGlqksU0qMpz+dL27sbHgY2OeTzED0ED1pH
	 HLYYALbSREilK7zgMmOGlT+qUyxE/qcduIWg6Etcsh3ZZpmvbzcbfhiUY0UcvV47q2
	 lINU674OuEMyiIO+/LwFYFrWBKWO78gqVphj/HyNWhz21gQAhvxMQO/oRlWv+fVZqH
	 QlImfLXrSLl78OWbWCXDUY1oSLAs7x/gTTbXT0cMUnAE/SiUtdSOYPsJML8Yz7D2jl
	 xDKbaEPOWwXFQ==
Message-ID: <6eb23f6c-fe0c-4ee1-8f99-568041524073@denx.de>
Date: Tue, 22 Oct 2024 05:52:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
References: <20241017211241.170861-1-marex@denx.de> <ZxcbHb5v05+XhFnM@dragon>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZxcbHb5v05+XhFnM@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/22/24 5:25 AM, Shawn Guo wrote:
> On Thu, Oct 17, 2024 at 11:11:18PM +0200, Marek Vasut wrote:
>> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
>> except for the configuration bits which differ across SoCs. Rename the
>> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
>> strings for the other SoCs and fill in the various bits into desciption.
>> This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
>> Remove the old text DT bindings description.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
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
>> Cc: Stefan Wahren <wahrenst@gmx.net>
>> Cc: devicetree@vger.kernel.org
>> Cc: imx@lists.linux.dev
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-gpio@vger.kernel.org
>> ---
>> V2: - Use DT schema to refer to the fsl,imx35-pinctrl.yaml file
>>      - Special-case the iMX50 compatible string
>> V3: Add RB from Rob
>> ---
>>   .../bindings/pinctrl/fsl,imx35-pinctrl.txt    | 33 -------
>>   ...ul-pinctrl.yaml => fsl,imx35-pinctrl.yaml} | 88 ++++++++++++++++---
>>   .../bindings/pinctrl/fsl,imx50-pinctrl.txt    | 32 -------
>>   .../bindings/pinctrl/fsl,imx51-pinctrl.txt    | 32 -------
>>   .../bindings/pinctrl/fsl,imx53-pinctrl.txt    | 32 -------
>>   .../bindings/pinctrl/fsl,imx6dl-pinctrl.txt   | 38 --------
>>   .../bindings/pinctrl/fsl,imx6q-pinctrl.txt    | 38 --------
>>   .../bindings/pinctrl/fsl,imx6sl-pinctrl.txt   | 39 --------
>>   .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt  | 40 ---------
>>   .../bindings/pinctrl/fsl,imx6sx-pinctrl.txt   | 36 --------
>>   10 files changed, 78 insertions(+), 330 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt
>>   rename Documentation/devicetree/bindings/pinctrl/{fsl,imx6ul-pinctrl.yaml => fsl,imx35-pinctrl.yaml} (50%)
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx50-pinctrl.txt
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx51-pinctrl.txt
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx53-pinctrl.txt
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-pinctrl.txt
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-pinctrl.txt
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
>>   delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-pinctrl.txt
> 
> I'm not sure it makes a lot sense to have "fsl,imx6ul-pinctrl: " in the
> subject prefix.
I can change it to imx-pinctrl or something and send V4 , or can you 
tweak it while applying since the series is somewhat large ? Which do 
you prefer ?

