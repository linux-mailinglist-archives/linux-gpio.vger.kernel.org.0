Return-Path: <linux-gpio+bounces-33767-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gma/NHffumlwcwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33767-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 18:23:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C72C02D8
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 18:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 458D0301EF32
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 17:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200D72EFD95;
	Wed, 18 Mar 2026 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LyHi1XOm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772541EFFB7;
	Wed, 18 Mar 2026 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854572; cv=none; b=Q3OJ6VHcwGMEysximcEOC9z3csCcX+fkVUvWEPVEBD0fi1YHBJZTFPWpRt9RiDhxc6tP0bzhqiTyucwcyfIdJj0OySnyOlCYGMcJ7NXQATryLbLdmzEXShe7Fle1gGxFrYMt9LsE9VQ5L7ubyJHhJwDirmf8FKh/vSgTwozT3HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854572; c=relaxed/simple;
	bh=ynyBnNeJwC1iJq0V3/CMoDF/qT11osJ8LY2W6q765hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxzYRQ7erFWLpSMrBJ3TfkGxiYHUVMzpLzOJvF6A1vNeTWydO4kWgQPXP7wKNwDLAY5lVljd3thpEzWps9kRbZptdbBBz91MjMlfl2o+Z56VGXnXtc13Cu+otmU0V3LV2U9AYVdAhHwqmEt2gjch6r6eKHk+WgRnsdqZPaUsQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LyHi1XOm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773854564;
	bh=ynyBnNeJwC1iJq0V3/CMoDF/qT11osJ8LY2W6q765hQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LyHi1XOm1XcajxqvX8esnSlpNh+SuznV4YyDPzPfC9JVObF6JgfRs4SwkgSAOF0lv
	 UGSt5RYxqSzjSPjKlKHDHW00v1tO3jTscIB081PEEy1mov+ontvkNhwayX9+2bqNRU
	 uKehGX45Du8tFja1zwTWI9Ycc7eQz25D1TX6hNBaPjOS61OaZF0/Ar3V2gJYT4uoJK
	 N7eZWmXpDW8/0GcgkyOZNoJUy7P7UdOIccATW18cRm0nV8bxRlqX9tdBRXeMTJjpIm
	 14Jx6vgXSlS3XqONXD83EYEd1Q9Er0WNnjiU2wzQkfOA/d/divMEK14Gswr9AI2ohL
	 Jn6NbHB4FYxPw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68F7617E0E42;
	Wed, 18 Mar 2026 18:22:43 +0100 (CET)
Message-ID: <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
Date: Wed, 18 Mar 2026 18:22:42 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
To: wens@kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>,
 Julien Massot <julien.massot@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-10-l.scorcia@gmail.com>
 <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
 <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33767-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,packett.cool:email]
X-Rspamd-Queue-Id: A22C72C02D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 18/03/26 14:54, Chen-Yu Tsai ha scritto:
> On Wed, Mar 18, 2026 at 8:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
>>> From: Val Packett <val@packett.cool>
>>>
>>> Add the dts to be included by all boards using the MT6392 PMIC.
>>>
>>> Signed-off-by: Val Packett <val@packett.cool>
>>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
>>>    1 file changed, 141 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
>>> new file mode 100644
>>> index 000000000000..fbf6f671524c
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
>>> @@ -0,0 +1,141 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2019 MediaTek Inc.
>>> + * Copyright (c) 2024 Val Packett <val@packett.cool>
>>> + */
>>> +
>>> +#include <dt-bindings/input/input.h>
>>> +
>>> +&pwrap {
>>> +     pmic: pmic {
>>> +             compatible = "mediatek,mt6392", "mediatek,mt6323";
>>> +             interrupt-controller;
>>> +             #interrupt-cells = <2>;
>>> +
>>> +             keys {
>>> +                     compatible = "mediatek,mt6392-keys";
>>> +
>>> +                     key-power {
>>> +                             linux,keycodes = <KEY_POWER>;
>>> +                             wakeup-source;
>>> +                     };
>>> +
>>> +                     key-home {
>>> +                             linux,keycodes = <KEY_HOME>;
>>> +                             wakeup-source;
>>> +                     };
>>> +             };
>>> +
>>> +             pio6392: pinctrl {
>>> +                     compatible = "mediatek,mt6392-pinctrl";
>>> +
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +             };
>>> +
>>> +             rtc {
>>> +                     compatible = "mediatek,mt6392-rtc",
>>> +                             "mediatek,mt6323-rtc";
>>> +             };
>>> +
>>> +             regulators {
>>> +                     compatible = "mediatek,mt6392-regulator";
>>> +
>>> +                     mt6392_vproc_reg: buck_vproc {
>>
>> s/buck//g
>>
>> Also, no min/max voltages?!
> 
> We really shouldn't set min/max voltages in the PMIC dtsi file.
> 
> The min/max voltages are supposed to be the intersection of the
> consumers acceptable operating ranges. The min/max of the regulator
> itself is already implied by the model / compatible.
> 

Your point is fair, but it's also true that some of the regulators are not
really meant to ever output anything different than what they are supposed
to, though, with slight variations being possible... I guess the best option
here is to leave declaring voltages to board DTs instead, which is sensible
in the end.

Okay, agreed. Let's go with no voltages.

Reminder for myself: there's a bunch of PMIC devicetrees to cleanup in here...

Cheers,
Angelo


