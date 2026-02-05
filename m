Return-Path: <linux-gpio+bounces-31475-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIddI0GXhGk43gMAu9opvQ
	(envelope-from <linux-gpio+bounces-31475-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 14:12:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05222F309A
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 14:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE5C2301628E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 13:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58653D5235;
	Thu,  5 Feb 2026 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=dev.tdt.de header.i=@dev.tdt.de header.b="VqLwQ/bg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BC4C97;
	Thu,  5 Feb 2026 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297150; cv=none; b=e43qjWGijx52e8kbwR6OCy58tXanzvqnJeaX46/pCE3jfLd4jXUJo+LGL+ppQWgFwYzk+1uGgRZ8x67dccvKDUgVq7ncPZpXTpx8Byq7XDGOFjTOyt5itz+bnun/i7pWmXuwHd8bqVOQzeQPdMp++ZMSIKhtStO/Hu2YSNIsj7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297150; c=relaxed/simple;
	bh=6wZMJRHOqSeijjYvBXmjC8a2MBqSH1LlrASOWPzsPeg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:Cc; b=HULf9/+xm/Izms/lDbwHNvhwHXH1PFDKa6Vq/B/0sqa2MwPXZznyjklPIGcRS5qBPDjX2rsDFHHjaGovMdQWRgEWv5xiNGQ7sKvCiBE3CiqbhSlmR0U7RDoUE1lagrPH2M27AMfowcbQvTsUHz/HC6tt9U2tXMPunEWhbXNr3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; dkim=temperror (0-bit key) header.d=dev.tdt.de header.i=@dev.tdt.de header.b=VqLwQ/bg; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=451014665c=fe@dev.tdt.de>)
	id 1vnytn-007WtF-E3; Thu, 05 Feb 2026 13:55:55 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1vnytm-00HFwG-Rc; Thu, 05 Feb 2026 13:55:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev.tdt.de;
	s=z1-selector1; t=1770296154;
	bh=mCK0leNJNLgkUU7++A1Z24504q+4xW0JO3Agfb3qRRA=;
	h=From:Subject:Date:To:Cc:From;
	b=VqLwQ/bgOwZVSmvZHFghUC0YBuhnYnxpcErfJ3/fDwsfIVBf7bXQxEiNdV2FOIdJ/
	 Db24wQ/E2HWvsS+rPFvU7xsRcotN+/u9bKCe7pITxE0xuwRLmkkUqIwcohAcaCIRYo
	 iNhbnUWsyaWvWg/+mt3WRxvL/EIk0WSj6TNRCeu4EMS+coK2A0Kg8XLdEEfKXM1Fe6
	 k5Z/H4owOVpKS2VE49oGa2FbWaJ3JktsrNzwotaVS1fohvAQSwpCcWqFFbIJymWHuw
	 MXKNVZHNpEERUGqvP/WF/sHS4oaTwuIflYdzLG4TzyM4lG8/vQ7JyhAmF7A82J/AZW
	 Xayr92fa/epPw==
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 6CF5A240040;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 66BC4240036;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
Received: from [10.2.3.40] (unknown [10.2.3.40])
	by mail.dev.tdt.de (Postfix) with ESMTPSA id 45AC422826;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
From: Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH 0/2] pinctrl: equilibrium: fix warning trace on load
Date: Thu, 05 Feb 2026 13:55:44 +0100
Message-ID: <20260205-pinctrl-equilibrium-v1-0-66909a3b0acb@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCThGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNT3YLMvOSSohzd1MLSzJzMpKLM0lzdJMsUCwsTA8uUFHNLJaDOgqL
 UtMwKsKnRsbW1ANCy2+tlAAAA
X-Change-ID: 20260205-pinctrl-equilibrium-b9d88409dd79
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Florian Eckert <Eckert.Florian@gmail.com>,
	Florian Eckert <fe@dev.tdt.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770296154; l=1035;
 i=fe@dev.tdt.de; s=20260205; h=from:subject:message-id;
 bh=6wZMJRHOqSeijjYvBXmjC8a2MBqSH1LlrASOWPzsPeg=;
 b=71FEziEzmicrvnv70qtKiVBi+mmkpT3DsAdblXKXfUJboxOj5EokPruFSVuRtDxaxUaaY2Scg
 xPUJYxT0ohjCD+RMwBs+tHlPoob1JT98Q73DzHRciLoIJgfjrJSjvxi
X-Developer-Key: i=fe@dev.tdt.de; a=ed25519;
 pk=q7Pvv3Au2sAVRhBz5UF7ZqUPNxUwXQ78Jdqu8E6Negk=
X-purgate-ID: 151534::1770296155-965FE330-E298789B/0/0
X-purgate: clean
X-purgate-type: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tdt.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[dev.tdt.de:s=z1-selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,dev.tdt.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31475-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[dev.tdt.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tdt.de:email,dev.tdt.de:mid,dev.tdt.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fe@dev.tdt.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 05222F309A
X-Rspamd-Action: no action

The following series of patches fixes a warning message for each GPIO
during driver loading. The core problem is that the names of the functions
in the driver implementation do not match those of the callbacks. Therefore,
the functions were used incorrectly.

For this reason, the first patch renames the callbacks and adapts them
to the usual pattern used by other drivers in this subsystem. In the second
patch of this serie, the actual problem is then fixed after it becomes
clearer that the functions have been used incorrectly.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
Florian Eckert (2):
      pinctrl: equilibrium: rename irq_chip function callbacks
      pinctrl: equilibrium: fix warning trace on load

 drivers/pinctrl/pinctrl-equilibrium.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-pinctrl-equilibrium-b9d88409dd79

Best regards,
-- 
Florian Eckert <fe@dev.tdt.de>


