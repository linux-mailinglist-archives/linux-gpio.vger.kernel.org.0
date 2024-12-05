Return-Path: <linux-gpio+bounces-13533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0C79E510F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 10:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D888162120
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 09:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B791D515B;
	Thu,  5 Dec 2024 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="ktA/SVxy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5771E2391A8;
	Thu,  5 Dec 2024 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733390325; cv=none; b=mwvWWGauBSNO4grdVykTFF1Ds++4QixVSTeJt0o6Fa+CgutHD72LJaFKtN03ZhH0Sz7ZjwaFy4ZIojEay4GodHz0yFlCYPM2wPMfAXk6HgzoC0oWUqSVorolGGuo6PhP9TdiKtHONNFdNmZVDMmY1Y/1msbUl6PzUr4jAJAsQ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733390325; c=relaxed/simple;
	bh=GhbKRmnzpsD9P8ZhWIKEmkuvB4oLjoK1qLvvJUUuALw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=j02Ee2mnEy/JuNye6kaFFwzyX7OPokCK8ZrVu860Jeer8LgFiYJorgJ/SK9bG0/QO0+k03hFgK4Xpc9wVHxca+aHNtcIG3NwHNg1ON/hSZkLO5NIt3nwYMINaVRL8gQtyyTw35Usmw3Rqgqgky9c+g1m/R8RmyLSysEKt9ODyiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=ktA/SVxy; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 1E598616B6;
	Thu,  5 Dec 2024 09:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733390315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmHKOegUCAzoPx5EkMu41F32NHwcGnKPOxcKrUxVd5c=;
	b=ktA/SVxy29czMtiMwoNkO0otnKMqpmC2qOUufS7HEFUT1mYbgADtOkMSt72qLdvCi+POZX
	OB/5NETolms6U2ObIGquvlnOH6bkGwM62Igmr539l8N7geOb1SNS9nZvi9cses7AfFP2Ml
	/CJAZbhdHzk3IHeLTdH5g35lQ++m+kU=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 545051002C7;
	Thu,  5 Dec 2024 09:18:34 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Dec 2024 10:18:34 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: frank-w@public-files.de, Linus Walleij <linus.walleij@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean
 Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
In-Reply-To: <6ebd58fd-8461-476c-9266-a21455d5e819@kernel.org>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-4-linux@fw-web.de>
 <iwmnxlqpaijvr4kmzwk3elacqj5ukqlchfs67ca6c6gxrycpbb@pc6a6scqkdi5>
 <1DBA844B-4DB2-4AA2-BF04-B3CC39B3C3F8@public-files.de>
 <6ebd58fd-8461-476c-9266-a21455d5e819@kernel.org>
Message-ID: <6926509bd56cbb32125a978c939b28ab@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: ac2b3ffa-74bd-41dc-bc2b-b3b7e5131251

Am 2024-12-05 08:35, schrieb Krzysztof Kozlowski:
> On 04/12/2024 08:41, Frank Wunderlich wrote:
>> Am 4. Dezember 2024 08:35:37 MEZ schrieb Krzysztof Kozlowski 
>> <krzk@kernel.org>:
>>> On Mon, Dec 02, 2024 at 12:00:37PM +0100, Frank Wunderlich wrote:
>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>> 
>>>> This adds bindings for MT7988 pinctrl driver.
>>>> 
>>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>>> ---
>>>> changes in v5 (so not adding RB from Rob given in v4):
>>>> - do not use MTK_DRIVE_8mA in example
>>>> - add _0 functions for pwm
>>>> 
>>> 
>>> <form letter>
>>> This is a friendly reminder during the review process.
>>> 
>>> It looks like you received a tag and forgot to add it.
>>> 
>>> If you do not know the process, here is a short explanation: Please 
>>> add
>>> Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
>>> or above your Signed-off-by tag. Tag is "received", when provided
>>> in a message replied to you on the mailing list. Tools like b4 can 
>>> help
>>> here. However, there's no need to repost patches *only* to add the 
>>> tags.
>>> The upstream maintainer will do that for tags received on the version
>>> they apply.
>>> 
>>> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>>> 
>>> If a tag was not added on purpose, please state why and what changed.
>>> </form letter>
>> 
>> Is this an automatic message? I guess yes...
>> 
>> I have not added it (robs reviewed-by) from v4 due to changes and 
>> explained why in changelog. If i'm wrong please let me know.
> 
> Where did you explain the reason of dropping review tag? This has to be
> *EXPLICIT* but I only see:
> 
> - rebased to 6.13-rc1
> - moved dt nodes with mutliple options to BPI-R4 board
> - changes suggested by angelo in v4
> - changed example in binding and dt node to not using const 
> MTK_DRIVE_8mA
> 
> 
> Nothing here suggests even remotely that review tag was dropped. 
> Nothing
> suggests that it should be dropped!

here:
>>>> changes in v5 (so not adding RB from Rob given in v4):


> Best regards,
> Krzysztof

