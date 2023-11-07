Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5D27E4103
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Nov 2023 14:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbjKGNtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Nov 2023 08:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbjKGNtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Nov 2023 08:49:31 -0500
Received: from mail-wr1-x463.google.com (mail-wr1-x463.google.com [IPv6:2a00:1450:4864:20::463])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8233878
        for <linux-gpio@vger.kernel.org>; Tue,  7 Nov 2023 05:47:23 -0800 (PST)
Received: by mail-wr1-x463.google.com with SMTP id ffacd0b85a97d-32d834ec222so2898856f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Nov 2023 05:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699364842; x=1699969642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Mpl5ro6bpqJv9Ig+eJOuNrA5aYb9lgA2xY9vuT5fPs=;
        b=EmxO77eFP8MjIzZSWh7ytHS8JnWCCSOQeg+g6e3mDrDv9yFDRQaWIwPYSh+eu6875O
         pQerL5fn/kywMwEtkvrgQpO8igO0ynxNZHcwB0vVbB7k8RF9TXXGIYsdDHAZ9+GoOv7y
         a9YemBJNCwrREqTE5+9Pjn8eDbYRIFOELj3z7iyY88uqSgYZ9VGLjgm+3iIDrhIPjIVJ
         NgdgpjzlFVgyQOXlU5ADomqPSu/T1Uw4eBuVLMnps/lusjb0wvPuoFD5kQO6wTOiJUJi
         CrRWcU6/lz+qosFm2Hn9b1qfzWesXB7x375MD3HeH3rbthQcms7Ua1+sdPLN34onpSIK
         NWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699364842; x=1699969642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Mpl5ro6bpqJv9Ig+eJOuNrA5aYb9lgA2xY9vuT5fPs=;
        b=qgjUBwH0miuhzy9fXAlVLVcGsSB7/yKxd5cUrQJv7UhBfkJepCeEvNc2xCjNuRawzV
         3BtOYxfL0Jk8DE5Cu7tABClpjppHkc2Ne2aI2+aKDnz+Tz3x+wJk20wckMTcM8kf9ffx
         fkItxTXQ1D5wxwCljXpVE3zUoi1NdjHK2pCSeNZ7XR60Gc3qr/Wd21nIrz+m7d9xi9tI
         vrk3Sgwmg06vFtFGQP/1zQGCydsFvax9s2qB6FmDhAEBfaudtxKfaTzyhOvLbZ4P4UxA
         n47RF7W8g4RPB7msXaMSBroX1Vx70/e3vcLzI4s6UCWpynZTzyGVhKEEoYn5cEbdDskL
         BT6w==
X-Gm-Message-State: AOJu0Yw/K1YjvHFG22cerHY/Na1cWKQEAX067/z3XocP2rsvO+Yd4fjO
        nFnnYmpQLj1+664VFuJw99C3HXZc1hzWJO3slJa71DqQOD7Hiw==
X-Google-Smtp-Source: AGHT+IG2eCPMN5cGPxI/ExjRYboKjbGkAgFXgY1ppoJbxYrA3uDHMNcX5Cox0issLBE21GRNWyepddAjaNf5
X-Received: by 2002:a5d:4b90:0:b0:32d:9b3d:4f69 with SMTP id b16-20020a5d4b90000000b0032d9b3d4f69mr22709600wrt.64.1699364841535;
        Tue, 07 Nov 2023 05:47:21 -0800 (PST)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id x8-20020a5d4908000000b0032db2e770f1sm66153wrq.66.2023.11.07.05.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 05:47:21 -0800 (PST)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [PATCH 1/2] bindings: python: fix library path for python test builds
Date:   Tue,  7 Nov 2023 13:47:17 +0000
Message-Id: <20231107134718.2913223-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Correct top_srcdir to top_builddir for out of tree builds.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 079ceb1..b2f2779 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -15,7 +15,7 @@ all-local:
 	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
 	$(PYTHON) setup.py build_ext --inplace \
 		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
-		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
+		--library-dirs=$(top_builddir)/lib/.libs/:$(top_builddir)/tests/gpiosim/.libs/
 
 install-exec-local:
 	GPIOD_WITH_TESTS= \
-- 
2.34.1

