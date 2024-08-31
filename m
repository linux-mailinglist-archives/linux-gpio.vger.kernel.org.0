Return-Path: <linux-gpio+bounces-9489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292196701A
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 09:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E31442844F3
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 07:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4C816A94F;
	Sat, 31 Aug 2024 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZbJHCVL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2DF763F8
	for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725089510; cv=none; b=rvcUIm60/dS5LHxpBW3hi81GxOocJLQOI/VsKCccIQmzlrVieQ2ysMnd4aFo8JbbKtNDiv/Ub2RSDK5fhYT0xRaGRToXzs+ffB28guJPSYWrGrZEDlCQHG5v0ku4ClIUEdg7piUFisxvXLdSniSjkuBtht1WVTvrou45C64rwjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725089510; c=relaxed/simple;
	bh=Ud7u2nYt3rwr5eMqc5apXHQ63G5SVgbjHCTHf2d5Nuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BugxWLZGZzwXWgvVpnCT2XuUNLR8ggnbefTG1FskNGK2Vin7kjwiF/Nr0PGdL4BLGcxT2j3qHw9fXdqaEGpwwUHOLSXGfgjZq/7mv16XDWH4M98393pcefcUR8n4GTJFSzg5THoXNv9/m+vKcpA7O6vQ5IyIRF8z1fNijkUpOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZbJHCVL; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7bcf8077742so1799140a12.0
        for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725089508; x=1725694308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkuD53cKq91e8to2XISIW6P6L1kNvcwBliuldKXKc6M=;
        b=ZZbJHCVLsLayV+KoyrwK2hc/nCVAnWno3PqC6ybCvCd4+KvpizrQGY/gDv9LR3RDYs
         Abfx4ewCV4PobvIGjbXxwtF21nrCSQA9nKUeowIOGZQC+IAtElQqIQjRIs6I7PlwtqY2
         H8QIZDRwJgDTJi/v6pFJgSsm75E46uCrYe5bKZSIkoYn1IvQ3rAd44i7zTnoYZPugjD5
         GV/Emvjk0rMA2x80XgJDhLwSl7wcAPAZSj8+GzoC8rDyapuXI7iOux8yfwnxB1NLfj62
         e1pKtz0+yemzCW89htgNjtloMngmjIvVsa1AOP9BFYidl9zURoPKJAQMIQRxA+952Qq5
         LChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725089508; x=1725694308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkuD53cKq91e8to2XISIW6P6L1kNvcwBliuldKXKc6M=;
        b=rwKo7IqR+oeg2WGYRwgdKR3WjeVmVEoIKhVHb+mkIhUWtL5mYfvOJ3ppHig5H0c19Q
         qN7ksIo4T5fpfK2kqYiS+JrzCr0TvOibI2mW488IWuUQ6H520NJasFvw7BrrdS0V8HMW
         i1fgXbuYIx1wCZeuXPQNf8KZloOoRmeOg2Djpm8vUYJlMoOGlK3L4TlqXrKlXv+LGkQq
         9TgrXg7Skl22ZfekSD33a8YtJu5p/dTz2p3j1/gekUt1krIFHRZ3tYR0IJbT7lrpICHi
         a6rJLinJ6553JimwgQQzufKHsO74F5edPNRlG4yTuE/OE+wqE9DS5Yb3hi8mUsngKc4V
         Gm2Q==
X-Gm-Message-State: AOJu0Yx+4jQxe2XcUprjE0zJ2rJ6+aaVYxwpXY4nH2ne0PANkFpZ41Ev
	C4wPJjI1LqRjXZOLmKtFssp9IKHTYmzyR1+hELAc9MYzeDwFzsPIEsopuw==
X-Google-Smtp-Source: AGHT+IGBnkd4FsbJM1Aq3KmEZRjC/TrYVPN0/voyXpINwBZufel1Q9XHRMo7SUBg+bb4cS6C9EwQ7Q==
X-Received: by 2002:a05:6a20:9f09:b0:1ca:2789:c3ad with SMTP id adf61e73a8af0-1cce1003843mr8700665637.4.1725089508385;
        Sat, 31 Aug 2024 00:31:48 -0700 (PDT)
Received: from rigel.home.arpa ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515537c6asm36352975ad.179.2024.08.31.00.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 00:31:47 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] build: fix HAS_GI_DOCGEN never defined error
Date: Sat, 31 Aug 2024 15:31:39 +0800
Message-Id: <20240831073139.145526-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building without --enable-bindings-glib configure reports this error:

  ...
  checking for help2man... true
  checking that generated files are newer than configure... done
  configure: error: conditional "HAS_GI_DOCGEN" was never defined.
  Usually this means the macro was only invoked conditionally.
  make: *** [Makefile:440: config.status] Error 1

Move the initialization of HAS_GI_DOCGEN outside the conditional
with_bindings_glib section so it is always initialized.

Fixes: e090088c21b7 ("bindings: add GLib bindings")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index cbe9e13..1ac1002 100644
--- a/configure.ac
+++ b/configure.ac
@@ -267,12 +267,12 @@ then
 		AC_MSG_ERROR([glib-mkenums not found - needed to build GLib bindings]))
 
 	AC_CHECK_PROG([has_gi_docgen], [gi-docgen], [true], [false])
-	AM_CONDITIONAL([HAS_GI_DOCGEN], [test "x$has_gi_docgen" = xtrue])
 	if test "x$has_gi_docgen" = xfalse
 	then
 		AC_MSG_NOTICE([gi-docgen not found - GLib documentation cannot be generated])
 	fi
 fi
+AM_CONDITIONAL([HAS_GI_DOCGEN], [test "x$has_gi_docgen" = xtrue])
 
 # GObject-introspection
 found_introspection=no
-- 
2.39.2


