Return-Path: <linux-gpio+bounces-33741-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGD3F0udummHZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33741-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:40:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BA42BBA28
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F95431046D4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BA93D75CA;
	Wed, 18 Mar 2026 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nFllDv3R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC563D6CCC;
	Wed, 18 Mar 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837550; cv=none; b=gvvmzvZqW3ECViUXlWWpBWjPTdId5J9pKzvHT2AstNHdSSagZrvXBgFVfEgSXWGmQcqBunY62cpot65LeO37WRQawach+ZjmvoQNse49Fa4wMe2LdhWDp0PkXhXbdLVxsDm6+LAyd0ys8Ah6adEqsD7RyIgl+4GnZuw6f5gCZDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837550; c=relaxed/simple;
	bh=6O3O+gKjtbmkLIDWzLlSL/IeC7Z4ijv0QDVu07Nn/1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3LxiFcfD2Q1bjZTAN40XW44F5M4cLrtjeUavEV1XagTvg9e3tJIXiPiSsu9RrQIolDaPCCW8x6Rzyu7+XIXT/iQ+TWjfRsHF6WL5hEuQXlu413hhBU6mhm3P7v4XSs3Xz5RqRGg/0reTuZWGQL7qejLsADk4rX6741IryZ++Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nFllDv3R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837545;
	bh=6O3O+gKjtbmkLIDWzLlSL/IeC7Z4ijv0QDVu07Nn/1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nFllDv3RrabAZKhJ3YrwJkdR0eaLcjzcNJtBQwGjhYl3k5Qtf8aEvaZfVNr6fqmSk
	 U+5neotyg2VkCVkycaKWg1cRfEnklZlKEtLz4Y5HW4VQQt0mnZAF3/1J/0B3gXLQDt
	 z/G2UQtuEUwuCtcHpBl94rqzHwBdzsF2QPbUrMMd01ZJ2T4qpaYz54NoY3DEe9GGIa
	 a+BLv6Niaf5DH8f7IsOw2aA6z/PhqJJO1Bb3JhiA+KMG+wpvHl68sVrQjUTItnv0lI
	 W3A9XwIx1FXNKx0X/WdqP8sef24iuTRuDRbmUQgl7+B+xqU91HKSnTj+vG1gCJUXel
	 bqEcJcKEB/bCw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3293917E1525;
	Wed, 18 Mar 2026 13:39:04 +0100 (CET)
Message-ID: <39a5c651-4921-422e-aaeb-552a27f04098@collabora.com>
Date: Wed, 18 Mar 2026 13:39:03 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: pinctrl: mt65xx: Document MT6392
 pinctrl
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Julien Massot
 <julien.massot@collabora.com>, Val Packett <val@packett.cool>,
 Gary Bisson <bisson.gary@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-5-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-5-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33741-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 08BA42BBA28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> Add a compatible for the pinctrl device of the MT6392 PMIC, a variant
> of the already supported MT6397.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |  1 +
>   include/dt-bindings/pinctrl/mt6392-pinfunc.h  | 39 +++++++++++++++++++
>   2 files changed, 40 insertions(+)
>   create mode 100644 include/dt-bindings/pinctrl/mt6392-pinfunc.h

Please rename the header to mediatek,mt6392-pinfunc.h

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index aa71398cf522..1468c6f87cfa 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -17,6 +17,7 @@ properties:
>       enum:
>         - mediatek,mt2701-pinctrl
>         - mediatek,mt2712-pinctrl
> +      - mediatek,mt6392-pinctrl
>         - mediatek,mt6397-pinctrl
>         - mediatek,mt7623-pinctrl
>         - mediatek,mt8127-pinctrl
> diff --git a/include/dt-bindings/pinctrl/mt6392-pinfunc.h b/include/dt-bindings/pinctrl/mt6392-pinfunc.h
> new file mode 100644
> index 000000000000..c65278c8103d
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt6392-pinfunc.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef __DTS_MT6392_PINFUNC_H
> +#define __DTS_MT6392_PINFUNC_H
> +
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#define MT6392_PIN_0_INT__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define MT6392_PIN_0_INT__FUNC_INT (MTK_PIN_NO(0) | 1)
> +#define MT6392_PIN_0_INT__FUNC_TEST_CK2 (MTK_PIN_NO(0) | 5)
> +#define MT6392_PIN_0_INT__FUNC_TEST_IN1 (MTK_PIN_NO(0) | 6)
> +#define MT6392_PIN_0_INT__FUNC_TEST_OUT1 (MTK_PIN_NO(0) | 7)
> +
> +#define MT6392_PIN_1_SRCLKEN__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
> +#define MT6392_PIN_1_SRCLKEN__FUNC_SRCLKEN (MTK_PIN_NO(1) | 1)
> +#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_CK0 (MTK_PIN_NO(1) | 5)
> +#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_IN2 (MTK_PIN_NO(1) | 6)
> +#define MT6392_PIN_1_SRCLKEN__FUNC_TEST_OUT2 (MTK_PIN_NO(1) | 7)
> +
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_RTC_32K1V8 (MTK_PIN_NO(2) | 1)
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_CK1 (MTK_PIN_NO(2) | 5)
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_IN3 (MTK_PIN_NO(2) | 6)
> +#define MT6392_PIN_2_RTC_32K1V8__FUNC_TEST_OUT3 (MTK_PIN_NO(2) | 7)
> +
> +#define MT6392_PIN_3_SPI_CLK__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
> +#define MT6392_PIN_3_SPI_CLK__FUNC_SPI_CLK (MTK_PIN_NO(3) | 1)
> +
> +#define MT6392_PIN_4_SPI_CSN__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
> +#define MT6392_PIN_4_SPI_CSN__FUNC_SPI_CSN (MTK_PIN_NO(4) | 1)
> +
> +#define MT6392_PIN_5_SPI_MOSI__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
> +#define MT6392_PIN_5_SPI_MOSI__FUNC_SPI_MOSI (MTK_PIN_NO(5) | 1)
> +
> +#define MT6392_PIN_6_SPI_MISO__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
> +#define MT6392_PIN_6_SPI_MISO__FUNC_SPI_MISO (MTK_PIN_NO(6) | 1)
> +#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_IN4 (MTK_PIN_NO(6) | 6)
> +#define MT6392_PIN_6_SPI_MISO__FUNC_TEST_OUT4 (MTK_PIN_NO(6) | 7)
> +
> +#endif /* __DTS_MT6392_PINFUNC_H */


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

