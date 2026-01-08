Return-Path: <linux-gpio+bounces-30244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B7BD0145E
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 07:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7DED3045F48
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 06:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9682332AAB3;
	Thu,  8 Jan 2026 06:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="lqyrncSy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC01A277013;
	Thu,  8 Jan 2026 06:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854597; cv=none; b=lwjfoK9vXbR1W878NFhpBvsbBB4dx5SrLNoN8n+QFhOPS7W/asGwZcFxJ72ZURtSm9BeNIT1JueToEtStKroj7Jcn66lVP3ebGYg/u+KUtRV+WAATS1YORIXZoM3fZXhYz7s7U8yCd+tNaQD6VGIiXROK8zobVRU9A4F73cqzmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854597; c=relaxed/simple;
	bh=nVReq+M0f8SIE0+5C7Db6sJIn/W+xLXbA07SBl1dRGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=paGieBH/a3vdFw9kzlh5Z3ALZ13CfCA8U5x20UspjimzlhtmKh7k8OxjBJbW1e/WjZLV4UNAVIztxqfqMKXqNBZ2b0IQU9fQJdu7FphrZ6aHCdpQBOZFroPYLp+KEjGGULhy00HBqTC6tqqp1eJzZIkal+C4P+6FKOszmisvmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=lqyrncSy; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767854571;
	bh=XUZT6grwZGL3amf/rECaoVBVp6vaVZW4P3oWWpHwRDo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=lqyrncSy8Ea+sD2Jp2HftYPBfs457+TMFfrsD2MzwVeZGZtSB+DAot0QIPfEw/6gL
	 1+X+XWo91SrTh04kcUFErdPmh6e6jnWCcRh2c80EoE/Sy3SUEL6aRffSa3psT3PuXj
	 3Vg9OSvB6tg0fFelZ/bEPDogB4/6hGygJRBujNas=
X-QQ-mid: zesmtpsz5t1767854566t9f4502b3
X-QQ-Originating-IP: tbHzB6R+05nY+mVqBP6c06yq7vfpu1onF+MNlbWQMig=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:42:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3421227298654861082
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 14:42:38 +0800
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: spacemit: add syscon property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-1-6bcb46146e53@linux.spacemit.com>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767854560; l=1758;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=nVReq+M0f8SIE0+5C7Db6sJIn/W+xLXbA07SBl1dRGM=;
 b=YlvEeMKQIoooq2OXBccCvXhzkiLj1a6wAVCBBRSknw8nm2ztmQqLh9GTB1wIr9YqUXXq6874q
 H7bTkkZ+SE+Cixmydyi2HDy7fVrTQXeBdLEP/boD2hw+NHwfPS02a41
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MJyHWrNgM9tN4LSJzRfD7H91fdeMwZ+Lk7vHk/YGsnqhmbUf5rade3cN
	g9zpxL6tGdTvpVxtPwxlB/RSorQALQWaS82j6q5cWIt3g4YeuEvaEpDVuopInqOC3aDte9+
	3W9D1Nwb17JIqrd9AFDAM/BJYXfHoFbIrIs8PdfelpZvKd4sKqhyFx737uJOGO+DN1Gb2jO
	yu569+z4q/J44z8x9+7pnuQofhYgKrza4CKMakhYcJAG6t2sJFsSEqTnNHOt8uO6v/J9dgz
	BRSvBidsXOvB2TqElmfWC97pLDdeSDkm736ut4PDPaGI5yznaeAlNIUpr//bMBotVyplUEg
	bFdqxiRp+BgYWEkRqgToYL4uMH5fonHPHA7RK47hiZ0BgGmyKFphYIfFQ5rtNLn4uZwmLl7
	MLY+FBcBFwgMz+Blvqx7cLxjh4ogT8OZOaEo3KAIy3heAfMDI5tWYC8TXAW8ZuAetEDnOea
	H7UumUpsWWCaOcN3iTLKxpoQ/au/ey6qo/jC3cRLzhK7/cUbd8+303Lyc4wRj346BcZUrzg
	GMuoGqMClnof8+CGYrPnIz2Z+5jpdv7kxZFjuFB6HTcgBkZPEKdPlZ56h0nCWbz+kmzLgIH
	AVXGjfDqQTdYImagmxM+242TL+Bzdlfo6b1rdE+bOUlTjmTismdETsMVA4QrYyx3V8jSGyb
	mv4RyvbQ5fI+js4XFt59DvCpW7NdlPwYI1+AKihCbKQvZesIMaxoqj7VHIzHj+0T0d4CL9P
	AXjqfOKU3F4H606ijKdDGQhe2+DOXMLCoV3B/K8/OSBObYlyQAEtfLJHojFvReqkb6uAWc7
	wxc02CnrwIVbWprs3qI+3uen6qK8nNmTYoGhdq9k/G4sqF3wtH1cFtpNSJD+CkQYg3r2dtz
	SAG+WKo90fu8PgzsSbkrK2os2fdLNog1GKs+jhDhJ8UKHx3akcMMJgHPcG7i9dpod2O5Yj4
	DsD1h7T/VsK7PcDtBAwb/Mm4tQH7hXRtOh+krAUkM/6YJPKNFZkUxah3eeaHhUnCWtI20iK
	STD2PqTcwEDowusUorCEXvz5KfEgQSDsZwmA1PMzBfy5AHpQyVvpK4JE6ugcGLqGZvca5Q9
	xbgSPJsLC4p+CiACmjgv3dT0cERjnMepvjHxN8ZcuMUhJPB7CprRMwU2YxzFYk3cDjOk8xr
	d1CweSfonJ+1aqqeS0Pple02oA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

In order to access the protected IO power domain registers, a valid
unlock sequence must be performed by writing the required keys to the
AIB Secure Access Register (ASAR).

The ASAR register resides within the APBC register address space.
A corresponding syscon property is added to allow the pinctrl driver
to access this register.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- add `spacemmit` prefix in the subject
- remove offset in syscon property
- remove `spacemit,apbc` property in required
- Link to v1: https://lore.kernel.org/spacemit/20260108042753-GYA2796@gentoo.org/T/#m2ab46cd63cbb1b110eb317ee5b9d540d39cbd82b
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index 9a76cffcbaee8eb465ebaad3f92c929c2a6815db..141dcedb81fba31bcad39b2fa267224b84ba0535 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -32,6 +32,10 @@ properties:
   resets:
     maxItems: 1
 
+  spacemit,apbc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to syscon that access the protected register
+
 patternProperties:
   '-cfg$':
     type: object
@@ -138,6 +142,7 @@ examples:
             clocks = <&syscon_apbc 42>,
                      <&syscon_apbc 94>;
             clock-names = "func", "bus";
+            spacemit,apbc = <&syscon_apbc>;
 
             uart0_2_cfg: uart0-2-cfg {
                 uart0-2-pins {

-- 
2.52.0


