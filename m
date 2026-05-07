Return-Path: <linux-gpio+bounces-36371-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONApLbSD/GmOQwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36371-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 14:21:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C84E81E6
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 14:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B56C630067B3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 12:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718F13B6BF0;
	Thu,  7 May 2026 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="zdjslWwz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599593A6B6C
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778156464; cv=none; b=aESK+4t1c8uv8wKCJZw4YNsAlzYejFDwJSDZDk8eaedJZR1EH1wN/WN/2Kl+B/SZZf4asORX68q8cDongIeQ6WBXvPyIwn1s5LOzmWLPOMIPmd2zA7KOAZH841++Ej3cyd5Z5EvlThYGe3lzzlHKwVvUQd/7A7l6tKx+qvP+f5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778156464; c=relaxed/simple;
	bh=LxG5akUKcO5BBA86ktVgP/4+ojKCeM1Tc78y1CrcuTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNYRCaRMWbuT9RqbgNpHTX+38QMFC8sMa/bYByiFc09qNe62BdZReYxYRMsCCiptiumfI9lpGaDEqEGSyRfbRXB9x4ZyS9xZZCCNG2KiAkjLMvUhaUTAuL3y7zgfmFuP9/7Dz4KYpiMTpm5dVvy8nBz3/eNnLFB3Qf8haYc6N7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=zdjslWwz; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8dbbc6c16b2so103388785a.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778156461; x=1778761261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhz8KoocXZc3ctaarL47fHWQ++aFEBdyNLqthbCRIEs=;
        b=zdjslWwzdcCgnr4aPFXk+/sg8nEfRfdHNLBL5BCbwUKq8v+mVgy+rE1YY84EOGp36J
         RxhqNzd48l/nmbnnHztARhUUjxNoHdgnYxZeskwF5pHC37Wce5L+7uKdeARW3ApIHFgv
         5nPvyPOJ1kK7kkvWPN+Pm8IawZpLD3GaQOYlar7Xl3SXhyD9/7DltL8qllvQRx2TSAI4
         19BsvPDlMp+vZ4Lip+C9cJ+Cx/fqNtgEgYiVYtU0SOplxBj9WfBNZU0y6ifnlSWosrBa
         6fWZbxatVadjVH5XCoW6F1Ym5yeYRrsjO9mAIS7eH4+o3azRniE1SjTMm8iklncBdH+L
         b59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778156461; x=1778761261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhz8KoocXZc3ctaarL47fHWQ++aFEBdyNLqthbCRIEs=;
        b=hcBkBt2kt9fUbslvCix+XMnPs+h9p0+0vq//tAStfeLWcu0PwXVKnP9aDgIeSch0KW
         NtqiR8GM+IW+Dx08yszF5Nyqa1rS/6dsLHo7DMsniiC4ivqTL5MdEAiEAhRXV/rBfQ78
         Ey6UegZS9EqsM8PfR6/FAn3cSIu2mdd3woEMCApXIHlhtWz4IZGHEavb8gj9somNw730
         /qtgfh6PPCbzN90QjqTWkT23LxsPWcsikTFEkLNvgXEryJdUUVJwEi+6ocrARbGySvx7
         oONEw5ONzgjBf09CeTQAZT3j0VFQa6nCPsDFE/AW+2yWphRiY8t7LisAUi3l0o9MkyCb
         Zqdw==
X-Forwarded-Encrypted: i=1; AFNElJ+IJrvA4Em8Fb7yGnOxyhthL/+79HBTvmsVT1+AAia+VnXz7hkvNWRDxd6AYP/bkQD2CpstZsIQr2Jz@vger.kernel.org
X-Gm-Message-State: AOJu0YwITSn7XyvEtzNcuU3qwqzqPgUxCBuiE9VFAhDtXE4w+n/O4E8I
	o7D9JAB4527DNcCyAnUqxH/LyLIp9RTBhaOuUWBUyRKlfBQpCYIpV2YHbRL4Egdpyh0=
X-Gm-Gg: AeBDietAwV6Mpf/oTuSWS0R53kCR7ZPfnjGEMGlYwV+Wk/a9P/zzr+TpuRoywodIXEV
	cMorJ+Vc/5Mc9SS13DJGsrA1oi20VfeA4ZrdcwF0xzVfAo+7Ut+Gg/YC2peh74JFuCaIWkQHRj4
	OK+ts8miJLYw9ShSgVY00FRWG9JrASUzN7Oj9E5OvizekO8b9b9nk9tCJdNqZWPB1dZEVEXweaL
	XacdjJy7/ICcgNW0j48seTlcjUxszDgfOlReYTIjMS1FHui3pXd2dcb/KZjfhJg1JlidMTx3YH3
	SK+6MxjsJkFPHxbcMwg1Lu6FJlMA97HQz6Zd2vxTQfjBxh2NaYOacucbyZTYlQrrzmqe2opbqOM
	UH4RU0i7qNLj75iDGuGlyKNq/n1H0euU1he2VJq+an3zmVKdsVnObVwOdX0Iyfik7VsAZy2JZEi
	luuPrJZE/8peiPyuJw1IqRCyQ0VD/Q24zD/mp6b6b9y84sg3d64tXBAYDhFwFiTw6FDb2q1Q621
	Q==
X-Received: by 2002:a05:620a:469f:b0:8cf:dd93:aca5 with SMTP id af79cd13be357-90652c64f39mr328497885a.34.1778156461028;
        Thu, 07 May 2026 05:21:01 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dc62csm226235066d6.23.2026.05.07.05.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:21:00 -0700 (PDT)
Message-ID: <cb788638-7cb0-469e-9c38-13452103f7c4@riscstar.com>
Date: Thu, 7 May 2026 07:20:58 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Linus Walleij <linusw@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, daniel@riscstar.com, wens@kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <CAD++jLkm4qn9hxQ9HjjnTWjvAiS+A+x1ATy7wamnm_YSP_qPEg@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAD++jLkm4qn9hxQ9HjjnTWjvAiS+A+x1ATy7wamnm_YSP_qPEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0C9C84E81E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36371-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:email,riscstar.com:mid,riscstar-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action

On 5/7/26 7:15 AM, Linus Walleij wrote:
> Hi Alex,
> 
> thanks for your patch!

Thank you for your excellent feedback.  I will plan to use
regmap-gpio (already suggested strongly by Andrew Lunn) and
that will be included in the next version of the series.
Once I've done this and tried your other patch I'll provide
a Tested-by for it.

					-Alex


> 
> On Fri, May 1, 2026 at 5:55 PM Alex Elder <elder@riscstar.com> wrote:
> 
>> Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
>> a small and highly-specialized SoC.  TC956x includes a GPIO block that
>> can be accessed, alongside several other peripherals, via two PCIe
>> endpoint functions.  The PCIe function driver creates an auxiliary
>> device for the GPIO block, and that device gets bound to this auxiliary
>> device driver.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
> (...)
> 
>> +config GPIO_TC956X
>> +       tristate "Toshiba TC956X GPIO support"
>> +       depends on TOSHIBA_TC956X_PCI
>> +       default m if TOSHIBA_TC956X_PCI
> 
> I think this driver can
> 
> select GPIO_REGMAP
> 
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
> 
> #include <linux/gpio/regmap.h>
> 
>> +#define TC956X_GPIO_COUNT      37      /* Number of GPIOs (20-21 reserved) */
> 
> I would just do 64 and flag > 37 as invalid.
> 
>> +/*
>> + * struct tc956x_gpio - Information related to the embedded GPIO controller
>> + * @chip:              GPIO chip structure
>> + * @regmap:            MMIO register map for SFR GPIO region access
>> + * @input_only:                Bitmap indicating which GPIOs are input-only
>> + */
>> +struct tc956x_gpio {
>> +       struct gpio_chip chip;
>> +       struct regmap *regmap;
>> +       DECLARE_BITMAP(input_only, TC956X_GPIO_COUNT);
> 
>> +static int tc956x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>> +static int tc956x_gpio_direction_input(struct gpio_chip *gc,
>> +                                      unsigned int offset)
>> +static int tc956x_gpio_direction_output(struct gpio_chip *gc,
>> +                                       unsigned int offset, int value)
>> +static int tc956x_gpio_get(struct gpio_chip *gc, unsigned int offset)
>> +static int tc956x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> 
> REGMAP_GPIO can handle all of this for you with the right
> parameterization, study the drivers using this already such as
> those that appear when you type
> git grep 'gpio\/regmap\.h'
> 
> 
>> +static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
>> +                                      unsigned long *valid_mask,
>> +                                      unsigned int ngpios)
>> +{
>> +       /*
>> +        * GPIOs 2 and 3 are used by the PCI power control driver, and
>> +        * we don't allow them to be used.  GPIOs 20 and 21 are reserved
>> +        * (and not usable).
>> +        */
>> +       bitmap_fill(valid_mask, ngpios);
>> +       bitmap_clear(valid_mask, 2, 2);
>> +       bitmap_clear(valid_mask, 20, 2);
>> +
>> +       return 0;
>> +}
> 
> That's good use of this facility.
> 
> I would say the chip has 64 lines and just
> bitmap_clear(valid_mask, 37, 64 - 37);
> but that's your pick. This probably works too.
> 
>> +       /* Mark GPIOs 22, 23, 24, 27, 28, 31, and 34 as input only */
>> +       bitmap_set(gpio->input_only, 22, 3);
>> +       bitmap_set(gpio->input_only, 27, 2);
>> +       set_bit(31, gpio->input_only);
>> +       set_bit(34, gpio->input_only);
> 
> regmap-gpio can't currently handle selective input-only or
> output-only lines, but we can
> very easily make it.
> 
> So I sent a patch for that (now in your inbox).
> 
> Check if this fixed_direction_sparse bitmap will do the trick
> for you and provide Tested-by if it does, thanks!
> 
> Yours,
> Linus Walleij


