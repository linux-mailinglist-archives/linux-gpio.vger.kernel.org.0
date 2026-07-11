Return-Path: <linux-gpio+bounces-39890-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F4UpFulzUmr4PwMAu9opvQ
	(envelope-from <linux-gpio+bounces-39890-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:48:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91151742412
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:48:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oVuzYuUV;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39890-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39890-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 657E03006D4F
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 16:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714D2376BE4;
	Sat, 11 Jul 2026 16:48:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04962417D1
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 16:48:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788508; cv=none; b=a/38s4fZXpfU0QsLYZw5XCA/PimgHQDlk7HhrNMdpWsTvqJTfsQPdEXPCT610ytHEeYCXaP4ZSyq8edpF0uTzpnHUuaCb2s1+5Ww/pOBl6suk/fvuWZlzstAon1Ym+WASA0+7B/NAzDcMeiXk6WRDQ22kEwdQI+34EXh4g91ZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788508; c=relaxed/simple;
	bh=BoQT9QyuvDPpf+Uz0OcP4BBhhJPSPS/TOn7RXbZ0l5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SlkvQU0zrGsFuRae6HbZHWeyq7N3SRal1OIB/VuQUXPPpcXCEsDJLD6rWTKL63pvd6D9K8iK6bPL2CBJUQwEbovMYjJlvldA45HW40VhfJcYTBZLIltvEWxnsWx0YeMWJJP18Yz4btnhdGV7zZ57VSMPEp9usTZX1k7elmEkoJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oVuzYuUV; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f431e317so17016235e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783788505; x=1784393305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kenkJqSu0B0lVB8IF1SD7uLqT70NJDzMSzBH90/RAac=;
        b=oVuzYuUVbSemE2H8FzJH0zzDi63CXBKOA/+oMXsRWef5MyujD9q+rOrqzd+ozrD4zw
         ZAtepYmj0GI4CYzOMfmjpWfpQhvuO9A+W/ZStuVTakuyiNVx1ePPIm5L/46hm49AMQOH
         P44UBXeVNo63DsTZjKM2tQnn+pLOh5GPCormcE+s0HlGS2/Brz8+3moc7LRuiXHTQBZo
         64qFt/wW7oU/GAh+amXlKR3Vb108v1WeEHPbagx+mai9Uho0L8AuBr8KD7nVRT3uiMw3
         +MSxT2J9fL106v6wknSukeB3FXaPFmGpcaanVDIpxrr7BRDIzZRrwHs+YZftWQQPzzco
         Ya4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788505; x=1784393305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kenkJqSu0B0lVB8IF1SD7uLqT70NJDzMSzBH90/RAac=;
        b=gmB2b6NVoqOPzJ7km7rQ6/gaOPRUhbENhiBL55fp+7kB4ZDKI8Kr8QD7H+Vy83NUKO
         yyS1rte35vIyK+R6b0EmhI24Vo/ZYmKPXzcENsPnQpYCsAm56l/GxgRCk5I6MpR9p8hJ
         zobWbQEsN18o/ZrnmT9Kb84r6FNmjV4BLy6F5e4rOXuIJkIgqIBMAvqkFiLwUYnFUvEB
         OTxJGR2/MrGbtykBhL8jh0NF4tOr5Ch7LGzwhlhzc8/Q8qzItGLLH4BDv6PzyteAv9eU
         gutzAZAF6UPHUhkY32p7fijt4IvchSQrJl2UOxQg50w6MbNem3h7O/vy+64YVUMfrFa4
         e9jA==
X-Forwarded-Encrypted: i=1; AHgh+RogMxRmifN0vTfhvEUSeAhVtTd2hKW5GMJX2pNNjyhNhvwRcDJZq322rQrf4EE+Oua/QyEibDrxwlKd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzroi5C1uK0LZ2K0moO96/ZE2Th2pHw1cWIwW5CL4Kgi237S3qJ
	ydsg/A/5UkIDakZDiIVMiOPlh4BZYF263CjWvR72FR58Ff2tC31reeah3oYMqYWj
X-Gm-Gg: AfdE7clR275NoFacT1ZuK4IVPSE9cBCc5LiZ5XKFZ6xNmK3yUZQf8s76WSmMS+gEYCu
	m/8F/uvr/xTkKrcPOm5pTA8Bw/52DR7Vffi5GoPPgnW/ct+8RZdwzHExv5CAAC7LMO9AXRM0yB8
	k3F8R5VCHqQvBbTxPGe/IKWuDBPifEH/GzKfpMDQi4i9bLNkA7qmutyhctNMTTqt5gXEzG48baL
	/xyweCYTSlL34r5vzcjTLDjREjt9KYNL8P41Fnt7okvS76M1n9psC3+NTmzlvJtcx1S4IUZPlXy
	8OUbnvgzN+Q124+5pUkviMiCdcHKjMB2mdnEeJPBCDL63aH3jKVtNkimjQeySsSazEhtsZNx5dE
	zam99vhHf9wXpNZByfrkCrCzPjD+ydCjWoRcx1uPiq7FNzFchjyQGYPlGmqWhJXVCyawyti2tn3
	A/jHCgH34QLdTQiTxtRcNtMPDyPebWfXWShA==
X-Received: by 2002:a05:6000:1866:b0:475:f0d1:eb56 with SMTP id ffacd0b85a97d-47f2dd0d63fmr3630999f8f.49.1783788505186;
        Sat, 11 Jul 2026 09:48:25 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm69152875f8f.13.2026.07.11.09.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:48:24 -0700 (PDT)
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
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v4 0/6] phy: cpcap-usb: improve charger detection and export cable state
Date: Sat, 11 Jul 2026 19:47:48 +0300
Message-Id: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39890-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:--cc=linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91151742412

The Motorola CPCAP USB PHY contains the hardware state machine used for
USB cable detection. Besides distinguishing USB peripheral and host
connections, it can also detect dedicated charging ports (DCP).

This series extends the CPCAP USB PHY driver to detect DCP connections
and export the detected cable state through the Extcon framework. It also
makes the idle UART mode optional, allowing the PHY to remain in its
default USB detection configuration unless UART support is explicitly
requested.

The series updates the Device Tree binding for the optional charger
detection interrupt and the optional "safe" pinctrl state. Corresponding
mapphone Device Tree entries are added to describe the charger detection
interrupt and enable the safe pinctrl state.

The charger detection interrupt is not currently used by the driver.
However, it is added to the binding and Device Tree because it describes
a hardware capability of the CPCAP USB PHY.

The series has been tested on Motorola Droid 4 hardware.

Changes in v4:
- make charger detection interrupt optional
- make driver functional without charger detection interrupt
- add bindings and Device Tree for 'safe' pinctrl mode
- use 'safe' pinctrl state before switching PHY modes

Changes in v3:
- Drop "phy: cpcap-usb: Prevent line glitches from triggering sysrq"
- Fix DT schema interrupts order
- Fix boot cable detection

Changes in v2:
- add chrg_det interrupt instead of replacing se1
- Fix remove() race by cancelling detect_work before hardware teardown
- Restore SysRq state on all error paths
- Introduce CPCAP_UNKNOWN initial mode
- Snapshot enable_uart module parameter

Ivaylo Dimitrov (6):
  dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
  dt-bindings: phy: motorola,cpcap-usb-phy: add optional safe pinctrl
    state
  phy: cpcap-usb: add DCP detection and make UART idle mode optional
  phy: cpcap-usb: add extcon support
  ARM: dts: ti: cpcap-mapphone: add charger detection interrupt for
    CPCAP USB PHY
  ARM: dts: ti: cpcap-mapphone: add USB safe pinctrl state

 .../bindings/phy/motorola,cpcap-usb-phy.yaml  |  13 +-
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   9 +-
 .../dts/ti/omap/motorola-mapphone-common.dtsi |  19 +
 drivers/phy/motorola/phy-cpcap-usb.c          | 350 ++++++++++++++----
 4 files changed, 323 insertions(+), 68 deletions(-)

-- 
2.39.5


