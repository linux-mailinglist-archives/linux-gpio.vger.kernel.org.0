Return-Path: <linux-gpio+bounces-33601-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMJ5NbcfuWmergEAu9opvQ
	(envelope-from <linux-gpio+bounces-33601-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:32:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B62A6D12
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9114130955E0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F67374183;
	Tue, 17 Mar 2026 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BL/PJH8a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925C35E95D;
	Tue, 17 Mar 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739717; cv=none; b=BZxCsIAXwzvphUeggApgD6o2o1FToVXayqXHoJvFSxU03JJ00b/dnT/7YmIEELxVHozjpib0V8zRCK9Ytb/BNHdGMZLieZrPkauCWJVqB+I+iw4lkA+bVEH8LUkEb1wUrjERfhgGUgxTTs8COo/jZ8BhOiE7k8yISpHURxK+zWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739717; c=relaxed/simple;
	bh=D3rv23vP3GNGYsHHzaSWIvumnHJui1I0W5+mW/jdySo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eG7xw6F5Utua1sqTebCXh1pqHT1Lwpcor7o3yDJLfWlf40XZFUXQ17U4I4zGVXqZXWa9+JNiti7BYBwNirF7Py/yljuuTyw4YZNbxuRlfrEIjgNsYV1qTeE4vsenCZicvhOEs5hsZjxq+HfaEdYEb6sBeqGjhaTwmerKmnrpAdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BL/PJH8a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB000C19425;
	Tue, 17 Mar 2026 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739717;
	bh=D3rv23vP3GNGYsHHzaSWIvumnHJui1I0W5+mW/jdySo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BL/PJH8agzSyMdw4uJyASEJmgJ7fXvaRqhJawkDECXmHuvNbZgUW/V1lA01iNIo0L
	 14nLbcuqgwpSopgId52KC0I0rrTThoAFkdO23D6VYOF7hqIpsL+0lH9uDbxbCbtkSv
	 hrLiZzMu6m3mu8gxDOpjrW65+zC1fwNqp3jz825Bp1V7iIZYmMclze71S6sAZCgeRU
	 zdZ82Y32/PZALqGmi7d4VAnEM56UpLG54BHO6d1xIO/TfwX4/gsNhBfdqaHmzffrTC
	 t737aP/4SHaMWdS5bGUOh8F+Gz3vLSnkaUbMaB4eQKlB0gwoF7pdVE8q5G9h01cCF7
	 dDK0IxNPyAXWA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Mar 2026 10:28:31 +0100
Subject: [PATCH v2 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-mfd-arizona-irq-v2-1-9ea546f517dc@kernel.org>
References: <20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org>
In-Reply-To: <20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org>
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33601-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B4B62A6D12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Wolfson Microelectronics Arizona sometimes needs to poll the
GPIO line corresponding to the IRQ to counter bugs in the hardware
that appear on edge-triggered IRQs.

For this situation, provide the optional irq-gpios property.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/mfd/wlf,arizona.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
index 7902f3c5d289..dbf1f1e0a57e 100644
--- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
+++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
@@ -194,6 +194,15 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  irq-gpios:
+    maxItems: 1
+    description:
+      Nominally a functional IRQ should be provided in the interrupts
+      property. However due to glitches in the hardware, the GPIO line
+      corresponding to the IRQ sometimes need to be iteratively polled to
+      check for the triggering edge. If this bug is present, the GPIO line
+      should be passed here.
+
   wlf,reset:
     description:
       GPIO specifier for the GPIO controlling RESET

-- 
2.53.0


