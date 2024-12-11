Return-Path: <linux-gpio+bounces-13747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDD49EC788
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 09:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 665D116A5A6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 08:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188D61DDA14;
	Wed, 11 Dec 2024 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="fET0avlR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21B68489;
	Wed, 11 Dec 2024 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733906649; cv=none; b=ThL46FX1tE+61lZ5tEoxqXkWhTCAq8cUk0DSJCBR//c1t1z37F8ffVfWZS6onmvKlaHsVM49L5+0e8x/Xm09FsadngqQSwmBHUHKV+ywy8V0/u01+0lytjWbJohxG5aGph45mu7EpBlSQgZb/LPZ9nIxOHF0DRnKz+k+Mug1ZGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733906649; c=relaxed/simple;
	bh=/PcBGhHEt4WHwzP0k5DYrT6el/XNOWWzhcQsKxmNuU8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=h7MPnBJZPFqzOiplfuISWXi9cKvMHyN787LtWPVCQTWh8tuvClA4JtT5ZAaMVh1+yEQ1M/JNViyPcAytHHGnwhe/Ru0zYdmCOdzqrwGjN6Lz3BRx05JqVK59IpcINgXTaWIVyz6694DpxWluCn0n3L4k4Kn7MkENQ6y1tKV0TQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=fET0avlR; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 13DE340349;
	Wed, 11 Dec 2024 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733906639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUoipqwINErtScImQT/pK8ikFLW9WxsFyv2aWgrTKQU=;
	b=fET0avlRfjFvv6n1c4Q7Byb5prAb2b6BY2o49YLKT3+i/tNGTqN5LxuMYxmsigTLJ5WuZf
	TduRVyFFyJpATin75Ah4YgvM0WSqzgGn1JPEQJEAfgVGQdO/sSNxB9HZ4U1CYfVH+ihB2k
	LOvt0BkmZZ0UPpSCW1ka4m2JJZ+PhY8=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 46180360076;
	Wed, 11 Dec 2024 08:43:58 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Dec 2024 09:43:58 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean
 Wang <sean.wang@kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Sam Shih <sam.shih@mediatek.com>, =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?=
 <arinc.unal@arinc9.com>
Subject: Re: [PATCH v5 2/5] pinctrl: mediatek: add MT7988 pinctrl driver
In-Reply-To: <32201aec-f3d2-49a7-b0ca-2ede10fec103@wanadoo.fr>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-3-linux@fw-web.de>
 <32201aec-f3d2-49a7-b0ca-2ede10fec103@wanadoo.fr>
Message-ID: <598f595589d061bf314d942095cd5dc6@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Mail-ID: f7caaa60-9ba2-4071-927a-9434349a1399

Am 2024-12-10 19:45, schrieb Christophe JAILLET:
> Le 02/12/2024 à 12:00, Frank Wunderlich a écrit :
>> From: Daniel Golle <daniel@makrotopia.org>
>> 
>> Add pinctrl driver for the MediaTek MT7988 SoC.
>> 
>> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>> [correctly initialise for the function_desc structure]
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> 
>> ---
> 
> ...
> 
>> +/* flash */
>> +static int mt7988_snfi_pins[] = { 22, 23, 24, 25, 26, 27 };
>> +static int mt7988_snfi_funcs[] = { 2, 2, 2, 2, 2, 2 };
>> +
>> +static int mt7988_emmc_45_pins[] = {
>> +	21, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37
>> +};
>> +static int mt7988_emmc_45_funcs[] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 
>> };
>> +
>> +static int mt7988_sdcard_pins[] = { 32, 33, 34, 35, 36, 37 };
>> +static int mt7988_sdcard_funcs[] = { 5, 5, 5, 5, 5, 5 };
>> +
>> +static int mt7988_emmc_51_pins[] = { 38, 39, 40, 41, 42, 43,
>> +				     44, 45, 46, 47, 48, 49 };
>> +static int mt7988_emmc_51_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
>> 1, 1 };
> 
> At least all the _pins arrays could be const.
> Maybe we could also make it possible to have _funcs const as well.
> 
> ...
> 
>> +static struct mtk_pin_soc mt7988_data = {
> 
> const?

can do, but for funcs i see no clear way

angelo, can i keep the RB, when changing pins/mtk_pin_soc to const 
(without changing macro in drivers/pinctrl/mediatek/pinctrl-moore.h)?

>> +	.reg_cal = mt7988_reg_cals,
>> +	.pins = mt7988_pins,
>> +	.npins = ARRAY_SIZE(mt7988_pins),
>> +	.grps = mt7988_groups,
>> +	.ngrps = ARRAY_SIZE(mt7988_groups),
>> +	.funcs = mt7988_functions,
>> +	.nfuncs = ARRAY_SIZE(mt7988_functions),
>> +	.eint_hw = &mt7988_eint_hw,
>> +	.gpio_m = 0,
>> +	.ies_present = false,
>> +	.base_names = mt7988_pinctrl_register_base_names,
>> +	.nbase_names = ARRAY_SIZE(mt7988_pinctrl_register_base_names),
>> +	.bias_disable_set = mtk_pinconf_bias_disable_set,
>> +	.bias_disable_get = mtk_pinconf_bias_disable_get,
>> +	.bias_set = mtk_pinconf_bias_set,
>> +	.bias_get = mtk_pinconf_bias_get,
>> +	.pull_type = mt7988_pull_type,
>> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
>> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
>> +	.drive_set = mtk_pinconf_drive_set_rev1,
>> +	.drive_get = mtk_pinconf_drive_get_rev1,
>> +	.adv_pull_get = mtk_pinconf_adv_pull_get,
>> +	.adv_pull_set = mtk_pinconf_adv_pull_set,
>> +};
> 
> ...
> 
> CJ

