Return-Path: <linux-gpio+bounces-12555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC59BC5C9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 07:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AE72280E4F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 06:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367E21FDF96;
	Tue,  5 Nov 2024 06:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Y88NL3vR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D81C2324;
	Tue,  5 Nov 2024 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730788945; cv=none; b=EljPVVPqEo2dz964eEvxKI5i07gvbc88Xf9juzNTTlW6p6qBwvfA+7p7sWt6w+Bahl/IEGUn1yZqM5LL541TteVIQL+Oyl0CkehqH9EdGXpPsUmaUez0VXTq8Qe/OcLYaHbaPkWUsUZo6ivSkPSB62aAP7E5TUsTBHHrWbezbBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730788945; c=relaxed/simple;
	bh=gT6TGfPLEEgNb9a1UcM6k2+GwOFFX10p6GUhgD4xCO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q9LzqkR+7lFyp9feUqyhzuRzcbVaHrWU214sF4MaKfXO63j78XdWXr+l6V/RrlTFIrnuytqk37fq4I/PIDZTYHb/Y9wa7rPwU6Jx9aSvJgv0AZ0j3iEJlTz2Pm2J2BDBE/J3lhNP8EZHcLyCOgRugGzQZ9mdGWNA65weCzuO9rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Y88NL3vR; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from localhost.localdomain (87-97-112-21.pool.digikabel.hu [87.97.112.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0090488EDD;
	Tue,  5 Nov 2024 07:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730788941;
	bh=CTUrXm3qAhjs4mU9JLhzVL58+lVPixfrNT8nOp3fw/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y88NL3vRuqtA0/QL3iRvwjCKuwKTHUbv/euDTraH7ScQqRoNbYSfUHSJIuq41kEQB
	 U5k5SczfydRsvzxs2GBAg63HgFmJDoyslLyAMJeIy5pmoBag3MWuZsjRuWeu9hNNdc
	 R/wSHgmrCCQKcgTjkE7R63mGd9YbNHMed8kN5kRJc9EFkSykO+yMurFiWCWmnWX2ab
	 YLkaN+ZTsXwgGlPh9rIUQl5PIQtkQvCUQ8LgTg6wTjVCtcI5wlRRni4wH4Rxf4S5Nw
	 9kYgfGVhtyKlAzoDuO9ZSbO1bzMpk7IFTvugSOIpm2CMDBFgO0iRxNcTwTdta1RUtF
	 g26yd2XFkhgPQ==
From: Heiko Schocher <hs@denx.de>
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: sx150xq: allow gpio line naming
Date: Tue,  5 Nov 2024 07:42:05 +0100
Message-Id: <20241105064206.43626-3-hs@denx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241105064206.43626-1-hs@denx.de>
References: <20241105064206.43626-1-hs@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Adding gpio-line-names property works fine for this
device node, but dtb check drops warning:

'gpio-line-names' does not match any of the regexes: '-cfg$', 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#

Allow to add property gpio-line-names for this devices.

Signed-off-by: Heiko Schocher <hs@denx.de>

---
checkpatch shows
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
'gpio-line-names' does not match any of the regexes: '-cfg$', 'pinctrl-[0-9]+'

Ignored, as it is a make output, which helps to understand the
reason for adding this patch.

Changes in v3:
- worked in comments from Krzysztof
  gpio-line-names should match the actual number of
  gpios of the device.

Changes in v2:
patch dt-bindings: pinctrl: sx150xq: allow gpio line naming new in v2

 .../bindings/pinctrl/semtech,sx1501q.yaml     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
index 4214d7311f6b..39d7dad3313b 100644
--- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
@@ -26,6 +26,10 @@ properties:
   reg:
     maxItems: 1
 
+  gpio-line-names:
+    minItems: 5
+    maxItems: 17
+
   interrupts:
     maxItems: 1
 
@@ -87,6 +91,45 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - semtech,sx1501q
+              - semtech,sx1504q
+              - semtech,sx1507q
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 5
+          maxItems: 5
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - semtech,sx1502q
+              - semtech,sx1505q
+              - semtech,sx1508q
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 9
+          maxItems: 9
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - semtech,sx1503q
+              - semtech,sx1506q
+              - semtech,sx1509q
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 17
+          maxItems: 17
   - if:
       not:
         properties:
-- 
2.20.1


