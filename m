Return-Path: <linux-gpio+bounces-26939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD0BC932C
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1AB73A1C53
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312BF2E7182;
	Thu,  9 Oct 2025 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSA97B44"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617D52E6CD4
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015146; cv=none; b=LT2aYZ1CyLdZ71t4Rcjawl8CUn8JWp+ccSowR3DvMIpouJbDMUPZ7iWwSYw0Ju1qTwh1qFPOnBw0/W7gzQ1BJMwAlO9MCvLeEAKgGblZgxvmwNBBQrOwXXkCiG7DBOS6bWVNtUNK9C7V+wnZFf7vPzFbmvR4PpppYUhEHndM/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015146; c=relaxed/simple;
	bh=5HjPqta6TKF7mQu4/3Mz/6CdX3vM2rwOprp+ht0QMKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IH5qmym4zyzr3c4YJuhhFSPSaOiTb1p0z5mEq17qHjz6SUBLFu4Utxlmhv4msTVjwg/uN0PevEatiSh4Qw7ppyEhJ2mp7tmMHMNiSZzDBQ9Krn00vZcjQYDiT9UMoUtfBZGp47gN3t+i0/X3GO3j/+oJuMKpgXmGauxiFCR39V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSA97B44; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-93bccd4901aso94193139f.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015143; x=1760619943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Csxm3O/IBAWNoG+uWVHpaABVxVngKlIBHxbhBCrVHO8=;
        b=YSA97B440GQHDM5MGzlJslZGYDGbozvLPyxsAWBOu0631wsj3pW30vuNC4ynvJjzWx
         Aj3hl0aoQhkDyH1/zb3oBecLW/lfMbNdSmV+iuAbUebEtyScj4lmg3n2h0StXhnfJuva
         VH1jEafGzqHfZ5CBbQAk0/YuopbO0NoQ+DRW8Vsk4gqXWUFeeHKiDPy7jbDTtHIrZQhL
         Up4bzdhRk47Dv+LvGKWqZlMTEig6xa/d/5uqEwe2m2/h6H2ulYQ0ju54/brofP3CgVoC
         9ZvVetf0ueReOTgv4XixNJ9GA+PIupPme/7XGElNS1mtrPlZOtHmiODSKcLvvobpHrYH
         ut/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015143; x=1760619943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Csxm3O/IBAWNoG+uWVHpaABVxVngKlIBHxbhBCrVHO8=;
        b=AjgZ3GD7H7PJ5zhic42sApMqlYKZxpA4xaglRFLj2BiDgl88cseUtEj98eKd9jK5/f
         amMvkHOCNzfqvN89u6Ulp7C1wjRDaIOYZb/fdYMVjMF1xHPs4CfwzFU9H2/r0ptKAV/t
         3CfgDmEjARemO5iZg4v5g4olAzipVaHPOClU9Mj/vXUbBtidRvDPydKTCmmu4nOJfK4s
         m7IsQ6Taubu8kZwRe0sdd0lxfq1N3NRRK93RxrxIKR+yL1VZR46yA5gYOq/kttYs/zWL
         LFeQeIJCGBD1bFeAtxYftWsHnQCY38fr6KAsJd9aYIphz5A5i1NyUgn7HKLfoEzjIoEp
         jEkw==
X-Gm-Message-State: AOJu0YyH9lLEpo3lP8fo5IdUgv5jE3Mitw9W7m3hufb7wfQwA0dTX7nT
	gXvBeldC1fossCNz/P7Tp9Gn6SPiwWUq55ngD73+++ZOus6Rm7FLg1HLUHU5qRpu
X-Gm-Gg: ASbGncv9wSZd6A+nx+eWfgNL04l5abVdSCoC0JtybqFCGLDgSwNDC2xHqSnKKaO1AA2
	bNAPn4lP+OKRqSSIDCnjsuOUxrdpprdXyKR9v/AV+eFQ2Nh/rxuaRo5jrXIgCAnJl5kvLDtdyVw
	PFwQNGiUbqTBvgqeVKq0Q0QEGMcBXhcE/a5QpZaBnmfeqbPcjC0UjLz9uRmnD56UvWXlBKoXGKK
	eEpzt7NeEfVGsnuqOSHjOIm2f5DSfIcPvtMwHi2mAJM/sFuYf4r15jEwBBmtd5IACFuMNQF3QAr
	3N2rvcxnhEQjASLiq6b2Ms8g1zPvG5KV7jcGL4KoZ1d+yzTXLG9SxDMu9e3rEf7D64mDlGH/yMb
	YlQBnb8fIoo7/yQnyGyFqEhu/qqM1t8iLt4A4k1OziTUWdwyk0f8=
X-Google-Smtp-Source: AGHT+IEr9U6tDPvbUgqUsGqSN36Qh1drY74o0xMgqnbqaFX9Hi8TV41+f52kA+stRQUm7gFqg95kJw==
X-Received: by 2002:a05:6e02:b24:b0:42f:8b0f:bad2 with SMTP id e9e14a558f8ab-42f8b0fbfdemr66578475ab.10.1760015143052;
        Thu, 09 Oct 2025 06:05:43 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:42 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 6/9] bindings: python: line_request: ignore invalid line names in reconfigure_lines
Date: Thu,  9 Oct 2025 08:05:12 -0500
Message-ID: <20251009130516.3729433-7-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009130516.3729433-1-vfazio@gmail.com>
References: <20251009130516.3729433-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, calling `reconfigure_lines` with line identifiers that were
not included in the original request produced different behaviors
depending on the identifier type.

If the identifier was an integer, it would be silently ignored.

If the identifier was a string, it would raise a `ValueError`.

To be consistent, invalid line names are now silently ignored.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/line_request.py       | 19 +++++++++++--------
 bindings/python/tests/tests_line_request.py | 13 +++++++++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index c0798b5..629df3c 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -94,12 +94,9 @@ class LineRequest:
     def _line_to_offset(self, line: Union[int, str]) -> int:
         if isinstance(line, int):
             return line
-        else:
-            _line: Union[int, None]
-            if (_line := self._name_map.get(line)) is None:
-                raise ValueError(f"unknown line name: {line}")
-            else:
-                return _line
+        if (_line := self._name_map.get(line)) is None:
+            raise ValueError(f"unknown line name: {line}")
+        return _line
 
     def get_values(
         self, lines: Optional[Iterable[Union[int, str]]] = None
@@ -174,8 +171,14 @@ class LineRequest:
         line_settings = {}
 
         for line, settings in config_iter(config):
-            offset = self._line_to_offset(line)
-            line_settings[offset] = settings
+            try:
+                offset = self._line_to_offset(line)
+                line_settings[offset] = settings
+            except ValueError:
+                # _line_to_offset will raise a ValueError when it encounters
+                # an unrecognized line name. Ignore these like we do offsets
+                # that were not in the original request.
+                pass
 
         for offset in self.offsets:
             settings = line_settings.get(offset) or LineSettings()
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index 217c299..66e9e8d 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -596,6 +596,19 @@ class ReconfigureRequestedLines(TestCase):
         info = self.chip.get_line_info(2)
         self.assertEqual(info.direction, Direction.INPUT)
 
+    def test_reconfigure_extra_names(self) -> None:
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines(
+            {
+                (0, 2, "foo", "baz", "buzz"): gpiod.LineSettings(
+                    direction=Direction.INPUT
+                )
+            }
+        )
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.INPUT)
+
 
 class ReleasedLineRequestCannotBeUsed(TestCase):
     def test_using_released_line_request(self) -> None:
-- 
2.43.0


