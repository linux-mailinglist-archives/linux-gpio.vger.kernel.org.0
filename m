Return-Path: <linux-gpio+bounces-39537-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FWjoDw0JTGqPfAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39537-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 21:59:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A3715340
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 21:59:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=fLI7VdWx;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39537-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39537-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49115302623A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 19:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FAD3D3D07;
	Mon,  6 Jul 2026 19:58:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805EC347FC0
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 19:58:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367936; cv=none; b=H48YHor6AlweU3oH22J0beENVVVEvdEvPYrY2jwzNMUZtAlRB3mYqUAGxCfW/pQjAObsjACfqjWDPFu+Iu4Azg7kacjw8tYsRHSbFUaXxV15J0E+tBwzcTYIeK4Or21SCxQeCjYGOnH86JBQC16u2NZVp+UIKe89EnlSbjQXP/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367936; c=relaxed/simple;
	bh=VQRJctfRoIx43q7B8zg+JoEZ2DSkfCYQEsjoCD9AsiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXI6Z2u7qJgsoILrAf3heRvQH74TnCOREPm7jOdD10oxxfWzNC4PKF3liL3Arvkz42S3vTih+H+micx4xa7e/1M9oHhn8niLD0lmgFQsZ26slsLSyaT5RBMXAC7pXNgw9DJj0PiUoIWdXN2h6anr32hw0UFa81H2+pxhRzw+3iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fLI7VdWx; arc=none smtp.client-ip=209.85.210.44
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb545db3afso1935574a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 12:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367933; x=1783972733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YlT3WnM+OJST3BZ/4dqDMJmxXkYErU65jgqgDcmWdqE=;
        b=fLI7VdWxmVioG1DzkOAcOiSBU5UPE0uYjVuDNI3h9Q9XAdYjV09FY0Iwe9T5gmFDOM
         rpg9MLdvMrkObb7Vbz1Ph/oSP63fNu3kFrFB51YrFEdCeP90+k8O1p4wUqeD0x6fb5z6
         oNlg583yDuJQNLkRlK6n6XJwqfqnTngCk7CBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367933; x=1783972733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlT3WnM+OJST3BZ/4dqDMJmxXkYErU65jgqgDcmWdqE=;
        b=sfLC45OnuF1129kPuJyy/5DP1T+C/Ljhsr/GGym1Sq00kDq7BpGo0v461o12EZaKZz
         rhaiPW7z3FlmIJx7BgoTxyo2bIQ3+WDZ5o+OD3f4xqoH+snmE1x/9CVsfXU+hDwiI5Ey
         Qa7PbEIHf+Qh3fV8BgoKp9q829sTGhwab1eLHYipB/rWQKgbh+NpTOqmNLxoyzV6DHJ+
         HuURnTP7uZYNkupBF5YEZIh26VxDHImjlpyRTdrJUXMxUz7rVfy0VYATh4UdTxiyDN0N
         jrW6H2I+OSr1Sxu2UITkCyEvzAmbdd6zJrqArS4liJXHyiqqGOBm8N+nSuz0CSHIJu8B
         yyuA==
X-Forwarded-Encrypted: i=1; AFNElJ/AWR4nTxYh6/bf3SslYHAHYJlohwa/Za2qXZcxP8RJ0zzHerHrZqTsKjR4a3mQFT6E8tI7QtonOjRb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5BwQ/th02yZwjyybEiQ/k5gfM2hpikf6PCIu12H68KBF/1ocS
	aqLF23KiA0vBWP+o8Jd0E0pxOb2Wk4aazoLgJTNQaXp7U3U5sqDT02Z8svTjU4r7OQ==
X-Gm-Gg: AfdE7ckUl2rTo7ZXxGehVLOTsdgPo+e4dcGYI8Ew7DbquEgFmjKaTtckqvjwXtlBIqA
	zvjkOlMUHK6pIxO4hI263Ly/+rr16gqy9Iwzw5Z1I+4cU2D10bGfZW5TO2oIvqZ7MdDfazaw8sF
	SQ1Qu2NKypuenv/Emch3hEmb0sEbjodLBu3+m+JmrlkG7CRJc5cjVfsxH4mRhCBri9yUn2KgRZE
	WUuHZH24o6PwOWR6wpwj7+2PH1uqvOypOusXqV44NlIXTL5gKadZqBsicUz0zyn33fOuS7OAopx
	rJbfW874WS9bkPERk08MRP0WcwI0Z9IWJItdNBdXiF34xO0iKheoZRQc7AejZOvqHbcOr2d0cbK
	qeT4BcocJBdcra2lI1Oz6/gOQl6KPzvGaAeyZzaEEFbQsWbW1TrKsViQ6scs2cirDCBCAYdsgvX
	PxveJJt3g=
X-Received: by 2002:a05:6830:4882:b0:7e9:3765:79c2 with SMTP id 46e09a7af769-7ebb22251dfmr1322732a34.12.1783367933546;
        Mon, 06 Jul 2026 12:58:53 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:58:52 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jamie Iles <jamie@jamieiles.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 00/12] Add support for the Rockchip RV1106 and RV1103
Date: Mon,  6 Jul 2026 13:57:56 -0600
Message-ID: <20260706195818.3906949-1-sjg@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sjg@chromium.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	TAGGED_FROM(0.00)[bounces-39537-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:festevam@nabladev.com,m:linux-arm-kernel@lists.infradead.org,m:sjg@chromium.org,m:albert.u.boot@aribaud.net,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:amadeus@jmu.edu.cn,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:naoki@radxa.com,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:jamie@jamieiles.com,m:jeffy.chen@rock-chips.com,m:jirislaby@kernel.org,m:jonas@kwiboo.se,m:jic23@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:michael.opdenacker@rootcommit.com,m:michael.riesch@collabora.com,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:robh@kernel.org,m:sboyd@kernel.org,m:ulfh@kernel.org,m:wim@linux-watchdog.org,m:ziyao@disroot.org,m:hl@rock-chips.com,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-watchdog@vger.kerne
 l.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E2A3715340

This series adds initial support for the Rockchip RV1106, a Cortex-A7
SoC aimed at IP cameras, and its RV1103 package variant, together with
the Luckfox Pico Mini B, a small and widely available RV1103 board.

The series follows the structure of the recently merged RV1103B
support. The clock driver is ported from the vendor kernel and is the
work of Elaine Zhang; the pinctrl data also comes from the vendor
kernel. The clock binding header keeps the vendor clock IDs. As with
the RV1103B, no resets are exposed yet and the CPU pvtpll is
initialised but not calibrated.

The devicetrees cover the devices needed for a basic system: UARTs,
SD/eMMC, the SPI flash controller, SARADC, watchdog, GPIO and pinctrl.

The series is tested on the Luckfox Pico Mini B: the kernel boots to
the rootfs wait with a working console on UART2, timers, pinctrl and
GPIO, and an SD card running at high speed. It builds with W=1 without
warnings and dt_binding_check and dtbs_check are clean.


Simon Glass (12):
  dt-bindings: clock: rockchip: Add RV1106 CRU support
  clk: rockchip: Add clock controller for the RV1106
  dt-bindings: pinctrl: rockchip: Add RV1106 compatible
  pinctrl: rockchip: Add RV1106 pinctrl support
  dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
  dt-bindings: serial: snps-dw-apb-uart: Add RV1106 compatible
  dt-bindings: mmc: rockchip-dw-mshc: Add RV1106 compatible
  dt-bindings: watchdog: snps,dw-wdt: Add RV1106 compatible
  dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible
  ARM: dts: rockchip: Add support for RV1106 and RV1103
  dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
  ARM: dts: rockchip: Add Luckfox Pico Mini B

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../bindings/clock/rockchip,rv1106-cru.yaml   |   59 +
 .../bindings/iio/adc/rockchip-saradc.yaml     |    3 +
 .../bindings/mmc/rockchip-dw-mshc.yaml        |    1 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |    1 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   30 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm/boot/dts/rockchip/Makefile           |    1 +
 .../rockchip/rv1103-luckfox-pico-mini-b.dts   |   93 ++
 arch/arm/boot/dts/rockchip/rv1103.dtsi        |   12 +
 .../arm/boot/dts/rockchip/rv1106-pinctrl.dtsi | 1398 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1106.dtsi        |  299 ++++
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-rv1106.c             | 1107 +++++++++++++
 drivers/pinctrl/pinctrl-rockchip.c            |  208 +++
 drivers/pinctrl/pinctrl-rockchip.h            |    1 +
 .../dt-bindings/clock/rockchip,rv1106-cru.h   |  301 ++++
 19 files changed, 3529 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103-luckfox-pico-mini-b.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1106.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rv1106.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
branch: rv1106a

-- 
2.43.0


