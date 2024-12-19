Return-Path: <linux-gpio+bounces-14019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D91119F7BA8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 13:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D57171892368
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 12:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC68E224AE1;
	Thu, 19 Dec 2024 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l25unRnP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E7A224899;
	Thu, 19 Dec 2024 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612121; cv=none; b=q9T8PZQ1FdAxKFUqSer+HbKKCM+PrFjnc2fLM6Fhmmo1OTOEPXo9EAPvpfzg/gMNy6MM5MXfwuY02I6kCDiUYeLbvkW5eqmBUyJXZZFxQKEYkrp0RkEEBXS8EjKzB9atAibirTrjmoJjF5ucULBWUjXcKmhIMDLbDOighQ8Y+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612121; c=relaxed/simple;
	bh=wDrACSxE67QlUQtertVzUZUXLm2imMYI+ZYK5RaLBLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNkg+VhwCCQpq0eFT7+sJARMTGTTuIi9wR2mQ+zOxyIocXALw+8IHSDQ27PyS9lMS1qcZ6NiWPmG+TRrad8H5PYVzBaj8yvld+2f6UU6Q3OELG60pzveCaV30aUBid2vSwqnC7/OmKfJcYpa+Rl6rF9AVkD2GSP0408ACzb2Sw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l25unRnP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734612118;
	bh=wDrACSxE67QlUQtertVzUZUXLm2imMYI+ZYK5RaLBLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l25unRnPqzQ9eRY7ufOjAlOAx6AwZm3jbmWEww1Eggzq9GhuwrNflP7v5zbC63r/l
	 x1oulzEAEYjvcxAbr0pJdwD5LXTjVWyeiGMbkdn6ziC4EbCfOXf8sjLVUbmXFmJpzV
	 INm68E014y8KxKsvdMfNMh6ZviK+A8x3USF7UGYTIe6twGOzXF8TLN6nMhf+ncnS0n
	 k896Sc0cwIReJEUCLVSU+FvLH0+hV28r5OZ1OWXXsgAd5/nbgPMwNmgsf5+vE0mwh5
	 qrkNvG+Zxg7BzaYn416dez0Vj5Zis+js3QB4dCxCdJXGSBMXjQ7TbfDSd2z09w4M0s
	 t/0BiSyPuv0Ow==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D54B17E36AF;
	Thu, 19 Dec 2024 13:41:57 +0100 (CET)
Message-ID: <e9fb2634-5b47-4f68-ad7c-26a4f52d0df8@collabora.com>
Date: Thu, 19 Dec 2024 13:41:56 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
To: Rob Herring <robh@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Frank Wunderlich
 <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241217085435.9586-1-linux@fw-web.de>
 <20241217085435.9586-4-linux@fw-web.de>
 <4ecfcdd3-3c81-4625-90cd-1d45f6d71a2f@collabora.com>
 <20241219123441.GA4016373-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241219123441.GA4016373-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 19/12/24 13:34, Rob Herring ha scritto:
> On Thu, Dec 19, 2024 at 12:56:23PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 17/12/24 09:54, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> This adds bindings for MT7988 pinctrl driver.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> DT binding maintainers, can you please review this patch and eventually release
>> an Ack so that I can take it through the MediaTek tree along with the devicetree
>> changes?
> 
> It's been 2 days... If you want to know the status and where you are in
> the queue, you can check patchwork[1]. But guess what, you're #1.
> 
> Rob
> 
> [1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/


Rob, I was checking the patches to apply to the MTK trees and while in the
process I didn't notice that this one was sent that early.

Sending a ping after a short time wasn't intentional. Sorry for that.

Cheers,
Angelo



