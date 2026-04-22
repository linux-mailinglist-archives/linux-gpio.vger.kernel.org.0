Return-Path: <linux-gpio+bounces-35362-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id L2H9ATnz6Gl3SAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35362-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:11:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B394484C8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61C9430A5D58
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4351038A706;
	Wed, 22 Apr 2026 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma3Yr86C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA237D124
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873915; cv=none; b=jQgqc8XcRoChmap4D7TjhML7g7wNanJyT+6fAYXzwrqXbE/DdgbDWsw+eZO89Z+8PmAvyXb1I7uEgCsGx1/n9fKdGhTCIHUO9TYUq/f8eDzLVW0mzJUlbCQ1dpMbSSE+rTsHr9Di/1Wwp1QSeeYOMQZwXUu9A2m7iO2Sn0xu4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873915; c=relaxed/simple;
	bh=0oF5yLnqueqC9tyouh3AcpVVlddHY0rpyMWXyvW8cHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f/0w9XcvoihXmsqBHqqJYX6xJn1mYsjgEegFaXbjQjfkSMNHg5qeF1l0I9SYYiFYMk2maXh4Ps93EmIYaCuPQSsWL43+b123sWwwMHEqIEF/ez+4d6QAn/MfRRhPA4P4YH0BHn4BM5J+xqcAcSNiNwL3TRlODmKoKRtad0msVjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma3Yr86C; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f83bd32efso4438096b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776873913; x=1777478713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxb256EBeZtQyoihRghLekjihrjtRwmLsvJYxZ59QmU=;
        b=ma3Yr86ClFK61Jn9bZTfZOHVCGyoV6k03Y4GxmyQyHGMxd9fVcEtJyZgdrMmBKGsxF
         4382zRKrlJNkg5qdiyvUjKi9vppDNDgZKw/ecB1gF856ciP5vOhuiBnj+nrZwO/RAfb4
         MuS988/lMMY7sshPvga1A93U2YuCG589vdUWFRlOslPP/QedOI8ug7SYQtf4ELIJTObQ
         Qv+tfFuHlEbG7stq7a2eyy4lhlD/rn8/P9uG6rmuAapNUmVcLtZXpMJ3tE52ZspTZxrF
         7T8ely/kEiAEcxC7/C3c5mBZxKyxDBJLf9H/aP0WeSXEfPDhWSyvV6OgL74pOxhYD6+b
         0Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873913; x=1777478713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxb256EBeZtQyoihRghLekjihrjtRwmLsvJYxZ59QmU=;
        b=BhIQI0V8vXM+E5rrx0yV5vx2tZZbQBg/h2HQogn2j+lpG1LsE2ch2+M4tNIYoCddbC
         Sh7LphxcE3A+PxQXIP9siMhGEXHDU7gPOS2V3D6g2Ig28Zz68/IgMpcmFKYGeLpMx9dw
         eJyRiTqPDTfZOvCAj8qrMCzyMn4oWAu5GScO+ZbWflkyCWaegif7hARlNzgg6lC23Nk8
         T9ThBHdp2AWXnExwBAQdr5axRnnq1+UKyRrBZx6Qq5O7hiLM0klLHbXrduFUYfXnr0rl
         2j7SYmvz+qgA9BUPzoKDxvLgBSBEKOEXnuX46r1eK1cXc/rYDfbyD37vhyNezy07PRy0
         2VhQ==
X-Gm-Message-State: AOJu0YwX6zk+La+lRwSYfqR2kuLhl15b47QCNeAsKCIgeoPOTxk+PINe
	MQLH8rBSOGr6L8OA10FnMMXq3RlhjSlXUb6fI5oGAFd6Udks9n9bzcdT
X-Gm-Gg: AeBDies9MoVKXl1eQa1SQTdCRgAUNSEWACNlX65dieN8BrG9WS3J8XD8ycilkraT7Vd
	tzzq5TqbEYqrXmWgVnX9To+g7M0FXYFEkrAhYBF3edOB5MN6cQoTdn2lUhl8i3nzDbaRI21keZF
	qCsyClERnf30oHpaIKwoXYSy0E65wNT8KANN3OFsErVT3lnZlHkEG/EHi9yNyHMcDPCGTCYX3sH
	g/NhAZgqBcfzQqCCGDiDTXDVp5pBjbNCMPOizHZ0bNcYL39PAx/U0xGUXC2QC4839ycHnAkEdym
	UzLrK57mdAqqArImK78ejxUR+Qjwyv7L1K9UE8sRE8zQpjotpmxM3dFzcg9AYgKw5CT7uu63nYi
	5eZbJZ5055CinHB0frK4zMAHIV0STLMZ4wi7ww5bdySpNP1oJGpqYmKC9zWS3dKki8T5m5qLlCa
	m2vkqdmoFGegtOfFb0R6pW50V6gVcVdudYFHN+xNhHJg63IpabuhEDHPirQi/YcxDS
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr24045763b3a.1.1776873912716;
        Wed, 22 Apr 2026 09:05:12 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec003dcsm18151031b3a.52.2026.04.22.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:05:12 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add registers-default property
Date: Thu, 23 Apr 2026 01:05:03 +0900
Message-Id: <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1776872453.git.happycpu@gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35362-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[happycpu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 36B394484C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 74HC595 and 74LVC594 shift registers latch their outputs until the
first serial write, so boards that depend on a specific power-on pattern
(for example active-low indicators, reset lines, or other signals that
must come up non-zero) have no way to express that today: the Linux
driver always writes zeros from its zero-initialised buffer during
probe.

Describe a new optional 'registers-default' property that carries a u8
array - one byte per cascaded register, in the same order used by the
driver's internal buffer (first byte targets the last register in the
chain). The Linux driver change that consumes this property follows.

This property is already recognised by the corresponding U-Boot driver
(drivers/gpio/74x164_gpio.c), so documenting it here brings the two
bindings back in sync and allows boards to initialise the chain once
from the bootloader DT and keep the same value after the kernel takes
over.

Signed-off-by: Chanhong Jung <happycpu@gmail.com>
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 23410aeca..c6221ed75 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -45,6 +45,15 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Number of daisy-chained shift registers
 
+  registers-default:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Initial state of the daisy-chained outputs, written by the driver
+      before the gpiochip is registered. One byte per cascaded register,
+      in the same order used by the driver's buffer (the first byte
+      targets the last register in the chain). When absent, outputs come
+      up zeroed. The number of entries must match 'registers-number'.
+
   enable-gpios:
     description: GPIO connected to the OE (Output Enable) pin.
     maxItems: 1
@@ -79,6 +88,7 @@ examples:
             gpio-controller;
             #gpio-cells = <2>;
             registers-number = <4>;
+            registers-default = /bits/ 8 <0xff 0xff 0x00 0x00>;
             spi-max-frequency = <100000>;
         };
     };
-- 
2.34.1


