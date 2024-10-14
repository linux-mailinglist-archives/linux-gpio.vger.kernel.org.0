Return-Path: <linux-gpio+bounces-11273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C95EC99C277
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B5531F23A84
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE05014A09C;
	Mon, 14 Oct 2024 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DBM/qrU7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ACD13AA53;
	Mon, 14 Oct 2024 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892990; cv=none; b=as5HcwWKkuydqBwkaCuFWv8rSetV93WB45D2yPNIrqbHqn2/Ju489XZlKPoliS2JhtyDjwdC5NIDAoXJ82cdh48boyWsot+Og4VrZ8Jk8uBK6Y3G+dFv84VJUI5OhbaSJ0i/Y/W3hcy4Ips3HtszhzeFQ/kTi9HI+comdW9/hpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892990; c=relaxed/simple;
	bh=SyhQsYUVHECUxhjoE6eiAt+DlVG70JsuMxqwJVecDtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smxDyu+XVegwfLQwrZKB6vjjFIQTRbVNaTwulvECelF82D9uRWrgqXzhF4No/l6rLCGRGqGlIWi5ARodkeTOWyWIt9CdvtTQ5yu47AgUUxgRCugp/yAMBDCGJjk72G/ugIbO4NVL9T1j84gY9S/qrEjfE5x3PMG+R1UI131W2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DBM/qrU7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892987;
	bh=SyhQsYUVHECUxhjoE6eiAt+DlVG70JsuMxqwJVecDtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DBM/qrU7VChjgNdwqwukRbBPv28OLN0nzNeh/5pwhFKQPAQa5x36fidH6wyi312ND
	 Vz66Tn07h/l4kgT4RUV1SpxdkqgUz8dIT+l3eftDlISTVcNtujmiXDPdLwz9NuIl6w
	 +lnIlAKOpwo5eIxPk0Gj+51L4BehfpaZJHnYlrG0ANp5QGmNdcQapoNiG41mO2c1s8
	 lgeoukFwqCWckqUtcfS6uEoeN4oIcdqENM7xWfFQ/c0aGO+wNldNc5ssHY89r64yDH
	 IMyS4jK5wOzvlB+aHCJBo/fVxH10h0Gpt2OcAnEjEoxfwPbvGmOks5/Iox9gxzvWKj
	 I7rI9iJIlIGkQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C340F17E10C7;
	Mon, 14 Oct 2024 10:03:06 +0200 (CEST)
Message-ID: <70dcdca0-da9c-44fc-a701-aae1159d369b@collabora.com>
Date: Mon, 14 Oct 2024 10:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6735 pin controller
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-8-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-8-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add bindings for the pin controllers found on MediaTek MT6735 and
> MT6735M SoCs. The pin controllers on those SoCs are generally
> identical, with the only difference being the lack of MSDC2 pins
> (198-203) on MT6735M.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



