Return-Path: <linux-gpio+bounces-38649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HbQGIEcQM2oh9AUAu9opvQ
	(envelope-from <linux-gpio+bounces-38649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 23:23:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD169C844
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 23:23:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=BfBgw0ML;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38649-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38649-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E209A3040DA3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 21:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1BD44BC90;
	Wed, 17 Jun 2026 21:23:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC327FD4B;
	Wed, 17 Jun 2026 21:23:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781731394; cv=none; b=VhXQccacnO0LcD654KweSvFhiSdILQbFUiV5WBEiRxvX+Rs+z6DjSx86HzNq8jJF7DncZmI2ZIQjakHUh4XCCzjH2apBgffVYWEG5U6W57IEyKE3t9gq/ySJI3f4a5CFuLKEfOd6o5qFUh2eVXQc5hn7V3cz38oBF6PEiF316rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781731394; c=relaxed/simple;
	bh=GGh1ycsBzLoWhRErG8SxHMGj/YFeQBkhMbxEh6OSj7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKTz9uFlNZnZdehMxprdyDf4N6bifgwdfFzlzL47/uVP6snNqoeMiGlpmEB1KfT3PMn/x18VZT0sPZ0varAZ9Bl13O3DPWGTu+k1juvA88NhJZNOmTM163odSw9GXofn9qdFFFqTPj+BgDxBhfuEkbxB3TkaV8ytYN7aOCpo7Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BfBgw0ML; arc=none smtp.client-ip=212.227.15.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781731383; x=1782336183; i=w_armin@gmx.de;
	bh=LNYS7eDx+UYRwgE3hcFnN7rh0/EZkStQ9PUA3tVEbNY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BfBgw0MLwH32Yi16KfmeBp0JBcWGkwkj0qhAs4hjPgp9eOD7cQusyXDB5iBZwvvT
	 jTVqer76YZvVUfG86B/S4EJsyV47lBsc7iqPVpMb2PHkPMVs1uLNbGKnhAO+kBQEc
	 7NnMpqxrrn11PeCl+JfjElB5bklmkRdYCCqNqyI+yU7JlkHeMddg7HMk7BgLdlaaR
	 DY8xJVl7aU8Ff857rOIqgfW9PbeXun+0aBJwrWmyoHVijTxGO0znb8PXaPStBeWOG
	 7AYtz3KBjHlwCYUdW9xSPalOFFkIIxkKQPWKPkrMmsCkQytT9xrHBZzWWjMWBEgh6
	 uez6KMB0THkJoFqXCw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsU6-1wRCHX1XNI-00CaQr; Wed, 17
 Jun 2026 23:23:03 +0200
Message-ID: <0e6ea9d5-68ac-4d18-b40a-25e70216b288@gmx.de>
Date: Wed, 17 Jun 2026 23:23:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16
 G614 series
To: Marco Scardovi <scardracs@disroot.org>, bnatikar@amd.com
Cc: andriy.shevchenko@linux.intel.com, brgl@kernel.org, linusw@kernel.org,
 linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com, westeri@kernel.org
References: <221cd70d-70f9-4d01-8e8c-b4a5b347b8b9@amd.com>
 <20260617185318.11237-1-scardracs@disroot.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260617185318.11237-1-scardracs@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:bkl/WzePXypr7/kSP35pKX9ZoVcz51LvyUc1gw7mwwWo/Iep6sO
 3gOySIrKb2/Z6a6DxlJS+JhMG0Ayb5VbBv+tArRIHtwmyhNtP0D+xxZMaPufpuoPEnbuxGH
 FtYFSQk5GZB05YfJbnEt6SHEilVGSTwdZTb/n55/YRy7LbgdfgKYXZJRKjtOI22M3B5JJU/
 t+6ueNs8OioKBZUSuPuXg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mPlM9xAJn3M=;IyCzP+t/6va0Bc1QUfiA/zToqfk
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38649-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:bnatikar@amd.com,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:westeri@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gmx.de:dkim,gmx.de:mid,gmx.de:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3FD169C844

Am 17.06.26 um 20:50 schrieb Marco Scardovi:

> Hi Basavaraj,
>
> Thank you for your review: this is the v2 with the rewording as requested.

Hi,

could you share the output of "acpidump" on your device? I suspect that Asus
uses a _DSM control method to tell Windows to invert the polarity inside the
ActiveBoth check.

Thanks,
Armin Wolf

> Changes in v2:
> - Reworded the commit message and the code comment to explain the actual
>    boot-time replay mechanism as suggested by Basavaraj.
> - Explicitly noted that the touchpad itself is driven by i2c-hid and functions
>    normally, and that the ACPI event handler is preserved for post-boot events.
> - Rebased against linux-next-20260616
>
> Marco Scardovi (1):
>    gpiolib: acpi: Add quirk for ASUS ROG Strix G16 G614 series
>
>   drivers/gpio/gpiolib-acpi-quirks.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>

