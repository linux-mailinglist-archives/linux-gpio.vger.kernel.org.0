Return-Path: <linux-gpio+bounces-37405-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wpI0Fph9EWrimgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37405-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 12:12:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5255BE77C
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 12:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 879C83016819
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 10:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEF0384CFF;
	Sat, 23 May 2026 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="KTRC9hYD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC525B08E;
	Sat, 23 May 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779531157; cv=none; b=o+KF4yP/ta0QHr7t8mm/I02xQihXqjKtXR6dNgz19CGjuYcBPxQVZSWwAodNh/3tD78Tapg/jtCX84he7vbsBizDe3XHuQjMWXGZ17dJu9jmVH29bPpKwMAICqn8+kuXEjuYWQYBzWqM8kGnH69a9MnKKX+XmAEukX82/FeELd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779531157; c=relaxed/simple;
	bh=/3RvEH1nB8QPaA31nfa5CqgMYdJdLayHZcQOa8oGK7E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Rr0F1UT+7Rrcv2nAg0VQvfECi8DdbRC+K9g1Eg8NX9rgB6GOt9AD5spWaJAX33hOG0EAp5F7hroLllkFdM5VRjIvpBf+ngwrD10caQUM6uYarg+B4C9A314W52u6izEQ+Ip6H66j/lDVcQBGjv/GdRRPrUs1D1dfXv36XV7HKvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KTRC9hYD; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779531147; x=1780135947; i=markus.elfring@web.de;
	bh=aaBiY/95uAzIk6x4Yvj/7huhqUd3zgxjdDfGv9T4V+w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KTRC9hYDkyPtFQZ74LRcXECo3yjUyPFYUNjBOJn4kxB0Dau0Ztf775Q22fP4/sIz
	 gFZtzy/NCW66QeYq3JKzX52p7uY3kapGxW0OyqLawnOeIlurke7owB3xz4BDV+WvA
	 2PTXBNe2XE/XTT3d29lDsaoNsoCtM9gUYzSXtCZdKRgolmEcaSNGgceNR4rtA3MpP
	 dx0yGtl4T4Od2nxTmsVi0UbNnrXqEJU4e1dCOrKejlPn/LsEab74SqkojF3TYegN0
	 xPcuUDo7ej6BRGyxTrcMPqbguggzRMKXVIniVK5guOV561udaaXuS8zx4SFqGALkw
	 mKm2XxYU26sslGBfTw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWiA0-1wongI3iem-00K8M8; Sat, 23
 May 2026 12:12:26 +0200
Message-ID: <a9c4da74-1c3b-4764-a937-37d04a5a826f@web.de>
Date: Sat, 23 May 2026 12:12:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260523080758.1375830-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] pinctrl: pinconf-generic: fix of_node reference count
 leak in dt_node_to_map_pinmux
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260523080758.1375830-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:I/Bm/vMd0OTcMz3fv8rTtICBUu+9Q5Pit3WgNmQ6Y5uPymLbyia
 PAQaD1BBZkztnFjmoepvhZLXBjvRw0dsLojpfz6Quso99QYK88VUOR3dBT52rRWTrGplcnX
 TZ98EkbjZe652LFZUgcauqGjhH1k7JjrWr4YpYj5fpR6UGK23KUB5YAzdSxOdVyEbTrVBnS
 BeMAF1odK4KB2Sj3tSFSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0BJ6XTjan+A=;aq354tET7McBl1EqqJZcvNz6IwQ
 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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37405-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: AF5255BE77C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> of_get_parent() acquires a reference on pnode, but the reference is never
> released on any return path.  Add of_node_put(pnode) in the exit label and

                                                       call?


> before the early return path.

Please avoid a bit of duplicate source code in the mentioned function implementation.

How do you think about to reconsider involved identifiers once more?
https://elixir.bootlin.com/linux/v7.1-rc4/source/drivers/pinctrl/pinconf-generic.c

Regards,
Markus

