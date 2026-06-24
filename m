Return-Path: <linux-gpio+bounces-38863-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TwrlMxftO2rxfQgAu9opvQ
	(envelope-from <linux-gpio+bounces-38863-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 16:43:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F26BF3E5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 16:43:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=B0rMSf55;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38863-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38863-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D400305AA7D
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 14:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBD63CC7EF;
	Wed, 24 Jun 2026 14:42:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36D23C9893;
	Wed, 24 Jun 2026 14:42:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312145; cv=none; b=dS7z5Vgt06xL0XSoR0+2hx6nJr3GF4pEcjX9HzQXJZmpk69XIwO2RO3jWB01UEfDke6m/nzcEPJfVpogizQPKtWyBcOGkXgaakblsqf9tPqQb1vbRKzH5Tc516Z0OtrZVcaoBwIip23RwhMGCXlII21Es7A1e1AOlpir6JVUbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312145; c=relaxed/simple;
	bh=MP5LS7UkW1uzXoJtuAI1kUpbiGJUW02AVkJQVUGuW+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5Lx7abEZ1Rw/AYwhbhIP88dZ6iVfYBk/kdgl3joYdS9Z+dVmOyCW/8H7i7OJiTbYMwRlHdG635YkV9a4jXF89u+hSqRIZlC0sNzjIXS1uroK0+NIpB2M31E+A10MK6u0p4BehMXgo4j/D0w5v1xaIF7BmHF2qRPSBEQM8uA+Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=B0rMSf55; arc=none smtp.client-ip=212.227.15.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782312137; x=1782916937; i=w_armin@gmx.de;
	bh=gecyV2vZC6Az8H6aUcK5vYHKEWcRBa1Nqt0NQ8aYMyQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B0rMSf55QVk8AO4iuyjZkKCsuAY/4pAcdqXel1d2uilLTe3kBx6Uo7TZlMSwEurK
	 z8UIX474Z0KAsg3Xao1CwMsFjYNNfRSfdOwPLSE8kSkCKjiVQ8uub7/E/MJEWBSle
	 wJvURgrqf6LYDUQOBeuy25FpYzIa7bz3MpQ934x50bQrM/HP1uZyRElhnqYnckQta
	 QtndDulKJPWtsYogAfIA7ep/Qv53TBYlnaLROPQ89GIxVy+ufc6tPu8KIvCFYGU35
	 oaqYWgpzWJUcBXNTH70U7PbbP3yvuPKwOr01BIzSFfJuJ5aPIIoUj8MGGPM8tg7Mq
	 x6cvNPyU7DfvQEIm0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0oFz-1xPQaq29Rt-016iKl; Wed, 24
 Jun 2026 16:42:17 +0200
Message-ID: <f51df47c-0523-41ee-9e7d-0aa0177065e7@gmx.de>
Date: Wed, 24 Jun 2026 16:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16
 G614 series
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Marco Scardovi <scardracs@disroot.org>, bnatikar@amd.com
Cc: andriy.shevchenko@linux.intel.com, brgl@kernel.org, linusw@kernel.org,
 linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com, westeri@kernel.org
References: <221cd70d-70f9-4d01-8e8c-b4a5b347b8b9@amd.com>
 <20260617185318.11237-1-scardracs@disroot.org>
 <9237988a-2f5a-4c4e-8586-12899957bfea@oss.qualcomm.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <9237988a-2f5a-4c4e-8586-12899957bfea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Ei0Lr6EvjbdkQ6g+5txYPfR/hdeejuwI1PqH9eU5xEFgxYDb5bI
 aas4rQd5F3OHNnaaUy+OY8TNQmoYpb/vX3okIVB0FK39Qro+mocDWOP2C7m7Vs4lOS380oy
 NEtpG94JRHXRvekP8LhNKIa43/PtWnZPD07g5rcXW46/wDrILXlW5qfCQs4mifrA4ivJQUJ
 ICoqi9g6MBXU2+h6GHxwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F88tSJUduAU=;7ZqQ5wZsuKpULChIKV4Pq1YMERK
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38863-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:scardracs@disroot.org,m:bnatikar@amd.com,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:westeri@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[W_Armin@gmx.de,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,gmx.de:dkim,gmx.de:mid,gmx.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 650F26BF3E5

Am 21.06.26 um 13:00 schrieb Hans de Goede:

> Hi Marco,
>
> On 17-Jun-26 20:50, Marco Scardovi wrote:
>> Hi Basavaraj,
>>
>> Thank you for your review: this is the v2 with the rewording as requested.
>>
>> Changes in v2:
>> - Reworded the commit message and the code comment to explain the actual
>>    boot-time replay mechanism as suggested by Basavaraj.
>> - Explicitly noted that the touchpad itself is driven by i2c-hid and functions
>>    normally, and that the ACPI event handler is preserved for post-boot events.
>> - Rebased against linux-next-20260616
>>
>> Marco Scardovi (1):
>>    gpiolib: acpi: Add quirk for ASUS ROG Strix G16 G614 series
> Have you tried adding this patch to your kernel instead of adding a quirk? :
>
> https://lore.kernel.org/linux-gpio/20260429025247.1372984-1-mario.limonciello@amd.com/
>
> This modifies the code which does an initial sync of edge-run ACPI GPIO
> interrupt event handlers to match Windows and to skip it in certain
> circumstances.
>
> If that does not help, we should wait for Armin to get a chance to check
> your DSDT to see if the magic _DSM which inverts the polarity check for
> the initial sync run is there.

I checked the ACPI tables, and the _DSM is missing. However i think that the
affected GPIO is actually declared as being edge-triggered, so the aforementioned
patch from mario should fix the problem without requiring another quirk entry.

Thanks,
Armin Wolf

>
> By matching what Windows this we can hopefully fix this for a whole bunch
> of devices rather then having to rely on per model quirks.
>
> Regards,
>
> Hans
>
>

