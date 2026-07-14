Return-Path: <linux-gpio+bounces-40079-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w30cMYuNVmrt8wAAu9opvQ
	(envelope-from <linux-gpio+bounces-40079-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:27:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018A7583A9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 21:27:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=BMBMcJQC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40079-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40079-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EA58307C648
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 19:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1664D98FA;
	Tue, 14 Jul 2026 19:25:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19D5480974
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 19:25:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057156; cv=none; b=NbPZzScQhos6dBL9/Uogx97IoiwLjwXGI0qp/Uoy95s6lElx2TyVyHNaz4Fd42qxqdwtnm191VqdSxdP8Xmn9tk4Ss/KYebQ0a+S724QVCy+MKAIbEIBX0ROFE6K0fpBQeTXG/rtTug7ZeUIQjqNOBCrH8re6cYqLTnOw7hwtSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057156; c=relaxed/simple;
	bh=ahscmd9YT8oibDqCY6Oc6uJhn6xbs2gH9045tEkGePc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkPTdxVBwAcTBqHaoz/O8Rvd1PR7DGvGKg1aKKhGLVIGjKEnwUecLD9qAZaHZX5YFY54mBkowevPBZ0BjY3gHwfODHqwUW4XX+iUx/fknUbJrhToD5auOJfPCYicgOXll9as4kgOltBYdakPTXSwh62rESYGqXpwys2kIFSvc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BMBMcJQC; arc=none smtp.client-ip=209.85.160.45
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-451e2a978a3so827014fac.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057151; x=1784661951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfB31hq6nij2zrbqGroJKSVeDBtuN7UhhDZLTpuuWH4=;
        b=BMBMcJQC9JHScWT/uBYyJwG6PNecmJ9jE7nAxFGcCKHrAv8sY+49/fho/k6mbRcFa9
         U2HQy28CgrTlFJv0Sc4/VTYLgR7gh3SOsmcF2rBlQgBQv9no+Dxb6Otxf6lodA+H2W2c
         7L19EFZLvvPx5d34UEYBifoLdjL+VHgQxRGJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057151; x=1784661951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfB31hq6nij2zrbqGroJKSVeDBtuN7UhhDZLTpuuWH4=;
        b=r6ETiF950jKGWFUD+mww59nclv44qw4Bwym07OymDHCDH6LZusi5LaOUr38tziFOaE
         ZTr86mDIuNBvRIBZekyhkxlouY4PD4wgtc/6ZdRN4ky6BlYwA75kJd/6nzKujpFDZj30
         hcRAxR6zEcC+oI8XkeBHui5RR+V8bMaHgs7x2R/ommHX1AHPkLrxFuhqyx0o4YZt90HZ
         F2qES/XAoGUr8eOQgNIA0u7/vPurg36KLzvVfMktA+6rnzqA1/rzLdZH6bgnDZ/B9p9Z
         juvqwKbCwjZyrFYx9YMEBrE39RG/FAtcGd6dcYvlzQbLVupv0P7oXIN8XIdiScL2cnG9
         TFxw==
X-Forwarded-Encrypted: i=1; AFNElJ9SQ3ONR+NabAI2GTwCYDDR5IvOl40ascLcFSB5JATuahS4Vz0S+ogXUFY5xIaYVjGC+VkU5G4swWqx@vger.kernel.org
X-Gm-Message-State: AOJu0YzQsfGTvWzQ9vYUjH9mWwGmuGTlpOokQP9zcm/8ENRZFq47KS8b
	Zyy6GVYn8OuyJnnhqe0eKwOjWw4hkQzGOvA7uBXyIaTZ/ETh/gATZn8mU513XACBhw==
X-Gm-Gg: AfdE7ckrI0rA0EYsJXnwHx1wayE8YfaSu31Q9imih1UmJOyhwCQ/wK4+bwYHEJADv6+
	Ddm6o0WS0GjEVPtg+zsiTpdgBJO8E6aMoBMd7otJWNzQf1IPcTMDdFrKygxKx8t8JNARzjLBp4O
	SiHFom+8xydFMBQAzdup5zqm9TjI4AOsL78VFr1T+Hx7FIxz7LfsU6bEIFEyNtTNGxj/8AeSrWE
	mkii4GUdQp4LOKAAX4MrWb6GTsTdItRV8FyfiklzQ08CedSItwmt4zjq62zAtRkMe2rxYmcJKqg
	FfxayPCv5dq5Y3ro1jivr7c8NNSfxSLgs92UGqC5Q8XvQ4wtm2+eyo5ct4UuetSPbTF77s7El8i
	Py6kgW3QntSXGkYHn29UrKQTOf9tCHIDdrjORUWxT581qGTAhhwNMQwzjdFHvcCmA5iuTJxpPWJ
	P40rvuPTo=
X-Received: by 2002:a05:6870:1793:b0:417:4888:328b with SMTP id 586e51a60fabf-451f13ced10mr7772617fac.20.1784057150898;
        Tue, 14 Jul 2026 12:25:50 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:50 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] pinctrl: Add support for the Rockchip RV1106
Date: Tue, 14 Jul 2026 13:25:28 -0600
Message-ID: <20260714192535.2082729-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-40079-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:heiko@sntech.de,m:robh@kernel.org,m:jonas@kwiboo.se,m:conor+dt@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:sjg@chromium.org,m:brgl@kernel.org,m:jeffy.chen@rock-chips.com,m:hl@rock-chips.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:from_mime,chromium.org:dkim,chromium.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2018A7583A9

This series adds pinctrl support for the Rockchip RV1106 and its
RV1103 package variant, split out from the initial RV1106 enablement
series [1] following feedback to submit per subsystem.

On this SoC each GPIO bank has a dedicated IO control (IOC) register
block, unlike earlier Rockchip designs where the registers of all
banks share a GRF region. Following Jonas's review of v1, each bank
node now references the syscon for its own IOC block through a
rockchip,grf phandle and the driver uses a separate regmap per bank,
so no regmap crosses a block boundary.

This v2 is tested on a Luckfox Pico Mini B (RV1103): pinctrl and the
four GPIO banks probe, and the sdmmc pinctrl state is applied through
the per-bank IOC regmaps, with the SD card working.

The corresponding devicetree changes are part of the main RV1106
series, which goes through the Rockchip tree.

[1] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1122658

Changes in v2:
- Add new patch for the per-bank IOC reference
- Use a separate IOC regmap per bank, taken from the rockchip,grf
  phandle of each bank node and identified by the gpio alias, with
  block-relative register offsets
- Reject drive-strength requests for GPIO0 pins above 6, which have no
  drive-strength registers
- Specify only the first iomux offset for each bank, letting the driver
  calculate the increments

Simon Glass (3):
  dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
  dt-bindings: pinctrl: rockchip: Add RV1106 compatible
  pinctrl: rockchip: Add RV1106 pinctrl support

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   7 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 168 ++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h            |   4 +
 4 files changed, 180 insertions(+)

---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106b2

-- 
2.43.0


