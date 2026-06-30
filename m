Return-Path: <linux-gpio+bounces-39243-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +20fLTXbQ2pUkQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39243-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:05:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6353D6E5B75
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:05:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QhzKKDxZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39243-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39243-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EBAA30C29DA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AE043C07C;
	Tue, 30 Jun 2026 14:58:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F1525A359;
	Tue, 30 Jun 2026 14:57:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831481; cv=none; b=cv0TWjH+zSYUUFSZ9TRu89gh20ma67mGv0OJrIeZl0I1g4sPZoclhmJdmMsawVF5zeJfU1xOvEaakC6G+s36v2gYXW2rFnHdXkxTXWs2BZ9A3SYj0NVVQ8DZO8HVLZf9bhAqLVXq9dg64Mg00MZioSmPYuL38P66Mg8nEMjeHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831481; c=relaxed/simple;
	bh=MO2KMMJz9bNmVTOqCZf4QqFo5B59p63cybsp9Y61isc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HaQ/W9Nmr9fETC8Nb9dYppDCtS2vgeIoH4mJgx3pioUvFeuTuiNSDF0dapym3q5lR7aeM0FPNZNQzcjbKP5KcIPgKZgufAcccahFUIMlDZNPbrqBQjaEVHACaiBeWgKnk6W6OboY9HcSpydaHBnU6rkTFD50pgJVaEXebzg8/OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhzKKDxZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142EA1F000E9;
	Tue, 30 Jun 2026 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831479;
	bh=MO2KMMJz9bNmVTOqCZf4QqFo5B59p63cybsp9Y61isc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QhzKKDxZmIcs0Lap66Azn2X8AoY3Qu3GSgafvTmWUQPRGlecNX0OGKRJz5gPgQ2j/
	 GmHT+KP9Czr8zNDroW3d2mTvNPu7IAVBbB85seDI+aRaZDPi5gbId482KzKzIVbIBF
	 ZjXy/nrSdwH1JVgztg7S6FlST1RaDJvmdQMGJXsdBo+3Tu+hyz1jCueayWzGz0jaHe
	 s3dv9RKiFxEYgf2jRKpyrjsqN3mcjH5spR3bXULyWgbhBVMI+1VHYEWmB3ivbM7sbE
	 AyJRWNN4RTdMR9PpiA9s0qj/JPF1I74B/uJSTyBomBK2h4UjzekR4gXLtzUc+Jjpn6
	 AgfbhNj7nUYYA==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct
 SPI and GPIO as SPI
In-Reply-To: <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:57:56 +0200
Message-ID: <87h5mkqdmz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39243-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,fw13:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6353D6E5B75

On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
> there are separate domains for direct SPIs and GPIO used as SPIs. Separate

s/are/were/

> domains can be useful in case irqchip want to differentiate both of them.

the irqchip wants

> Since commit unified both the domains there is no way to differentiate.

Since the commit.

> In preparation to add the second level interrupt controller support where
> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not

does not

> seem a good option either which leads to waste of resources.

'either which leads' is not a parseable sentence.


