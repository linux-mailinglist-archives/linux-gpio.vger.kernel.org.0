Return-Path: <linux-gpio+bounces-10389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F15B097F09D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 20:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B262A281EDA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 18:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0287D1A01C3;
	Mon, 23 Sep 2024 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jf+lcDVz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1019F13C
	for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727115988; cv=none; b=GOyuX7jCslhkCEpnv+R9ydBoLxuz1NQtu9wYJelII99GfYQ/hOWSsQ401iWWmru9ZQLdDNbqMX/BnjjHyI0hqpkthaOvF+8CHtD0SK2m/ALOeUdRENRpUbTSMRNbOBUSFKbUmiLwXtBojLvrvOJGPM5kjTQqlZ1zN/cm5u9Rm2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727115988; c=relaxed/simple;
	bh=6yAOz26213n2KgfQEQsbiC5BQb5c9sE/isoaVPgReMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CckhdT4paTRQe17atF4uzAibkasr77fK5h3aZDG6VjqAOWrYXfo2ge/3I86V+5r4jmZKu8UbK5O/GnOiWBRqDSHY/cCMn9HQcMmGwvokaNc2107aEFwinpuAIwILK9+7oftPx1sNovpStiPRoAnf9jio3SqUhcR9ZMOgJtG+X78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jf+lcDVz; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-458311b338eso39469751cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727115986; x=1727720786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBvpgXO5r5dFIZAM8oRzmHzrw+yH88awNg14BJlS8xc=;
        b=Jf+lcDVzyle1RODyECvQA4rm8zeNri/4X8+jchhZ/vXlPpk8NLdgjkncT7zn5YK7p3
         QwiRCYunlCQcYHM93fEDRlZ8/Nxfxg2RRB1nmpWnAdRuDonUdOyqI9E1vB31AhQ0uXKb
         hZDjondnIbgyB94YmiR7eNtlPesibP9+NZZU/pWk8EjqZcD46tuZcBG2WOkFvAiDyi4d
         vl+q1QvlMNnFNK9e4ShcU3dZV/OMN8W2b7kLmJzC1WkyMlBPXgr2QtgJoY86IikihPQk
         laP95O13rRjutbNOMqxLiAzed+u5LJBRHbWGvi8ElVuSC7tge3Xhet0qfR1SfAtBZI45
         OHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727115986; x=1727720786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBvpgXO5r5dFIZAM8oRzmHzrw+yH88awNg14BJlS8xc=;
        b=K24/7JNog6r5NN0OPDtwn2vSar0BilsTkfHPfxuWUMEu0F8eDD3abXXaWYXqogw5NX
         ptweac5P/XXNzPhrYNNxeNF4DxAyXetSED6N40AEiACvT7uYCGYgwSofeTBtJ89meSXe
         8/xa0InZ2Nev89f/2iItpCdg6JrufaIknPTxlxQO2sg1N1MJoi4SfrDu0Gu3gBNqQda4
         F10lUzYrcqBuVHHLrHdOWtHvMGI8zbsoxdnhCRUCUyuLKyWc0V+gyzv7D2Eq/AuqjqHd
         qIFMQK1XzocezXo+bGymqUwQI3FSiyG4lmKyiYFtGp3IseK8Jao9siCTj1tOAQFY4Lzm
         1C+w==
X-Gm-Message-State: AOJu0YzdgGWSFbSy3yRLY9CNGPUdPWY7ANY+/0OpCXkd0VwgzcpnrXzn
	4kCdLD78i+5ib7d2qE84+OQQCNe5DElbZVhrMmtpVHUn1ZqY3Zo51Rqnbw==
X-Google-Smtp-Source: AGHT+IE5+qfL40o05XJorUx61WsygrDFOfQnpeDZyKQ1t/d6G03INA/DlV6YCF7+q0BTXuDwI0xieQ==
X-Received: by 2002:a05:6214:310c:b0:6c3:63be:e716 with SMTP id 6a1803df08f44-6c7bc80d154mr174104126d6.35.1727115985742;
        Mon, 23 Sep 2024 11:26:25 -0700 (PDT)
Received: from vfazio4.xes-mad.com (mail.xes-mad.com. [162.248.234.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c75e474465sm49699736d6.42.2024.09.23.11.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 11:26:24 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
X-Google-Original-From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH] bindings: python: tests: skip some reconfigure tests on older kernels
Date: Mon, 23 Sep 2024 13:25:50 -0500
Message-Id: <20240923182550.3724996-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 40db20e added tests to ensure that lines that were either missing
from a reconfigure call or were included but had no LineSettings defined
would _not_ change configuration.

However, this functionality requires the changes from kernel commit
b44039638 to work as expected. This commit exists in the 6.10 kernel and
was backported to 6.9.8 [0].

Now, these tests are skipped if the kernel version is older than 6.9.8.

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=d972e7b24a50d1f89967d5bffc3147810af9222d
Fixes: 40db20eec045 ("bindings: python: tests: extend reconfiguration tests")
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/tests_line_request.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 285c9f1..5c42676 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -4,9 +4,9 @@
 import errno
 import gpiod
 
-from . import gpiosim
+from . import gpiosim, current_version as linux_kernel_version
 from gpiod.line import Clock, Direction, Drive, Edge, Value
-from unittest import TestCase
+from unittest import TestCase, skipIf
 
 Pull = gpiosim.Chip.Pull
 SimVal = gpiosim.Chip.Value
@@ -549,6 +549,7 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
+    @skipIf(linux_kernel_version < "6.9.8", "Requires kernel commit b44039638 to pass properly")
     def test_reconfigure_with_default(self):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
@@ -568,6 +569,7 @@ class ReconfigureRequestedLines(TestCase):
         self.assertTrue(info.active_low)
         self.assertEqual(info.drive, Drive.OPEN_DRAIN)
 
+    @skipIf(linux_kernel_version < "6.9.8", "Requires kernel commit b44039638 to pass properly")
     def test_reconfigure_missing_offsets(self):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.OUTPUT)
-- 
2.34.1


