Return-Path: <linux-gpio+bounces-34401-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zuaxEUg4ymnD6gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34401-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:46:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A53973576F2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42A8230EB20F
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3E83AF67A;
	Mon, 30 Mar 2026 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOBYvrff"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607A3B2FF3
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859800; cv=none; b=AM3/myzUziEMjJRC+iofwOXd8ED2zWnmJ1zcGXPkEqxtuNGhKdxgm+ncFDisA0YvN4TuxHXMKf3pY9beczd1f6e87cnNWkh3hosXBfAhUJ9IkzW1gKgrBHUFn3j/7/ET42yksDeh3qfIHZHznkiMG3YPADtAqSNciPnaaayHG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859800; c=relaxed/simple;
	bh=ferQ/I0Y9PK2QH16FMGnGF2+/wylIAM94hfiAZxJn5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQFhyr8eYrzegNTbcDkh2yYsuimxl6iraAWeuKJfrHftZ1c2HSbomfffZinJhxXNzMWXLadDrjIZ/2bLEL/Fw54GR6gXb2o+DU3L0FWtFcMX7YARx5PvP272UHtVPKt0IqJChOIYUk+MBBfnkmuONeHZqTEVAlNIWahifl1PpDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOBYvrff; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfbd17589so847695f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859794; x=1775464594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=sOBYvrffy2quhHrgmrX4S3D/PvEsXUo8xNIRXw+Aj86DYHf2h9JTjgOKT5kb0wqiSy
         eTHeH43yjOuIUqTm6BrDXqf6Ijy7Qtq9CvH6WxvOfoxBc15VA/Qm8r9uCMbPGDmn9RVu
         g7Jup+tI8g0Kw7mMEJ6tygU9FAwJtOPsF9LwS4e5UL0S6FySGV7lV2wmBHfw7Gzfpqzf
         M2ubKh84t+++qOAzWWjOUNTqpSwujRko7UN0+6yAPMe4qqEfHG/PW6gUwmGvS1eNrWIr
         X6wOrX129451gISarVPylOe89PJ01C/hYhV7yHP3LyR0UeWva0splGXJHiTJwjTx2sWb
         nZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859794; x=1775464594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXtK/Bb6scSWKAWFi8Dh0zrFz4wUjG5d2vtkn8qVfbU=;
        b=R5HYCujw9gMkZ7UJZpUHIMvce6jRchTUNLzobjpDuatZNqZg20Zk7I+uUzVui8+0nj
         Mm1FMB7nRIXdzjesuSvMML0QNajt2QtoClZTRe3DTknEXRNw0aMoQoy9pdSH0eX5KIVd
         Ho4u0MoZYr6jOJefF83u38jS7upg0ZH+FGg5O6WKpXsZO62RDMSXqmbGYEbR5CCk3R0a
         nCyINxBuk6QCi3tj46zdlNS33MKmOMy2W2jHEzRchG9O2PG2w3+0fCpdNlDSaiOZFq99
         NM3vpXYHJ7LA/5GqxMZWYMehOg8Jz0qdhjfrXLY3zGYac/VDNBb1W6ocYUUyBwHE0Q60
         vM7A==
X-Forwarded-Encrypted: i=1; AJvYcCXOy9agvhFFi5KP5ZEerIkuPeprCmCal0NvDSMFDvC3MPo65NLOPcwRmxvvqyWC9j1JS+ecEqFPXoqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDq+CkLG8cAgrcbX19acL5GQcbxZNkzQEVAPYUqQgEKdm45fqQ
	YdPBGsQzlaCOUJaUyezz1fCASfWlmm7CkGPBtnMB6fFRcU8y9ThYB18Z
X-Gm-Gg: ATEYQzxxEjpML+895KDucCfWFjJxWxhZr1xuOVEWFepTkbO1vaK+qY8wKdtxbvj92KH
	ECDqZDPt8KmrNw8QLnnFnBduHrcXzeANgkU6HUpeeJlIMYygKAgYJicV/eFjnfsl48FllgndVk8
	JQ9o87v2n0uYJ9UKp2GlsnogxrNoc8x5Kkwg4KQPTX8scDHLy0bAAv/Qu+iI6E3Dqhgmo/xxBqu
	WK40GsqOmEQso74qaTaxDyw16kdtthx9XT13T17n0sf0kghL8olRvZF2hvcIijTTcqzX1cWvPgx
	aOg7RM6Rb+MFQshBN2GGlYx0qHTal/Hc8ljxANIF6ljb8ziS5OAMX43RgXbVhUrcKEYDno0/w31
	iOGmkT64z1heDLa7ayP2l2cYzZOyx2lYSDpSU2njhr3Yum7Pg3mvVmEHC0kQaFgLTYbDjq0JI7Y
	t3z7BWOPDzj+ENJutOz8Y6k4B6h3Si9A==
X-Received: by 2002:a05:600c:6386:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48727ee5720mr183078015e9.1.1774859794164;
        Mon, 30 Mar 2026 01:36:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:36:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Mon, 30 Mar 2026 09:29:43 +0100
Message-ID: <20260330083429.359819-10-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34401-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A53973576F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 73 ++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..750ee9b2856f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		pio6392: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+
+		mt6392regulators: regulators {
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore { };
+			mt6392_vproc_reg: vproc { };
+			mt6392_vsys_reg: vsys { };
+			mt6392_vaud28_reg: vaud28 { };
+			mt6392_vxo22_reg: vxo22 { };
+			mt6392_vaud22_reg: vaud22 { };
+			mt6392_vadc18_reg: vadc18 { };
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 { };
+			mt6392_vio28_reg: vio28 { };
+			mt6392_vusb_reg: vusb { };
+			mt6392_vmc_reg: vmc { };
+			mt6392_vmch_reg: vmch { };
+			mt6392_vemc3v3_reg: vemc3v3 { };
+			mt6392_vcamaf_reg: vcamaf { };
+			mt6392_vgp1_reg: vgp1 { };
+			mt6392_vgp2_reg: vgp2 { };
+			mt6392_vefuse_reg: vefuse { };
+			mt6392_vm25_reg: vm25 { };
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm { };
+			mt6392_vio18_reg: vio18 { };
+			mt6392_vcn18_reg: vcn18 { };
+			mt6392_vcamd_reg: vcamd { };
+			mt6392_vcamio_reg: vcamio { };
+			mt6392_vrtc_reg: vrtc {	};
+		};
+	};
+};
-- 
2.43.0


