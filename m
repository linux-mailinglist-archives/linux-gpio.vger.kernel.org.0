Return-Path: <linux-gpio+bounces-34883-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DfYIAQi1mklBQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34883-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 11:38:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29E3B9F1D
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 11:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EA58302A04A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AFC37B40E;
	Wed,  8 Apr 2026 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1aU+i0N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332D3644CB
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640929; cv=none; b=cpsgCc1qBwtI73a9jRCMdHNsD16WNHoVBiSe7JNUnOrmUKCwLAStnRenYiL8JMPInTRJ0yX3MgqMlXP/yQUOLj+BCe+aQYavi9k1qtFlRFoQn0phYbk1kDErhweQOyHlPlZ20gpkj76mg3gms0ms3UzjuR7otR4yI8fjgoSmpis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640929; c=relaxed/simple;
	bh=HXqM/oIl0J1GIsq6xnHEI1gZ9fmP8FbeFSx73s/rCZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1vsK0AH4CM5JmIyz3L60uJ06guPH1TOwJAeWxfnndT5Rf3dh2yhUYUou5QsPv4RwoQJ1plPBDSrJrjHmOUP4JdNzU80Yvo6fJjLuJofsf1moDQkFtuuZtK0fArVoxxbUWg5D51iitYFQsEdsZ9449BV58pp0iadfsQjbR2lZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1aU+i0N; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82a7539851fso2650208b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775640927; x=1776245727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9ob+5DjZJfjGxOOJg7va6LhdtI3Tpf0ax2Xb93FxM4=;
        b=e1aU+i0NogDpHwfL8YWfVQxdJuUJr1PmbQsSonYDCAJ+zAzj8wgLjJ95sxm11fCYbq
         1c6TFEGt+H24I+uyobLM+VC0khzaV9JhjNa0G4MITWeIyR7DRKeK0kjIstd/gI6BUQ9M
         kRV6g7g/kEPJFG9dfZ0S2WlzYOl1ZxXmr3JmddLutGMZIuqyclVxk7Tax30ynVbSLRuF
         uvTBH5z7miPI+MT2qMy0Hc/rFcyWipuFPIbGdMTWROT1vgmAlg4Thi90M21YS42UBmPP
         pCDF+x6NJPaTBpvKptVg8j1Ldmt05GYoUmn9Mx9gqtjIWr0i7GEEuD7iUa1J1e4Vplyr
         fQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640927; x=1776245727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9ob+5DjZJfjGxOOJg7va6LhdtI3Tpf0ax2Xb93FxM4=;
        b=CnWiYLRMI1riUVLg4srPJntKuYIvxG/2PruPs9Mo0rmmYFje64DPGXcr+jGkLlzECR
         pJ4ZiF3PFbJ0zdGZcdFhexqAPhkVRs3GIiHPFRpoKiX4ZKl4SpUWZY/P8fUFEz0j4tIk
         fipgDz9zwSCkPwogUXcGiPMi9U7UN94ffgWcW3AWFwQ8FuQgM2rGU+LPpC20OOZC1VYk
         Hpi+dD6OsOLOI2PLoYaci+rDj+8beuB6smG2eNkzHT7M1myHhAnaUxqv4uw410SVTvEh
         uxLe5Yfprvhgq2lL4N+/Z+XV/vQgK0WBl3VD3qQVUNSbWxBg9UnEXHqfzpkwNFUZ9Jb9
         8Mww==
X-Forwarded-Encrypted: i=1; AJvYcCUoQAxKuc62ZmASwtIDuwqtRaVqN4k+eUUVGdnWbh1l/qI6ZU5WKOPyOPq418cjuoqXt8c+YICmw/Ek@vger.kernel.org
X-Gm-Message-State: AOJu0YwXY7FY4Bo++6qRN+8pZmgjsuyGFv8D4Z0umj2cvC/DffI6jbKe
	rnnq38WDWzzZzsss3+WbSowY4LIbaxoU443H28J7Ip2t6Prrat4iyhg3
X-Gm-Gg: AeBDiet/Gp3Bgfmd4fl3cYHi5cekQQTl68T4gFW1GlgH33xUwiXjm9rYLlddtsjmGpy
	O1Wj5/vTDG3qzjJqmsXvAMDhJ4XlWzbPSlkQuFPIJ5qZStGuYyPzIilxVwkJbZfH5zrp89Zf6lu
	DjAr7baSN4yPBxy9uKYitYiQLdBAxCt7enlLHJ//M5Gsk4qXNhNG8O/C8p2GvuvIkttNx4sAYlD
	DM3hUVmlL72qq8ApL9G5CLCUZNNt5U6vMqfO8jc4jb8ftSETJ/XqmyDaQZZvXTU4akGqUz5fMvY
	wqR7M7/RwfaivPlQPAbfWo+vsUjGfLIk9tBDjmBTvv0yTWMgN9JsRiAO2BY6eXj3GAkZONlXIei
	QdFXkSiKMzDC4POyJFIYrF5IW5XXSjftoXVdLDe/JVyjyerEXxskswc7yfckzBYv5MJqx9ro3b3
	Im/9yYFV4aRJ7x/yX2Fr30
X-Received: by 2002:a05:6a00:10c6:b0:81f:4a0c:c584 with SMTP id d2e1a72fcca58-82d0da44954mr21259507b3a.1.1775640927193;
        Wed, 08 Apr 2026 02:35:27 -0700 (PDT)
Received: from fedora ([122.173.24.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm20544993b3a.59.2026.04.08.02.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:35:26 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: robh@kernel.org
Cc: brgl@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rric@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH v3] dt-bindings: gpio: cavium,thunder-8890: Remove DT binding
Date: Wed,  8 Apr 2026 15:03:13 +0530
Message-ID: <20260408093313.17025-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[ishihao999@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-34883-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.6:email]
X-Rspamd-Queue-Id: 2F29E3B9F1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the cavium,thunder-8890 GPIO binding as there are no active
use cases. A previous attempt was made to convert the binding to DT
schema, but since the binding is unused, remove it instead.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
v3:
- Remove unused legacy text-based binding
- Drop previous DT schema conversion attempt

v2: https://lore.kernel.org/linux-devicetree/CAL_Jsq+0q8Wb==Xy_bi-j2D29BzZEN81tZr7VPGikL4AM5rbbQ@mail.gmail.com/T/#t
 - Rename schema file based on compatible string
 - Wrap commit message body as per kernel patch guidelines
 - Use appropriate maintainer name and email address in DT schema.
 - Change commit subject as per guidelines
 - Fix $id path

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
---
 .../bindings/gpio/gpio-thunderx.txt           | 27 -------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
deleted file mode 100644
index 3f883ae29d11..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Cavium ThunderX/OCTEON-TX GPIO controller bindings
-
-Required Properties:
-- reg: The controller bus address.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Must be 2.
-  - First cell is the GPIO pin number relative to the controller.
-  - Second cell is a standard generic flag bitfield as described in gpio.txt.
-
-Optional Properties:
-- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Must be present and have value of 2 if
-                    "interrupt-controller" is present.
-  - First cell is the GPIO pin number relative to the controller.
-  - Second cell is triggering flags as defined in interrupts.txt.
-
-Example:
-
-gpio_6_0: gpio@6,0 {
-	compatible = "cavium,thunder-8890-gpio";
-	reg = <0x3000 0 0 0 0>; /*  DEVFN = 0x30 (6:0) */
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-- 
2.53.0


