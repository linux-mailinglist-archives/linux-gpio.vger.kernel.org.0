Return-Path: <linux-gpio+bounces-39018-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kf+DN2knPmowAgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39018-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:16:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE76CADCC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:16:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=baodeep.com header.s=dkim header.b=jyzEzToP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39018-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39018-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=baodeep.com (policy=reject);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51937300A4BF
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 07:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090353CD8D3;
	Fri, 26 Jun 2026 07:16:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B6F2F8E8E;
	Fri, 26 Jun 2026 07:16:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458214; cv=none; b=r+akLOWDLd5CZX2vPKDK+KkejW+1vs4Fhiyb0hbbW7bnKfCwSVu/8ckVkqNrjwvzOjXHbVvUBbMNvMjkrzFCr5vVSUUlpywh/sv/idpikDnMZQaqNZ6VpDGmw78e7F/knaOwlR5ygtUsZN1pVrEp0rPHZGR3FeyQypTyhbRcGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458214; c=relaxed/simple;
	bh=4GkvO2DZ5KA4iC+jKpP4hkWsAEg72QOLBRDLYAg6IQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpVAokdGLN3vW93hCUZB/BziaX9HjePZzeDHjCj6F5SLkvqBAaXE+mG7ZwR8T60LwUrD2p15M/d9HrM0vD4FiKvQ1utKWNtVUcnlDdAh8KsH26N1uZg0+kzO2UzszkGC8PF9/6gM9SniDqVtjkVVN7b5usAEF5VaKzHNWT+8B34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=jyzEzToP reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF51B1BE7A2;
	Fri, 26 Jun 2026 10:16:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782458207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LLwOaOrVN63ocBzK4TrquFSTvMxdhRBEVjhLSw06WEg=;
	b=jyzEzToPHt0FZEmcxepLe+ZA6VMW2QaCJLe96oEhXXdQhSolX3SH2aWIN078Or7/guip9m
	82ZEJ3DklV52hmqI5FJndHqn9PIWo4eumBRO7PBLUc72cWVkTz7o4dW4o6F7oqqoNRg6Ev
	wIqMLPn0iDCNqC5LioVBHo/WriwYTTAwiBCvM2c5Pjl9wFs+/OQTMDkQXwpcD9MDj4m9oW
	2cAxU05OE0rPKjDz5vAke6MfDIVXYPz8EGK7ENdztgc1A9/lzV/Q/FL0dRIrvZzlV5wPlu
	UdwruCzDc8Kd7uWA1HZM2Wq5mNsK1N8M7a7jL4uXmIYQCljl3Uil0QPGYpgBqw==
Message-ID: <0a9fee08-8945-4c7d-8bea-9efb7d921f10@baodeep.com>
Date: Fri, 26 Jun 2026 10:16:27 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625115718.1678991-1-v@baodeep.com>
 <CGME20260625115817eucas1p10bfe0898d6cb2f6f51cff36a031946f9@eucas1p1.samsung.com>
 <20260625115718.1678991-2-v@baodeep.com>
 <d8d407d5-ba6c-4197-9cf0-2fa7e6e17155@samsung.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <d8d407d5-ba6c-4197-9cf0-2fa7e6e17155@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[baodeep.com : SPF not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[baodeep.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-39018-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[baodeep.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08DE76CADCC

Hi!

26.06.2026 08:54, Marek Szyprowski wrote:
> On 25.06.2026 13:57, Viacheslav Bocharov wrote:
>> The shared GPIO descriptor used either a mutex or a spinlock, chosen at
>> runtime from the underlying chip's can_sleep:
>>
>> 	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
>> 	... if (can_sleep) mutex_lock(); else spin_lock_irqsave();

...

>>
>> The lock type was added by commit a060b8c511ab ("gpiolib: implement
>> low-level, shared GPIO support"); the sleeping call under it arrived with
>> the proxy driver.
>>
>> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
>> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
> 
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Thanks!


Best regards
-- 
Viacheslav Bocharov


