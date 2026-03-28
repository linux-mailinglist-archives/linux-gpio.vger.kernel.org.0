Return-Path: <linux-gpio+bounces-34349-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH79OE/3x2lMfQUAu9opvQ
	(envelope-from <linux-gpio+bounces-34349-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 16:44:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4980C34EF6A
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 16:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D03A307EBD6
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 15:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF3B346E7B;
	Sat, 28 Mar 2026 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux6j/Dzs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E8034C81F
	for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712315; cv=none; b=MX67BRfkzorFvuhPzey8viIMx3+xQ1lkLFJc23hMU1ONkyOneewtm+DTdzxRkt1tiK6dbSPzezyF28Ew1KCmWVJFy/l8EHWefIskOsj65h1gwF66E1Y2CjJoqq3oVju/B35doA1FK5I5641hlUkYySPoV/WW+R1hhKGcKihevgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712315; c=relaxed/simple;
	bh=yHnYCD3Yjtr2dapPbgeCpmyuuSIpfeJ6ikUI6HCe8fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4gGKhJUVw6Ujuw4kldUnODgeq9Y0qK3kwFnxu9iPcT+nVb0D6894HKP37Fc4tJYawjG7HJ8OGDqsdYDwboOmkHCU6Sj8MBIDMghxvSlPHLE7qpNZFOcB0M8o6STkC1dyJZv5w8wW0otx8k6Ji26rHFmbWzyRXDdZHcgjfZsnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux6j/Dzs; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d7eb85fb81so3042016a34.0
        for <linux-gpio@vger.kernel.org>; Sat, 28 Mar 2026 08:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774712313; x=1775317113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gHeI0Au3+Leub7JbWvdZEnPyYX4TmlKRj6OkHehBU0=;
        b=Ux6j/DzsbJQZ4aZlqh7hmALTEAIZ5dsf2NHLixfW+t21qX9XmrzgwkwWdku2ZG8I57
         7555GKHdSwGm4k8mvwrsSS4hGHhRV0oR8SZRJW7PQzS0gHGxUHppZDsziv7wG+4b5+eo
         0iPLDp5J0cA7LD/5xEnOBM1+kUYnbpG93SPaNuTfoqtmsnfVPfzMoSYJQIaIcaBCGtap
         9MyAZxl1dUdxoGK8hFIIvKKrQ44Pa9GDMsBmBlEDal+kBhlnpJsnQB2zArN+M2vaaEzD
         hfADFR5Cy2zDKfJtbjNnpvJ/EHM+j09mkEidJ1TKBgbusoS2boATK7OA18yw8L5fWRDj
         2+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712313; x=1775317113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gHeI0Au3+Leub7JbWvdZEnPyYX4TmlKRj6OkHehBU0=;
        b=S4o/1qIp9TOLEb199YoS+refKOl5isHc8D1XW+hKsmnSRsVQgCAJThYqRDuvxlCRVJ
         vyyjSy+g6SeIt0as3dqeoU6/maR0rPz2az4JNmt+A2nCjhQ40cN4CKjIVnH5ESRu6ZtQ
         XZND1cmIgEQmPKz8GMjnBZPGCG2v2hG+l5I6ZGiw0KwRMf5e6zlg1Agr+/ULM8lzHZtn
         CbpdkkTnWo6dZaI4Z705OJJTG+Ley/+mT9nuUSdt96o0s7ES9eA+yg29fe8hQxgmaSZk
         pHEdJAtZXQRaJfxPd77xJUD30tUHMi4kKsydNCq8+vHHvWjWcJJDH0cs6H2L2DKAfaub
         8edQ==
X-Gm-Message-State: AOJu0YwAZZ40alHU0QCLhWHDrwfbUG2p7tcCUMzAVaemmaWQrONNQlj4
	Jh4LPOv6PvkIa7ZA5t+lklOOISR3K1gq8EUBjgEZteg4qygxzsxTF8F+7bafLw==
X-Gm-Gg: ATEYQzzrtPsP7RSv91t5ZfrrvgAFSh+M3BoBPNdXYyg2sAoEY8A8Dnf6C1pO4GmigOr
	kwsPSCagcTP60a/+IKOa86+hCL0r75Ax8ZewQ0pkbdc81Kalgx6GpGlFk6peurvuJ0AUIqZ5PaF
	ACPaBe4K379y3OsSnjOk74TftchEzbvNXen7JICytwATubwbOxncAUnpi/0MIVWraC0niutJxVu
	J0Jmg+qItTMsCadKMiJq6LgO+0M4qQkHJ0mAMio4BqwUUMWqu5U47OYOl5DHiUvzNSlj+kV+7iX
	kesO5aTNP43XZwbcLUEznFH14jnq+wPJ9MP0E6QnbwnOSrJ8/zqnV5Xlgis3pS6/Id8zQOH9djk
	vXFyqR9m5tus1S6GHbQ6tmO5l5RamhTzvnnCLN2Y4aOL7KAe52kuLKwm7Vyt60cSyxTJpYerIeb
	cxIWzxtAl+KLFdRCJX/PO0arN1nPK6tBalNcxqpg2g8or78wiv9fTG0zjYCDvqoqt4v6sHd0Hw
X-Received: by 2002:a05:6830:6605:b0:7d7:58b0:8e72 with SMTP id 46e09a7af769-7d9fad8e7b1mr3829505a34.4.1774712313173;
        Sat, 28 Mar 2026 08:38:33 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a821746sm1976073a34.24.2026.03.28.08.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:38:32 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: remove wheel from build dependencies
Date: Sat, 28 Mar 2026 10:38:30 -0500
Message-ID: <20260328153830.57177-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34349-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4980C34EF6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The `wheel` package is not actually a build dependency for the project
since it is not imported during setup.

The `setuptools` documentation [0] says it was documented as required at
one point and that most packages have cargo culted the inclusion.

[0]: https://setuptools.pypa.io/en/latest/userguide/quickstart.html#basic-use
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/pyproject.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 1c3549c..9ac2157 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -2,7 +2,7 @@
 # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
 
 [build-system]
-requires = ["setuptools>=77.0.0", "wheel", "packaging"]
+requires = ["setuptools>=77.0.0", "packaging"]
 build-backend = "setuptools.build_meta"
 
 [project]
-- 
2.43.0


