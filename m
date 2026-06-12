Return-Path: <linux-gpio+bounces-38390-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f2SoInSNLGooSgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38390-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:51:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 124AB67CE93
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:51:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=F2dDb9UD;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38390-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38390-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E97923246068
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E213D5C3A;
	Fri, 12 Jun 2026 22:47:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA6356755
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:47:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304423; cv=none; b=vGCEhnnAEHfzgybhcymlJvaKCd8M4DSlKpBgWp8qHJBk7XZ4vgmow8JIXDRJnRMO5Ulsy+H4fB+6JrIsgrsRVXFlDDB1UXHKex8B/e2CUWHkOK1C6L81bc4SxO2P3AcPuVZIsumNB5NRaLTVeKkiPtaGi7euCRcT1S67IPeJ5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304423; c=relaxed/simple;
	bh=DnQqRk8Wr3CWD8K3b2VzKXlVynzHi8xJBBFO2aUAQTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EZrOmmOkEuyfy68GbUUZwsIsoFpFHuqvlKPt+0H8dKG929IEozOlRQlXyS+f3o4hBwSBDK4mmChxDBp+Hd2c+UFQBOzsXKEvReSlFzdnipLGLgvMcrOZ3Do48ltsCL9w6KhqMSwR3raSuS6ykTaBcWz4Vah1hNWd2X/CjdS5z2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2dDb9UD; arc=none smtp.client-ip=209.85.221.181
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59be89d310aso1511526e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 15:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781304421; x=1781909221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPinIBTvadn6Wv8oxclaLI9sZqTMC+eS72l1Gak81fk=;
        b=F2dDb9UDuHSQP0ItNP+xI2ylfUd3azMotZ3Xc7DWDo0wzpRjSPqhsfHerV5TzNaADG
         ar8woOvvc1rRGwxNeDYfzS/bOX92wIG21MTaYQWDbXQ7SINYEuQsx9H2N9ShYM877WtY
         WYRprkBYIWlfnlyiD9ACJYfGw+cDAXBi8rDOV2zsiE9nf3HdHtGxHLs88MWdaCHBioZU
         zMpWjE1zMWbOZgFbI167WwN+Z9WfjoM9f8RBKCxjhPv9BXwhMDvBBR8mAZcjAkvPyWOg
         2s1h6bDF5Drfolf+jUftAI229ECze52jiB2QbTyTfGYEsOhy5491BMtVao/W63+A0cY0
         s6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781304421; x=1781909221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPinIBTvadn6Wv8oxclaLI9sZqTMC+eS72l1Gak81fk=;
        b=qNWvox5ibFthIo74ljkSJ4iZqN5l49yPuT6CZWFisedDp29oXFqaSI4A0/phNA1D3p
         4iCeE1M5T+R54zi6tq8BgaymNo/z28wL+/UFmNMzqTJt+1dbJkd5u7ywlQKSR5EDfbRH
         N/AiriaVKZ52ITvF0qLag1nbiS6pqa/XeO2Dn46/souQaVaSa85WRgJT7dgWSK1AbMU5
         PyQJsz+N+64rEc+dYWS5W3xzCS2KB3gsTnERohTfZ7Q1r42YuT1Vjto2ODzB9bVi1NNZ
         L98STgoVAbk4GOuM2dCggXy9T4jFXCBtR3BUxjcP5gHb0krBrZuwdGMMifnG7kgxCyxp
         aJnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ThSQiTh2Y31xqd9LiT4WC3qmKQ3+4gIdr6wDNBT8nSvGcfjMNES9GQ1ItZxmkC0eBpCdNqABkWlpp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd5FWyjXNqubv56dZz7AY1h48dm+dSymJsy3fNvQow6b21ZSgP
	vgmrqjaT4ZdY1JSAl/Wzn6AEDRF9jxz61nLQNEoa4Sqm23Ot4k1rwHY0
X-Gm-Gg: Acq92OFSX51W2fO31LgwecC/wMnWvQQUaGKXIyRLmEGEliep9KkR4MG0cLIQmliHZT1
	6+pgyNXWkhq3LXFkLZ+V7jz5B4hCizyzpMdQe8DsoXWdm2xEdTG0rgvMPgZ4VgcRtM27OjouwFO
	L6tO4n5SFITu2W6LmonFzFnWiBn+VkDXApUZrMHGHypvx1e5FhWCPqocIzEcjq9kxG09vgb9b4B
	V6dW45tjKxl4LEwHpnR9sYRelhTyqhZt/mjydXS5YsdZL+1fRVBTHPHUwgJmo/ZPQZAxTcPuJqV
	VDQJu6Vi7/0H7gMOfIwavgh1hmh9BiaczztAGzzwS+Gal5zCU3XhntO16NXMiMa9ORlqCl6LLcQ
	Ic4uh1yw7pVx8fIJanrtjACaDg3cYnl47j4i3ji29ZTMEC6SD8Po1QewduNRBJSLmadaWARnM2c
	E3t0S8jBUCW2deGqSfSxDwdg==
X-Received: by 2002:ac5:c0c9:0:b0:59c:627b:8425 with SMTP id 71dfb90a1353d-5bb6a20c818mr1891552e0c.10.1781304420670;
        Fri, 12 Jun 2026 15:47:00 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb691fd8adsm4244553e0c.13.2026.06.12.15.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 15:47:00 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 0/5] iio: adc: Add TI ADS126X ADC family support
Date: Fri, 12 Jun 2026 17:46:18 -0500
Message-Id: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNL3cSUYkMjswrdtCQzQwNzUwPT5MRUJaDqgqLUtMwKsEnRsbW1AEJ
 Wc4ZZAAAA
X-Change-ID: 20251129-ads126x-fb6107505cae
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=DnQqRk8Wr3CWD8K3b2VzKXlVynzHi8xJBBFO2aUAQTw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFk6PSEvDK5L/5u+Ol4odc5EIRk1ljh9gcUGlyb32k3+f
 Yex4U53RykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAEzEaykjw7LT5VwlE576GuQa
 3GN7n9l58b9ajESEs8ybKLty16nrgxkZLgkdjwnYy76p89nThz15b4qnC+n/F77VKt38ueiUxBE
 tTgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38390-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:kuurtb@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuurtb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ti.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 124AB67CE93

Hi all,

This series introduces support for TI ADS1262 and ADS1263 ADCs [1].
These devices are very similar (if not the same), except ADS1263
includes a secondary auxiliary ADC.

The main ADC has quite a few features supported the main driver
(ti-ads1262), including:

  - Power management
  - IIO direct and buffer modes
  - Channel hot-reloading
  - Internal or external oscillator
  - Internal or external voltage reference
  - Filter configuration
  - Sensor bias configuration
  - IDAC configuration
  - Level-shift voltage configuration
  - Manual calibration support
  - GPIO controller capabilities

I plan to add these features to the main driver soon:

  - SPI offload support (38400 SPS turns out to be too high for some
    systems)
  - User triggered, automatic calibration (Datasheet 9.4.9)

Additionally, full support for the (less capable) auxiliary ADC is
introduced by the auxiliary ti-ads1263-adc2 driver included in this
series.

The auxiliary ADC operates almost completely independent of the main
ADC. The only consideration that has to be taken for interoperability is
when reading conversion data in direct mode (Datasheet 9.4.7.1), which
happens only in buffer mode, when multiple channels are enabled.

When reading data in direct mode, all SPI activity is forbidden between
the data-ready signal and the data retrieval. To achieve this a second
mutex called xfer_lock was introduced to block SPI activity on the
device.

This is one of the biggest drivers I've developed, so I hope the code
and the comments are self-explainatory. If not, please let me know so I
can clarify them.

As always, thanks for your reviews and help. Submitting upstream is
always a great learning experience :)

[1] https://www.ti.com/lit/ds/symlink/ads1263.pdf

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (5):
      dt-bindings: iio: adc: Add TI ADS126x ADC family
      iio: adc: Add ti-ads1262 driver
      iio: adc: ti-ads1262: Add GPIO controller support
      iio: adc: ti-ads1262: Add calibration support
      iio: adc: Add ti-ads1263-adc2 driver

 .../devicetree/bindings/iio/adc/ti,ads1262.yaml    |  308 +++
 .../bindings/iio/adc/ti,ads1263-adc2.yaml          |   49 +
 MAINTAINERS                                        |   10 +
 drivers/iio/adc/Kconfig                            |   26 +
 drivers/iio/adc/Makefile                           |    2 +
 drivers/iio/adc/ti-ads1262.c                       | 2180 ++++++++++++++++++++
 drivers/iio/adc/ti-ads1262.h                       |   39 +
 drivers/iio/adc/ti-ads1263-adc2.c                  |  470 +++++
 8 files changed, 3084 insertions(+)
---
base-commit: ae696dfa47c30016cd429b9db5e70b259b8f509e
change-id: 20251129-ads126x-fb6107505cae

-- 
Thanks, 
 ~ Kurt


