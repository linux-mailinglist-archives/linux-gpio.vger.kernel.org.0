Return-Path: <linux-gpio+bounces-11757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 205929AB124
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C6A41C223BD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 14:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219711A265B;
	Tue, 22 Oct 2024 14:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="zPsfDhy5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0701A0737;
	Tue, 22 Oct 2024 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729608271; cv=none; b=Wff4wQ3hBKaEF+G5C5Kg0SbtwVYA5/ksIwQo9/sX6yVOaZ1Qgz90Yhhuk1h5nWtdA2vJqqCWm0mbvpc38TT7UUMEhQGQHZIitEeagl5eGV4awvHfEj/Jy8PnTIghTOGCkyegDQc315v//R6nWUW93VHM9Tf9oYWtjGoGSVlmCBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729608271; c=relaxed/simple;
	bh=eURP4ar4+HITlep6dZUO0eNRMf3wwVBadmodatCMtSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaJ0GkPtPCMhGmAoXcjGCRyhluikSeN0UN6pxPOGh7RNYMmgNU/0msgK/S117npCsEAVKrVrVnAYaGsNt4u4dWx2E1+o+IoWTqyA56aEiL7tMGPK6/5xXrgwnhP8JgCKrwG1JKeFqtWzhdLDLctzLaBf4JiGHgxG4hsKXipvvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=zPsfDhy5; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7F5CE88EBA;
	Tue, 22 Oct 2024 16:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729608268;
	bh=8JCWEFiVxTgldvfx2ew36UU69vLDsIQ+wcH6mkzO9Is=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zPsfDhy5oryqqBV+Ic3xo10tNvaLLB1ttADNgufC5PYpGS1vKw5xSsP1Q8HXF5oLa
	 LTASKwtUNO/uKlpy588coRiqHVZQUJXbwZlu6sj4F6spD+DsmDTKV/UOxdmItG8ETJ
	 ZJshR9NtvCyyBMLy1J9ky5IPFJk/vMmOvzj5nMn6atIN2RbDPJ3QOvuqFpxcVJ+KGc
	 qSmus+JL2H+lD7oOYbTXEZytYFzruUZ/iVVaD0ZKkF7gqcZLWDWHXEU6rKqo9xZXPt
	 pmt9oYK79A0k1wu7g7zM5domLaPESR9MOwT1vTAe7VbIA/BshvuE0A15CNjTjBTPrc
	 UHMSI1BK0027w==
Message-ID: <b382b08a-4ce9-4070-adbf-45ef5e91ce1d@denx.de>
Date: Tue, 22 Oct 2024 15:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
References: <20241017211241.170861-1-marex@denx.de>
 <CACRpkdYvMWABqw1tC5YSh+RXcHiCwUGsbOGAfkysThYQZTPWzg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdYvMWABqw1tC5YSh+RXcHiCwUGsbOGAfkysThYQZTPWzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/22/24 2:55 PM, Linus Walleij wrote:
> Hi Marek,

Hi,

> thanks for your hard work on this!
> 
> On Thu, Oct 17, 2024 at 11:13 PM Marek Vasut <marex@denx.de> wrote:
> 
>> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
>> except for the configuration bits which differ across SoCs. Rename the
>> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
>> strings for the other SoCs and fill in the various bits into desciption.
>> This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
>> Remove the old text DT bindings description.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Is this v5 patch 1/12 something I can just apply to the pinctrl
> tree or do you want it on some immutable branch or so to be able
> to pull it into the SoC tree for dependencies?
I do not have a preference, really. If Shawn maybe has one, then I will 
defer to Shawn's preference.

I'm sorry I cannot be of more help.

