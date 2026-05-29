Return-Path: <linux-gpio+bounces-37663-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM45I8xAGWpquAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37663-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:31:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9F5FE884
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3620B30315FB
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 07:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8051137C0FA;
	Fri, 29 May 2026 07:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQMSMPbq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B2348C46;
	Fri, 29 May 2026 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039430; cv=none; b=jXmbulv+bZlxTEjRiY6zD4UjAqzW49MDJGa1jfKeJrp6lFAydpONImaAiaNp5SkTQZR99GSSnlHj6bS260IE/JsrtQRpGDwvD6zs5DmbffsGZAKAxhECbaoW7zrZ+FqiUQoC3JepBVjQzogWJnCMFvwwnRV1W+kQMe7sy/wkTz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039430; c=relaxed/simple;
	bh=BaFSzMSj0IA5FOwdE9cWRz76rEbDFpdM7czbRcFBhPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyWHauoAfIWI9g0LsXju/cwYW+XupFU+rp58pWNzFPPLn7HyObYmUrdL4hZHOucFvjYa1lFki1TwqxQwh0cuED0WS6POgYOqRyJknrVgKh0aqBEvyf2cVVUmvDH42HHIx2yRf5DUzn5Mkh3sATs8TdPqQVEn1EzjOQAE0plBpIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQMSMPbq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC101F00893;
	Fri, 29 May 2026 07:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780039428;
	bh=OC8XILryGU+gDFed7sGULjlk0ZVTBD+pAsgKvW0nB+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kQMSMPbqEc90cITNK49ov2tAdDAnakAmmNInhLzJaB7pF9BXdLoP8AEDvgCAciO7o
	 4f2h/NrdSjYhxg31xq1nAWLNKie9cDinrrMr/YuRtsqUaCZA4XU6I+D2hehyWSD5KM
	 vHohbHYKsYIBJmaaTYNEkWoU2mWBY+17JZwpGKODz6OyU4CVnlrxbIUtQSu+u5T9Xg
	 th1CUycqZZADnLR43RZT7EtL2MFSE2ljZDRABODxeo+jSVzplDP9Gjz3NEAWHi9GIM
	 vtauHkXWMjIGVfHmIGZtd5uHEOEnHX6S6UMbQwGn0JgOv6yQE97tzsF3Xa0H/04kbG
	 JRDkYvGNGl6dw==
Message-ID: <8444f980-d8d4-4361-acff-8424b4c8cd3f@kernel.org>
Date: Fri, 29 May 2026 08:23:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Content-Language: en-US
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
 wsa@kernel.org, andriy.shevchenko@intel.com, brgl@bgdev.pl,
 basavaraj.natikar@amd.com, linux-i2c@vger.kernel.org, linusw@kernel.org
References: <20260523174440.9629-1-hardikprakash.official@gmail.com>
 <20260523174440.9629-2-hardikprakash.official@gmail.com>
 <CAMRc=Mc7KrsmB4Svjoj4WMRa-=D2xitqURVRJVWhDH9qyzOVhg@mail.gmail.com>
 <63e6fdb6-1679-44f5-acfb-563ed3b56a54@kernel.org>
 <CANTFpSVX8YZxY+6pMcv=HhHBRbkPymox1GHhSCoBHzknatnfQg@mail.gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CANTFpSVX8YZxY+6pMcv=HhHBRbkPymox1GHhSCoBHzknatnfQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37663-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DAB9F5FE884
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 07:56, Hardik Prakash wrote:
> On Fri, May 29, 2026, at 04:43, Mario Limonciello wrote:
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>
>> Please make sure that we drop the now unnecessary patch that was
>> committed from the earlier series when queuing this. If that has
>> already made it into a PR to linus (as part of -fixes or so) we should
>> get it reverted.
> 
> Linus Walleij confirmed it has already been pulled into Torvalds' tree,
> so a revert will be needed. I'll leave that to the maintainers to
> coordinate.
> 
> I'll send v8 now with your Reviewed-by and Bart's Acked-by collected.
> 

IMO - Just send your next version with a revert of that first patch 
frontloaded in the series.

