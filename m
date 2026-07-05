Return-Path: <linux-gpio+bounces-39464-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yPFtF2UuSmp+/AAAu9opvQ
	(envelope-from <linux-gpio+bounces-39464-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 12:13:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B50709B5A
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 12:13:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QcaJhpYF;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39464-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39464-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9D23302DB50
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 10:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43910392C3C;
	Sun,  5 Jul 2026 10:11:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B54938F252
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 10:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246286; cv=none; b=MnW07syPzv1I7w0FI9tHVf5V29pfhqXYnozg0lyG5IkkOOM533CwhQzvwRnrYAipRI+DvAYKGvfgA+VpLlcQ52eYkT4K/NYw0RUX2HShhnfy54Qf3wI67XWt5vua0E0ohh8nkdnRKeIkr44kZJKuiuAC/+UqK+JcAjrbbtvqbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246286; c=relaxed/simple;
	bh=e7sepBvKllOJE2cVjyGxRX7LbgzcAMO6ZZ+f7CeIci4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JX2+SggK9aaVXgbUwIKvd2Dog0OQ8TtM5HQJtPAWrqGj10xu9eqsLpTY2zIpWdFoIYDQi8D3rOvg6mFwRUd5hV7BRopPQqQ9/dHZiXQWm/r9pwpCK8X3mwfuGEqGFjdkNpRHxq/V/Ll7jJNWTNFJq+7qEW5f9hmSrvZ7ZGcifSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcaJhpYF; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b1710405so11268025e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 03:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783246283; x=1783851083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTQQYukmPEeRXmpWGMDD6xv10gI6rwVhTPfZN5h8J8Q=;
        b=QcaJhpYFWgkcCFWbBoW1uh/+SKCXoIMlzSfA9ney64+s7TVu57hjoWuUB+S3CpSINS
         YPD5Vpw8V8Quo0D3cV3I25PWO6aat7m2iEqibeA8jFviCcR6ejv+50Om/AXzKz2CdOHJ
         WGHgZilxYjcRBoeO1qS3TrNgw4buM+Rdl6cT7yU4gWyIvIP4hWGa1qlwALKHJztAZZZM
         lMyKE/r77xcjXEEWdUZXKdgSW0ArZmvZ9uXEV3y1FMxQf1suy98XfB9uDqDlCcpaXNHG
         5iINZDqI02vjSZ+F9JJAEYUaKwq3N29KjzrSG4OXaw2r6L7/We1qCohJqpI4JNptQ74+
         CMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783246283; x=1783851083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NTQQYukmPEeRXmpWGMDD6xv10gI6rwVhTPfZN5h8J8Q=;
        b=njgFHsoYFs1J2c04etStcOrTEvxo42qDfvQtBnifjNq/pIZ599AEFrKmkZyvLKY9AP
         EtUxRf8qWR2HUnF2IM1Hbcg/crUkgFJI/iVXV07SwmhzV+wX6n0ivZyIicuSgWe2T2oY
         i/vDtfhtyeLrsL+hTtXqqUh5eQv9NdoXhrO1t42gyxAiss6rpXf61CfKiMdMinFOHy9L
         C0vZmFV9wJ9lVlshPYsxGdkQeqgvJZkass4gWXIvMh6GF3Z4K2KFj5IltHVNJJeU+Wdw
         ZWl6n1QBuDyBZgwN1uk8Mix5m8Hll+npVa/UVQKLsKkE2EfoTs6YuE7oDQtIkzrUer3G
         tIEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DkcZ3EkuOoa4bPio0lVbXtd9n/LnnvhZ7P7GDeeuQD1sR5ntONJRN4I84piZanh+p+YNOLqLAow9w@vger.kernel.org
X-Gm-Message-State: AOJu0YzmwJPbC06JwPl9cJsqXlEExHAWA6miQbeLWUiqS9Otwz0yfkWr
	oUmK2M2LIGYQyg+jXMj3ZI01LAl0TwSbYkDpHEpKQitEBxj8lxU3KI4a
X-Gm-Gg: AfdE7cnG+ppoq2P8Pkk9znAzgR82dqpkjZ3mwZifRBTymTmPDmk12+IwzPnN1oL6DKD
	hNp1aYLi8UtluqZVwwyfjXsQGRCNECyuOGYsrROcaSQPa2YKtj+Q9yAHg5GED2x9UvL8fxfziD8
	JLwoDfR0+2kp7wtkbh8wL0x7f6bUEkzEVNQtEbeT/LhwVZcAJTAzVxArirHaO2Om3y723vym9Xw
	GQplAxgUqc32uUBMn04sUwrnmSwjDUi/nt+DhintNrSqLdbsw8IREcDQ+DNVOIJykxNX2BQEZqw
	tgN3b3hdwB/Fr+b4KNA60PUn2lAxwNWPI9kI/GfZ9GooFkStP6mRyJBiE3yZhW5dhGY/am/0PWn
	jVedTT8hqtM2hzLyHk5rD1J4r/WPdYyUZM11BjgOHJJ0C9yPtE7gHSZUbre0oM2W6cUO2CxY211
	gcc+QHUGJUmz1NV9C0itA6OlKF5p9MgEOpyQ==
X-Received: by 2002:a05:600c:64c5:b0:492:4c2e:9613 with SMTP id 5b1f17b1804b1-493d5e61ff8mr29175395e9.18.1783246282611;
        Sun, 05 Jul 2026 03:11:22 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm261382715e9.6.2026.07.05.03.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:11:22 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
Date: Sun,  5 Jul 2026 13:11:02 +0300
Message-Id: <20260705101105.1798069-2-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-39464-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: B4B50709B5A

The CPCAP USB PHY driver uses the CPCAP charger detection interrupt
for DCP detection.

Update the binding and example DTS to use the corresponding
"chrg_det" interrupt name.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
index 0febd04a61f4..523a8f8480d0 100644
--- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - description: se1 interrupt
       - description: dm interrupt
       - description: dp interrupt
+      - description: charger detection interrupt
 
   interrupt-names:
     description: Interrupt names
@@ -43,6 +44,7 @@ properties:
       - const: se1
       - const: dm
       - const: dp
+      - const: chrg_det
 
   io-channels:
     description: IIO ADC channels used by the USB PHY
@@ -91,10 +93,10 @@ examples:
         interrupts-extended = <
             &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
             &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
-            &cpcap 48 1
+            &cpcap 48 1 &cpcap 13 0
         >;
         interrupt-names = "id_ground", "id_float", "se0conn", "vbusvld",
-                          "sessvld", "sessend", "se1", "dm", "dp";
+                          "sessvld", "sessend", "se1", "dm", "dp", "chrg_det";
         io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
         io-channel-names = "vbus", "id";
         vusb-supply = <&vusb>;
-- 
2.39.5


