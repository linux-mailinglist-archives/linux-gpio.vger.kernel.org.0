Return-Path: <linux-gpio+bounces-8509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17C944670
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 10:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EC831C2178C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 08:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D84916E877;
	Thu,  1 Aug 2024 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IIl8/0BX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02A16E861;
	Thu,  1 Aug 2024 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500531; cv=none; b=D2FOy8VvVwQO20jP6v/AgbcuMW9Im0MFtJa+0khILS7bCn4TMuPwQJlr1hqbuYvRhveo4xJ7KU2bMHGII4dL22NCVzjdXIs+oROB4+pCpS3XzreT+UDemn5UHCzzUDVfIbHB3PnhNnjyDakJa664D4bUxk7nxH9l4MWaWGqvf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500531; c=relaxed/simple;
	bh=Xko+NGsgt715KHl+KdqbOzHGFKdB6jEcV92XWqA000w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=St+ZrKquJVr8Sk4NcbCC/BELQVSzO0+Nnq8FCEnDXF9H9NoyniWgSI3esG/9Kw8ZK4IVAw6lE0AXUkJbSb+3DJTwQezXQFF/G/p0Hc3DmGyFY1ldnvqNIsge9sN21uszkvi1FD78GAsRA1dUyFfK9GzmtLe5L00D0uOOjON0bBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IIl8/0BX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500528;
	bh=Xko+NGsgt715KHl+KdqbOzHGFKdB6jEcV92XWqA000w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IIl8/0BXar3kAxacRVfXMmthv8nvZzqt775T/PhSRQ3v+zjFQkA3cY0Nxkh4TEppI
	 u01uvejUNjYfIbwYUoYejU0X4MMIUtsmO9WQ5fk63BiGd1bXh3R1EAFc5axarbc2Pf
	 VPTUnPyqGeebN48ZsXZ2Ei0NAJotvoCOjVHXhWol3tGuIS+OVVFY0UsAMBx+Rqi2Rn
	 ETgEHjx4SsdSmHt/UUP3qvrefd3PUxHioeKYeV9CbsIYW05hlYY+uGJCvkranQIIbZ
	 tO94n28WM6163CmMVb2JA4TNt1+whPT90lzO6SRMjjv0coivfdmUDf785dWqimMuaC
	 iodnKJVNLpFjA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A64B3780520;
	Thu,  1 Aug 2024 08:22:07 +0000 (UTC)
Message-ID: <8fd089d2-ac4b-4f6b-9870-4ccdfd320887@collabora.com>
Date: Thu, 1 Aug 2024 10:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: Use of_property_read_bool()
To: "Rob Herring (Arm)" <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731191312.1710417-23-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240731191312.1710417-23-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 31/07/24 21:13, Rob Herring (Arm) ha scritto:
> Use of_property_read_bool() to read boolean properties rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


