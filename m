Return-Path: <linux-gpio+bounces-6623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F19AE8CF419
	for <lists+linux-gpio@lfdr.de>; Sun, 26 May 2024 13:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A651F215F4
	for <lists+linux-gpio@lfdr.de>; Sun, 26 May 2024 11:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183A38F40;
	Sun, 26 May 2024 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKqMTuHQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC72CA5
	for <linux-gpio@vger.kernel.org>; Sun, 26 May 2024 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716723195; cv=none; b=dglhe5H5qfIAcK4HKbn9gDmkXmb7QO3PzhQ1Kg8xr7wJhAlmJDOrOSbp9rvrEajjfdiSxZQ/UjCDuVsavWfZBjlEbvkSr+i06CU59bZvVnDn0ZKYoi8sjqT0HWjPJFU1Hv9NYLc88j4AsrFG0da8OojUCdHBa+cA0SPEuPlXBUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716723195; c=relaxed/simple;
	bh=MNroRjEAgotdjW5Gakxj2ytKgpN2wphJ6fqWDZu0CRU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RSr+2dPqapyMyXqZy17JBhY/KpbJZjWdmU4HcUDP6xxbE2x1TpLN+mZXGAsfnwcO+FvEAmB10aFkmMCsOvjSZzVH/lhYFGDJAY4RUOMkZszHTff+u8Q8JoocuCnjjUPmXJQATJUeE+ocACvlSRX3CgpcC4SMcAmhU4sVZCnRuVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKqMTuHQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f4ed9dc7beso3345863b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 26 May 2024 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716723194; x=1717327994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4TwlfiviwYhLBWmrv6Z99RbSj4Os4S4sMpBj6e0Zvs=;
        b=TKqMTuHQeyxejC2eaCI2bbNAPm1n/rk1bSbzERG1mSsMlN0wXRS8xqCeGt2P9Xa2bw
         RgaroVEZEhR8hbQZAFESdfQNLfU+eVMsxFbo4gvE4GwLy71gMOPIClToK0kDWkqky/7A
         34FnhLB+wWzsRlhLpGrnUUr1QT3xIDpyY89/QKni9RCCejTcX4A7Zi2KGPPT8+xOsa8t
         SwDfGzRUTeBppJaLiwaOMAH6/H8g5sSuhWp2h/G6mQLHJe+w2RwkzCgkJmWw88N2XZ/D
         +5A3lkgk6bNYUZiJr77Pe429GH77MGEY62IcA+B4VBiCb43cTglBnISH9mD5dsd53uRh
         BZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716723194; x=1717327994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4TwlfiviwYhLBWmrv6Z99RbSj4Os4S4sMpBj6e0Zvs=;
        b=Q+uUDXuCmSG5JjZFUSHPcvTJZVbehdG3fID1gulyfwokmqKRg+3zaAGWidDhLMm3zt
         TCGjdunboE6L5q4EN2lwYmoXwZB0axcoGA11HaoLCOWFZe9Z/xQSvqy/VZ7KU3x/4Qlt
         +0bz0++0Vux4gHlwGcZdcccDFA3tG3OBsTFQIkUJ/NUY8n2NkmsRCYka9kcUXcDvcNAF
         DRc7qPfup7PitS0xz2Sx3L2FzhFkQbM5yNdKbuJhxcgd1UkxHQPjnL2MO+OeP9LHHFuM
         Aj5HftWFK3KKyTIGVCRlYvohz8/rh8rVetAkAMslKYAVcdiGfpXHu8gR2ytXavxQ8cKJ
         bj2Q==
X-Gm-Message-State: AOJu0YzEG5LKS22r+tPbg2L3vfuegHGTySdPNhnrVzaljCNZwxYIFs6n
	n/5EkbU50cCv+YZV+79Wok2Ry/jHWPET7jOi/D8tft/ES3QApVxqLPmM1g==
X-Google-Smtp-Source: AGHT+IF3r6TOeQ5qHDzuxg8vUdFw7FeGPEcQ89CksJhjJA8yDub/AFRmxrimE9FhriaNpGnEu+5rsw==
X-Received: by 2002:a05:6a00:2988:b0:6f3:ee23:3c39 with SMTP id d2e1a72fcca58-6f8e955aabfmr8261773b3a.7.1716723193609;
        Sun, 26 May 2024 04:33:13 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6fd94372addsm1793646b3a.186.2024.05.26.04.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 04:33:13 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/2] bindings: python: fix python-tests-run make target
Date: Sun, 26 May 2024 19:32:34 +0800
Message-Id: <20240526113234.253859-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240526113234.253859-1-warthog618@gmail.com>
References: <20240526113234.253859-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The python-tests-run target is broken as it does not correctly split
lines.  It also calls Python directly rather then through the $PYTHON
variable.

Fix the line splitting and call Python using the $PYTHON variable.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/Makefile.am | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 65964c7..c14a6d4 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -13,10 +13,10 @@ python-tests:
 	$(PYTHON) build_tests.py
 
 python-tests-run:
-	PYTHONPATH=$(abs_top_srcdir)/bindings/python
+	PYTHONPATH=$(abs_top_srcdir)/bindings/python \
 	LD_LIBRARY_PATH=$(abs_top_builddir)/lib/.libs/:\
-		$(abs_top_builddir)/tests/gpiosim/.libs/ \
-	python3 -B -m tests
+	$(abs_top_builddir)/tests/gpiosim/.libs/ \
+	$(PYTHON) -B -m tests
 
 else
 
-- 
2.39.2


