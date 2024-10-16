Return-Path: <linux-gpio+bounces-11484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BD79A16E5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 02:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 325D8286BD1
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 00:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3C13FC7;
	Thu, 17 Oct 2024 00:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="mCpjlRxd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668503C30;
	Thu, 17 Oct 2024 00:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124686; cv=none; b=V32VH6tYA+RJB+LtBBOtEt22hJmHKbdIE3b2UfnFggK+i2uUOuGsn8a3sfqCTEh1qX3YxyJQMq7lSJD5z7cDTYAohmfV5jVzXdk1qlrXmMG27vQfB2d/GfHtYGJZ0r0HF+jEi/S8zx+qRjlTQ059HJai6siB+KwGW4iNaERAjx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124686; c=relaxed/simple;
	bh=7g0aC8MALwVGRPVCCSINwLL7HrVEmpwktOlBZPETjQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iHM2alkJv1F3g/WGenmFFGQbtBaJjIKh8UwbmVo7zYdkslpVQJhK8PK/iGpPYAosEJyAppTW/rnJcAmCKyeqheuRwl58qZw5vksXABcW4EaTQ6gEJgDQggzLdqJPsuff1FoQvUk4UU/6BIVttddt+ay3s7IxR2iESvOaxeiGRms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=mCpjlRxd; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9E71288E14;
	Thu, 17 Oct 2024 02:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729124683;
	bh=M6fhzpLMexaXGKuiI41TaABaPZfkUsLvBKtsOHdEIEE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mCpjlRxd0OSFlp6IHUZ+OJxtxLNrr/2w2OFNZo1z6GsXLuCWLx+AaL/iMJAOm1l3x
	 einB9skbUrHQz0DSpxtVpU/rBTbA5t+/20fUbf5+RtFVpqsj/eWh9hHONiLjFuw+/2
	 i72LUr5HTAD236S6/DNgs/7UfluhDtrZEFB2irvvM91YLPkzFf834wcL2ZbS2QDR8U
	 +bAJ+fjS8QzFwRVCxi6b2CN86TgSVWlMSygaT2qAVW0xgtaW9Zrh/6xVDYzAi/j230
	 Hx/oOnTup7u4hOAYjtN7Q0G47atjYxP6KqUPGeVPSKOQzQiRpfPSqC6K8DEinje6ex
	 7JJwq7Nct+h8g==
Message-ID: <98a43b52-00b3-4d3f-bbfc-23c0b9d85738@denx.de>
Date: Thu, 17 Oct 2024 01:13:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: fsl, imx6ul-pinctrl: Convert
 i.MX35/5x/6 to YAML
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20241015232107.100771-1-marex@denx.de>
 <2205972.irdbgypaU6@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2205972.irdbgypaU6@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/16/24 8:58 AM, Alexander Stein wrote:
> Hi Marek,

Hi,

> thanks for the conversion.

Sure

[...]

>> @@ -19,6 +19,15 @@ allOf:
>>   properties:
>>     compatible:
>>       enum:
>> +      - fsl,imx35-iomuxc
>> +      - fsl,imx50-iomuxc
>> +      - fsl,imx51-iomuxc
>> +      - fsl,imx53-iomuxc
> 
> imx50.dtsi is using
>> "fsl,imx50-iomuxc", "fsl,imx53-iomuxc";
> 
> So either the .dtsi or this schema needs to be adjusted.

I'll be special-casing this in V2, thanks.

>> +      - fsl,imx6dl-iomuxc
>> +      - fsl,imx6q-iomuxc
>> +      - fsl,imx6sl-iomuxc
>> +      - fsl,imx6sll-iomuxc
>> +      - fsl,imx6sx-iomuxc
>>         - fsl,imx6ul-iomuxc
>>         - fsl,imx6ull-iomuxc-snvs
>>   

[...]

>> +                Common i.MX6 bits
>>                     PAD_CTL_HYS                     (1 << 16)
>>                     PAD_CTL_PUS_100K_DOWN           (0 << 14)
>>                     PAD_CTL_PUS_47K_UP              (1 << 14)
>> @@ -69,6 +112,11 @@ patternProperties:
>>                     PAD_CTL_SPEED_MED               (1 << 6)
>>                     PAD_CTL_SPEED_HIGH              (3 << 6)
>>                     PAD_CTL_DSE_DISABLE             (0 << 3)
>> +                  PAD_CTL_SRE_FAST                (1 << 0)
>> +                  PAD_CTL_SRE_SLOW                (0 << 0)
>> +                i.MX6SL/MX6SLL specific bits
>> +                  PAD_CTL_LVE                     (1 << 22) (MX6SL/SLL only)
> 
> Is this comment 'MX6SL/SLL only' really needed? This bit is already in the
> i.MX6SL/MX6SLL only section.
I think yes, because this particular bit is MX6SL/MX6SLL-only specific.

