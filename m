Return-Path: <linux-gpio+bounces-39685-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2/cAAdrPTmpSUgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39685-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 00:31:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF6A72AE43
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 00:31:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=k2eHq3Y1;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39685-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39685-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F724303B4C6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 22:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347E83FD152;
	Wed,  8 Jul 2026 22:31:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953642F3C19;
	Wed,  8 Jul 2026 22:31:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549908; cv=none; b=UGdbB+YTVOaR3R49QLcwI57LiPHTgpTtR+8m7LWjLYrKHRyykWGQPGeW/GKXm7J35j/cciS3NZHMnbW8UP2X9FthxcVRlbOpegv/4e87pq9oaynVMUgc2hJ7YDqnFyZsXg16QZyt8InOh+fw9N0S8HKlcS0MSRKcJ4D1DbLYyzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549908; c=relaxed/simple;
	bh=TwPNIap4o9alfoMGrHjKWF4JR0px4d7fD/wJeY6TlV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laC7jUOszs6z0CUsVMIWlwW1kbn3bjhLdvQdTCuWLJbkSV/ScRgJ7YTB5pZwAyTfYSemW/j75Aj3Br0JWqqjc6unEzwiym+8lp1XGMA8edz80XIcNfAVuF+0GAiFWH8hGstxOl8YakmBUvbc3itNppld0T/g3bYZ9dizpHowDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=k2eHq3Y1; arc=none smtp.client-ip=80.241.56.172
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gwXrb2NCfzMlHw;
	Thu, 09 Jul 2026 00:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783549903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=153NGcG1DPWuSXRcq4z9zBLGMIc6zuyh1qAdI4RAZiI=;
	b=k2eHq3Y1gdAukQn2jHL3lPY6q2pTwZmYCQfEiX/3LfjZH+0YnWX76gdlkczjxYYo95aUJz
	hdonlaaoddJsyIm2RDY9iqEGDfG8vIn73MoJ6JiCcj4+OWYLImLmM2hMgqyvijNB6osGU1
	IueO2hsKXV3lNyJbRQSYwig1PQmGB4/bb4MglHtRoyYYmB9bJwAobTCzll46KpA+LWGsbX
	+XffLbtofMiAckleXsbpoxo/DlAk4PxOo34VE/LTUMF/qI6YeJykz+hItU/NA6SqEEnh1r
	0ahc95ox2Uw3F6rvCFp55XsE8SiTiwbrNeDuYS0+Sx32pKv/IGOqmXEoa+RRgg==
Message-ID: <9ecabfec-d428-4c64-b398-4e80baaf3752@mailbox.org>
Date: Thu, 9 Jul 2026 00:31:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
 <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
 <CAMuHMdXQQWmn612R3y6qSXOZ7YMwZcfrBTrQZ9GzGekhFhtWSw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXQQWmn612R3y6qSXOZ7YMwZcfrBTrQZ9GzGekhFhtWSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 272722f82881645b40f
X-MBO-RS-META: 1mwb6twn3dfq1me165a49ir9q7udb4g3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39685-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EF6A72AE43

On 7/7/26 8:52 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
>>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
>>>> +{
>>
>> I am hoping to get some input on this remap function.
> 
> I haven't looked at your patch in detail yet, but the remap function
> was the first thing that struck my eyes.  This might impact performance
> of bit-banging and of the sloppy logic analyzer.

Regarding the performance impact -- yes, this will impact performance. 
Both the remap function and register table look up will, but at least 
the remap function is small and (subset of it) ends up inlined, the 
indirect look up table is bigger and unlikely to be inlined. That is why 
I opted for this over a table look up.

> Have you looked at the code generated by the compiler?

I did, but there is a lot of inlining going on.

> Perhaps it would be better to use a table, like sci_port_params.regs[]
> in the sh-sci driver, and riic_of_data.regs in the riic driver?

Please see above.

[...]

-- 
Best regards,
Marek Vasut

