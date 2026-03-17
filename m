Return-Path: <linux-gpio+bounces-33629-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK0fCT1CuWnq9wEAu9opvQ
	(envelope-from <linux-gpio+bounces-33629-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:59:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFC2A9683
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58C0E30EBD7F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760D83B9601;
	Tue, 17 Mar 2026 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="hpSVY/R3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BA3B6C1C;
	Tue, 17 Mar 2026 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748626; cv=none; b=lbWAzwRBV8vgzgumMCH6UzFQ4GRw8l6XfZw5CdBR6eiJfnQTDOTqUN1lMg6GTPdhqXuEGafUcFGuIrmsk4krdm12lmjXDpyfjZ1CQzr7hFU0KUHwrjE3Cmouw/rHwFKWbT4AplMmeuSUWmLmkzGWwRWEFYrpxvrRboS9ssrTSZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748626; c=relaxed/simple;
	bh=Jv6XUNQ7Mp6i3OPmnLO/dLnqySO4oIbJpvyPlq9XQVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ff0CnHQcauUd+ilqG2QL/66NWD7Pg0yr5MM/4Ry5sJPi0dffGc5UkWLl1i6wyndlkrURuCTCQBsSR37C7eUJxD3YqUDRerULVp/UlmqbsTWdWlgYhSGHCwl8wPFqdCjo/3SBtnDzrkB+9YwuTHmkSui25wviC9sPVpuAdC8ynBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=hpSVY/R3; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsBmQ53851628, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748451; bh=vRAWdjCwxCbz+YpNUmuGWkb9Vz8VLQ2U7nUml1WoZqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=hpSVY/R3/71HeOWYGgwnuUOli9Cwh25gI7Vd4vCU/y1ccrHU8e9bDn20luUrSkBQO
	 8AB1CGhcH234cbPZR9GSX5JeFw+rEHsUH6BTyEhpykT6ZpL67o2PLdZQ4ph89SKHdi
	 RIHPiP78NcqXQoH1r5aNFoFSoqgTWg6ZzsetXzHgEzsLkonxLHInEf//VfltBdYDii
	 DrGlwT9skO9W6rLAfpuBHLdjLBd3OiaPy6KfMSH7hEUV+gYwMgr3Wtu2rFuwwuXXQN
	 zFzQ9JK8mSsPFJeT57SW/rsCUy3ux7rPAsV/jH7rY30bUws/9vj5N7SdfPZ9yBnsMu
	 zjZZSH69e2v0A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsBmQ53851628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:12 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:12 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 4/8] dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle' description
Date: Tue, 17 Mar 2026 19:54:06 +0800
Message-ID: <20260317115411.2154365-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33629-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:email,realtek.com:mid,microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B4CFC2A9683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The previous description was misleading because this hardware block is not
a PWM generator. It does not generate a signal with a specific frequency
and duty ratio.

Instead, it provides a fixed nanosecond-level adjustment to the rising/
falling edges of an existing signal.

The property name is kept as 'realtek,duty-cycle' rather than being
renamed to strictly preserve Device Tree ABI backward compatibility.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Add Reviewed-by from Linus and Acked-by tag from Conor.

 .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml         | 7 +++++--
 .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml         | 7 +++++--
 .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml         | 7 +++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
index 90bd49d87d2e..2a640e495cc7 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
@@ -135,8 +135,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
index b6211c8544ca..2136546adec8 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
@@ -134,8 +134,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
index e88bc649cc73..e8ea1362b16d 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
@@ -133,8 +133,11 @@ patternProperties:
 
       realtek,duty-cycle:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
-- 
2.34.1


