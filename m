Return-Path: <linux-gpio+bounces-27757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B5C13966
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 09:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 290564E4FBA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 08:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C201F209F43;
	Tue, 28 Oct 2025 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X0nD8Ef8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6144C98;
	Tue, 28 Oct 2025 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761641137; cv=none; b=llBuZHFQPVTaCBN5wgT2zg361RHVwEbnHNegrNNY/zow33XXJikJZc+rAnQOtpZhmTMFa1aoaBV3QPP4RlCWyizvTN9ujCEQQuEUoHstx7mQ4CEnPbpBxvOZFLR/HXNUpb0MU4khHCLOKZEBpXxKgsQs/YQikzEMH1LF8tuj4u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761641137; c=relaxed/simple;
	bh=AzfMJnxDlLOurBkOwjsFhj7GPFZLhxcijnAWsYYiWpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+zU9VDbl2vpsCmI82JVzQciI0OLAaxWUfjinIm6bHnwCnPqw5IkcGMkYz5t2hA25Fcz13AkZmPjd+Jnvgq0AUwEd1UWunlrUAuHtjTLaP8mea2dmQl0Y4galOPRtOdfQlQ1Ek0aTzl6SK/FTQfKYERASkdDFR5iY/lcan1+Vj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X0nD8Ef8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761641133;
	bh=AzfMJnxDlLOurBkOwjsFhj7GPFZLhxcijnAWsYYiWpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X0nD8Ef80li5RM/i0fesne7rsefbId77wgY5dQqPZ/+p46Npgi57Ixd6Clyo7K2En
	 w+WmhFsu8DfyMvJLLF0/CYBB2aHJGFT7o1tpkjytMnM+rEGd/EiS0pd7gH01iUwkjv
	 cKAjWSdV3D7EUoM8L83giRV2z4BxkTCeCxfMGOBU7jZ6YDL4d3Vq+YSU2molrl250P
	 Jrxgx608OPhy4RzzFhSiSQedfHWcqDSH9xkZUoxaM+DZ6GrB92cPEvvLezPZRfphOM
	 KHdPeOmFbZflKFvYSe4CpHUzQrV26EWCq+Pw1al9OBUwAo0dU6sx14lbpD7NVdwXYa
	 +d+5i9L2Oxwwg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F070F17E126B;
	Tue, 28 Oct 2025 09:45:32 +0100 (CET)
Message-ID: <39602d94-7f2e-42b1-a77e-1d5a3e032277@collabora.com>
Date: Tue, 28 Oct 2025 09:45:32 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: mediatek: mt7988a: Add label for
 ssusb0
To: frank-w@public-files.de, Krzysztof Kozlowski <krzk@kernel.org>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251027132817.212534-1-linux@fw-web.de>
 <20251027132817.212534-4-linux@fw-web.de>
 <35504988-448e-4a5c-8ea6-769c06117c01@kernel.org>
 <F6FAB95A-9FF2-416C-B50A-C2B1808FC5FF@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <F6FAB95A-9FF2-416C-B50A-C2B1808FC5FF@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/10/25 20:04, Frank Wunderlich ha scritto:
> Am 27. Oktober 2025 19:58:23 MEZ schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>> On 27/10/2025 14:28, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add label for ssusb0 node which is used for BPI-R4-Pro.
>>
>> This makes no sense on its own. We do not add labels because they have 0
>> impact.
>>
>> Please drop or squash.
> 
> Thank you for the review.
> 
> I reference this label in part 4 and tried to separate
> changes in soc dtsi and board layer.
> But of course i can squash this to part 4.
> 
>> Best regards,
>> Krzysztof
> 
> 
> regards Frank

Yes, please squash this to the patch where you actually use the label.

Cheers,
Angelo

