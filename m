Return-Path: <linux-gpio+bounces-28156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC753C39B82
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 10:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACA134F8164
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 09:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEC2309EFC;
	Thu,  6 Nov 2025 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Jk22pwid"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C961271459;
	Thu,  6 Nov 2025 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419706; cv=none; b=c9YFloTWARAb8cs6wSQWq/UCURk7KmE51fChvJ2TVLJjpBdr6Nx7keH78rijDKZkrXL10lbFpIVAgSdo+Id9/wMJ/y10qaYIhL7d4JWbB3MRz7rRbSy6hkQqT7cFmkdEj3WGripFaWJulBiGvDt13T7UaQKNdB/PUnQarnA2TmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419706; c=relaxed/simple;
	bh=QcB4tTj1Ktd6oFfnLlrC9HHYo8w5fqDcLZG41VSOuC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncUOxivxkE6ObZhmF+pgqNsbRI7F1YveEQvgvi2PpAKrVWU0eBtYgmtgLPSJYglitRhfvl5r5aAEEsIHyfa0lu4JPziNnVNw3aLFMUy6pyr+v3iVCBiwt9mG8B1rotxYpfV2oNDFhVEz0q14RCNCjv2GcofJsT7t4Y+uh4ao0W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Jk22pwid; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762419702;
	bh=QcB4tTj1Ktd6oFfnLlrC9HHYo8w5fqDcLZG41VSOuC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jk22pwidtbtK/X3DkNJMhIA7sOVgGiU9p7ziVD72TsI/vSwcl5AaKNwrmC8xKpWHu
	 WNWctcbuVnJyYugfkekvTiBAIxghyHtCoHkJaFfrLhZ8ITFVyRhK2vtPwTspll9XOy
	 3I7r3iEne6g5YlLN7oqIyzuDcSAQMSqZII28go1oss41qUd6ioIHGxmFwKlscN58P1
	 V1gZ2BYfkWwJ+KQZWHssJk1BfSU16tC4IfibnmtOv8vQXdcPSXOhVsUOl0FL/IBnwn
	 H5IBBdTYqRV3g/jvpRn2K8WaU4UYWMCDnwcQ6uJsbq5TB1ECwzH/K2SJqNThBXg+tE
	 AahLN65keuQ1Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED3BC17E090D;
	Thu,  6 Nov 2025 10:01:41 +0100 (CET)
Message-ID: <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>
Date: Thu, 6 Nov 2025 10:01:41 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
References: <20251105195007.199229-1-linux@fw-web.de>
 <20251105195007.199229-2-linux@fw-web.de>
 <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/11/25 21:01, Frank Wunderlich ha scritto:
> Am 5. November 2025 20:50:01 MEZ schrieb Frank Wunderlich <linux@fw-web.de>:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
>>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
> 
> Seems Angelos RB tag is missing "a" in "Gioacchino" in email
> 
> Got error:
> said: 550 5.1.1 User does not exist -
> <angelogiocchino.delregno@collabora.com> (in reply to RCPT TO command)
> 
> maybe this can be fixed while applying?
> 
> regards Frank

Eh, have I typoed my own name?

So cool. Lol

Just in case it's needed:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo


