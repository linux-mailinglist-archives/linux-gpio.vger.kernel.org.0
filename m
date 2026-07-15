Return-Path: <linux-gpio+bounces-40112-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jD7iDZ96V2q7OwEAu9opvQ
	(envelope-from <linux-gpio+bounces-40112-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:18:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C2E75E02F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:18:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=obLTZAJf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40112-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40112-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C129303C4E3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4750844C653;
	Wed, 15 Jul 2026 12:15:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C241C44E044
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:15:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117751; cv=none; b=VgZMtDqIdd/vK3oh+Ax3226YYnuorvGdw0mOC5ZEGTw5n5PlIL2fj+7IVYk1gKVVodEdKGyZpvFNsIlf1EoYoQKyWzyevm3nDs2cU5vODdccdRfYfyyEQv72gBje6Ch29i0tXeFHKziRmUrO7NxQ0a9cba7D3qXJ8ZjHIwkQHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117751; c=relaxed/simple;
	bh=W5EZDSzSPth1BUbOy1q6Wnn14R+EBwhIOVIb0emFyys=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prpcpCrA0zmBhpVE9eufiKwSN8FxJ1BHVMzWI0njZ3XXUG8zwQo4Z4MdBmwt+Xs9vpsk3O40mFE6HDP7q+/QpRGLky0wTY74n45wJP8gXRDoCc+rT1IWHbzMr8Rj3M57utHPv3Cub90cxiDeCiw8QOvuWOINnr9J3NaYqFGwUVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obLTZAJf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F691F01558
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117749;
	bh=RKDnp51m/COvv5+IfZcdloAqKtTMb40rJD0x+eX0ID8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=obLTZAJfx4lImVTbXUB5pPXY26He5+Fc1vqFYT60SkAVloafptn6VGq/0NyAgC6I8
	 eOo5R4kqG7/jnfzjCv4J+M4pPR9Hm/iyx+axJVj8fnvaJhXzVc1i+zwlDm7j8Y4uKB
	 e841oUHJKarxoxWGINalhaLxsm9umQTT8+oVdOvdXDoNfYk7VYOIIZDgd+mfGpRdWr
	 APscYwaJNokzpfOkJ51g0CFlnwXS89SZjGbTsS9R5VTucmL43q0p9NiJKE5srZMFxj
	 Ni4sXGb/jLcWnswih2SsGxRi/QUF14zMvhcoFyVxKtB/S2nCyC7zLGsjoWhNc/m/eH
	 LscLf7fHjPVWg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso5049587e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpGTqJbF6/7pDlDouYfLYAzwLM/X06ME6uD1AtCs63gXbtykHZP0b8d48Hwlz7gpOfdWlDQT9omG+HF@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfkSufBFpatOM7MmMwpL8qlPVedhdr8VKS/b7M8PK9V4T2uhy
	MDKJD58lDtfDAWKPgjVkE1swoT/tFMLe7hRfLMNuEMZa0TJ0FgzYvW64sRsYg8DibZpQztyQ8La
	1fo+3SS9Aw/pYzzhAdtfWrTQSx03z3+OletYZsnSUFg==
X-Received: by 2002:a05:6512:668c:20b0:5b0:1aa5:b869 with SMTP id
 2adb3069b0e04-5b159b6bd5bmr813218e87.25.1784117747953; Wed, 15 Jul 2026
 05:15:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:15:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:15:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alX3PLGgoKTgSy_-@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
 <alX3PLGgoKTgSy_-@ashevche-desk.local>
Date: Wed, 15 Jul 2026 05:15:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=MddZtuuZ-dOaCui8ngO4hnZzNZrPj+1Hutoecit9WdCmg@mail.gmail.com>
X-Gm-Features: AUfX_myIhBXpXPOWc6e4XKEkjqdGIsljv9t_WEO6AKgHBeBaw-_g1hKvslbVK7M
Message-ID: <CAMRc=MddZtuuZ-dOaCui8ngO4hnZzNZrPj+1Hutoecit9WdCmg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Golle <daniel@makrotopia.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40112-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:daniel@makrotopia.org,m:linusw@kernel.org,m:brgl@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:frank-w@public-files.de,m:mika.westerberg@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,public-files.de,linux.intel.com,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88C2E75E02F

On Tue, 14 Jul 2026 10:45:48 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Tue, Jul 14, 2026 at 12:30:53AM +0100, Daniel Golle wrote:
>> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
>> gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
>> 'input', 'output-low' or 'output-high' properties. The error is
>> propagated by gpiochip_hog_lines() and fails registration of the
>> whole GPIO chip.
>>
>> The previous OF-specific implementation tolerated such nodes:
>> of_parse_own_gpio() warned "no hogging state specified, bailing out"
>> and of_gpiochip_add_hog() stopped processing the node without failing
>> chip registration.
>>
>> Some boards deliberately ship hog nodes without a hogging state in
>> their base devicetree and supply the state via overlay, e.g. the PCIe
>> slot key selection hogs on the BananaPi R4 Pro added in
>> commit e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework
>> pcie gpio-hog handling"), as the polarity set in the base devicetree
>> could not be overridden from an overlay.
>>
>> Booting such a board without an overlay applied now fails to register
>> the gpiochip. On the BananaPi R4 Pro this means the MT7988A pinctrl
>> device fails to probe, all peripherals including the console UART
>> defer forever, and the board finally hangs when clk_disable_unused()
>> gates the clocks of the UART still in use by earlycon:
>>
>>   gpiochip_add_data_with_key: GPIOs 512..595 (pinctrl_moore) failed to register, -22
>>   mt7988-pinctrl 1001f000.pinctrl: error -EINVAL: Failed to add gpio_chip
>>   ...
>>   clk: Disabling unused clocks
>>   (hangs)
>>
>> Restore the previous behaviour by warning about hog nodes lacking a
>> hogging state and skipping them instead of failing the registration
>> of the whole GPIO chip.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
>> -	if (fwnode_property_present(fwnode, "input"))
>> +	if (fwnode_property_present(fwnode, "input")) {
>>  		dflags |= GPIOD_IN;
>> -	else if (fwnode_property_present(fwnode, "output-low"))
>> +	} else if (fwnode_property_present(fwnode, "output-low")) {
>>  		dflags |= GPIOD_OUT_LOW;
>> -	else if (fwnode_property_present(fwnode, "output-high"))
>> +	} else if (fwnode_property_present(fwnode, "output-high")) {
>>  		dflags |= GPIOD_OUT_HIGH;
>
> For a fix I would make it less invasive and yes, break the style, by just
> replacing
>

Nah, this is fine as is, let me queue this and sorry for the trouble, thanks
for spotting and fixing it!

Bart

