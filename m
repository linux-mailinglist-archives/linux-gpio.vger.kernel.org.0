Return-Path: <linux-gpio+bounces-7767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F370091AB49
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 17:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C451C210B9
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F373198E81;
	Thu, 27 Jun 2024 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=melty.land header.i=@melty.land header.b="wSxZo/rT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ilama.link.melty.land (mail.melty.land [45.77.175.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DC219750B
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.77.175.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502283; cv=none; b=ng9XCp6rRVoPd7a3r4hb2QlEOC9Cwy983Zquq7j8j68j4GMa77lkDy3+DHgjpVPstu8RQLI0lYm4XedQyTfawauogpLmAyejFWBMmL8I+7eld04q1do5z7kwSMhbm7hmqeZIUkJagd8Q/J/1PwjGlj0jb+UM1XpDjUop5wrNvbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502283; c=relaxed/simple;
	bh=+lkh4VFfd0iLmwe5Qv7C/ovto4qw4zZXj7sa10shWTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2kcF1i81bSiRTEk94jqZGTF9270KXWxPoVeylucVzOzCpfkz34rM7fc2729eaxt1fUZ8j3HpvcIUddUorB4UOVCFjMnvuJFVrcImBGcjVXUJEhqBG67+Or9kJT7fjGz98skFMYNgWWFUjo2ox1bermlgPjk1Lwy2mliGU+2Uds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=melty.land; spf=pass smtp.mailfrom=melty.land; dkim=pass (1024-bit key) header.d=melty.land header.i=@melty.land header.b=wSxZo/rT; arc=none smtp.client-ip=45.77.175.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=melty.land
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melty.land
Received: from localhost.localdomain (hawthorn.chuang [192.168.174.5])
	by ilama.link.melty.land (Postfix) with ESMTPSA id 38A4F8BAED0;
	Thu, 27 Jun 2024 23:31:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=melty.land; s=default;
	t=1719502268; bh=+lkh4VFfd0iLmwe5Qv7C/ovto4qw4zZXj7sa10shWTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wSxZo/rTHGg9Vv3nI66irNbcBj+/+mwLO35xZmSPKU8DbW9QxOlfC1T45XEWETGji
	 3cbRPixSLObTdD/XpwWCGGYKhzKsKbciKsRpK4s78Ry5ZLFrYt73VEluv57VxDXLDg
	 u5aRFlADHXBz+NjfLpLdO8oLG1sbbmbAar3EUgRY=
From: Chuang Zhu <chuang+git@melty.land>
To: linux-gpio@vger.kernel.org
Cc: Chuang Zhu <git@chuang.cz>
Subject: [libgpiod][PATCH v2 2/2] bindings: python: fix line request by name with multiple entries
Date: Thu, 27 Jun 2024 23:31:03 +0800
Message-ID: <20240627153103.594107-2-chuang+git@melty.land>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240627153103.594107-1-chuang+git@melty.land>
References: <20240627153103.594107-1-chuang+git@melty.land>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuang Zhu <git@chuang.cz>

When multiple entries are requested using line names in
Chip.request_lines, only the the last entry is added to
LineRequest._name_map, causing a ValueError when trying to use functions
like LineRequest.set_value on any former entries.

This patch fixes that by moving the required variables to the correct
scope.

Signed-off-by: Chuang Zhu <git@chuang.cz>
---
 bindings/python/gpiod/chip.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 19c62cd..55f0c3e 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -279,11 +279,12 @@ class Chip:
         else:
             mapped_output_values = None
 
+        name_map = dict()
+        offset_map = dict()
+        global_output_values = list()
+
         for lines, settings in config.items():
             offsets = list()
-            name_map = dict()
-            offset_map = dict()
-            global_output_values = list()
 
             if isinstance(lines, int) or isinstance(lines, str):
                 lines = (lines,)
-- 
2.44.0


