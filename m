Return-Path: <linux-gpio+bounces-39463-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nh2qBFYuSmp6/AAAu9opvQ
	(envelope-from <linux-gpio+bounces-39463-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 12:13:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B812709B50
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 12:13:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ff1qHjLG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39463-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39463-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 210DB302AC01
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 10:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B773921E9;
	Sun,  5 Jul 2026 10:11:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075A36B044
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 10:11:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246285; cv=none; b=ebnRfmL5j6oNOpteGETnjMvCBdxbIPdVNfiks56ImgMYNgNgrSw5t09M5FOYi6m4y/hFmHPqaZ1Y7OUMM6mxLVZW3aVBPkGI8oYV+2etwrKifHCc6DR/W7ZLzDm7VhH1Cf5ObdIPSG08BOWxGBWC/b/maAm0m1nyJg4ylaiVQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246285; c=relaxed/simple;
	bh=1+urWhTzQMUH0oiAjedVIldEW714w2feNRJ/RVDNWTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qpjmOeBs/XJS1aRzgV0K1foCLsYrFjga6rdvwuPqwr8HJ7R8BFC3ozGTN3cWuOZioA6T4i2q1RzDoZLqUnbcFJnWyPqCe7saPoI8L0L+lZYVivntFajQp/uUo6lAqTDD7H5Hn+AQueFSlrzIupRxSWMLBAHMgwLa2G94/j7uEiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff1qHjLG; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so791155e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 03:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783246281; x=1783851081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KosFoYH7JPzJbGxiLDLiAcfUT9wevKTSADbKnE7NxIU=;
        b=Ff1qHjLGsmFKCgVdZOH+PEgrUAHHONaG+X8cOYDTZWd1IIvjCqj0nMr8FVE2Lh5B5c
         Hn9JAfvq6tkblvQR3gbbonHpaSCsUsK76QVYWj87PXTbx2QfmySMwm7F6E/cxqTkUMxQ
         RLDB0Tk0JRoGU2cteJt0TImzAMpfNd27K4eOI8RDom1oBg9YnkfICxDXBcFH8J3brmZH
         sZBJtd7YtubI7LyeMWmakotpABKpYCCVX8Bx/IrKeT0uqqi7CunO1lAcd2DAfYCZVg3g
         M8ssymFrwr9Hs0GBL9cngdSHnJxEF+FTw3EDcwy37TdX7PKbCSRs5tIEuonKAlnz0NMi
         0EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783246281; x=1783851081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KosFoYH7JPzJbGxiLDLiAcfUT9wevKTSADbKnE7NxIU=;
        b=U3rN3YrlNShcTGTxvRQmBbKUj7mVn6Z5qcMUgVqnuTMAwMpbZlvnz7t1NaE0NzyPAt
         53DLOlvooKQrUZ+VkDmcgBJy9ZC+GJXo9psV23za56hkuwKyNrdgJ4n6F6FrrnIKQ/nH
         gOhDBy7Aun6P/INq+p1afa2q5QkSuUWp6k+4tFLAWuga+oCwIgDG8aHopJCgrUMw6w0a
         KWvlln7PR9gBlCql+TB48GN6TPSUVhHdWRYPrpZboaxx9mhgppndNZGyGfqZvDzHEzYJ
         4SuwQAzR/aSSWVRYqgcDT3228Wn5iO8fDLNTa2PN7K/ZJ3o8Sbubpg8MnmJKkMVcptOH
         2TGw==
X-Forwarded-Encrypted: i=1; AFNElJ+RLh0loNnNQaNgiY0V5MHUzTTKT9q2mHdv51ENqRx3JjHSw1Acb/+fgSiJjm05B9tleYwg9m6cmY+0@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/rDVHQsZvPrE7kL/o64bB5Jle+JAp3JuG44B5EGFTUg3BM8X
	Ql+LVk1VlLEgCsUdb5SqUeNxpjfsgE6GROjr9R0cLtIN+mpvcLHDY7R/
X-Gm-Gg: AfdE7ck7ogvgGD3r0tellWmyEKk6+UG5tihyoSd4UyfDUWk0i3dVo3JaTcsxWOgY7do
	Eh9LG9McfAHhirTYjdAbVijPuUn4Pv4ItQF582VccNG/ovO+Sw1QTVfkbQtw5hXeG6m9k481r8s
	M6Q3SQ+qa3RpVCFbPi/1MfvBetaC16Tv5AUdO1IjFhYmGp0KHokgJtyH0WAIVRHvl74aZKzjRCL
	gLDKoWUlBLScZwQ1U1fVTe8thWklQjqtqXeXNG4mMMXjIu+Uq/5eDjg51XvBEzXPwHk+9eJgYfc
	DCqaZy45vaddBMIJfLnIZLSnZfSsb3JWtcABvSbPjSlAUptJ3josH+2Ur/I52IWuTHsQqjImQyR
	sr1JHV91zAzXanBeehwqgfNT1KFlluQ9wCIKbHsJkTwmkcfXQ0YWN/308mYRjPvVXLC/SsMPXfz
	36dZELBardrMCfY7ijLRRofdUj+IpWgCxk+g==
X-Received: by 2002:a05:600c:3493:b0:493:d115:d835 with SMTP id 5b1f17b1804b1-493d22abbd8mr58420125e9.8.1783246281032;
        Sun, 05 Jul 2026 03:11:21 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm261382715e9.6.2026.07.05.03.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:11:20 -0700 (PDT)
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
Subject: [PATCH v3 0/4] phy: cpcap-usb: improve charger detection and export cable state
Date: Sun,  5 Jul 2026 13:11:01 +0300
Message-Id: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39463-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B812709B50

The Motorola CPCAP USB PHY contains the hardware state machine used for
USB cable detection. Besides distinguishing USB peripheral and host
connections, it can also detect dedicated charging ports (DCP).

This series updates the Device Tree binding and corresponding mapphone
Device Tree to use the charger detection interrupt, adds DCP detection
support to the CPCAP USB PHY and finally exports the detected cable state
through the Extcon framework.

The existing driver already interprets the CPCAP USB detection state
machine to determine the attached cable type. This series extends that
logic to distinguish DCP connections and exposes the detected cable state
through Extcon using a standard kernel interface. It also makes the idle
UART mode optional, allowing the PHY to remain in its default USB
detection configuration unless UART support is explicitly requested.

The series has been tested on Motorola Droid 4 hardware.

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

Ivaylo Dimitrov (4):
  dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
  ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for
    CPCAP USB PHY
  phy: cpcap-usb: add DCP detection and make UART idle mode optional
  phy: cpcap-usb: add extcon support

 .../bindings/phy/motorola,cpcap-usb-phy.yaml  |   6 +-
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   6 +-
 drivers/phy/motorola/phy-cpcap-usb.c          | 320 +++++++++++++++---
 3 files changed, 279 insertions(+), 53 deletions(-)

-- 
2.39.5


