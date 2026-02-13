Return-Path: <linux-gpio+bounces-31676-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOZ6I4Cmj2kVSQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31676-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 23:32:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13036139CB2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 23:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3147A301F149
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 22:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988B1316185;
	Fri, 13 Feb 2026 22:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdTaxu1V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C566315D23
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 22:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771021947; cv=none; b=ld4wjiBttLhFzSRgbH26GJAQgV8+a7C+jIgFZoAnTxK3KKdqfijJSgpsgLdc4DMj1cS9lJc/TODFsGXxDkc3ctII7D/q06mxYNjNItiv4PKmCZYmmBQ1c0kHmlpiSDF8Rz5/GUG2VsvDcBoafrPXqHMDI1Pbma64TH3xDqV8Z5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771021947; c=relaxed/simple;
	bh=q7Fqxy6e28lycA/LVu+rFivt886Ak4SzXlJ0a8MnRFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUjuLPv0cqKR8xVb47n6CGzhOJzXu11hK2ziOZpcE7tt007J2xrb4aoRKQ2IuLzAXf7NmMQWbgcKYm4hqrFBcDZ89Sinwj8Ia8rR+lDfAqMQC/r9hc83cmPq1lxWe4sAGSINabrfcsV97YYuCV6UNxoBdnvrPYGgzk7kbBi1DkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdTaxu1V; arc=none smtp.client-ip=209.85.167.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-46392972257so965035b6e.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 14:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771021945; x=1771626745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOA3Fq3qeW/ssDTBL2Z818pHx95UW3MtdV2Mwb98UGY=;
        b=XdTaxu1VmPYH1rxhp8+a1pS3xM8rJAQZfndOCRgCPKigyXexENG7mdFqY2kvO6Tx8N
         T2cxeuvh5xDXV0HpxKKyKLSPVs+OeOEj9fQxqtygY7KfBltz9Hz8rRpp6p4xSISKLfK2
         b+ET300jcGoX5jf50tvMOpavQ+M3FOTLrxfeI8PSb/ndkRtA7X6M49HbDAi119eeUY7T
         iQBDWx5yh9QLgozhk5vcLqgSE/Xu3YXinIO/Ife0PNi9CWOg2OpwXslG/K5l/uokdLFr
         NmdNTCmGdNBD+moZZcST3iXJaqmhpDNqWGVDCdJ6wGahdENGRPMc2GYsRUIVx0dsdINm
         fIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771021945; x=1771626745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pOA3Fq3qeW/ssDTBL2Z818pHx95UW3MtdV2Mwb98UGY=;
        b=HRMu+j/Dfq4jq4mSUajh4/HpAnRamoFWAoolsVNac0oCRY1wQqQ3UDEcun/3uGNzEN
         BZogeFOLpSC7G/q3TN/MyKiGTjnU0SSMnxuEclETgFuFQyzG4aRoeACxgKi0tFx9VKo8
         Nk6MWmLP2ivfTxm9jtGedjrmBtwS7yWjxj4ZdAZ/cToiYKhhLcpvjnOf/zCFV1vD1lZG
         Jd8r0trBt8OzWgcRxzdCyp+1aMjLoFuRstPZtejQIoZLNh67AN0gL1ZKhzE5cCTFzYzz
         3auQ5b465XiWWeR4ESn//cDz7JTTvHcvi+oO0qRPBw3ldHggk7B3fDagkeFp1Bhw9f+5
         4JAw==
X-Gm-Message-State: AOJu0Yw/rYift/hS887jdcz6MHHd0JJ9hlTZHIbYOuSU2yIjjx1PhIu0
	RWpfhn2vldLnykmNkwTuW7TchUnlOnksq12BuZZqUzPfTDV13tvYQR0g4d3ZAlWq
X-Gm-Gg: AZuq6aJT1mgLO5ZJ1BnjHQd56PxuPvAPPSZLDAWKanI3XFUBhbBjZevoRVO4QB+ChgL
	+jxON0TNSt3v2E1f/W+b9WWaGpjhUp1Ys0QWukJJDWVLFEcljBXOQQSSrczpsGS4cJiNI7FjoIn
	WLOXHFuhe5FJ7RxnNXcQd8+l7uDlGrfiqAjcOhPFLJlpm44+cs4oNx01XClg+O6BHaX7b+5pch/
	UUEh/BHE2abwusBAehvsBpONj6tecGDiGmRjw0fvC/65fbsppqOGpff7AAfpq2X8boNt3kSi5GP
	Wic+Pw/A1Sx8qui1JZIEo5oSY+85OU03BOgVLz+KWoya4dPxat+fbDAW6n+WMqQrXuHa8rCkBx7
	28lbyr0TRgfbNOJYXL/JRc4lHXcGe5nYkAl3RxwSbbyQmLko/cti4331Pfajo8I77sTMsh/2BtA
	oGbjrIWf3ZuQmHPfCtJRBvv+ZvWak+CFSPwPJUjunT/gSN3HVaJarbzQtu0CvQv3pWKVUTp25a8
	EQUvODOG0HTnyM6Rlt8AKlrtZDCnKeO82Qd+Ppy3ID6I/8S1eOxeR/ksk6W7iI=
X-Received: by 2002:a05:6808:c18e:b0:450:d143:b79f with SMTP id 5614622812f47-4639f281395mr1478351b6e.66.1771021944958;
        Fri, 13 Feb 2026 14:32:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net. [71.218.105.26])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4636b0c8606sm5446923b6e.18.2026.02.13.14.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 14:32:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: gpio: document gpio-line usage
Date: Fri, 13 Feb 2026 15:32:02 -0700
Message-ID: <20260213223204.2415507-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213223204.2415507-1-james.hilliard1@gmail.com>
References: <20260213223204.2415507-1-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31676-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13036139CB2
X-Rspamd-Action: no action

Document gpio-line child nodes for GPIO controller initialization
without line hogging.

Describe gpio-line-name semantics for both gpio-line nodes and gpio-hog
nodes, and update examples accordingly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/gpio/gpio.txt         | 47 ++++++++++++++-----
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index b37dbb1edc62..cf591954eafd 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -199,28 +199,41 @@ gpio-controller@00000000 {
 		"poweroff", "reset";
 }
 
-The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
-providing automatic GPIO request and configuration as part of the
-gpio-controller's driver probe function.
+The GPIO chip may contain child nodes used for line setup at probe time:
+- gpio-hog: reserves the GPIO line as a hog and configures it.
+- gpio-line: configures the GPIO line without reserving it as a hog.
 
-Each GPIO hog definition is represented as a child node of the GPIO controller.
-Required properties:
-- gpio-hog:   A property specifying that this child node represents a GPIO hog.
+Common properties for gpio-hog and gpio-line child nodes:
 - gpios:      Store the GPIO information (id, flags, ...) for each GPIO to
 	      affect. Shall contain an integer multiple of the number of cells
 	      specified in its parent node (GPIO controller node).
-Only one of the following properties scanned in the order shown below.
-This means that when multiple properties are present they will be searched
-in the order presented below and the first match is taken as the intended
-configuration.
 - input:      A property specifying to set the GPIO direction as input.
 - output-low  A property specifying to set the GPIO direction as output with
 	      the value low.
 - output-high A property specifying to set the GPIO direction as output with
 	      the value high.
-
-Optional properties:
-- line-name:  The GPIO label name. If not present the node name is used.
+	      When multiple line-state properties are present they are scanned
+	      in the order shown above and the first match is used.
+- gpio-line-name:
+	      Optional GPIO line name for the configured line.
+	      When present, it sets the line name for that line and overrides
+	      any existing name, including names assigned by the controller's
+	      "gpio-line-names". If not present, any existing name is left
+	      unchanged.
+
+gpio-hog specific properties:
+- gpio-hog:   A property specifying that this child node represents a GPIO hog.
+- line-name:  Consumer label used when requesting the hogged GPIO.
+	      If not present the node name is used.
+	      This is independent from "gpio-line-name".
+At least one line-state property ("input", "output-low", or "output-high")
+must be present for gpio-hog.
+
+gpio-line specific properties:
+- gpio-line:  A property specifying that this child node represents GPIO lines
+	      to configure without hogging.
+Line-state properties are optional for gpio-line.
+When no line-state property is present, the line direction/value is left as-is.
 
 Example of two SOC GPIO banks defined as gpio-controller nodes:
 
@@ -235,6 +248,14 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 			gpios = <6 0>;
 			output-low;
 			line-name = "foo-bar-gpio";
+			gpio-line-name = "foo-bar-line";
+		};
+
+		line_c-init {
+			gpio-line;
+			gpios = <7 0>;
+			output-high;
+			gpio-line-name = "foo-baz-gpio";
 		};
 	};
 
-- 
2.43.0


