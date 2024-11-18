Return-Path: <linux-gpio+bounces-13061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5747C9D09DB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 07:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F2CA1F21F54
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 06:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435D954652;
	Mon, 18 Nov 2024 06:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="REq9SpKa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D4146A87;
	Mon, 18 Nov 2024 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731912764; cv=none; b=I+pFcBjSaSwax8Rf6QzctnWSelTIWu2BdRWo43K2d8fuHGKyO45kKWxh9UHo35KC1JpmMcovvWeSdMQc5EPQyGyWM3oNVRdpXynh1u3K4uMGyHQmxJ7A7YJA3b+28V6hQE+1VZy7l9hqPwL/tlGkzxvRLIe+ryEftpmElwz6yAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731912764; c=relaxed/simple;
	bh=Wzof8Ms9Bx1I7gMnTWBqwPj9iq0cMnT9zRVArVqYBMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GzwH22vFbRpWo/gOoCJ0zNps+ecTspXxMXjL9JQoSQCmgFyAn+D3dvM5dhvntR8r6LKS1JSFTho/VOLp9/8dm3K2TCNCmt62/GD7GAbYY9c8MlHHlKjqdZxZcX/h1hgwPV86GL9eY59/6WSlAfn6ohbjtI+ie2ss1cW0sfoKBuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=REq9SpKa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912759;
	bh=Wzof8Ms9Bx1I7gMnTWBqwPj9iq0cMnT9zRVArVqYBMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=REq9SpKa55aKFUCf7qaWWO4c7scByRAFfFKwKtlJNh+w6CdWHSW3YHxLfsujwPfCV
	 u/rw5xWvZA3YdXA1vCIv9VbUmsy9l9kMqYTbsEWdGyt96ZJ8Xn19MH7iXNq9omjra1
	 JGGmoGLbyXriE+y+44nAx+Z4Vpg+Z6gYSRGNJkxQIsLlhcBD1q+jCwvsrypFIgCo2l
	 EuEjAvkZxVwtNWmsghTzUe9tIoyZlWlwARlOsMBVFAjSE863P6CUrANHnq0FTymP6j
	 JeiFTkEG1xjgsxtzAPDz2wSy/d+SHmtM23uGGdmmmJ56lPt2d5KMg3mRzuNt20l3SE
	 IJL7ugd3ZTBjw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2CAC717E1232;
	Mon, 18 Nov 2024 07:52:39 +0100 (CET)
Message-ID: <ddf945c3-8bb8-4f20-b53b-5cbf6579a1da@collabora.com>
Date: Mon, 18 Nov 2024 07:52:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: airoha: Use unsigned long for bit search
To: Kees Cook <kees@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <20241117114534.work.292-kees@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241117114534.work.292-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/11/24 12:45, Kees Cook ha scritto:
> Instead of risking alignment problems and causing (false positive) array
> bound warnings when casting a u32 to (64-bit) unsigned long, just use a
> native unsigned long for doing bit searches. Avoids warning with GCC 15's
> -Warray-bounds -fdiagnostics-details:
> 
> In file included from ../include/linux/bitmap.h:11,
>                   from ../include/linux/cpumask.h:12,
>                   from ../arch/x86/include/asm/paravirt.h:21,
>                   from ../arch/x86/include/asm/irqflags.h:80,
>                   from ../include/linux/irqflags.h:18,
>                   from ../include/linux/spinlock.h:59,
>                   from ../include/linux/irq.h:14,
>                   from ../include/linux/irqchip/chained_irq.h:10,
>                   from ../include/linux/gpio/driver.h:8,
>                   from ../drivers/pinctrl/mediatek/pinctrl-airoha.c:11:
> In function 'find_next_bit',
>      inlined from 'airoha_irq_handler' at ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2394:3:
> ../include/linux/find.h:65:23: error: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Werror=array-bounds=]
>     65 |                 val = *addr & GENMASK(size - 1, offset);
>        |                       ^~~~~
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_irq_handler':
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2387:21: note: object 'status' of size 4
>   2387 |                 u32 status;
>        |                     ^~~~~~
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



