Return-Path: <linux-gpio+bounces-26938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655B7BC9329
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A433AFF33
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFAF2E6CB3;
	Thu,  9 Oct 2025 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ST36b5pk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A3E2E2F13
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015145; cv=none; b=r0p3I4dt5oAxrHMM7iGEeHB+BVBQ5OKqFRmU4p4GyhNAxxiYICcGUXXF7TRAmFTX8BJbwKCRaYTUiPc8olQG/3upFRN/8y1+1cEwfvJPJna01eL3KwXmVnSueY3hwgzYDP+YQavPY0o9kPRhN2PUi5bvGXxzH6yKoW0cFkrSDE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015145; c=relaxed/simple;
	bh=oWe02YK/08pzbyo4cTXCLFhY5RfDiv4oi+3VI+f5x3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qpwm+R/WJVzDzA92oBs3L8yo40AS8PDcDbk32tuEEyxJcRs5B6IngDmU5C5abiBZz0tsU0Uk8vO3zqSoehUl8zrTLL2WolFgVOUriIbt6xv7/aUuKAOe1nEvWjjX984lgLJFKyAYOkJqn4vfgXUlRtCxpHKRrauh6C7bJsvXIeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ST36b5pk; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-425911e5661so3460115ab.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015143; x=1760619943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANc6gR5jI7mX3fNCIaNhv3vV533lnniHiwuEIm6qmhw=;
        b=ST36b5pkGZMPhpquRp9/HP1fi0CKGBnLRrEGRXx+aKlKD6BsapnjAfaqCHjWn/dm/E
         tt7zx0ridjFzCvybFRiaxnu0n/mQlhKw6YKRliSSh1sQ0OH37X71i8mjQ1+3iwFOIZ/s
         fl5awc4L9PiVLnHZ5ZUZy1BEeUd5/KgjicAus/e/xlxDGS57wZ8rH+bVqsAk78d3vEm8
         t8BDS+OdgHguMCvD4V0KCjqTwc7G3GOdqrmbyP6mjMb8SOvizN+uA1NSa6qWkQ3FR3+3
         vWuZvug7JbU0SfgZ23LJs1uTpbfuN4XJNf0rVXy1+TJ82l2rLgS8RlW5RihvHW+2DMGu
         f5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015143; x=1760619943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANc6gR5jI7mX3fNCIaNhv3vV533lnniHiwuEIm6qmhw=;
        b=DOu1rQZA9c1GMbgqTMslscFxGv73nSJAssb7sKNxpevHAXWNY3Lo4OeSl2iq6zKyCN
         FbGIQtLJW+y3fpCA9M+rKO3U2g1QlWsKjKC+RtZuV/dEBcT8i4KHARtQe88dgdQAQ3hB
         nBmH+TeMxIdxg7m/t9sE7R/vq4gzQpLntlDEujvh4Se1JzDH3Qg64bgINyuTLKdlbFyY
         LSaohfAoJa8lARHEdwEuk7lsEYw8zT0yWAxLldG68PEyHZ4sRK7QXgFXrUVM6lOUmqg5
         k5ppjoJlhurkYx0HqrKw9f53hvc1LsCdOQ/aUkRRhRV2dZLgjgkMdJUa5ajUmUo6KhW4
         MuQw==
X-Gm-Message-State: AOJu0YxzgE4byWRkJ7X6WOApTPBveQ0ZdivWYiSH2cBkWVd1s2FNdEeS
	lSfXbxdHLEV+AC02JZqky7cM+EhlLCRD6veO5wQsdh/pJELpyzW+SaFHiYyLPoaL
X-Gm-Gg: ASbGncsBfs1wXhWo5jmqWMswfq8k/X66h2l6ATPs5baJiDs82yFp2B3+svIwxzgT3Kc
	mxNIY21Oqcc/VutoKiWGCNPf1MfBbtF6uAyxEHF9zP1M8WKh9JJQTPt77GUDeqdv13KWcaqfH5h
	ykcUBvC9sCVBVi+Npscd4EgnhJsIvfDiPSMvrTTGEycMG8SxnUGFAfSYCUvq/r6ysYVE+VpM+3J
	t4ocBBNXezXxfAht4zpifOspyHpHBIF8o8jSDDJWKg8iT2Fhzkg1Rzz8iHYvTwS2SpwXskkx8na
	a4MQ6IBr35IHvhTzgwIfuI4Z/Yhse0qH+tRA/N7yf8lFOxOZCECrbqXg2/ay5DDBaHJwQTuBqsl
	k0kugkm2FPzbGeqnnh9/wFG4g1+gROJnJR55KHTT2EhbYVslzyZsDZZUpXy23Cw==
X-Google-Smtp-Source: AGHT+IEnUYP5ZgHdxwba+TFyJaOAzmBzZmYqQQEQ274qUxF699jSG7uqKQguyWexTUD0ToRBg4h2Rw==
X-Received: by 2002:a05:6e02:b24:b0:42e:d74:7252 with SMTP id e9e14a558f8ab-42f8740e748mr64862475ab.31.1760015142425;
        Thu, 09 Oct 2025 06:05:42 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:41 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 5/9] bindings: python: chip: check mapped_output_values membership once
Date: Thu,  9 Oct 2025 08:05:11 -0500
Message-ID: <20251009130516.3729433-6-vfazio@gmail.com>
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

Simplify looking up mapped output values by providing a default value to
dict.get instead of checking for membership in the dict and then
fetching the value subsequently.

While hashing and lookup is fast, it's unnecessary overhead.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 1f4a9bd..2e66018 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -269,13 +269,12 @@ class Chip:
         line_cfg = _ext.LineConfig()
 
         # If we have global output values - map line names to offsets
+        mapped_output_values = None
         if output_values:
             mapped_output_values = {
                 self.line_offset_from_id(line): value
                 for line, value in output_values.items()
             }
-        else:
-            mapped_output_values = None
 
         name_map = dict()
         requested_lines = list()
@@ -299,9 +298,7 @@ class Chip:
             # list for later.
             if mapped_output_values:
                 global_output_values.append(
-                    mapped_output_values[offset]
-                    if offset in mapped_output_values
-                    else Value.INACTIVE
+                    mapped_output_values.get(offset, Value.INACTIVE)
                 )
 
             if isinstance(line, str):
-- 
2.43.0


