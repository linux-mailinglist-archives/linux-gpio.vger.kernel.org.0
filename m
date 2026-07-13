Return-Path: <linux-gpio+bounces-39980-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z0slKnjiVGq8gQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39980-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:04:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1664C74B40C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:04:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=abscue.de header.s=dkim header.b=TfnRqYCj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39980-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39980-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F90A3049AF8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F028B4189B3;
	Mon, 13 Jul 2026 13:01:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99E416CE2;
	Mon, 13 Jul 2026 13:01:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947700; cv=none; b=AlSFtCeiZHpsCMH2D0vyhLTVWMNUrnvi74mJdidNSVva5Z3fiZGATgGBRygYLVli29LWN3NYzZ65SJVTpPOikkxFCe7AB14S9jJ53XrFYZdfSFiuKhStJaMFNa5/pwTJ4oC+Dctuj2pmkZ3/NvIYm38X2Akd8epKIqF3r2Pnmcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947700; c=relaxed/simple;
	bh=BwrO3/MsLOx0N0sI+Mj+GfChy3yrdeQ+2EJMwPhwp2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rs7fCJvN7YaTzvSDklDWlAsMXp2TApsvQWudE9iPyySiJp57XGtuqwYCC45/+ETyK5di9otO7JqpxApCexjo9Xp6/Wz6AF++aWYJnGzNCPX7dtvfik6OhGpd670ZhZMBplNryU1cy6nCj5DU2ZatxhBF3/uoyOyb8EAryCzteCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=TfnRqYCj; arc=none smtp.client-ip=89.58.28.240
Message-ID: <2d34c3f6-5f66-4b60-b9a2-180163964552@abscue.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1783947103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzVe8atkrU+j+S9mStRrtWyJtCiaN5tTvQ4xvIGKY4g=;
	b=TfnRqYCjfBvrXj255IPTjN/a+2WqhfzYlNYRwwgkTzsAZghsBX+j+IFD3Sm0Jm1J253j8C
	LIFgZHSnhERrtO5gD1FtHfosFOl217I05vxwWIjmR1ereLDLyLq2rgkdVDF1r2Pc1WoaXS
	8phx60lWlBl8U7HmgzV9b0HzZVB3Tdv8GdzHwWF5YcFXkGAB/CN4vVLFLcKtvPCi63Uq50
	KqcmE/hMF05vOd3Fqm81umPnyewCDTJTxAqukIiOJ06c2wE8KaAaxb16H5qYQ/tQR+CLth
	1SzGtzdImvS/B2sG8uANcSpQsk0UK1nvZ4hTlKjA/b1foUCa8SiPjQCL0LhOTQ==
Date: Mon, 13 Jul 2026 14:51:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add driver for MT6858
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nikolai.burov@jolla.com,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-2-f75ab558f0df@jolla.com>
 <89e4eb3d-a61c-410e-8ad5-e845b07f8029@collabora.com>
Content-Language: en-US
From: Nikolai Burov <nikolai.burov+review@abscue.de>
In-Reply-To: <89e4eb3d-a61c-410e-8ad5-e845b07f8029@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[abscue.de:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:angelogioacchino.delregno@collabora.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov@jolla.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:sean.wang@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[nikolai.burov@abscue.de,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39980-lists,linux-gpio=lfdr.de,review];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[abscue.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[abscue.de:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikolai.burov@abscue.de,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,jolla.com,kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1664C74B40C

On 7/13/26 10:01 AM, AngeloGioacchino Del Regno wrote:
[...]
>> +	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6858_pin_mode_range),
>> +	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6858_pin_dir_range),
>> +	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6858_pin_di_range),
>> +	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6858_pin_do_range),
>> +	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt6858_pin_dir_range),
> 
> This is Slew Rate, not Direction... And I think this is wrong.
> 
> If you don't know where the slew rate registers are, or if that is an 
> unsupported operation, just omit PINCTRL_PIN_REG_SR.

Thanks for noticing this! This seems to be a mistake in the downstream 
driver that I unintentionally copied over. I will remove the slew rate.

> 
>> +	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6858_pin_smt_range),
>> +	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6858_pin_ies_range),
>> +	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt6858_pin_pu_range),
>> +	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt6858_pin_pd_range),
>> +	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6858_pin_drv_range),
>> +	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6858_pin_pupd_range),
>> +	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6858_pin_r0_range),
>> +	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6858_pin_r1_range),
>> +	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt6858_pin_drv_adv_range),
>> +	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt6858_pin_rsel_range),
>> +};
>> +
>> +static const char * const mt6858_pinctrl_register_base_names[] = {
>> +	"base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1", "rt", "rt1",
> 
> Fix ordering:
> 
> "base", "lm", "rb", "bm", "bm1", "bm2", "lt", "lt1", "rt", "rt1",

The bases are already in ascending address order. I don't know what the 
1 and 2 suffixes in the names of the iocfg regions mean, they may just 
be a historical leftover. Are the names more important than the 
addresses here?

[...]
>> +static const struct of_device_id mt6858_pinctrl_of_match[] = {
>> +	{ .compatible = "mediatek,mt6858-pinctrl", .data = &mt6858_data },
>> +	{ }
> 
>      { /* sentinel */ }

Thanks!

[...]
>> +	MTK_EINT_PIN(119, 0, 72, 0),
>> +	MTK_EINT_PIN(120, 0, 73, 0),
>> +	MTK_EINT_PIN(121, 0, 74, 0),
> 
> Looks like you're missing ~70 pins here?
> 
> If those have no EINT support, you can declare them as
> 
>      MTK_EINT_PIN(122, EINT_INVALID_BASE, 0, 0),
> 
> ...or you can add a macro to add a (sequential) range of pins with no 
> EINT support.

Adding a variable number of mtk_eint_pin structs (with a different pin 
number inside each struct) doesn't seem possible using a single macro, 
so I'll just manually add all of them to the list.

While writing this, I was looking at the mt6878 driver, which also omits 
a range of pins. Should that be fixed as well?

-- 
Best regards,
Nikolai

