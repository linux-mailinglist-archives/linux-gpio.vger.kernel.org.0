Return-Path: <linux-gpio+bounces-36496-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOZ4O67PAGr3MwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36496-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 20:34:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BF505AE1
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 20:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8855D3037485
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 18:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAF53115AF;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLpWIDNP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A7331326B;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778437937; cv=none; b=HhnBA3VmPNGI0oi6xPYNNkmunFBBdHESjxFd6LeTG4MwVGCIR75J4sNVBats3UQkdH/Wp98ESdp7sAF9a7ZJtbNZA3uG/ojMu6EEFUaX8BKGyCXEVctt/qBhmwWLmOgleT0HcvKSCHXdqxGitwGaBuRUdQfCXqFQyaypgclb0do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778437937; c=relaxed/simple;
	bh=J5DVFZpbI/iCCQJkG0D1pYqDIIeZqc8UastCfYmVqGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6dlaRAlndYo3Rkj4aNuSP6rJ3XpMafaroUzMcm0A4cmZkS0A9Yyc9Aky/oBxeOgWPLw25ZISNP/NTdo6AclPRHdTBKsyL0QMo9lY+ynSCtAslnDFnUvthqOIB+XhuB7d4kNBRykacJysobEQjwEoSBQXb+JJEnuF1tzY+BIpz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLpWIDNP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 773F1C2BCC7;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778437937;
	bh=J5DVFZpbI/iCCQJkG0D1pYqDIIeZqc8UastCfYmVqGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dLpWIDNPoBLL0tNblVQHj/ETvs5w6OPVYT1/EMQlYtGTs5igAgzk6LFaI9h48h/44
	 p3MuL8cP3mTWV54hlqj0AO3kZxc1Hbg4KYOqSc3MazGmIACeA8LvdSAMmNJ819f3VT
	 li1QutH3cTZBOnlTpSv1urLoHK/1XCMw6GeSW3DtdZ2G14VNeWXQ7fNwZM93c2CDjo
	 yupjRHRsxqmxPNBQhXe5actqkZNc4DP1HWUovgpVWS8iCs5tEr24zydWM/qNRkShr8
	 3avg1u89m3W4JqpBRhZfFLQ6zfaJbwASODWn4TvEr3Sf7N6bnriH2GxH6CVgk9jUCz
	 Mq8VJscgxTLJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A037CD37B5;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 11 May 2026 01:32:11 +0700
Subject: [PATCH v2 3/3] dt-bindings: usb: fix properties type
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-bm92t-v2-3-2145e4f4386b@gmail.com>
References: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
In-Reply-To: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, CTCaer <ctcaer@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778437929; l=1431;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=f6S7QyZFwXdvy107/0JuOsiYe2d8g5NArKl85IO4QKI=;
 b=O/UffyUVHLFM26VSXF5Zp+aE56RyfVdIa/jgYJcrbUqlGu++fkJ0xLl/UxnwKzK1bQIGhIPYe
 V129Ye44sBvCh/ygmhB+DZ6bA7tclX+LNEgVwRuT/wef1GVqPXdlR3V
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 542BF505AE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36496-lists,linux-gpio=lfdr.de,azkali.limited.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

rohm,pd-5v-current-limit-ma, rohm,pd-9v-current-limit-ma,
rohm,pd-12v-current-limit-ma, rohm,pd-15v-current-limit-ma
where missing type, add appropriate uint32 type

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 Documentation/devicetree/bindings/usb/rohm,bm92t.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml b/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml
index 007f70a8f5bb..6ee6ddcdca7a 100644
--- a/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml
+++ b/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml
@@ -71,15 +71,19 @@ properties:
       Disable the lower power limit applied when a dock is detected.
 
   rohm,pd-5v-current-limit-ma:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: Charging current limit in mA when 5V PD contract is active.
 
   rohm,pd-9v-current-limit-ma:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: Charging current limit in mA when 9V PD contract is active.
 
   rohm,pd-12v-current-limit-ma:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: Charging current limit in mA when 12V PD contract is active.
 
   rohm,pd-15v-current-limit-ma:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: Charging current limit in mA when 15V PD contract is active.
 
   port:

-- 
2.54.0



