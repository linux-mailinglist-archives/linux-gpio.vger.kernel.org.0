Return-Path: <linux-gpio+bounces-23433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB6B09BA7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE1F1C25765
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 06:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B2720C494;
	Fri, 18 Jul 2025 06:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DwS0PG5m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E191FBC91;
	Fri, 18 Jul 2025 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752821107; cv=none; b=Urkn6ffvWyH1Aoy4NmthUYyKSZwDj4BQIyLNRwBWsoQD2F3DJ9xiHZlomoT9oQu0W8V6kzkkxIzBYMz24jWYQdUFl4mMAO9zEZSG8+V35O2/Qq4vr4soKPekFvwt8u7ZIYBnZ3gDIMp+Ve5gjnm7LczgENC29HWcir5GmhLC0aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752821107; c=relaxed/simple;
	bh=Flu8f5EEMoareDycOibeeDu3AxB1XnSACgaMHVsyW1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKmncHvLwu/+LBkLu5RRrIdkyHiWbhRJTOA+4Yo/Do3w12pRhVwC3kjBW4FAdwb7DeOqMuEbWJX5me97SqGX/vA8KDFQ4iju9BsavlD3UWHVDganrSsJOo8tvetaXUbVEV7grEOj+PfXcB/+p7VvxjoBOOu60mx3PlujLZdmJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DwS0PG5m; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752821103;
	bh=Flu8f5EEMoareDycOibeeDu3AxB1XnSACgaMHVsyW1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DwS0PG5m6sy8pPsSDEEPkvprigDV/c5LttouP7znEuzfmyNRglSTvLZd07oracBng
	 jDnOTaXFvrL/l83ZUOCpI+KHO6ojM9yqDnTB/Cu1qGRtDwKiKriNdFcAcvU+3KYsJS
	 igv6SR0FFKXofVtRVWudolGkdWUVlSuKzIChIOyosFoLFE082xvIYgseM/JndxKVas
	 9ubYc4UpQhpMMzc5Z6vFXwIyHKXNSuMOX+tUHDXuPqosjKabEIkvlrO3Jk1wtAE/Oe
	 4JV6uYUYheU3Lh7d505ApkMOVsBDaA0ZFEe6GKjOLU2CbrD+E0ohcP0Wi1aZILexk9
	 erbIGHatW5WhQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0455417E1544;
	Fri, 18 Jul 2025 08:45:02 +0200 (CEST)
Message-ID: <409ef1d7-1339-4089-ae28-37a7c032d15c@collabora.com>
Date: Fri, 18 Jul 2025 08:45:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
 <20250711094513.17073-2-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250711094513.17073-2-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/07/25 11:44, Cathy Xu ha scritto:
> Add the new binding document for pinctrl on MediaTek mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



