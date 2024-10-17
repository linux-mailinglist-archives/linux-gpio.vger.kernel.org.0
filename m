Return-Path: <linux-gpio+bounces-11582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49AB9A2F73
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 23:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C751C21889
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 21:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248FF1EE022;
	Thu, 17 Oct 2024 21:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="XMNhbGjX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B91EE00D;
	Thu, 17 Oct 2024 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199679; cv=none; b=KaSyUs33SMqDVNyIUtSF+7PqECM2pF8tR66fLFhEyNsf0fXPrZbilz6wgn2bVaeIh869hbauc5jKW2Ed0UXF250An+sq8M5GlWupQpBXuAI3MojHwsNYzFopAlBUABu1Len+gsGH9+G8KsmCV6w1HwM9XUNmCHEVEeyG7NlZrts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199679; c=relaxed/simple;
	bh=lIhVXg98Xg7EFXn6mWKwykZhuSv1EILhcZuUTSkVoRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvlH9npiOODz1ROHFxZgbR8blb3KGzSkGVzx0adHG3l0rHdHVGSYWI06ffHZWNxJ3mvoK1h/DiFP+pw/Cpt5X5Yq9J2ogJ2Oemz3gqCur1/xTqZ0XCQkRPIYrLjqu9dN5YSkweko15bqKSRCkSQkEqiWh0xQHK55IDR+dcJFGW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=XMNhbGjX; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1311188FF6;
	Thu, 17 Oct 2024 23:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729199677;
	bh=O9UkuWyyy6bKsG0cxyMIbUIe3eH7YaOaFCDaVNZEAG4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XMNhbGjXyA15TyPwOyw9j8/jR7ZCNYagimHtabWogtkBP7QM3ajY+xMv6lfbhpuoL
	 Xp8uRa9QjNxsVNytTkGUnVZGogsm0oZp9hl7T8X2pcM8ALBqB1CYQap23UmYsmw7bd
	 WVocaVRAcV6k8vdiduCjz44x0KwoH5hPz9mthCtdBrLkiZdiechlrOoVnDM1iwHyTF
	 3gOEVRrTTvwRHGgnn3sm1oDamC1XL2IW34SRORsmY1n0SlIue7PcLH1/OyY1gDfzGj
	 918ikxF7nHDFxAQ7VS/hJ1lnsC0EN5YyQ3QSDNdpv65pwdSgUm6Vrgt4jbOVv2oElI
	 xpj9p+Y/T6uag==
Message-ID: <5548933f-f6ce-450f-9516-d66a323ca504@denx.de>
Date: Thu, 17 Oct 2024 20:23:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] ARM: dts: imx6ul: Align pin config nodes with
 bindings
To: Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-gpio@vger.kernel.org
References: <20241017000801.149276-1-marex@denx.de>
 <20241017000801.149276-12-marex@denx.de>
 <aa21db7a-5b05-4529-ba75-e2111e9e6362@gmx.net>
 <a5026879-48d9-4557-85d9-038ab73deefb@denx.de>
 <16b45842-1a8e-4425-aca3-d93276e59d5a@gmx.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <16b45842-1a8e-4425-aca3-d93276e59d5a@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/17/24 7:04 PM, Stefan Wahren wrote:
> Am 17.10.24 um 14:30 schrieb Marek Vasut:
>> On 10/17/24 2:14 PM, Stefan Wahren wrote:
>>> Hi Marek,
>>>
>>> Am 17.10.24 um 02:06 schrieb Marek Vasut:
>>>> Bindings expect pin configuration nodes in pinctrl to match certain
>>>> naming and not be part of another fake node:
>>>>
>>>> pinctrl@30330000: '...' does not match any of the regexes: 'grp$',
>>>> 'pinctrl-[0-9]+'
>>>>
>>>> Drop the wrapping node and adjust the names to have "grp" prefix.
>>>> Diff looks big but this should have no functional impact, use e.g.
>>>> git show -w to view the diff.
>>> thanks for addressing the YAML conversion, but this specific commit
>>> message doesn't seems to match the change?
>> Uh, right, commit message replaced in V3 (or shall I send this patch
>> separately?)
> I don't have a strong opinion about that. Luckily this is the last
> patch, so in theory the rest could by applied if there are no other
> findings.
I expect findings, so V3 is coming anyway, I'll just let it on the ML 
for a bit for those findings to pour in.

Thanks for keeping an eye on this !

