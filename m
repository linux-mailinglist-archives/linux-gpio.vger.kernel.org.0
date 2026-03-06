Return-Path: <linux-gpio+bounces-32681-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBIZF/7Xqmn3XgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32681-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 14:34:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B5221C2C
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 14:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54882303BF4C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 13:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9293330BF6D;
	Fri,  6 Mar 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5HWFk3C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4B6304BDF
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804061; cv=none; b=D0K+GQ5MQ41qUH9JbmXuysSCnWcxlKoSCnykf27s/+zROR/Jiy8OINPkqiOhHawBwfkE9Au9q2QyS9+lZSGhgRGCupL8PKCjXd0lA4ny0lPIBU7LALhrPrc+qFVYISzRoywPqGOYIpc6XmiMzEMGUYpZuMKjHNnBv6tCLlp5+5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804061; c=relaxed/simple;
	bh=NpF8QL91yqldScG2XxQn8+rb+qg1VM07w+yITLk8tqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoV4DS5UaLo/rAPmuYCexKn3vq8yh9puhDDv3PZoBpdmM2nArW0hxWwGNkU33PsXlurK6PRLM+qFg+eNfBJbE4DAOCe4HJ/tzEudK1tSjpaYc2MUiH1njvglrtAnM2DGAnWvxDdcYxMfYxszdKoVL7uQ8MPXyb6qWWBfjbSTH8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5HWFk3C; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483703e4b08so90243565e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804058; x=1773408858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3xPqNAmdyvkw2Jw1GpTd5bQavc5+xFaOAaBqhAj8JY=;
        b=Y5HWFk3CCMqmVuHog/VIr4ktnP++eh3t4U0FwKw+cbuKqvBcZa7xB+4rv0gMg4bO5u
         OSpnXdecmFDO78ANTaKITRCMxAOQlb4PQnqg+vYIKFleTzUyXmwaJl7p0MIVYxGLZxpW
         EsyDobk/2UUw2kIRfv19NJJk2aWh2Lujc/IKP0K/rqZEqQZKXWYytONl8BEC0m7/P318
         dc7eSRL+9A5qeIvdfSScK/GAtYgKdDctvk8YEWFTYqNADD4dGj0U/HHavYdy03+uce6f
         stp9G4yDvAYtR7CxYk741S7NDMMmKA3UzBKb06gOHRkXERlTtCI39gYeLCUjrqRwjG9n
         RbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804058; x=1773408858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3xPqNAmdyvkw2Jw1GpTd5bQavc5+xFaOAaBqhAj8JY=;
        b=kbG92kodSqhDbIk7/eZ9z7YZIjz1hiRbeiVJMBWT8IAHN84o1YEHYx1o3kvkyGvj31
         sbITFCciCtzrSxtVrh2fxShxl2umfNrwIrIZncuRMSxRpJM2EGccQDkKvnPs3UNd+U1s
         gpMxUc3hy3T96w3vewS2o07cJQ8/tSv3crnzmtnB1dhuKvfAyXReYu4FelY9DIBa9pZT
         bnJ7xUkPnuF7Uv8MGIlos3rSkkFncUvzmd/GwwnxgEkI5JxrOMygb82va+0ob9CPZRtZ
         3tU1EgFctj+Cz18zdxFJHpuXxujq/BUjecPy5hi9IrosCZLlJzhCyfeYEoH8FUhuvmBm
         3pzg==
X-Gm-Message-State: AOJu0YzYabeU7fE2D5iZT4mHV25TkjojPk5LXSmSYRFgQ5UWeH/k0uv3
	bulkLVIbx7EOUAWwueW5fOyoKyPQhLIyR/xRfL+G14R1oFgMqBlxIqcl
X-Gm-Gg: ATEYQzwGA1FPghW7gDSe4JZ4y3CgD0FY1W1q5rIFNBuYUz/Lp2mByQ+Moc/Rw7Zz7+j
	wdOS0G921qCt57v+DBIF3NZM64voNpx/d+sBRcrfEMSEpNIDKunjedecLMzIXSYTxkvo0qcXcJ0
	dERp8zIqtihazcTcDlKMG5XwNaI5fOg2jZ6WB7FEZALJe/5fJBD/OAtvBAzX7qDuokYjXSh7nkk
	ZRBMsI2FbVkcWVZFbVYI+OyGkHXqHo27P/ramByZw7Y6OIC+L2Fi0gOca2Eo6/ZfOjIGR73rAxL
	iHA6QhoKu/00IgpVUNRol+WRoJLpJ2d56UDlHAO5VcW3iWuHXAloJDTdTfoZi5f7o+fFxoy9+MT
	xHi4cAfwN3rSqWFjZWShQuJw9kEJ3NveM5Svg5JSmPhZnclweTCYR1kf/TqoeIhiEdyuXzj2KPR
	4IXEFyC5r+SZHs5Rva3C+IcRw=
X-Received: by 2002:a05:600c:8705:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-4852674e8camr33569795e9.9.1772804058447;
        Fri, 06 Mar 2026 05:34:18 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm80856735e9.4.2026.03.06.05.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:34:18 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 3/6] dt-bindings: gpio: trivial-gpio: remove max77620 compatible
Date: Fri,  6 Mar 2026 15:33:48 +0200
Message-ID: <20260306133351.31589-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306133351.31589-1-clamor95@gmail.com>
References: <20260306133351.31589-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3D3B5221C2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32681-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Binding for MAX77620 GPIO function is covered by the MAX77620 schema. GPIO
controller function in MAX77620 has no dedicated node and is folded into
the parent node itself.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
index 3f4bbd57fc52..fe9b14a72d69 100644
--- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -27,7 +27,6 @@ properties:
           - gateworks,pld-gpio
           - ibm,ppc4xx-gpio
           - loongson,ls1x-gpio
-          - maxim,max77620
           - nintendo,hollywood-gpio
           - nxp,pca9570
           - nxp,pca9571
@@ -86,7 +85,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - maxim,max77620
               - rockchip,rk3328-grf-gpio
               - ti,lp3943-gpio
               - ti,palmas-gpio
-- 
2.51.0


