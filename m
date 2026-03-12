Return-Path: <linux-gpio+bounces-33241-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIV5Jf6ksmnwOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33241-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:35:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B8D2710B4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 113383074BE0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57233A1691;
	Thu, 12 Mar 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="VSzbmUkm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054D3939D0;
	Thu, 12 Mar 2026 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315218; cv=none; b=TylN/jdv+FXSe+WBoFi4S7q29uKKiSgx23qVPxgzRJ+DXu60G9WZTnSrC/5nk+SNIY111XRE256DQd7dDP3xOa7yQiugBcKxqgiyRahdG3Bf8maqZH0Id5/WqksV9chsf/bMkR1PlWE7MOI0De3w5HEPjRK00EQ6eEe9G3/Fpuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315218; c=relaxed/simple;
	bh=a+WHMjiTNRDIjVuQ9+Q0qVRVa1tCplNh22auIHPRdaE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eIaE9nh3iVCypCf8+eJLnJyqg64cY1coo9BiJVHYvWezO2BwYh2yuGLuiVsueKrQtqqGcRR2TVC5gPBzUiDGglT7JudLtw0jNYmzRMaLvzLpTT1GGHXynueuVpM/i22b84+4ffwuz8vlsiVeVKvzjTHbRW5j6lB5x1A5c6OaAGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=VSzbmUkm; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUevxE2456770, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=J7IFS+Nq88jf8GKKNBe7mAAapyjw4fDD+dL+TVSwaL0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=VSzbmUkm0aF8/l06bUGmL+bA5BzD1OzXoo+8necBJrjxEVvMYJdDgDeOn1x/tc1Oy
	 +H4PGxCa/fjz43KEPkOHsX8IxDllYPrm478hPoWf8l9rs9WO/RF2OeNzeJJeDPz7y4
	 sYKvqEAmyBCtIcrAihNc8DwNBTCtyoF53mSF6G1VnS6RFeNtxqg3IJGaKoIwbwWC/v
	 pArqJFHrFuRs7iFBMyXJmxpYgbi1RRG3a1nv4Brnu/jmI0obCs5S5pMv2gcH7KjCOl
	 AeVA0M9g6vzlnaePtDMI5I4vuRh5woA8HNVePSCfj+x99MaZoxnJ3JrP0F1SAOMjDh
	 FIvwS3EumkORA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUevxE2456770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:40 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:40 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 1/7] dt-bindings: pincfg-node: Add input-voltage-microvolt property
Date: Thu, 12 Mar 2026 19:30:34 +0800
Message-ID: <20260312113040.68189-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312113040.68189-1-eleanor.lin@realtek.com>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33241-lists,linux-gpio=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:email,realtek.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56B8D2710B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Tzuyi Chang <tychang@realtek.com>

Add a generic pin configuration property "input-voltage-microvolt" to
support hardware designs where the input logic threshold is decoupled
from the power supply voltage.

This property allows the pinctrl driver to configure the correct internal
reference voltage for pins that need to accept input signals at a different
voltage level than their power supply. For example, a pin powered by 3.3V
may need to accept 1.8V logic signals.

This defines the reference for VIH (Input High Voltage) and VIL (Input Low
Voltage) thresholds, enabling proper signal detection across different
voltage domains.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Rebased onto the devel branch of the pinctrl tree.
- Improved commit message and description.
---
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index fe936ab09104..fd49a0d53bf0 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -162,6 +162,11 @@ properties:
       this affects the expected delay in ps before latching a value to
       an output pin.
 
+  input-voltage-microvolt:
+    description: Specifies the input voltage level of the pin in microvolts.
+      This defines the reference for  VIH (Input High Voltage) and VIL
+      (Input Low Voltage) thresholds for proper signal detection.
+
 allOf:
   - if:
       required:
-- 
2.34.1


