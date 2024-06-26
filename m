Return-Path: <linux-gpio+bounces-7701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6891783A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FAE9280ECF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4161714534D;
	Wed, 26 Jun 2024 05:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0igrob1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1213D28F
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 05:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719380307; cv=none; b=VKTmV5626MGAIp6oTpjTUkFUXvVY3vOFnPzOD1BEKfbconM+FSRs+kUVkTXjT3MxVxF4/3qduyvTVqgoRgiNZh+wQ2llakZZg8c4brjxSdPXIVgge1rPYqi6V+/Qi1uxccg0ogAEKBQof2JRLe1SRUEpWCTaSVK2Bzv5Ds86Pmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719380307; c=relaxed/simple;
	bh=R9TO1OdcFXqz05anwosJ6q7usrPOMc/RWkOrA0Z+E/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X/j+y3vLQW0cSPYC2zoQSpKfT2u1bgSLwH/mcSMiQn+FB3wqCnhRD2M/ybZCAr9jZ4JhAfFMklju7ztrry+7pLGgQELR/dOXiCmpjbFtO5wt9zMcnHf2uuehbpDfiXTEm5t+MCPeEGNGuGd7EwCoGYkiP6aNINGMAOayzrkXBVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0igrob1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c80637d8adso4261062a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 22:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719380305; x=1719985105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcc5dm+/D1AGOp5FR1AXSdHqXjg+ggR1IoBjJP6gie4=;
        b=P0igrob1U7wEC/Mjp8ZwG2N78JFwiIsLW4MvgsGtMFN1W2obQ8h4X49e9+DYEnzyZ9
         Aq5TpQ4e9o4u5TEhfjlYsHp97lO6OcMuZYRZK6zUgACdXvijtjz0IMZvVc6ytueOZBqZ
         s2tJ2efXGDZzXBbNm2PTNrK2DLBl7EiOhBqVarESgUWAGCccg2Lqcl1gJrfwy3MUoZ1Q
         ME2X0/Zls+u7C+reuneyu4IxfYglsh6d15NP/FJxPGtmNoZGEBMcRNj/ImVEi1MgVVqk
         gtSYk5My9FBf4zbgviIuxtGnqtZ+a1AI+cK0ucy2i1R8zn3Ihc0OEor59m0uU7qLJntF
         TyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719380305; x=1719985105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcc5dm+/D1AGOp5FR1AXSdHqXjg+ggR1IoBjJP6gie4=;
        b=JN20KRIlPs6WLEt08eqZ0kM51yanC0gNqK8kSEwrPopg/ygst8ilpU1gMAjNKWIGmX
         rxc2KypNtXJ1k9LhB/DSxuhqdl0I++a89bTUlyhaP2RFqBFmpm49BvMQRq9oV1CCXQ2K
         xwfW7tfHZlvYpk//xbXt7MKuCccoVH/ONCyDXjl0htJTAFppH//neFiulbEw8bqt3qOp
         Wv7+h5yhTcuUHz4G9Zcq7xAf0PDZURn7baNqsb6xrInfAD6M2ttvuBVnIgDaluO0mYu/
         y3wfmDhWypnX2uy3dhC3MAyIMGurodO5boS77zPOByojPakR/aWGInThccPrpOW8MoJK
         mD0A==
X-Gm-Message-State: AOJu0YycsfKL0pb+7z61u/Wx0xF9Cb8IqhRIFdl/tdxopepH2Yzhl7QZ
	HDOImMgUdIKyfk+m46kL08Fwl+KlvzP07ugArKLc2j9dKG0pappGm953yA==
X-Google-Smtp-Source: AGHT+IG6vZhYS1gy2cCfzcgeRT+qzRDDbmz0u5Aaxrwne69Atq7WvFvtdUng8R+8UjDoy6rQ8ebyWA==
X-Received: by 2002:a17:90b:4b0c:b0:2c2:f472:64b0 with SMTP id 98e67ed59e1d1-2c8582e1711mr7477589a91.49.1719380304642;
        Tue, 25 Jun 2024 22:38:24 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8d7b4f821sm674370a91.0.2024.06.25.22.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:38:24 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/3] bindings: python: tests: extend reconfiguration tests
Date: Wed, 26 Jun 2024 13:38:06 +0800
Message-Id: <20240626053808.179457-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626053808.179457-1-warthog618@gmail.com>
References: <20240626053808.179457-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A number of the corner cases for reconfiguration are untested, including
 - using None for default settings
 - missing settings for some lines
 - jumbled line ordering relative to the request
 - extra settings for non-requested lines

Add tests for these corner cases.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/tests/tests_line_request.py | 50 +++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index f99b93d..2f375d6 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -490,6 +490,56 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
+    def test_reconfigure_by_misordered_offsets(self):
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines(
+            {(6, 0, 3, 2): gpiod.LineSettings(direction=Direction.INPUT)}
+        )
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.INPUT)
+
+    def test_reconfigure_by_misordered_names(self):
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines(
+            {(0, "baz", 2, "foo"): gpiod.LineSettings(direction=Direction.INPUT)}
+        )
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.INPUT)
+
+    def test_reconfigure_with_default(self):
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines({
+            0: gpiod.LineSettings(direction=Direction.INPUT),
+            2: None,
+            ("baz", "foo"): gpiod.LineSettings(direction=Direction.INPUT)
+        })
+        info = self.chip.get_line_info(0)
+        self.assertEqual(info.direction, Direction.INPUT)
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+
+    def test_reconfigure_missing_offsets(self):
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines(
+                {(6, 0): gpiod.LineSettings(direction=Direction.INPUT)}
+            )
+        info = self.chip.get_line_info(0)
+        self.assertEqual(info.direction, Direction.INPUT)
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+
+    def test_reconfigure_extra_offsets(self):
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines(
+            {(0, 2, 3, 6, 5): gpiod.LineSettings(direction=Direction.INPUT)}
+            )
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.INPUT)
 
 class ReleasedLineRequestCannotBeUsed(TestCase):
     def test_using_released_line_request(self):
-- 
2.39.2


