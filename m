Return-Path: <linux-gpio+bounces-37885-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yce8ETLmH2orsAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37885-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:30:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CD1635B75
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:30:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b="kd/m92Jt";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37885-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37885-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8C9330A6448
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 08:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6408F423164;
	Wed,  3 Jun 2026 08:26:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C194E421A02;
	Wed,  3 Jun 2026 08:26:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475176; cv=none; b=m5Q4Q5h/Q7rbiQ0VhyilN7hG2rEe5QZgXa4YV/lLwPiqrN66J9oKNuKh1HTQFm6DEbV5DXPsTgRUSjXkCQagBqTxJSbAXtyAMgdN+SPPtHgH7hrTLAe5CHB/FWyk3SJhTs6Z6OVUFMtks8okmNCQQf/RxFackt6rrmk4eKGvi6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475176; c=relaxed/simple;
	bh=HnDoJc1wVP1qFgJjnEmr1/CMX1uh1tn18/Vyj8exdoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djm4fZvb0aHz32klY55EjiJy5J7b4RAtJUGcWBhG/SXvczZk3WVXnOUQKxA9walLGFOCU1+MHSscIE7b1Ak95wm8LUY2ABRdRiAUGdyjUWkbEk4TqqlfEZYoM2zP0/Pa9hguJrdHe4CDB8C1zd1G62XP3n9jzc2WrVAsDPPBX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kd/m92Jt; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1591327155;
	Wed,  3 Jun 2026 10:26:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmAZXT24dWYo; Wed,  3 Jun 2026 10:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780475172; bh=HnDoJc1wVP1qFgJjnEmr1/CMX1uh1tn18/Vyj8exdoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kd/m92JtkMmtgc+g+DEyyJgaXgJ2nr/I5S26A3qqTubRB+HYycNk9kvAZFegLtAdF
	 IgY73f3aRMasf1EY2wlNvSJwzDk2fIDRo5sdmE2Dodxp+Q4PSnhiMm4Xc6tR4gZNMl
	 k09mf4AieZ4A28J3M+1cQht7guLuyjH4RlCGlYZ1IJP3eNyxlMeuKQz/Bf9WfPB0As
	 w0v3Kok7GaPQKfuXnnpYxHXDUy/alvXjYvEyAEdSiQRJEWNw7Rf4QGkiK6pruHtk7B
	 DDKo93r+sgeruhgsjUSG74V9MkOzCldcCa73ZRBcQkO6SkeR9ZqIGM59Lx6qHitCBa
	 PbNTLMex7Go6Q==
From: Marco Scardovi <scardracs@disroot.org>
To: mika.westerberg@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	scardracs@disroot.org
Subject: Re: [PATCH v5] gpiolib: acpi: prevent address truncation in OperationRegion handler
Date: Wed,  3 Jun 2026 10:25:50 +0200
Message-ID: <20260603082550.11989-1-scardracs@disroot.org>
In-Reply-To: <20260602121535.GC2990@black.igk.intel.com>
References: <20260602121535.GC2990@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37885-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mika.westerberg@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:scardracs@disroot.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,disroot.org:mid,disroot.org:from_mime,disroot.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01CD1635B75

Hi Mika,

Thanks for the clarification.

After looking again at the ACPI specification, I agree that AML accesses
GPIO fields through Connection() resources, so the offset used by the
handler is derived from the GPIO resource descriptor itself.

Therefore, describing this as a truncation issue is not accurate. The
actual issue is that the address argument is used as an index into
agpio->pin_table without first validating that it is within
agpio->pin_table_length.

I'll update the description accordingly and focus on the missing bounds
check rather than truncation or wrap-around.

If You or anyone else haven't any more suggestions/reviews I'll post it
later today/tomorrow as a v6.

Thanks,
Marco

