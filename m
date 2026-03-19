Return-Path: <linux-gpio+bounces-33825-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPrxFgUHvGkArgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33825-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:24:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1702CCB52
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1CD49306D058
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447FC3370EC;
	Thu, 19 Mar 2026 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1E2Poh0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A0E33A70F
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929726; cv=none; b=hObgZ/1JvoHrFLuk1QcEDrJ12sZm7i3QkC7BVsT5m9V36JuMtvJ29yOW8XJKfWDw/jPGahwYBAr82A2HToC4cvLlePmLzXG8NYoCBagkBBJmrSRRnWUm2MxuD/1KOXGICDT257QEgKTHcl/Mbzg3XD6Ssb9ccrKKyzHg7kErjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929726; c=relaxed/simple;
	bh=AVqKV2koLL7ZlkRc62jikhi1UX4IiI5DvZw1l2ipQw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aT7S4vAEJRqy56BXBUt6K4uu+fVXC2a/SI9iSM9/PE7HwGKwEh6vp6EN6kl+zrT2WMAisn8BsYZTVpCWHJY13jHc9SBbUyTdZqZ3/6GLJU+nEIanWGenC8pX0C/1O/GCSFy8l4XDSGEc4fLqHHUqKEHAH4a4LPqk9vVkF6FMsRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1E2Poh0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b4d734678so989575f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773929719; x=1774534519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVOwtxYwKf7F+id86vByPrLslX0VOCCmqpIA6XP6qiw=;
        b=Q1E2Poh0Sgop4j0ZeuULYvsTCnM9vWucHJdYqXYr4Vd63rxYm/g5HsODEZkqMtRNdN
         1W91gwJYsY267BOY79c7XvY/i/5awpakgTaaWZgsQFw/HfB2BA7rVnGnRWsHCQeeLhhz
         Q/3u8Jd+v/YGR3qDKuJkJN6CDyA8/o7Ym1hXLCm/wOI4qX6Cx1tBEsebzWcPZlX/LHC3
         8pz3pvd1m+bH73g3Fy9R7XAcfbk/ycLzsq4ye72kNMbH5L+Un0zpYqyzG5JMl5LYCDxN
         1OtVOGjXaMyQ8GlR15mRFQybd0oV7Hr0CmiqfznjD3uPXJ6KJw/WvyciDQE0Ru0EzSNf
         2pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929719; x=1774534519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dVOwtxYwKf7F+id86vByPrLslX0VOCCmqpIA6XP6qiw=;
        b=qtm99CMrQWbfbx5L/5nZHtiY+sJl/+Us1SnugdPHZZkSRClbEVdTJO8qSG1clWVnxR
         DT54u1ZBjMdgHT/oF1miMOubCCf8ExyLSKnXzqY9TCJd6seJiVugrzKS/1SNBx8BzEj7
         oUMdXzMxwc7ep4VE4PsP00m8rwbAy3N0mSNPszfadm4NMc+4J+yNp3+vfZQN4Ks49vW0
         zHikJruyOTQ0Ecrht8E2xFwgKtcmQ2qpPncZQSXwGPrydH73DK449DnQv3qeWYIzp8K0
         xSWMWFciC17uIedV+wgt6wkdpMCP3C1pKTO+BA6dUhEslpDb2sB6uaGMW1Loow8HpuOM
         ZIlA==
X-Forwarded-Encrypted: i=1; AJvYcCVXWmCQ+mrS2cHsNQCZkqB8FWIf5RarNkjqEtZEyssZSyeTAENLgvJ9+ESnSO1V6tL+0LQAGIfQu+7m@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0vny1cNbmpUvFBu+aAZx3G0XN4CYzWkFRNeaKE674U1Vdl80
	qR+LQZwne2ShY0xrJ7XRSkKoL8IRgjtEcstmsXeIOTNbScn9FLsK03Es
X-Gm-Gg: ATEYQzw9MFJGNgd4aoQGvDP4YETrJUsqlwp3vqnPTGA5lOZh3mBNc81t+VHdBKB5AXJ
	FadaeYpkrwmX13kN9zc5O5rZbZCXsjn3YCIeEW8nKLdw4xszN+7dPyNxKzbmem5w0AvyWHLt0dk
	ob0w1Lsp2RoEw8fQAKs+25fmDlUdkuS/u+p+mTHOLBwfAi9CrJ1mw/N10m6rc4UwmGuhqD/2MVJ
	r6z6w/p0m3VnaSLitAaxPVqPuO4cbT+h0itKYYPqcCibubAUUIAVCvSjoTmJd0h/jHqQbpih5Rh
	Ll1EgBrhfpxbArT+2uKd9mfc9pDXL5OCzBYmImgQyj57EKsMsPvezQsM/0S+wKyajLoOGnlvB2O
	csI12gS6142rtM5lk0UJtBEYYebvZ7SNEVahtLpzq3Ie9bl3WtxB7QpdjLlLa9XqyFJdiFKmOQr
	rFY/xbi060M/3XI7cnziPN+hmEMOxFyzaAsuINuuf1dFh4fCqIHeUSWhJVJbE48kTDrlsJQdtYv
	WokzZPezMd4B4zfSKDaq8QZEfaFEx7nIDBg96uwqozApyU=
X-Received: by 2002:a05:6000:2501:b0:439:c42f:10c4 with SMTP id ffacd0b85a97d-43b527a97b3mr13343032f8f.15.1773929718875;
        Thu, 19 Mar 2026 07:15:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:f7c0:c444:6359:4c21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm17824618f8f.5.2026.03.19.07.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:15:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin configuration properties
Date: Thu, 19 Mar 2026 14:15:14 +0000
Message-ID: <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33825-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-0.959];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D1702CCB52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the pin configuration properties supported by the RZ/T2H
pinctrl driver.

The RZ/T2H SoC allows configuring several electrical characteristics
through the DRCTLm (I/O Buffer Function Switching) registers. These
registers control drive strength, bias configuration, Schmitt trigger
input, and output slew rate.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit description
- Switched to using the standard drive-strength-microamp property
  name instead of a custom one
- Added a description for slew-rate property
---
 .../pinctrl/renesas,r9a09g077-pinctrl.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
index f049013a4e0c..63993b20524f 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
@@ -83,6 +83,23 @@ definitions:
       input: true
       input-enable: true
       output-enable: true
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      input-schmitt-enable: true
+      input-schmitt-disable: true
+      slew-rate:
+        description: 0 is slow slew rate, 1 is fast slew rate
+        enum: [0, 1]
+      drive-strength-microamp:
+        description: |
+          Four discrete levels are supported (via registers DRCTLm), corresponding
+          to the following nominal values:
+          - 2500  (Low strength)
+          - 5000  (Middle strength)
+          - 9000  (High strength)
+          - 11800 (Ultra High strength)
+        enum: [2500, 5000, 9000, 11800]
     oneOf:
       - required: [pinmux]
       - required: [pins]
-- 
2.53.0


