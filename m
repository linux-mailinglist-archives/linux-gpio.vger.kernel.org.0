Return-Path: <linux-gpio+bounces-14652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B215A0921A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2724A188073C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 13:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6467620B7E0;
	Fri, 10 Jan 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="nZJw3xx9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF5120E004;
	Fri, 10 Jan 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736515988; cv=none; b=Ii0uPVTazUL23FMiZuSd742zXk5XjjLzi74sawYcOCbo778ckP+09FJjn3/MeL4/rzddgsauEJISr9lAHj2+sHunJVUqnLGRccCE7D1S6EUjMHcRmfUceahBdlxmvEJm0fAO0arcAmLgk5yMfKYip3+oy4jVp/fVFh1BhWufl+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736515988; c=relaxed/simple;
	bh=AyUtcVRJ9nlybfLtuky0fv6ss9boY7oPlXU6fhdIzZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JXwvIB97HOg8bUTMBhSzlMRG4UIya8U14LUDWPezBPhZALxjwUHteWK9K3ZlVEEk7djLPNjx3kUHrjo6D1LaD/u9A31SfbDDWMkkM2+i46BF/VieEHcv/gE8aLBB7PbIo/jMcAwgTS29vPcmslVBcYcLvXRyvBmzhR46236y3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=nZJw3xx9; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C76A8A087A;
	Fri, 10 Jan 2025 14:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=p4TYswSLfx8k3QOiMyuQ
	wRn56cfuWggANjhg60W0TK0=; b=nZJw3xx9bJtqxbzTZWrOLa5/QGkEe0plFs6W
	UYZX6nCBaF0iNbahm+0T5SDqDHqulEVuZcuKvqxykGl4cjRadD5d4lRE9mVn5fmo
	Ct3pKiIeGjbqo1shRn7xH97sl/FspLi+uY1GbXaN7WQxAGx+JftcNUa3ynLtzUBI
	G63htBdcXNFjmcyF60e26T8yR/DOzfaOWK/5TAMZ2cX5ao7r4EoBrnGwjThOGV7J
	qY7riOY45zyF+ZzdB2CbzFyFsx+45i08U5Wx4FtTSl6slvoQCF+Gt1dDrgUO7EU/
	BZ+i5dxEXxiWUPIAK+HcMs90nO94j014NPRWY+oSeA+Vw9KhHibANOoziPhILwzP
	Qw+PurGPHSatRXsbF2gZyisA9yWFYiSMCB69pt9tnVOjgxWbQXVfOJrFTSQqHE8a
	WN85cnyq+zHWObJrddECLi/agPNsAYlDR5XOnazrQ/Ryl7tsxSGOD/fmgTQJV0LT
	J0zM+/UrEUxYGjd/RCLE/u76OnKXLDRC1cX4t3rnJcAAACtt9KKTSIdiQTV/H976
	1rU8aGLYIW6rf7cSEeMFVgA4MT7EDzz2Aav9M/JR66mAw+qX8rU/w7K33Rf8taPm
	1fDdw+3EOO5FIF5quuaUoZq0nSkANExtXbpVc1OdVUF7b9pF0uzDpcJ5/z8rkrLG
	Ag2zNlI=
Message-ID: <de6b70f2-8fd6-4e2a-a6c1-466698be8a6b@prolan.hu>
Date: Fri, 10 Jan 2025 14:32:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpio: 74x164: use a compatible fallback and don't
 extend the driver
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Ripard" <mripard@kernel.org>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?=
	<j.ne@posteo.net>, "Geert Uytterhoeven via gmail . com"
	<geert@linux-m68k.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20250110130025.55004-1-brgl@bgdev.pl>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250110130025.55004-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852647563

Hi,

On 2025. 01. 10. 14:00, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There were other suggested solutions (for instance: just use the
> existing compatible for the On Semi variant) but I figured the most
> common approach is to use a fallback value for 100% compatible models
> and this is what Rob suggested as well.
> 
> This reverts the driver change and makes the "onnn,74hc595a" compatible
> use "fairchild,74hc595" as fallback.

Is there any reason to introduce a new compatible name at all? Does some 
pre-existing, widely-used DT blob use it in the wild already? If not, 
then I don't think it's necessary; for any new boards, their DT's 
authors should just use the pre-existing names.

I'm especially against introducing a new, vendor-specific (On Semi, in 
this case) name; if we really want to introduce a new compatible, at 
least make it as generic as possible, i.e. `generic,74x595`, or even 
`generic,spi-shift-register-output`.

> Bartosz Golaszewski (2):
>    Revert "gpio: 74x164: Add On Semi MC74HC595A compat"
>    dt-bindings: gpio: fairchild,74hc595: use a fallback for Semi
>      MC74HC595A
> 
>   .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 10 ++++++----
>   drivers/gpio/gpio-74x164.c                             |  2 --
>   2 files changed, 6 insertions(+), 6 deletions(-)

Bence


