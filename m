Return-Path: <linux-gpio+bounces-33507-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEDjEiLZt2mcWAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33507-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 11:19:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95023297CDC
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 11:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80C0F3005EA3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADF938E5C4;
	Mon, 16 Mar 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rdMfKQKV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A538B7C3
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656351; cv=none; b=pEkaKPJUMFpGAEtB5oc2qOUSpimUkJpu3EYQAfS9y+7BhuLdq4OsE5Fk/bVutYG5LJzB10jdWWrlTR08VG8qN3VVlS0W4yB8XOhYDrqzIPAn5Pr2u9f6FkZZDC1g9pKnoVBb7aEVrH4R5DtjJFC7J+qp0fcSj1LFhw51e+HI94s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656351; c=relaxed/simple;
	bh=Z3Pv2UF3x1mOPl70WNEH733HqOKkS4/KHiIUlvtl3AI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQJHzxAjzcDtwE+Dt9iyceKE90fF8YCsnnoZuwBqRkYmGp+AM4TsWl4fXTsH/1ciQ4aLNV3OQrFznYkxqdP2beCV7fxzUYQovHUQuM+iHOk57FLfXPHBEjWY/TIwv4P0WI9Bz3ovboytBXjjWDrDPL3Prj2x2TxDz2TlqJOhtMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rdMfKQKV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48534237460so48636395e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773656347; x=1774261147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guiztfKTm/HX0Pn7WIHNBacDDiPf6WW6XQg+TERbbf0=;
        b=rdMfKQKVYnxv860r2PUuB8YMItsTGqsxuyW6SNBtLRgV4XY9mKKkDE4M2mjXJYxr49
         M2gFlBrXDQXDm/OdxVaGIb8fmI5BimkfJrY8sMeRp0Te3eQFG26BlbxMnrGKfQw39BDs
         POYFNECAVbniVjbZ1YWC6BMaXq1nknq8Pu97aaJN4bqbKyEO+2Yz5SlsOqP48AoR3tOX
         2qSmLEeNvzP9O8xFEb85Hmd0ypICGrkj/b7MQUoow6em8+8FXoUtAx40Djce+G0Auh4T
         n9vHq1DDgB7B6/LW6nnB7XRejyWWhS9MKCUx0RnGzKLHQotkmu9roI/PD5iBxwJ0Oq9P
         Lqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656347; x=1774261147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guiztfKTm/HX0Pn7WIHNBacDDiPf6WW6XQg+TERbbf0=;
        b=NsZS+uwBgmoUIdQlRKeOUnuRCCb/i6v6qX2Bl6atPvVkWpnpNL/lI0HVCVZDNiSXBC
         fG8m6iGN9Z+ktxrb4Y3biJCMM7nCoMWvDgMXZYt8nTlYRa0bsecL4gMtQOu+IUvZGdEf
         rN8f7AB91htxqoNltqJkDeuaV6nB7meF9M52s9z9yf6Jva4s8W38t/iQI/YCWVgRidee
         /Azff5mFxCW5bvxq5M60zSgMF13PlRVz4HkM9gshZ2lDjWRrzeHfp2BLoYKVhseFX07a
         LS6PRv52Fs4TUZnsWFN0tdVBuNsPkE5v5dQzGVYolsmwwpRx4SayY3LV++VO86m5Ijy0
         DXQA==
X-Forwarded-Encrypted: i=1; AJvYcCVVqZYQZgAVitM/UUkc7Zn2erKqqlYm0xUqawMgQTuGfopjCliga6r0PxOEXr2p36x5Zl5WGabE83QX@vger.kernel.org
X-Gm-Message-State: AOJu0YwKJ4ulnSpRbbH1hHND41dYZeMd1Sngs9Y6jS7MwE2San/xDoYj
	ACL2kTbbEZhO/C3QIX606Ea8bmVmxKH641NyE7ZqJa1sirodDAX0c26BPNOc82bYHw0=
X-Gm-Gg: ATEYQzx7Xt0R6JTI1EcBG4SF2N1AK14z2SlsoCBOv09h2+zQ6RBz91hW/pSbwsm3Qud
	rw1+qlgJJElnF+tcQUNZkqnn4bcTnWAbzIeWEAsyRLD60rwBFGdUWWnuuJNOmSy6hMpAYpVvctk
	j40QD0e1ant+thFZb+WqBw1/MWq7VMNUKttqFcecoDfzt+CouFp31TTITLJ/uBtqThL/cHXsHdK
	aNEKARL1pC2SffOd+/9aA8sGqph+3VF1GwnxWxDgOf3w7uDSgEaoGNk8jZJqaLu021e2dBlCt1J
	ZcHqg1zRXqoLCZrXCfV2eNUvyxpb/VLN+dukO4ErZhPtcK3QLQiU2G2b0+/nOPpA4IgiUBeAqBf
	FIYqqRDi28VevVcZGXoAdj3WR52ubP2pqHFt4GFrtvOmDGFg+zuw7lBU3FX1Q1N9taRk4NoVww5
	p+XnLx2ho3shXx8gqTef6XtLw1Wt7KblgL+MdnqTKfkiTsikcZQtFmHQtEq6p4qPcopQue/t9KX
	9Zgtlk=
X-Received: by 2002:a05:600c:49a1:b0:485:4bd1:4c74 with SMTP id 5b1f17b1804b1-4855670c0damr128725525e9.32.1773656347449;
        Mon, 16 Mar 2026 03:19:07 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6208:0:c5e3:3624:ad1c:6b4? ([2a02:2f04:6208:0:c5e3:3624:ad1c:6b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6c69fsm93983115e9.26.2026.03.16.03.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:19:07 -0700 (PDT)
Message-ID: <2772d5e1-2127-4808-bd9d-aa40b4ad7104@tuxon.dev>
Date: Mon, 16 Mar 2026 12:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	TAGGED_FROM(0.00)[bounces-33507-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 95023297CDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Geert,

On 3/13/26 15:15, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, 18 Feb 2026 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add GPIO set_config to allow setting GPIO specific functionalities.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
>>          rzg2l_gpio_direction_input(chip, offset);
>>   }
>>
>> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>> +                                unsigned long config)
>> +{
>> +       switch (pinconf_to_config_param(config)) {
>> +       case PIN_CONFIG_BIAS_DISABLE:
>> +       case PIN_CONFIG_BIAS_PULL_UP:
>> +       case PIN_CONFIG_BIAS_PULL_DOWN:
>> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
>> +       case PIN_CONFIG_SLEW_RATE:
>> +       case PIN_CONFIG_DRIVE_STRENGTH:
>> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
>> +       case PIN_CONFIG_POWER_SOURCE:
> 
> Shouldn't you handle all types that are supported by
> rzg2l_pinctrl_pinconf_[gs]et()?
> 
> The following are missing:
> PIN_CONFIG_INPUT_ENABLE
> PIN_CONFIG_OUTPUT_ENABLE
> PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
> PIN_CONFIG_INPUT_SCHMITT_ENABLE
> RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE

I'll add these as well.

Thank  you for your review,
Claudiu

