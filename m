Return-Path: <linux-gpio+bounces-17921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB13A6DF4F
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 17:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A37CB3B0E4C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 16:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04502620C3;
	Mon, 24 Mar 2025 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UFTK7VIn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12AC25EFB8;
	Mon, 24 Mar 2025 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742832648; cv=none; b=e9Bxg8QJqz8ObjOS65mPafgGgqz05I+oJ8ijSYbvYxyMYDFX8FQJrVdhgt+niLO/s0thW/Y/1PSQnJTs5NDPWspoR9ck5DVYcQTW463W3q95NEh+7v+qHtSicAj/lbw9BjyvZRyUMbVGkPEUd9z6T/bQPQNkzNKHe+Jg0qT1yJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742832648; c=relaxed/simple;
	bh=Gu2l2JLxMDCWKF/ck8d4RiqN/9CsaCC/fejEKfEzVwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3s46qwI5dnyD9D/Aee50waFPXf8lg4E7iV2rKn/m/lo+rjSEbRzokEthoU2wdDq6W7Hpo0RoSQYOpmJL3xqid6Ho1+NzAbWit+AeQFzaGnLQX9lJlrhhsiKzGxZeLNqtquTCGKin8yQXgkX3b5mZQvb8Dl9Ip8d+g0qPPtoMgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UFTK7VIn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742832644;
	bh=Gu2l2JLxMDCWKF/ck8d4RiqN/9CsaCC/fejEKfEzVwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UFTK7VIn1/I5hwkLfw1XtFbanIRysbesCsb7Fc5V2u10bJp47QKQJzMxNFMd5F+YQ
	 akSezJjNHkk1SM7F6Yg74KtRyeXn1RjJr5dXTsjZavrUokJhiDalxFZs1qUAziHsic
	 ltV6lzA8gJpa7SZF32lROzTPIL01r4ystflTk419bzbr294SJTQjVxwl3jneu+1hQX
	 3VW21ug4qlj7uAjAIKJqFir6xaRJPgUdCpLZ8lYDmNSM1YW8HcSjjV+iibRNwiv2i8
	 ZPwUOohPHhlJp7A4KR/uyhGj4f9R2Jaj3N7QaBl/FVdM04PIxxijVdBOkc0ijYn6MB
	 U1BpVWajMgaiA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D517417E0A50;
	Mon, 24 Mar 2025 17:10:42 +0100 (CET)
Message-ID: <d4af318b-1bdf-4abd-842d-461a763b79a4@collabora.com>
Date: Mon, 24 Mar 2025 17:10:41 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yong.mao@mediatek.com, Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com,
 Wenbin.Mei@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
 <20250321084142.18563-4-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250321084142.18563-4-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/03/25 09:39, Cathy Xu ha scritto:
> From: Guodong Liu <guodong.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek Soc mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


