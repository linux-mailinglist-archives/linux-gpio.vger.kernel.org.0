Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5270210198
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 03:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgGABje (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 21:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgGABjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 21:39:33 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4760EC061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 18:39:32 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 207so10063504pfu.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 18:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQ5jIovH0f3E5gni4PyQrUkPRk6UAn+p1+D9cwFBEf4=;
        b=tsOz7TpDPFA9fBYeqnjmoMGmYmTri4S/VgDfBN5mDkDDhmGEzE/zqmiQw4fpadVmau
         JDD0QjhGT1qDVGBMls2DqBTHCUNs3iBk1KFMdo8FjU6JyKEiNjqTjdlVFpTp0w1HjUT9
         ActBCUj+7XQm7I1AeIGNCvoSQj3Ahag/YGyZJOC40w5W9983OZUJOvyHy382qN/nN4U3
         Tzn9MSxA5fFghwHRxghNxuhiwRhalXLChyMhD/4GLHSEGQUnLMtx8aplPQbK+/IXpB/p
         62ZeJ7OGQ7I1J+5B9fbaXDasR7f9z6lUWPJ4SCHoa5ZbgG0tfKOM2jAaG1gz0iYc8SJR
         A9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQ5jIovH0f3E5gni4PyQrUkPRk6UAn+p1+D9cwFBEf4=;
        b=Db3DVujU14KFBGuuVCEK6e2YFvKbH7x63IlvFYYASDF5n96E3qrJpabeEvl8WphQDz
         ENzuRUqL45Ud1cxtVznKQLIYXGQpN/Hk6jvPUBeba9t0QmhbbDxSCH/YZ2Xf03ewGk26
         j0WSaY5KgT9AegL6E/03oIzMe5kutSVwYbmKswihNY2D1nmoDo0qk7QbvB+10jeJOjV/
         lv9tRbidBpPNfyXW4Mm49ED+MvFEXC0Oj8G2Xi10A7IugUqmxGm2fo8ynU3Ur/QZQU5p
         rXKgMuSRhlaoeT5yx3Trg+STSYYca6e63P6/BO+BbU26IQQfD5BAU5w7CE/vyLBx0I4b
         UIgg==
X-Gm-Message-State: AOAM5336tvr+kQ6pCEqADXSTFmMvXSUdO4DGhlVH4SnZn/v4ZAuTfkSJ
        4qJp5OMWZ7BB6zkkagehrxrZmv00
X-Google-Smtp-Source: ABdhPJz47AWnn7C8jem0o/hYU2bQ6ywC97DH6DlVETyzRjnGoNT53B/IBKk04eFDlNuWe1P34bL25Q==
X-Received: by 2002:a62:8096:: with SMTP id j144mr22211926pfd.78.1593567571142;
        Tue, 30 Jun 2020 18:39:31 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id 25sm3784787pfi.7.2020.06.30.18.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 18:39:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] bindings: cxx: fix sign-compare compile warnings in tests
Date:   Wed,  1 Jul 2020 09:39:08 +0800
Message-Id: <20200701013908.42359-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix sign-compare compile warnings in cxx tests.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Just noticed these warnings while rebuilding in a fresh build environment.
Not sure if they were triggered by an enviromental change, or if I just
wasn't paying enough attention before, but either way this patch makes
the compiler happier.

 bindings/cxx/tests/tests-iter.cpp | 2 +-
 bindings/cxx/tests/tests-line.cpp | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/cxx/tests/tests-iter.cpp b/bindings/cxx/tests/tests-iter.cpp
index fdc2cb5..4c07613 100644
--- a/bindings/cxx/tests/tests-iter.cpp
+++ b/bindings/cxx/tests/tests-iter.cpp
@@ -53,7 +53,7 @@ TEST_CASE("Line iterator works", "[iter][line]")
 {
 	mockup::probe_guard mockup_chips({ 4 });
 	::gpiod::chip chip(mockup::instance().chip_name(0));
-	int count = 0;
+	unsigned int count = 0;
 
 	for (auto& it: ::gpiod::line_iter(chip))
 		REQUIRE(it.offset() == count++);
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 5353093..e2e4cbc 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -210,7 +210,7 @@ TEST_CASE("Line bulk object works correctly", "[line][bulk]")
 	SECTION("bulk iterator works")
 	{
 		auto lines = chip.get_all_lines();
-		int count = 0;
+		unsigned int count = 0;
 
 		for (auto& it: lines)
 			REQUIRE(it.offset() == count++);

base-commit: b56d6b6a452e47fee8c70514afb99ccd77ada677
-- 
2.27.0

