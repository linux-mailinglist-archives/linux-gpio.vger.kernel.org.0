Return-Path: <linux-gpio+bounces-26809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E38BBD781
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 11:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 628871896558
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 09:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293F91FF1BF;
	Mon,  6 Oct 2025 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nNR4zdDk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AE81F63CD;
	Mon,  6 Oct 2025 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743539; cv=none; b=d6Ma+IHN0qAEI5Q/PIQt5Gn5Hy8JQrH5c+yJsH2Il9gV3/fXCp5kqojwhFNI72I2/w+HkzIiS1zBb+9DsOotChaaB+nfcMf1YJZuy8ioNZCBvzP2u7CGX8cYe+CZ9X76okDJ/AXBZ7zAPeE4TCb47+wFaxsKCCzBZZu1md0+dXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743539; c=relaxed/simple;
	bh=VGWfaj8Jc+RJr6PNFRH8ZLLpOaLe5dnDc71A2t0YLZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhDhE/ReSXsMoqWeAqUCyCzXt1W5nF/Ox/B/Lyv+IFp6vqNCqKFAx1+pPa7Az8WHBnLHK0KjesChM3f8/GX4URAQs8jkpULDyTmD+9lfi0Vo9PNH/pUwQM8Y/vNOXM2LyOf9bVAF1NcJtwuvzo2xxE8LCT6NQywCdr2mWOhXd9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nNR4zdDk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759743536;
	bh=VGWfaj8Jc+RJr6PNFRH8ZLLpOaLe5dnDc71A2t0YLZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nNR4zdDkBV58C6+8qKwLmWWiFLn1XSz0SkCndjLNlz6jYxdICDJHXVsEVLcxcwx84
	 qZHg2HM/NSoffFxRJtdvTkqQqWScAOoorSA80U26A+gQx+kwxay4CkxNP9o2qACHkA
	 9k5kjW5dfLEJ9nOzcqqKwKrhZf4X562iWCkfjdx7VyVZBC59fPMrhQ8Qa54pN+veha
	 GL081DkvsbJ3xdCIh165w+OUTX6qnz1uqwKSANz3yAmnDwOePzAmYmxNhBa2SKMt8b
	 vEPg7qHVMFAi1J6E1ttI33LLC3/k9yfK6SEODctsC+IvmBR0F6qioj7oyiX96qqB+I
	 xQqMiPsmxK3UA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B014817E009B;
	Mon,  6 Oct 2025 11:38:55 +0200 (CEST)
Message-ID: <a1d9a470-c6fe-4c8d-b36a-c4952c4d3494@collabora.com>
Date: Mon, 6 Oct 2025 11:38:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: mt8189: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/10/25 15:48, Louis-Alexis Eyraud ha scritto:
> The mt8189-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8189_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8189-pinctrl" dt-bindings, leading to possible dtbs check
> issues. The mt8189_pinctrl_register_base_names entry order is also
> different.
> So, align all mt8189_pinctrl_register_base_names entry names and order
> on dt-bindings.
> 
> Fixes: a3fe1324c3c5 ("pinctrl: mediatek: Add pinctrl driver for mt8189")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



