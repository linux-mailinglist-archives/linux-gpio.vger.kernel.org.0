Return-Path: <linux-gpio+bounces-33744-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO5IEBudummHZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33744-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:39:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EACAE2BB9DE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43A273028B73
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646703D75CB;
	Wed, 18 Mar 2026 12:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jjzt62tu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A2322B88;
	Wed, 18 Mar 2026 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837558; cv=none; b=UQscO3vIagqQ+yWRdpJHl3+mQBnK7NNpoZFfD9LZo5TBdz09b6eiCq0szQqoo8iLmjg4m3OQbq/iFdL0Nv5Z65SBo6Qo76D/4G1VkZSqfNDc7V9Y0VdpeSaO4sayaJe0aZIZ2J0IzZveAoT2TPEeCLEpEYBzexpgcvLFfGfoSUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837558; c=relaxed/simple;
	bh=FfQ4tOXt11Yk5HfFk5OE4cgHfDhrZv/d754oPFniJ6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnY1VPsz8YSyApdTNSNXp9bctkZXRfAtm2zgqIREBLjqn+AAhyPrIQYLHKJeBs6ba/oYhk279in/UNRReX2HtLHY3qSYXSRQmNeanXuTHOdDwNDf6Ddav8Qlc+FvNgvPfRNsYo0sNQnZcqtrZJ4Y+FiljvIr1O7rwl5E1hYPQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jjzt62tu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837553;
	bh=FfQ4tOXt11Yk5HfFk5OE4cgHfDhrZv/d754oPFniJ6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jjzt62tuJz4fRatqiNKPesSPc1em2DH9FU25jAhpxaqsL78O4BJllZ49HL9aYzqPh
	 zkYwfxR6Z42JBDyz19ttRbsqG8zMwBA53AVjfqC9ThYCwQOOBsZ/3aEGX0qwS9m4TA
	 at8NiNjgWuePnR95UeKO3YPWmDKwPDiqfDV2Vz4Mp6WyHr967TjyPYjn5zS6GkIcBH
	 XFtZ5CnxK7k86QMNSdr/dUpkjrc1ZpqGHLQXoRSbuvOfU1tUL0HJFmwWWHtC0NspyT
	 NG6QVfWP+YQOKhnBtr0p12vz9CxibIlNHn5CE3GrfPnxJELQuD3BDNkgTquhdb+V3y
	 xmgBcJtLdOTkw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EAF417E0FFA;
	Wed, 18 Mar 2026 13:39:12 +0100 (CET)
Message-ID: <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
Date: Wed, 18 Mar 2026 13:39:12 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-10-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33744-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,packett.cool:email]
X-Rspamd-Queue-Id: EACAE2BB9DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> From: Val Packett <val@packett.cool>
> 
> Add the dts to be included by all boards using the MT6392 PMIC.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
>   1 file changed, 141 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> new file mode 100644
> index 000000000000..fbf6f671524c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2024 Val Packett <val@packett.cool>
> + */
> +
> +#include <dt-bindings/input/input.h>
> +
> +&pwrap {
> +	pmic: pmic {
> +		compatible = "mediatek,mt6392", "mediatek,mt6323";
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		keys {
> +			compatible = "mediatek,mt6392-keys";
> +
> +			key-power {
> +				linux,keycodes = <KEY_POWER>;
> +				wakeup-source;
> +			};
> +
> +			key-home {
> +				linux,keycodes = <KEY_HOME>;
> +				wakeup-source;
> +			};
> +		};
> +
> +		pio6392: pinctrl {
> +			compatible = "mediatek,mt6392-pinctrl";
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		rtc {
> +			compatible = "mediatek,mt6392-rtc",
> +				"mediatek,mt6323-rtc";
> +		};
> +
> +		regulators {
> +			compatible = "mediatek,mt6392-regulator";
> +
> +			mt6392_vproc_reg: buck_vproc {

s/buck//g

Also, no min/max voltages?!

> +				regulator-name = "vproc";
> +			};
> +
> +			mt6392_vsys_reg: buck_vsys {
> +				regulator-name = "vsys";
> +			};
> +
> +			mt6392_vcore_reg: buck_vcore {
> +				regulator-name = "vcore";
> +			};
> +
> +			mt6392_vxo22_reg: ldo_vxo22 {

s/ldo//g

Also, same comment here, no min/max voltages?!

Most of those are easy too, because the regulator name actually tells you
the voltage it is supposed to output ;-)

Cheers,
Angelo

> +				regulator-name = "vxo22";
> +			};
> +
> +			mt6392_vaud22_reg: ldo_vaud22 {
> +				regulator-name = "vaud22";
> +			};
> +
> +			mt6392_vcama_reg: ldo_vcama {
> +				regulator-name = "vcama";
> +			};
> +
> +			mt6392_vaud28_reg: ldo_vaud28 {
> +				regulator-name = "vaud28";
> +			};
> +
> +			mt6392_vadc18_reg: ldo_vadc18 {
> +				regulator-name = "vadc18";
> +			};
> +
> +			mt6392_vcn35_reg: ldo_vcn35 {
> +				regulator-name = "vcn35";
> +			};
> +
> +			mt6392_vio28_reg: ldo_vio28 {
> +				regulator-name = "vio28";
> +			};
> +
> +			mt6392_vusb_reg: ldo_vusb {
> +				regulator-name = "vusb";
> +			};
> +
> +			mt6392_vmc_reg: ldo_vmc {
> +				regulator-name = "vmc";
> +			};
> +
> +			mt6392_vmch_reg: ldo_vmch {
> +				regulator-name = "vmch";
> +			};
> +
> +			mt6392_vemc3v3_reg: ldo_vemc3v3 {
> +				regulator-name = "vemc3v3";
> +			};
> +
> +			mt6392_vgp1_reg: ldo_vgp1 {
> +				regulator-name = "vgp1";
> +			};
> +
> +			mt6392_vgp2_reg: ldo_vgp2 {
> +				regulator-name = "vgp2";
> +			};
> +
> +			mt6392_vcn18_reg: ldo_vcn18 {
> +				regulator-name = "vcn18";
> +			};
> +
> +			mt6392_vcamaf_reg: ldo_vcamaf {
> +				regulator-name = "vcamaf";
> +			};
> +
> +			mt6392_vm_reg: ldo_vm {
> +				regulator-name = "vm";
> +			};
> +
> +			mt6392_vio18_reg: ldo_vio18 {
> +				regulator-name = "vio18";
> +			};
> +
> +			mt6392_vcamd_reg: ldo_vcamd {
> +				regulator-name = "vcamd";
> +			};
> +
> +			mt6392_vcamio_reg: ldo_vcamio {
> +				regulator-name = "vcamio";
> +			};
> +
> +			mt6392_vm25_reg: ldo_vm25 {
> +				regulator-name = "vm25";
> +			};
> +
> +			mt6392_vefuse_reg: ldo_vefuse {
> +				regulator-name = "vefuse";
> +			};
> +		};
> +	};
> +};

