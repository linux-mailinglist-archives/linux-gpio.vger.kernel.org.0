Return-Path: <linux-gpio+bounces-39985-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VcE0KYbrVGrWhAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39985-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:43:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 687CE74BC68
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:43:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=LulEUthV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39985-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39985-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nabladev.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E2DE301586A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC9842A7BC;
	Mon, 13 Jul 2026 13:35:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1285425CD2;
	Mon, 13 Jul 2026 13:34:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949701; cv=none; b=IIms9qcSysDs8CCoqMLU2p3bxNLTKN33DffpvegG126RwVVMtzxPX41Gws6sAKWVfu0FIVLm6eEotkyRDE2MKs1kym4syKt0l8Ouf/WKPE84vfvMS5pCMvUa6zn3CvD6u81YHQQ78oywAbHIHwbHvotjMQDCj1v5eWHzLG1muXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949701; c=relaxed/simple;
	bh=VSmDy/nXSV/1ss3m1t+2BbQQg7zGGeAjrSY7Kpl9H3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFtoOgF+ZHJ5qFsk/74c1klR5QtfBC3sZcDacOMI5oK8w/bzSJmslpgyXX/q0zjeHQDrRH+vr2Aq0qmBG84vQroygmFeuCsCn5YN6q5i1KFLLZWECbhCVNskV259H6F0s7WIsqMB5Wif6rZfxqk1sBpyjdmLb65OYZ2bU8+Tv5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=LulEUthV; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1A7F11992F;
	Mon, 13 Jul 2026 15:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783949142;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=P8EGB7qAg+4ywsne5RyKCHvoiul9xzVt3YITDcP0YII=;
	b=LulEUthVs8xG/zPIPifMnBISQJDzQ8qgMnOmJ+H5S1lL2pdNt/mlYPF0Cxa7YSyg1ZQ10f
	kZ3gf96aI3e7i03cTJh5dRo/ndC8xWSx7vnAlrlcmgsT4Tu3RKxvwdq7h5jVackrlWf7Gt
	qwLyEPZwaEETPI/e72tvmdALTOBOrHhyEaPfpikFVvNtF7fr7/bX5coSYXRhwwmVsgESrk
	YkuYiykKe4U/0vetNxKCfwAbYdSUq1E3U/4n+IstYHKUHLj+kLjTMZLpaRCf4lPdLpBFKL
	KNdmgWqNrh17BFDsz2iXXQ0ZX/X31yifCj/Nvub2TUXxdaNZqpliI6wBh+1E7w==
Message-ID: <21311e49-6132-48f4-8c5a-d321c14dc8e9@nabladev.com>
Date: Mon, 13 Jul 2026 15:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] MAINTAINERS: Add DH electronics DHCOS SoM entry and
 fix email address
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-11-marex@nabladev.com>
 <20260713-rousing-transparent-mongrel-ee18c3@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260713-rousing-transparent-mongrel-ee18c3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39985-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,denx.de:email,nabladev.com:from_mime,nabladev.com:mid,nabladev.com:email,nabladev.com:dkim,infradead.org:email,dh-electronics.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 687CE74BC68

On 7/13/26 9:51 AM, Krzysztof Kozlowski wrote:
> On Sat, Jul 11, 2026 at 10:59:39PM +0200, Marek Vasut wrote:
>> Add another SoM type N: match and update email address to an
>> up to date one in the process.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Bartosz Golaszewski <brgl@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Linus Walleij <linusw@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   MAINTAINERS | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8729cea57c3dd..3532d425e41f1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7518,11 +7518,12 @@ F:	drivers/iio/chemical/sen0322.c
>>   
>>   DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
>>   M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
>> -M:	Marek Vasut <marex@denx.de>
>> +M:	Marek Vasut <marex@nabladev.com>
>>   L:	kernel@dh-electronics.com
>>   S:	Maintained
> 
> Commit is fine, but, assuming old address stops working, please send a
> patch changing address in other MAINTAINERS entry + mailmap entry, and
> in all of dt-bindings (one patch for DT is enough)
There is one more DRM entry, I will fix that up in a separate patch.

But since you brought this up -- what about the mail address used in 
copyright headers (comments) in various drivers, shall I simply remove 
it and be done with it (I think yes, but again, separate patchset) ?

