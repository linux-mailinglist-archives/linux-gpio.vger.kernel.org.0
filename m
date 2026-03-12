Return-Path: <linux-gpio+bounces-33242-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL71IAClsmnwOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33242-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:35:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D72710C3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94E38307709C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71BA3A1E96;
	Thu, 12 Mar 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ZzCWWUza"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067E399341;
	Thu, 12 Mar 2026 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315218; cv=none; b=Cgz9aVieFxtpwvXIRaN42yrqDw4+KcGsT6ijs+5ItrXj0sTboWps9xsJVnD+9UQx6vAQ8HAp9Nc+vZ5SO1Nj+QmcjnElXTFjupsQ8KUTylcCG+jnyc2F9qjpUF0mQhxkClUK58j0ITsyg978GbXv9mKS0AKuFpxJ60USfaBzbU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315218; c=relaxed/simple;
	bh=Lq5F5VBC2Za2D82PHIvlT9JQlI/cYr9M1sh5RyEbENY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T8FX16WndE3aKXCdvdxTvbLW5zDvr/zEAYAkLD5oZ/+n36tVjKKNdDUDxuZjbzpny+CHeWfIVmfuIunGfc1JTOnfX0/F+7QtV6eMarKBHEjGvxHDkwUuySBZPW5m578cCv/mITRFV/onLAS5wJE/rzFXTGfhPNqhHGfguDqIgkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ZzCWWUza; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62CBUfGvA2456775, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773315041; bh=KRKwlNptv66mBAar+PaEyJl/1lwLb25U/oESD7/00jc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=ZzCWWUzaat8+qCWpQYlggnzePtw/1QRuJvQqglXvbmM0Y3KTAP1LJWPtxiQfnykJ8
	 CMDso3rp27Gunl8FG/ZeC7a3CVc0YkhFaIODTKF1G71J14RNdGCCbwCA20nyNlUFfE
	 Oyotk5Vcl6p2bSG4/8Gt3hJwm50bbGhZwRdbiyak8EMg+cpH/It0P5wsgN9imw6MYk
	 Gg/8ndAR3/XiuiOkfuEaOXLzyn4wxYcs2KIGdKc3leLxNNwlMsa8OhfOwbTfrhpBvf
	 tDf34H9WcPbJ9mIKQzc1kTi0zk3L20v02Sdw2VbUbxbA0911tXacvT+M38HGAPkyMb
	 K7rxwXP3miTKQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62CBUfGvA2456775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 19:30:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 12 Mar 2026 19:30:41 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 12 Mar 2026 19:30:41 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v3 3/7] dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle' description
Date: Thu, 12 Mar 2026 19:30:36 +0800
Message-ID: <20260312113040.68189-4-eleanor.lin@realtek.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33242-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:email,realtek.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 467D72710C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The previous description was misleading because this hardware block is not
a PWM generator. It does not generate a signal with a specific frequency
and duty ratio.

Instead, it provides a fixed nanosecond-level adjustment to the rising/
falling edges of an existing signal.

The property name is kept as 'realtek,duty-cycle' rather than being
renamed to strictly preserve Device Tree ABI backward compatibility.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v3:
- Reverted property name change.
---
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


