Return-Path: <linux-gpio+bounces-38646-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /jn5HWDuMmpB7wUAu9opvQ
	(envelope-from <linux-gpio+bounces-38646-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 20:58:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E477B69C0D2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 20:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=XERlxhC6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38646-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38646-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD90C307D7CA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36B437C906;
	Wed, 17 Jun 2026 18:53:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2EA33A9FF;
	Wed, 17 Jun 2026 18:53:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722425; cv=none; b=dwZmC6b9QeH4+ojLm6fIhWsbA3PrSoDIKeBTNX95HnfhgeqcFOgHQnACFBbPb0+HbUDNzD6ulH+4cRkMX4iVAD4OuQNVtYuDQQ49JgAt/yRJfPCa/2SBmKkO9dmnSfa39fdI+X97/1X+DurEMTPshO+Npm3w+pFQYM93b+rd31c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722425; c=relaxed/simple;
	bh=5F3OXM1sBF2ZFLRSxaiM/fLA1EljXy2Lo7y6NT0bs34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYq2WiVnvRDtD9jIZlcJb4Kp+z2yhWHqEk4/xX6eK+vC6xgX94S7zAN/nqB9CQCx0FpOzBtOvgVe8+dfshJFjncqZz92WsVClXphktOvvgry3eZeH/7b0xBj+ywhZ8SQW1Ok8DBkuoacYoqw0wFiv6VwP5BFhgAPDRmkAwqt0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XERlxhC6; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BEFC12686D;
	Wed, 17 Jun 2026 20:53:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrNnNFwVhjtG; Wed, 17 Jun 2026 20:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781722414; bh=5F3OXM1sBF2ZFLRSxaiM/fLA1EljXy2Lo7y6NT0bs34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XERlxhC65n8NsiN5GbYFFbmWrxKiMNjtyxuyrdQ/C/HW/pnPp2ucuaXJacWPGvKg/
	 CBFQuF8hvqhLQ6Iionar7FB0MIp8CvyzmfeVPBR1zUyr/YUNS6kNPEcz6vxhhuFuqN
	 FSU1AG3NFw6Iwhu18HlovaxaGLFAVSVrjD7hI69RNK/VeDzPLgU7xsxFkp4gp2NyRC
	 CwUWXJlGOvqjYtfBMgOBguA7Xj14ffRuGCd9vfj81G3upTh92DVqnulXGrZr+yfbka
	 ARodpzvwPIgPBc88Zqa5o6ALjzcWpUX/ojXPtA7gIq4ilFhZHzORQ/aEM/oKD/4Ir1
	 Ot0oBJn27JZKw==
From: Marco Scardovi <scardracs@disroot.org>
To: bnatikar@amd.com
Cc: andriy.shevchenko@linux.intel.com,
	brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	scardracs@disroot.org,
	westeri@kernel.org
Subject: [PATCH v2 0/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16 G614 series
Date: Wed, 17 Jun 2026 20:50:12 +0200
Message-ID: <20260617185318.11237-1-scardracs@disroot.org>
In-Reply-To: <221cd70d-70f9-4d01-8e8c-b4a5b347b8b9@amd.com>
References: <221cd70d-70f9-4d01-8e8c-b4a5b347b8b9@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38646-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bnatikar@amd.com,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:scardracs@disroot.org,m:westeri@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:mid,disroot.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E477B69C0D2

Hi Basavaraj,

Thank you for your review: this is the v2 with the rewording as requested.

Changes in v2:
- Reworded the commit message and the code comment to explain the actual
  boot-time replay mechanism as suggested by Basavaraj.
- Explicitly noted that the touchpad itself is driven by i2c-hid and functions
  normally, and that the ACPI event handler is preserved for post-boot events.
- Rebased against linux-next-20260616

Marco Scardovi (1):
  gpiolib: acpi: Add quirk for ASUS ROG Strix G16 G614 series

 drivers/gpio/gpiolib-acpi-quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.54.0


