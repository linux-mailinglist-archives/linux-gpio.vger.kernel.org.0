Return-Path: <linux-gpio+bounces-33034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGEBMRRcsGn2iQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 18:59:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B12560C3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 18:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 381A33038718
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 17:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867463D813B;
	Tue, 10 Mar 2026 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsNYrHIz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA2C3D16FB;
	Tue, 10 Mar 2026 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773165524; cv=none; b=c5dkmPIeOPbobxt0ALLxXne0Un/Oi92YDnBLHOSk9GqrQuJBRU+DvHdx0ehIv0OG6Gz54hVaRUFESFvVP3VHHxs0DWvjZxF5751uXkzWZUwwpuhVbmL+XHTPbYcsZDvkD/Q/pH3FmduvA2JuwmFD1el1Vd1vquhSi/Z1hS7GeD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773165524; c=relaxed/simple;
	bh=KLrkLMNyUEfFrePaVM8x3w4Vu1EfIKWegtQbe6pdwHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4ZBcZG8Qs3BYtKa7q9YE+afQ94t63ErkKkcqSKDM+E6Xjr1YKSCU74nG4KqGwC8Y4y+YnMwGVttMU4qjTPcsPOBuNkatZEdbRF6Ii0j22XZVxG+oMkv9HlAXSSaggvz350YyQ+pSQsbMc62z00w3QykH7f8sILJo6J43DEsK80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsNYrHIz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42E2C2BC87;
	Tue, 10 Mar 2026 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773165523;
	bh=KLrkLMNyUEfFrePaVM8x3w4Vu1EfIKWegtQbe6pdwHQ=;
	h=From:To:Cc:Subject:Date:From;
	b=gsNYrHIzXR6zRnbxz33jhwc6/d9Y3squlEomDnLP1oVLHhQZwKKeDC9sjMe8jI5Ea
	 j9f3ZSunmlf8IDlExP0DGaVR5CfeGOB1G0PRBFvvLziQ2ftiUfl0CTfW0zJ9pG9gKv
	 rcURm2JGSZMjimQaF+JpZ/2ezLI6NJKcvwIP0H0s3NdVII/kSLkS6EDJ5cOEzi+rJl
	 VrrXXAd0/j672bQDClotcIh0mHqDbpOcQMk4UHExFK1syol+Vu90o8PvmtmgZpHNng
	 /+2lnvK69qZzEiO//CYG2LTSvan2mWbf9nRMb976nDKgg0vrgopaIpuhnwZNecON9y
	 Hk+7+8xlUM4ow==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: pincfg-node: permit bias-high-impedance with other bias properties
Date: Tue, 10 Mar 2026 17:58:27 +0000
Message-ID: <20260310-ascertain-overblown-955becc1d8a3@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZbAMXJyjF4Y1/+I3oBqxaGv3ZucElxqghRywaoh85bE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbog8r832fK+3dcGvDu83+qwMXc6ydJ85p2LDsjfMX3 WZFplT+jlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkfy/Df9elk0xCVWddcfrR IrnRqfHyhOLgLR5sPW95E6edU6jzv8bI8Gwb1/qpy97FR7ndYy5PzFUPMjh3cOZ9Lj2ulA82NvN m8gIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D1B12560C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33034-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

It is possible that devices tristate buffers may set the buffer to
the high-Z state in addition to setting pull-up or pull-down on a pin.
Remove this particular restriction to prevent warning on zynqmp systems
where this configuration seems to be valid.

Reported-by: Rob Herring (Arm) <robh@kernel.org>
Fixes: a901e8705f89f ("dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index fe936ab091040..981f45c2f56b0 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -236,8 +236,6 @@ allOf:
       anyOf:
         - required:
             - bias-disable
-        - required:
-            - bias-high-impedance
         - required:
             - bias-bus-hold
         - required:
@@ -250,8 +248,6 @@ allOf:
       oneOf:
         - required:
             - bias-disable
-        - required:
-            - bias-high-impedance
         - required:
             - bias-bus-hold
         - required:
-- 
2.51.0


