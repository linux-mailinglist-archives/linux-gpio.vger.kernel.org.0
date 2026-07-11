Return-Path: <linux-gpio+bounces-39901-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kRGcAMqqUmpMSAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39901-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:42:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF46742D11
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:42:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KKFbcQyq;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39901-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39901-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C935130055DA
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 20:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9EA3148D3;
	Sat, 11 Jul 2026 20:42:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2772DB7B9
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 20:42:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802562; cv=none; b=jr38ETW5eNbyHqOhfsFrkVJoNubl/hVC7EWWYXqrsxQEoNmdd9HAFqoKSILaQS5rbZCKaq9S/55lJpLY6wGUEvqc+Go6wrK5+oKDtjMrWhtCiQa+SFoR9Nw2yl2zM+pbBH3sV9zLZER9aDO9Ezq4lvsOgB3BRLlxbIsX4iyKKdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802562; c=relaxed/simple;
	bh=L2sb5cET0wjT1JgD/AHsjf7HpJ891Sy1hzT2Y5sI8FI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KXlF1CaE6fSUcLcQ3S4D23K90/h5jxXz9XQtURItzq4MMBcJcM1Uqi3H47G/mN2AGCZRQvd+Wx9f95GFINLUKWjHJO71pPC9kOtSW9yS85ToN4QGVLJVwxfbzgFDMICX0Wt6/0Q6rR7jBn62mXkWTSoJOjUhj8T+0pYFXAjhCA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKFbcQyq; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso12816225e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 13:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783802559; x=1784407359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PnttK4V5N2RbdGmmP/+gvD/lecbvQoerec0w3s7gRKw=;
        b=KKFbcQyqnwjTAexocsEcTztm2/hp9ai65jm8Du/U0VVFFxyzx8D9fTbOrNNFVho+eT
         laSFVCAd6tBbkLB3VbdNCltvmjWUbMizz1/RY0KlWnkVmMvPdvq5c8b++5HGkQig9+Hq
         u3vFgNWrU/vHNaeuJf/kV5T8dmK3aBq/qqmUC0iXR/8ETZfuiSXjni9bIraQKu2YqfV/
         ZdzZEeMf/8WW/7UZJUgdreXSCHsuSajGiRMSibV02Ysjq4f0K9x5s4f8ZxEUYm+7u9J+
         RmTs7uJ5Cgos4Vc2zuVWeU2b63vRW43ILTQU3n7mJRRpDOU7fjwp7WLjAm42bRB6Hs8G
         8vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802559; x=1784407359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnttK4V5N2RbdGmmP/+gvD/lecbvQoerec0w3s7gRKw=;
        b=YGoG3Zhm7r9AWC4OM7UTjwXPYPtzQbI5I56vRFai5pU+xiUpBvBn4kjiAdq9ifHYT5
         9kEg0+dx8mHVG5wJtY9QSsyW3Ge7iJ9wKjVyh/FY0Q2Yj1fiiR/Yk5jkoXaE5xGSV4lf
         JysuzBNObcy7yK4MbxPeqlmEnwraKWGlehtY07yg1k5iQ5djNhywNmgvngnbiWnXdAPw
         sGre//FIbM4q7BJ+NWXEeZQa9ENkO8C9QEz+R+wLPpho9iQsI2pu1pz9eixT5jkB/UR9
         Fdj/BCip68EOjwBc1RQn8XXDb95wnZohFdbQpZoKG0tHc6ZdGKzByDEkdm7Ir76/Qd6+
         RGbA==
X-Forwarded-Encrypted: i=1; AHgh+RqEAWOsnHCZ9KNtak5clY+m6pzENQNtBrJ2W1If0F47T7VcnQmJIQWoXUBeu7HDUEGzSxtsr2tDL8mz@vger.kernel.org
X-Gm-Message-State: AOJu0YyoD6FQsqo1c7zXalMR/6brUe2KXKisnrZxug7FSG3EZVimatbT
	FM0Nyd3yXjlDA8PCfmJou4MX1792W6/4HQJZZnr0nctnKdr0Q3v+KgO1
X-Gm-Gg: AfdE7cngh+oToOAV0BQs2TvWhdFyGU/+aMSrFcn1N175O5KETBMQN1YiDfo7xT5b4uU
	p1HER6w0RCSeDM9nlhzyr3HUN7oof1DEw0slXvNimW8Nqhe/9Wqvf7ebOwnYZlYz3cmR1iXTnSc
	lVu50LmNQKEc+RVMdDOITBX2AHl4SGg6GaRuqtN0APgSCXLu7P2bFTuWqR5mHRYAsLAGeUkSRAp
	jlCMIuLeSlpmO0cJ1YdYsywaalyHVDVMMWmt3Rf4hdgE8nhp8K2Udy2l3qEVptSty9kFezbQYTN
	8OPpDqlQq4jvXwgdiFoPrfTsbS1XmKED70C7LU3hA6vejNsh8nedLHBtsHW4N6+RJHjCR3Yw6yP
	6lDhzahOspOZ+0JVmqXRTCzhEfJZbDs4si9/Ab4SIDptPWgYItrZ52UWHGp8SANa3+VtIT+O3mr
	NZ8A15gvjJFpZJfs5gyOd2qHeTlQBnKegNSw==
X-Received: by 2002:a05:600c:608e:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-493f881f934mr35888195e9.19.1783802558744;
        Sat, 11 Jul 2026 13:42:38 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm172704725e9.2.2026.07.11.13.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:42:38 -0700 (PDT)
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
Subject: [PATCH v5 0/7] phy: cpcap-usb: improve charger detection and export cable state
Date: Sat, 11 Jul 2026 23:42:03 +0300
Message-Id: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-39901-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:--cc=linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAF46742D11

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

Changes in v5:
- fix race in remove()
- fix commit message of PATCH 2
- re-schedule detect_work if DCP/SDP modes cannot be reliably detected
- fully configure PHY registers in DCP mode
- fix extcon intermediate cable states

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

Ivaylo Dimitrov (7):
  dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
  dt-bindings: phy: motorola,cpcap-usb-phy: add optional safe pinctrl
    state
  phy: cpcap-usb: fix IRQ teardown race
  phy: cpcap-usb: add DCP detection and make UART idle mode optional
  phy: cpcap-usb: add extcon support
  ARM: dts: ti: cpcap-mapphone: add charger detection interrupt for
    CPCAP USB PHY
  ARM: dts: ti: cpcap-mapphone: add USB safe pinctrl state

 .../bindings/phy/motorola,cpcap-usb-phy.yaml  |  13 +-
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   9 +-
 .../dts/ti/omap/motorola-mapphone-common.dtsi |  19 +
 drivers/phy/motorola/phy-cpcap-usb.c          | 386 +++++++++++++++---
 4 files changed, 357 insertions(+), 70 deletions(-)

-- 
2.39.5


