Return-Path: <linux-gpio+bounces-34438-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HZwFYGpymmx+gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34438-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:49:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C294535F029
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 18:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE75D3037D5D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 16:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E113DB651;
	Mon, 30 Mar 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kl3DTUSO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96D3DB632
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889191; cv=none; b=pqsNj4RbQQyOQ+DxjsRQXSz8x1c0tPRX5/prfDL5yjMmStIyS3IKF0nmIfGgdTd62SdB2s1nq++3HiFMSdZxIpWRX4jA8DTSy9QGk8+z6l7sBhv8B5DoRMBWWuzUjPaocN8T2FesMJCUQe3d6Dcz0s91wmCH/eH8lmPHlsOFdHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889191; c=relaxed/simple;
	bh=F2jd4YlfKNnvFt29JpBxPwcNHTeYzsN7X8O4lT8zPQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJ1/UsRCti9mw4kdjsN/LoJy3N6RQElWb4dxHRT0/yqxMryRd2JmlrWNASKv4YB4xy5GwIHykLt7A/VBOc8YY7hXIVxgId4bKee1y5GRbjGlqnaylO+wisE50yh9hrxlYPJnY5pq4tVtArd8bPznJldPGUiGbskFpHdFP0I//1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kl3DTUSO; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cd77786e97so472470885a.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889189; x=1775493989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=Kl3DTUSO3NA80db7IqIuRaNjKikpPu505+SXwex8tv0D3uKUdgOBTWQyxiGHdfZvXY
         ip3Ua83vMetirgxF8moIsx0AtR48HqQ/t2gjmS8yhFGic6WmYq7eTX5h+F9pWCIYaFX7
         rR+EEM0vNfk+8k+GAJY3hGb9c8L/5G3/wTkOmTHbjv2Its6mehI34xuGZjwxX0U/9oAd
         klMvUF8/otYJ5VLogfLp2Zn1gFcr+E0Mk3ETj7orpHdLW5yFBf48+WsTGjy2InwLjTML
         5jxvzhbIwmVH3N7VCG8ZT5h7JzK5r+vMZfarLqOSB5RCkyq8V2tbGr/KkeIMPnKI6loi
         q4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889189; x=1775493989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=YXOeG2E2BMAtAKlUgFS3n+4kCnk+11NhUJaU5SE53qPhx8szE9ZwDc3dSIEM+Hu0OC
         E6jtFvXD57Dy3rCEgkUSOhIiZJqsIu2K9cGC4ZK2I9hcUc3e7ZVnB/DE5nNMSTdhLPUC
         pvpHCXIv7gq9uRLoMOFUzGqbSTxwo4qxmolBuQQehOpTnxkCl2U2xYkedkjeQR56uxOc
         fvQFw+94kstAvBjfq4vyibPyIuml+d/IuSvBWmQQhs0I5mxMYQ1TeZkWIc7UnyGR33Yl
         RcD+J3OeLTiP7H4hnLfEoFaRe2ZI6GoAgkWaPiwrc4C3IgDzhWNtvXvtk9woyFN67E1J
         emSw==
X-Forwarded-Encrypted: i=1; AJvYcCVHHKxpKMdAGvxKA5Fv7L60IL8gdjSB32yB5xJ5i69v8lbKCt2vjI9ExlZQoX8nuxbUr2VpTD4/R9ch@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzlmp7Cq3/kIpLx9wospksWwYD7xu7qNLl2GuBWIXS44TOXSXl
	34Fjsc5uc4qyiLCtvCNcHomWEiadrb0RBcm9HDEJ0+1IA4t0a/30r0h5
X-Gm-Gg: ATEYQzwW1PEzwqTQeHerdxQqtcrbmJ0p7/fIFhBNG8usf69+3M92SqGtm++JUtIfHp6
	WhaMj7X8ENtj0FwOpINtuW7M9JSwagva/03kXoXQDHd6PGWBLd1QlwnCqMsWR+L8d1D6OXfxXBD
	IehKKqYfztYMdHgwO34VW8xxyS3zJNjQxdok90eDHH1oNOngA0VstTYpdd1iwoECp3puM9doETf
	BQ+hMoH4pbFci+dmZfpy8aifZ7A3N9+QSHQppWyCxU5gwvT/IJ2huVJA3w2fufVdLZ2Ha7Z168b
	rTdyUJtJL/NJoGBa2XlrcBCsMjIttksWp70zoa0orSBK6yzBbWhnJgO1DTJCTInDFa+RoOyzBlk
	cpYGQxQgU7yruu6LnWNsJ44iLF2LxXXrGfW4fz3Sl4x7ilTWUsqZyWCGlfrzVnHLk1Dbt+8yeke
	lV+u5cu7rpXRSRLHsmy83060c=
X-Received: by 2002:a05:6214:3f90:b0:89a:116b:e67c with SMTP id 6a1803df08f44-89ce8f05976mr186499446d6.45.1774889188937;
        Mon, 30 Mar 2026 09:46:28 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed051fdf6sm68357436d6.48.2026.03.30.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:46:28 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Mon, 30 Mar 2026 12:47:03 -0400
Message-ID: <20260330164707.87441-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330164707.87441-1-mailingradian@gmail.com>
References: <20260330164707.87441-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34438-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C294535F029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,lpass-lpi-common.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
index 619341dd637c..30f93b8159fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -27,6 +27,14 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 30
+    description:
+      Pins can be reserved for trusted applications or for LPASS, thereby
+      inaccessible from the OS. This property can be used to mark the pins
+      which resources should not be accessed by the OS.
+
 required:
   - gpio-controller
   - "#gpio-cells"
-- 
2.53.0


