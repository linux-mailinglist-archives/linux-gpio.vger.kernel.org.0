Return-Path: <linux-gpio+bounces-38318-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9pHhFIWAKmovrQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38318-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:31:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC96706D3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:31:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=baodeep.com header.s=dkim header.b=OsmJNX00;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38318-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38318-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=baodeep.com (policy=reject);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A15326CEC6
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3379724336D;
	Thu, 11 Jun 2026 09:28:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0A03921CE;
	Thu, 11 Jun 2026 09:27:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170083; cv=none; b=jR+oQ6Y0QQPN5Q8N7X2FHo83UB7FIwz+GO2gN9y8jAkJPMLoZmC3z5hP9NxdCapakTeh6TDKWEhweHA8Bc/+4799EBjvbD824W9Yk0CNYn8n/yDLuOZdmj4RtwmW5Y3UdrwNHzvFi0fcSSdH+Pl1cfAYzwozdII+tRUlsW9KAbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170083; c=relaxed/simple;
	bh=3SnG82dmRWU08dRDNtZ5ZvTeFHwFZdToJw0yAXN9qmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiOQqgZQfDi6AqdvGlM18nNrZdIaLAXsxHyyjXpI9qxHrK4FALO+JKxM7BBdSEN2V8JI3BJSohN0+8/z4MWZ22qaS5+BpCkwNlHX6R0ag54mIhzLelDi6aMhjrDF0QqOQBN/cgQ3DtODjac3dj6rOryB743WiJ0E+d/CJcz59PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=OsmJNX00 reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3795413F6A;
	Thu, 11 Jun 2026 12:27:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1781170076; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RlMltLney+5FO6rJ24VqCkuZLI37qXL5DCduKEsVMiM=;
	b=OsmJNX00sah5SQTArdDrms3Rb0W7fi4r6DOlhQvQXdUuRazcr+SEqPNUGaHXocZfYy+gu4
	IGF3xiapUHEvQ+QIIU1/Xvj77PaS5uJkv3ouSDmAGSoc9+5lj86nC1M87sFfXSU9YRaEnP
	7KU7jBYUeTVoAMhpOXoOyspipaSFOBBJFEgyL8bwYH/V4MkAveCj8M6t8oK2GKmUC3Dpju
	DqIa/0fUnSZ9GATWzSFdFaLUmMr4xNXbzgNhnqxdZGeZiyTzI1FkSQWnlBhaV2hrzdXwnn
	Sc0tftfC5oFZ+ad91M8CU18DYycUQYjaav5i2FYZTf2/Y/FWmsuwcUTv9ciRpQ==
Message-ID: <a523e854-c1d8-4f9d-a184-70ebee5fd630@baodeep.com>
Date: Thu, 11 Jun 2026 12:27:23 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
 <20260610153329.937833-1-v@baodeep.com>
 <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[baodeep.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baodeep.com:s=dkim];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38318-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:heiko@sntech.de,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,baylibre.com,googlemail.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org,sntech.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baodeep.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,samsung.com:email,baodeep.com:mid,baodeep.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61EC96706D3

Hi, Marek!

11.06.2026 11:26, Marek Szyprowski wrote:
> Hi Viachesla,
> 
> On 10.06.2026 17:32, Viacheslav Bocharov wrote:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Thanks for testing.

> This probably also affects the similar changes in Rockchip GPIO driver done
> by the following commits:
> 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")
> 7ca497be0016 ("gpio: rockchip: Stop calling pinctrl for set_direction")
> 

Yeah, we also need to revert can_sleep=true on rockchip and amlogic-a4 
(d6df4abe95a4).


Best regards
--
Viacheslav Bocharov
Shenzhen JetHome Technology Co., Ltd.

