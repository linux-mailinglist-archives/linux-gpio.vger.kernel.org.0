Return-Path: <linux-gpio+bounces-35745-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AEiBneB8WlYhQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35745-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:56:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC448EE5E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 623C73023106
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 03:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6210338424F;
	Wed, 29 Apr 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffqmqJpU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D23502A4
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434702; cv=none; b=JVafnz5pDpfel6FqliONzwx8gIG5AxlYrM85wPoR6imiuZyq0RaRAXIgHb8KPDOxGLrTdv9h1XFjLYGDmjU7/SJJeyb8Oli7/reAPqj8vTnttN3SaXfJgGW3+whGrwrOpnWZLsdMvpdnKsPa1J4YN4zVhdbGXXeZXhgUcRFL1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434702; c=relaxed/simple;
	bh=vPQUThWy67wfMYeJwrPcsHxWfcPcFCsMgNrLSkwoj8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bjp76DxVJGrwzRyiK9pLIl6cvDXrbjla3GsAzU13bPzC9cYkfrGXJYLJGM6Tqlea5tJ9UZ2Glx58N9CP7LF6kQQn7Z4n4pi57E9LumUzADFn2Rd5+5t4q5yvgVgeJvuBu3Uq0/0jj2zpxee8D68iwy5djCqkWpwcFC9vVm12x/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffqmqJpU; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f351ca23cso6227861b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777434700; x=1778039500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbH/TGRF6PfMqJsI3EAcyASyeCufTbbYiyEWVPz+mLo=;
        b=ffqmqJpUSQqknQC3oMOW6lJQDl0bUCO4Ncez+D4Q9R86sT4UusGPMz2//OMCWzb2GO
         iNGwHOBMXjNK+OsL3cQJ2CTKThbjjeZ8njo41PSv61xRkNlItEvu979eCRgyKDruo9YN
         QtIr0hNTtg2b6LRySAnDcnCr2FRSUg0/kfLSlqLSXAtpVJ0NzAh+UVkyA2OWAxq1aEiw
         J1fqA6ysGfGGtXCKhbqDYVnEcFzAYzTmbFC69Fdk/RoJ8yeBZBD14xNovAdKV2wlvHo1
         i77GTmY8+2AyzTGG0txSSuX/c9IGKW79GrCuJzP9Bt3iq0Y+WYSmjRovfMfnFLM28xxl
         4PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434700; x=1778039500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QbH/TGRF6PfMqJsI3EAcyASyeCufTbbYiyEWVPz+mLo=;
        b=j5XwB+F5+k50vor6l6lGUJTQvNs5T7DLysZRvpFiM5q4iHLPoADg72zihC5NAjnB5K
         Uxjmk8XJ6+IIsq8nA2eAq4S0hGrCn69BN+8rJ3hsvCbxBWSrxhYDDbF2NkDyr2NCnWfO
         rBNTp9q05Pvbuq9Y5QIU2UuYWOxrs5PUcOQ7n6SCDkXxq9Oj/1PIJ5v3xwgiT+rnNXvx
         PPYwYEyvFoL3iUlNIXkpjNcc6Pa6wPVMvwcYJoUk9UjtwHXvvilejh4mARxFz/tEAotA
         WDNxmXtp1+LTSr/FSX1yqHlVwceS4OsOwcbZPtpKLJNKFh/FydYKxaz23pgzCjmZHFwZ
         3yCQ==
X-Gm-Message-State: AOJu0YyM55COW28EKaNGZiyI0pNu6J9dWkfzp0Wpc0WfYl2LAIrHg4HA
	X3HEtK3iKLANQSFPq4TMw7q/akqXcANrLQ02bheGGtdkDuBTWaRjEiRM
X-Gm-Gg: AeBDieu3CIEQ8NFdtpkBvXdvHC1SAlLzVnHdMcUVzLpULswxhnPrNHv32pvFjYGhtKy
	INx1Oi6j7JDlo0PuRCAd3QIudsUuLfXwvaYGyrNNpoDkAefMmwQ4aOzErvndvP1qzM/n9rqrHlq
	B66824YT0lO1CObggGNux9BtUP5ZOsjq1F56dfnXywbqjT5SXPoGfXnWPlOB5tqgXf0zLHlXnPE
	d630E0+5fsf+rPwAk794WWgCijsNzJ2gqZKHnyyx+SHAajFv/AeOqN1KF7L1yQSDDsK5bVPwPEQ
	rAkda4d+l2Cg3W7DsMJa+TmnRI5IqFSI1qWa7sVheuZc2QsjQGQmq9Z0ouMz5zkV1oM0ZTj8ALU
	FMZcYLKCIcxnqgqrC31/k1HdnkPu314WOZwoOnMDnqdR9FCPjJv2WjF7566vGZ4kMYjM7Z1B0oV
	L65jWvMiBOIyT7lzupSFeJb94qtrFRMBnw1mTCzMN1rlDMQW6n6LJjNBh+uaW5yFWrw53XWkBr/
	RU=
X-Received: by 2002:a05:6a00:1953:b0:82f:4867:5876 with SMTP id d2e1a72fcca58-834ddc95779mr5627069b3a.50.1777434700304;
        Tue, 28 Apr 2026 20:51:40 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5f30ddsm502899b3a.26.2026.04.28.20.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:51:39 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: gpio: fairchild,74hc595: add lines-initial-states property
Date: Wed, 29 Apr 2026 12:51:33 +0900
Message-Id: <20260429035134.1023330-2-happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1776872453.git.happycpu@gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1BCC448EE5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35745-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[happycpu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]

The 74HC595 and 74LVC594 shift registers latch their outputs until the
first serial write, so boards that depend on a specific power-on pattern
(for example active-low indicators, reset lines, or other signals that
must come up non-zero) have no way to express that today: the Linux
driver always writes zeros from its zero-initialised buffer during
probe.

Document support for the existing lines-initial-states bitmask, already
defined for nxp,pcf8575, so the same convention covers this output-only
device. Bit N corresponds to GPIO line N. Because the 74HC595/74LVC594
family is push-pull output only (no input mode, no high-impedance state
under software control), bit=0 drives the line low and bit=1 drives it
high; this differs from nxp,pcf8575, where the 0/1 polarity reflects the
quasi-bidirectional nature of that part.

The bitmask covers up to 32 lines, which fits the typical 1-4 chip
cascades that appear in tree. Should longer chains require seeding in
the future, the property can be extended to a uint32-array without
breaking the bit-N-equals-line-N convention.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Chanhong Jung <happycpu@gmail.com>
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 23410aeca..451538df6 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -45,6 +45,18 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Number of daisy-chained shift registers
 
+  lines-initial-states:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bitmask that specifies the initial state of each output line, written
+      by the driver before the gpiochip is registered. Bit N corresponds to
+      GPIO line N, following the convention already documented for
+      nxp,pcf8575. Because the 74HC595/74LVC594 family is push-pull output
+      only, a bit set to zero drives the line low and a bit set to one
+      drives it high. The bitmask covers up to 32 lines (four cascaded
+      registers); outputs beyond that come up zeroed. When the property is
+      absent all outputs come up low, preserving the previous behaviour.
+
   enable-gpios:
     description: GPIO connected to the OE (Output Enable) pin.
     maxItems: 1
@@ -79,6 +91,7 @@ examples:
             gpio-controller;
             #gpio-cells = <2>;
             registers-number = <4>;
+            lines-initial-states = <0xffff0000>;
             spi-max-frequency = <100000>;
         };
     };
-- 
2.34.1


