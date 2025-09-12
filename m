Return-Path: <linux-gpio+bounces-26010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 583DDB544C9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 10:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1492D17F54C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797362D9EF0;
	Fri, 12 Sep 2025 08:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cilfCyRH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A32D47E4;
	Fri, 12 Sep 2025 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664708; cv=none; b=qFzPDR3LOdEE47aWMwh19bt1p/XbHGvIAwafGebvLF0NWUXT5HbPtDtHfXR+bI71m3wMZc2vhJYGaXSh3oy+DdDEIZXkrXm3vxSny1D60VfYhFtNyomvMKn4nJBBjIbIpmnQtDdbL+4/19tli9SLO687PwhL8JuHA9BeSnDW9Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664708; c=relaxed/simple;
	bh=ChD5uzNPZ1WBHrWScX2ak5FoHQeYerLzYbNrlQE8re4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMr6hUX69OmsCVCqoBW1S2eXMGAAxd8fUIQ5uHLivw8N4uEhwnU4tvF3Dy6zMugnnQe4LjzxVg3VyNZWR6tyPyO5AXlAex6nRrxHvWvFFIbpAjijQ706K7uuJWcM/PSjMW+/K++ucSrE7ERG+2dTcfENherQVMQQTzHD65Vx5Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cilfCyRH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664705;
	bh=ChD5uzNPZ1WBHrWScX2ak5FoHQeYerLzYbNrlQE8re4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cilfCyRHe4aX0DqLgy+NZgtdbGXyJGobjPngaOq3MX8OOSAF6aHK86amPYYrYaYzx
	 kXT72uwglGG0J6JeCE9QS0l+mQUez42hd6YhJHb4SQU8vlbED9s9aB8qGX4TIXn1wY
	 JVZFlakfvMyiuLWMtf4PhrRfBrhiZeh+QNvLquH0feTVub/iPiaSTiwBuuovx5mO18
	 X87oBp57iBy1trJpG61b8vMZDi+gdJUcIM/PkfvX4c31vdgyjiQczC9GOIHdQ2fifz
	 kLTTGEP4uDMF/e9qibi79+usdAKnNxtVv6rTlYzFKEwU69UiZfg0c+4pXZya7t9UyB
	 CcQA7LT9w5lbg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 383BB17E1301;
	Fri, 12 Sep 2025 10:11:43 +0200 (CEST)
Message-ID: <b4358926-cb35-4123-9629-b1eb0b7113ef@collabora.com>
Date: Fri, 12 Sep 2025 10:11:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] arm64: dts: mediatek: mt8173-elm: Drop unused
 bank supply
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-11-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-11-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> The mediatek,mt8173-thermal device tree binding schema doesn't allow
> regulator supplies like the ones defined in mt8173-elm.dtsi. Drop these as
> the associated driver doesn't implement them either.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



