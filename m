Return-Path: <linux-gpio+bounces-39456-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JljTLbQOSmqi9wAAu9opvQ
	(envelope-from <linux-gpio+bounces-39456-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:58:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B10B3709476
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:58:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QrHF7ezA;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39456-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39456-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3EBB3004047
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 07:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AC7366057;
	Sun,  5 Jul 2026 07:58:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D1363C79
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 07:58:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238319; cv=none; b=UdJNMyln54WpLhzFZ35L+0uutn6HvBTFdoN2bIdRJgdhaPYydnGmZqTVlG92NctoU+SpFYBdnpXN1tgXjI7XNYUn57qG4r7WCHVoAetzklveWZujXQIsCAngOKhigBB3sEFLIkdQciZNtlBpmGbpoykpnTzcyf8iqtdxETnyX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238319; c=relaxed/simple;
	bh=Gd6MlDdTQsHXKAXfnYEwmqafYU5uT6MkwvCo5cd4Z9M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r8xol0yjYs7wA+NMF/qkVTUc5TWdYLm6nysAbr2yLPN0EouuAo7ux0BFMv9ixNY5NSr2TaXHESnWGqQyqBC5gg/wCF/zcYpzDHuXzzohIc5AnSHFBTchEEhwv81LEw3QznO1Mj+z/fjvALTunDkcjOKOQXnn4vJuYlHbs+AVvUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrHF7ezA; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b779003fso9166345e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 00:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238316; x=1783843116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHxxISw9/eUoh0glcJjvTPDJ3DTP4w24ytxN3iIm2gE=;
        b=QrHF7ezA6qaAE+sQV9O+OXZe2PHBsV8mFHQxxSYejLdc2j9ic+aqC2En84lWgmSmiL
         GpWHx1kNUTfTIU1ZHvmUkfRsH3jih36bSBwDaqES+R9bvkHKp1bcQy6uHjs2jDWIqCJJ
         BHQZuOOVXV14oGCr4hec+7efU5JbrOTKJgSvIwZ5JkKfGbld9k6c4PqcRQ7O5T94C7TU
         IVH/bT/+/AvjZLQHZMvIP3hEPO3r7tVLkw5we659eD6joGBNiqpkYPkuo0vIEX8VU7Qj
         ZEv6Klk9FVbwboCw4EJckoUGTB3lB94Q0LYvrDbrdlfYEgIzcvVvoxJ55+zxZCVDTsK1
         EdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238316; x=1783843116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHxxISw9/eUoh0glcJjvTPDJ3DTP4w24ytxN3iIm2gE=;
        b=CGP7IC6jd/8dDMndqVMUtaH/RnZRvrvLGIirYKVUyk8Qg+3V51gwjJusvXLteT3tdP
         rzaBO28UYKAkYRXKvRY2KJU4PFvSyt4/PKZ5/QvYXsh27V4NdO3g+z+4dSL4UfCiCwkL
         Mt5lzqgLWIgpkpI4FZRBUOMX7H5OW8d/wbAn7EdrOtsjX/FGrdGOuJa0gjwE7qOBzl7S
         fcAILYCuukDsUdSmXqCNDFZr1pv4/H76PNpphxHLDnUXE+7NjTgEENXNxurIU1wrzrl6
         caxePXzF10q3icdpNkFx6fWJ+h8nANsHNnGtQaTC68Ae5g0+8P/1z3dq3U3LMC6iKD0C
         uUJg==
X-Forwarded-Encrypted: i=1; AFNElJ+0/cGAwNkplEj1NpRBpRK/O1ImMINsUWwkbHEFaxyRxyuw6pbMc8RS9uQTRrCXDyxF8mT0jw73n6rm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tayGobhNvYmEoYsEBCA4N1jbidovkl2cCYPtoj8MplA0rS/A
	5/zPK6X6a+HXE65UONoEziFHDUKH2jC/zOgHbXlFWs4v36bh0djbWYCJ
X-Gm-Gg: AfdE7cl/3AMu9a/jn0kHmHNP0y7gEimI1EAYXR4EVrWswyhRcWS+RCCc+Oycln2sODW
	QjtrikIQElz0VRy305hJIS4nvKiCGFXxdP8UnuJu6gXnmjglv7XTq5OGnAnh0RGCfJW4qoLdReQ
	HyZJ3BNPIktSAKepCH8Ri7nTIJQ4YNR90U81YVqZbcy0R1A6mk8gHUWR2aqHoaWu0le96Xk3ZGL
	u2hVUk+mAeRrWlWz2mBEkoTZZtpPHjiYoFgjcU/+cBJSTebg4QGzgjoFkXm/tf8hWBDpNpiCKtl
	xjIsXnbeZiuDL3bstM4yk6CGqrN35vYfSRFm5HnAzoFLIGhmhJB03JEWSUuUXuPYq75oW+VaXpn
	xybdif0boxze7hWgLp+VLGMWHRL0+i9smTcnxbryTSp2zQRs+oFH1gPtpP7pORI4uD7jW9YM4S8
	0VWtYG3Al6CxlZHQTzEI6zy0WRCXWa/QDF8g==
X-Received: by 2002:a05:600c:3551:b0:492:4714:2d7e with SMTP id 5b1f17b1804b1-493d11fe2f2mr68174165e9.36.1783238315894;
        Sun, 05 Jul 2026 00:58:35 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm305769765e9.15.2026.07.05.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:58:35 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 0/5] phy: cpcap-usb: improve charger detection and export cable state
Date: Sun,  5 Jul 2026 10:58:04 +0300
Message-Id: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39456-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B10B3709476

The Motorola CPCAP USB PHY contains the hardware state machine used for
USB cable detection. Besides distinguishing USB peripheral and host
connections, it can also detect dedicated charging ports (DCP).

This series starts with a fix to prevent spurious SysRq events when
switching between USB and UART modes. It then adds DCP detection support
to the CPCAP USB PHY, updates the Device Tree binding and corresponding
mapphone Device Tree to use the charger detection interrupt, and finally
exports the detected cable state through the Extcon framework.

The existing driver already interprets the CPCAP USB detection state
machine to determine the attached cable type. This series extends that
logic to distinguish DCP connections and exposes the detected cable state
through Extcon using a standard kernel interface. It also makes the idle
UART mode optional, allowing the PHY to remain in its default USB
detection configuration unless UART support is explicitly requested.

The series has been tested on Motorola Droid 4 hardware.

Changes in v2:
- add chrg_det interrupt instead of replacing se1
- Fix remove() race by cancelling detect_work before hardware teardown
- Restore SysRq state on all error paths
- Introduce CPCAP_UNKNOWN initial mode
- Snapshot enable_uart module parameter

Ivaylo Dimitrov (5):
  phy: cpcap-usb: Prevent line glitches from triggering sysrq
  dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
  ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for
    CPCAP USB PHY
  phy: cpcap-usb: add DCP detection and make UART idle mode optional
  phy: cpcap-usb: add extcon support

 .../bindings/phy/motorola,cpcap-usb-phy.yaml  |   6 +-
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   6 +-
 drivers/phy/motorola/phy-cpcap-usb.c          | 334 +++++++++++++++---
 3 files changed, 290 insertions(+), 56 deletions(-)

-- 
2.39.5


