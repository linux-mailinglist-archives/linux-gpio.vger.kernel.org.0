Return-Path: <linux-gpio+bounces-40006-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dEN8OVd0VWp3ogAAu9opvQ
	(envelope-from <linux-gpio+bounces-40006-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:27:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49074FB31
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 01:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=W8l29cdx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40006-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40006-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nabladev.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D592303674D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 23:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5503C3D2FEC;
	Mon, 13 Jul 2026 23:27:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D06F3921E6;
	Mon, 13 Jul 2026 23:27:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985231; cv=none; b=KUkXRVyB7UdYyStp6bNcc8BMwkwRTjLDYXr7G/vTptwaXxY9gKUJeJor22mi5KT4gPS8MGkT0/JKwdnV+gCR8fBomYSi4zI+zPR0sxrYzkRo3uUrH7WU2lHYnsX1v36C6uyZbYnqwC+b8WOhUBbHzqBy0QD0CdnNNRgQWcKwddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985231; c=relaxed/simple;
	bh=k3c/fQvFKsX+BL9ddtx7L/8o+2xx1vRwvyfARRDTw7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mFjBz/B0VtI9ESYIO957FgW+EhUPujUL4L/t1Ql6ma4cuAQbTujU2Ps0qPVweASU9wxaZ4LL+CeyX8W8Gbxqa/dPpNzit4bjOKkQ5aTFu6/pW+CKR8N9ElF3fB5RDCFMsYEQGUaZIhj8Q4tiryK9oZy5BtExks7lkYDkHgutNZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=W8l29cdx; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FB051199A0;
	Tue, 14 Jul 2026 01:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783985226;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JowGsrG8z0J8jTyRk7ZCwK3WilZ3WJBqoqWeGUbFbzM=;
	b=W8l29cdxgY05YqP1GtSfJ8UlIT5AER7bcgVfWzicUtwCuoVuQi/SpoT6zzQjtEa1V6v0En
	lFoBzsTBi+e7+2gjNzK2bu4NPA2Qb/1XytMW/SYLnUjOWE8Yg4fdJchvRN/88BpZ0HVhG6
	/vd0/rBi8wNX9L1wOGYsAbofIvCrZBiMT7tmux2S9CQZYofF9F6bY4qSFc/nVeJwAJceCs
	EXTtqAsvXXaFi2l+GcreIwj2GbZgO49EbSurOPTnt1Vc2GdNnzjmiYIPB0RCvxL4NO8O4E
	A8JH9oxsnCBlwPyZFmzLuTjcavv6zJPRvVw6a/MetVKlntTe8vkRABPzKbmvSg==
Message-ID: <0819d213-ce3f-4887-9374-ef0ae08055fa@nabladev.com>
Date: Mon, 13 Jul 2026 12:31:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dt-bindings: arm: stm32: Document
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-2-marex@nabladev.com>
 <20260713-tireless-sly-squirrel-04c7e5@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260713-tireless-sly-squirrel-04c7e5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40006-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nabladev.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:from_mime,nabladev.com:dkim,nabladev.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D49074FB31

On 7/13/26 9:48 AM, Krzysztof Kozlowski wrote:
> On Sat, Jul 11, 2026 at 10:59:30PM +0200, Marek Vasut wrote:
>>         - description: ST STM32MP257 based Boards
>>           items:
>>             - enum:
>> @@ -203,6 +215,12 @@ properties:
>>                 - st,stm32mp257f-ev1
>>             - const: st,stm32mp257
>>   
>> +      - description: DH STM32MP231 DHCOS SoM based Boards
>> +        items:
>> +          - const: dh,stm32mp231a-dhcos-bb
>> +          - const: dh,stm32mp231a-dhcos-som
>> +          - const: st,stm32mp231
> 
> This should be after st,stm32mp157 group and before st,stm32mp251 to be
> sorted by fallback compatible.
> 
> Anyway, not a big deal, so:
I'll send a sort patch for this schema file shortly and then a V2 of 
this series once I get a bit more feedback.

