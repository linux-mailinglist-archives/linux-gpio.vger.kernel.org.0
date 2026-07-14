Return-Path: <linux-gpio+bounces-40042-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ncLAHUnzVWrpwgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40042-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:28:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0984475263D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:28:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=St5oIaUh;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40042-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40042-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 520AD30D9601
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218F53FB7EB;
	Tue, 14 Jul 2026 08:24:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261643FAE10;
	Tue, 14 Jul 2026 08:23:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017438; cv=none; b=il2/m2TgtzSbTTJpakrp86kgkGUOADGSjFsgMYsXXNBE1OPgKx8URHgcdZQd+ankb8sYbph4AvItqD2brgcE4kPKkn9g+3U1shgtwbRHmn5q95yuE8A3JOqW3iqiRA9W3+9Mq/aSjv9PqLfUoBQKjpz2F6iT82pHKj0DA5faHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017438; c=relaxed/simple;
	bh=oFRTq4b5voEJqxJgna9sANZNAoovJN0WoH/xes8V0Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciqrJ66ufumkRmmfG863VHR2qlQ6q+I14Dw9vWvjVsOzwmMvodoThVszZQrqx+ipln5sLTf6KN8SKXxRqRKXCIURNyz6xZqR0d+X5NeItVeyvpNb7+v2cQujeh7PDFYy+X4Gdppr5Tr67QTQCDnxSZm9mbKsHus8UUwnh/0Ghbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=St5oIaUh; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784017429;
	bh=oFRTq4b5voEJqxJgna9sANZNAoovJN0WoH/xes8V0Kc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=St5oIaUhZcFpc4P3NLXsjrMgq49P8PiKUtjQ7t6YdtDl4YkxNBA/Dd/QIKZM5DLoj
	 1ABY+6QaJP3jupVTbAwDTNulrDya9AKCJBDkBQOZRhUZMae0bJ74ftxF5N4RDI9ySG
	 EHzW+gwDxJVFrrclWEFuAl5Iw1tCdJuo6vl7G55WGP8nYfegFGpy43yWww7onOdIQd
	 9tMj4mk7CzkwKyOPbp2T9KhhPz5hs058cU9yRvQbADigZnWfz5OOacqWHKdLLu+xli
	 /y8KwgPBV62Cd3leuq3iQYY2oNuB0hcE9d4kuwrREQGjHgpMUmIG+RZiNaI7TeOv0E
	 cyk/GjYqDxejA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A354F17E010F;
	Tue, 14 Jul 2026 10:23:48 +0200 (CEST)
Message-ID: <0cd526b9-aff5-40e6-b209-750f83fa0fd0@collabora.com>
Date: Tue, 14 Jul 2026 10:23:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add MT6858 support
To: nikolai.burov@jolla.com, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40042-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nikolai.burov@jolla.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:sean.wang@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov+review@abscue.de,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:nikolai.burov@abscue.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[jolla.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,review];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0984475263D

On 7/13/26 17:06, Nikolai Burov via B4 Relay wrote:
> Add support for GPIO and pin configuration on the MT6858 (MediaTek
> Dimensity 7100) SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
> Changes in v2:
> - dt-bindings: Change reg-names and descriptions as suggested by Angelo
> - Remove incorrect slew rate field from register table
> - Fix hole in the EINT table by including pins without EINT support
> - Add missing pm_sleep_ptr() and /* sentinel */ comment
> - Link to v1: https://patch.msgid.link/20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com
> 
> To: Linus Walleij <linusw@kernel.org>
> To: Rob Herring <robh@kernel.org>

-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Nikolai Burov <nikolai.burov@jolla.com>
> To: Sean Wang <sean.wang@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> 
> ---
> Nikolai Burov (3):
>        dt-bindings: pinctrl: mediatek: Add MT6858
>        pinctrl: mediatek: Add driver for MT6858
>        arm64: dts: mediatek: mt6858: Add pinmux macro header file
> 
>   .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  |  190 ++
>   arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h      | 1335 +++++++++++
>   drivers/pinctrl/mediatek/Kconfig                   |   10 +
>   drivers/pinctrl/mediatek/Makefile                  |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6858.c          | 1407 ++++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h      | 2378 ++++++++++++++++++++
>   6 files changed, 5321 insertions(+)
> ---
> base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
> change-id: 20260708-mt6858-pinctrl-917ad9097023
> 
> Best regards,
> --
> Nikolai Burov <nikolai.burov@jolla.com>
> 
> 

