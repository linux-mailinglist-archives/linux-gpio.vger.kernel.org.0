Return-Path: <linux-gpio+bounces-38880-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mi4BGGAIPWqPwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38880-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 12:52:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC606C4DCA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 12:52:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Aqepoqgq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38880-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38880-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 123B33040944
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 10:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3A53815CA;
	Thu, 25 Jun 2026 10:48:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBB32EEE6E
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 10:48:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384483; cv=none; b=TTRCE4C9w8OmXTTHaqD2Xsev35j5XucTNUMMQn37xEW5SIZLQc3kyNvV3ca+50vsxLxciTTRDwjMqCl9HUjU3oPKbCy3bNq3QdnL8F/W1xju0cNXSGVKM6h1sgEt5A5b56kWJ/AXtHV34oK/Jugs5fWU23H2zd6j6hsLvi5Y4SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384483; c=relaxed/simple;
	bh=eNnisl9qtnyVoa9BbRoub00ZqcY/iztZW2x9ofj5vdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUi2yFPlvf4Y2ADwgsZEsi3w9gFEu/55ioRwmMLXa+p/pKGhuTR2qWfRdilMK8okqdF8PFSNgvcCgO8jQXY77gsUXFV4WZs+fEmn0a4FLKT2JYh19kJFB3NhO5WHc4jVsEhZmS5SpvPJiDNvQtXeg0AkHDkrqXe413ooa9W8ugg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aqepoqgq; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b64c8311so25609815e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384480; x=1782989280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=;
        b=AqepoqgqOnZbkMrgSTxsgdIIBdlq1ZLzX3zklC8IGQEhX+UeVWlixm1ATnudyfznLJ
         825/Qf837PEVjo+amQ80YzRxRe+EyoRpSEdqd8k0JM052tn5pZlsYnofztyhJwOGVK9E
         vfDT8UvQZw+Spjp0s5b10rthlfo0azDffbkSyCkYV86+h2uzz0P9azeH0yk6/GouOd2N
         iFhVJHsiVOStLrNzD3AT8jdWpi7O8tPoXdCNG0ptL1XQzI73gjaEELtdze//gs0xNSfU
         ycckfVAWW5nH/xIeFdKf3uuypDjBTOyWoD6cH3SzNWe0Dce+mW5Y9435oJNf+WgBCqbP
         H2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384480; x=1782989280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=;
        b=B4SJUglwbWf3bjfiPjeigYFLyESigx/MCuxc3RaYPSooTcY1mxD69D0j8uu1QHWyZo
         zjD8VbRUwDsmF1rQKCiay5kd9PHEv0u9iJ2zK1efkx9bSPjhzrhb0pI/eqIdJDFuYomS
         JVxKXy5d2z6P6dFOTOZrXvIk2M59J/EN83axX0QaSZ5Lj0cZ5RhIPZumD42+tN6BkHDD
         6jNS2f71VK7PvRc6847Vg4VsWj8mGeKXebPpVjw0vxoypg1XkUPxP0resyw3kCk1O87K
         6h0U8412EWnnCWwzgOJX05B491fEDDTjq8nWbd8AKWjMmDijz4sFJPOp1oJnoTp09AbR
         yTjw==
X-Forwarded-Encrypted: i=1; AFNElJ/y6uWSp5nCgQlgCXbjHMqntSbucWCstbN7M4dAcW04SCK9Yzml292fRhObnhROHbnizPtzYnAPxJMa@vger.kernel.org
X-Gm-Message-State: AOJu0YzK6qgzeEUxZAzjz/kLIGLUJfAciGfdnFnfdthGcSyhl6thborI
	qLtmF6SiGan1n4kuuc/u+h4SGKJTVFY9gfir3N1fKexLtqmW7cOfQSJk
X-Gm-Gg: AfdE7cmFZoOG21VLSpaUi9PDKuFnjnXtjLTXhRVb+fGuhVmfBuMh5zEGu+s7G+BPp7o
	uDBrQkvnt2dlwcdxWcGYz4mTUsF6vFI9MQ3dWh8tSCEd3hkmAtzayyE5kMvrWzJ0s1RsHxLckUH
	0GlS5p75Q4Y/JuQePR107ucXEkGrP3pFGDqQEuho/C95otwiNjux+CTBnip80pWc/Aureao4Iyh
	s8QOITVmXPn0Zle+ZEGNUbDRJZPGXnlzxMujznSqB/4QyaVf0/Krw0XFWoPAGe27qF45sMxpwb4
	/KhgXWEfg+7gQdpfJPaD/P4HZC3iXnysACT3/jbs/BiHADvnus+HEkBvrmnFk+hEXFX6uGbLulT
	R9+7uGPKbvqazQ9by6N4kMSFTG9OrbAbKLYR06JlTz45oaMvwvx2sQ4FTKj9pf9TU9/1eE7mpM3
	ab3Yu2Vw==
X-Received: by 2002:a05:600c:b96:b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-4926686b3f3mr25232275e9.6.1782384480165;
        Thu, 25 Jun 2026 03:48:00 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:47:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 0/3] pinctrl: mediatek: mt8516-mt8167: Convert to Paris driver
Date: Thu, 25 Jun 2026 12:46:29 +0200
Message-ID: <20260625104742.113803-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38880-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:sean.wang@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAC606C4DCA

The pinctrl registers of the mt8516 and mt8167 SoCs follow the layout of
the Paris platform, but their pinctrl driver is currently modeled on
the mt65xx legacy driver. As suggested in [1], it is possible to migrate
them to the Paris driver.

In the process it is also possible to completely drop one of the two
drivers as their register layout is identical, they only differ in some
pin functions (mt8167 is basically mt8516 with added display blocks).

The Paris driver allows specifying two base registers, gpio and eint;
this way it's no longer necessary to have a syscfg node in the device
tree, referenced as a phandle in the pinctrl node. This also fixes the
following long standing dtbs_check errors:

mt8167-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short
mt8516-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short

The new driver has been checked against the SoC data sheet and adds the
capability to control pin driving strength and R1R0 pullup-pulldown
resistors.

This series is sent as a RFC since the changes could theoretically impact
existing devices. I am pretty sure that no device ever used upstream
drivers though, not even the Pumpkin board that's present in Linux
sources since this board lacks the associated mt6392 PMIC driver that
is required for regulator management. If for compatibility reasons it is
deemed better to keep both drivers in the kernel I would welcome any
suggestion on how to name the new driver, and how to adjust the two
bindings for coexistence.

These changes have been tested on the Xiaomi Mi Smart Clock X04G and on
the Lenovo Smart Clock 2 CD-24502F.

[1] https://lore.kernel.org/linux-mediatek/296b000c-5970-4668-bd42-b99ca78d598f@collabora.com/

Luca Leonardo Scorcia (3):
  dt-bindings: pinctrl: mt8516/mt8167: Move compatibles from mt66xx to
    mt6795
  pinctrl: mediatek: mt8516/mt8167: Migrate driver to pinctrl-paris
    platform
  arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris
    driver

 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 -
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |   5 +-
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  15 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  12 +-
 drivers/pinctrl/mediatek/Kconfig              |  11 +-
 drivers/pinctrl/mediatek/Makefile             |   1 -
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     | 345 --------
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     | 770 +++++++++++-------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h | 562 +++++++------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h | 512 ++++++------
 10 files changed, 1018 insertions(+), 1217 deletions(-)
 delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8167.c


base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
-- 
2.43.0


