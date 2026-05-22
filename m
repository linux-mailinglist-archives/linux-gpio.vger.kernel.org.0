Return-Path: <linux-gpio+bounces-37346-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPglEXgwEGpFUwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37346-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:31:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C95B2241
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF3A3305DEEB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F513F4104;
	Fri, 22 May 2026 10:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrH3gYeE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6433F1ADF;
	Fri, 22 May 2026 10:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445409; cv=none; b=udbzaYZzYW/vWkdwhIzru3J/JUTYePKM57Zw3Axa0DmYgRZwx0z/Sz9btoN+F0Ug4I/WyWkL+gIUA1m1dweTZBo3l7N9PfgTuDwSxrPksqlORLOVwEMxpWFF3c4lJMsUx1Fcuk6zamfKwfVl2aRDdqdRlmKTvsjVpXsbckSjOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445409; c=relaxed/simple;
	bh=tOLyWGNMP6FVkt1uavwsm4SDuIH89JnRNWtCEb3jJXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G25wBk3A7r0H783LvG58CoBLaQc9NHwnsKFjVdiMpasa6G3KXawADR73BS8n53kFmhkU7N/CFlpzlBudnWpcbKyCzlk3wJakTIK2te2+c8QomD5ZhbQtDxdIwjzZhqpOhBHvNW1nQgvdIMjEDNU45euWpaJUN8xxD3Z+g9aCMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrH3gYeE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EF41F00A3F;
	Fri, 22 May 2026 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445407;
	bh=NvT2fppSlj/gIreeQ+5hb0r40tegKZeJ3kZ9EEuIgzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HrH3gYeE9HOXOC4cChypNKnfKcLlAu0xxTGtDreHz6cdokcJ+VWoB0HQpKxydQfWn
	 WggJTzVsGdE0FPU0TNYA9b086ZOX20S9piZzaNDe/v7kdcSCB3rKkEKVhfXE0Fzem0
	 rbVHXOdMV65jzl2TrfJ0oUB6gKDixHs56nsD4KxhjyTlqjGwTBVNNnZZ0GNiOYtjnz
	 gW3flHxbHHTZmEn3GoHZDjeJ0gqOBGpLcrOkJg7qqy0alMc4CazQDL6z+xM35AM98D
	 qkix4R/AC8lH5HAmGglz3feiJZGoOQHdTyRBGW2LioiWAzKcMqGxL3+1RftoqaVKAU
	 WJAiarFo1K3hA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	wsa+renesas@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 7/9] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the I3C standby property
Date: Fri, 22 May 2026 13:22:49 +0300
Message-ID: <20260522102251.1723392-8-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-37346-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DA3C95B2241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The I3C pins on the Renesas RZ/G3S SoC can be configured in standby mode
when operating in I2C mode. According to the RZ/G3S HW manual (Rev. 1.20),
when standby mode is selected, the output is fixed at Hi-Z and no data is
transferred internally, even if data is received from outside.

Document the renesas,i3c-standby property.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 32864c9add4a..94a51666b1a2 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -153,6 +153,13 @@ additionalProperties:
             register, which adjusts the drive strength value and is pin-dependent.
           $ref: /schemas/types.yaml#/definitions/uint32
           enum: [0, 1, 2, 3]
+        renesas,i3c-standby:
+          description:
+            Controls the standby mode of the I3C interface when operating in I2C mode.
+            When standby mode is selected, the output is fixed at Hi-Z and no data is
+            transferred internally, even if data is received from outside.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [0, 1]
 
     - type: object
       additionalProperties:
-- 
2.43.0


