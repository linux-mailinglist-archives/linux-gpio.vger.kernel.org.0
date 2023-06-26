Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02A2C73E04A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 15:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjFZNPF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 09:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjFZNPD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 09:15:03 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E38125
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 06:15:01 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d97ba7c01so1472573a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 06:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687785300; x=1690377300;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZ/nYSjhAIx7eDJsJE/NJfsOMm4o2Hx7txIXTqM8ZHw=;
        b=KvBWreqvT/7PBFnUpUYu829k+ex6b60Zia4DIM9OFtIJkqf3601buNIalObnGlhNC2
         jYClbQWvt+nF7tAZ3dA6A6isVK6V1zgTtrIAWyUbYHcJ9XhDj0PLLQ7XQMBoFo+KskZo
         0hVdCGovQXLkStf3Lb+hKmLUYE8f6g0Vim0Jj0jJjMUYh1eUgC7+ZhlFYS61S5rKJKWl
         GvF4XNsQLGNNoZMklQA3RscL+5i56GsX5IPAI5kUtCCDEVmSnv9pVhRNxBv4bqzUcXLZ
         B0waefPXcMOdmdKgOBYvSKqbili5yLWRsdxZ/TZYJw/rOL1eYb4oNGK5cn+J8IfAbxim
         Yv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687785300; x=1690377300;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZ/nYSjhAIx7eDJsJE/NJfsOMm4o2Hx7txIXTqM8ZHw=;
        b=i3gsOPNltwSg1VGTCiWWaDx4akA5QnrWsSTQefbZ8sHP1ycrGRXwvOzSu44Hb3DxY4
         piNxawiV+M674EjpQ4o7g3QKCeRNu7vHw/dDDTMwgw4X8Hh5DDVaO8SiKsC6h+x+jt4P
         8lPltOseGZ2A53typlPqt5BqrImJKzAV7cMgAEuUxTEOjCAWfnfuwPLTt0my+X66ZufI
         wSa1w10UT3sYbVe/TS8/aNEB01Q92C7CF3mJJhnfrczbk5/jEqjvBP2amh1h8U58LZ6/
         nHLRX1w3LCo6ASCGDDmtsWe/Zp+Kk4ZNYd4REAfnguMYuWUYyCEcuQwDhiseyILD2HE9
         7Xjw==
X-Gm-Message-State: AC+VfDynFQq3NlbPdwIGrrO6zIWJEnpHTcnboMdMfpgRb3j8+wpno47+
        Bz53bFjuGDj4DFdkeAPmPvpyyvqp4AMTNpIJud4=
X-Google-Smtp-Source: ACHHUZ6vexJMabPahuhAjKIE6EIGQKhZ5J4h36mSU/4SCJRpV1D2we5s20O/Cbo7vXMtfo+/TOItBw==
X-Received: by 2002:a17:907:3187:b0:96f:c0b0:f137 with SMTP id xe7-20020a170907318700b0096fc0b0f137mr24364241ejb.16.1687785299922;
        Mon, 26 Jun 2023 06:14:59 -0700 (PDT)
Received: from [192.168.1.127] (i5C7408B6.versanet.de. [92.116.8.182])
        by smtp.gmail.com with ESMTPSA id bu24-20020a170906a15800b00991faf3810esm44554ejb.146.2023.06.26.06.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:14:59 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Mon, 26 Jun 2023 15:14:29 +0200
Subject: [PATCH libgpiod] gpiosim: fix data race that corrupts heap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230626-datarace-v1-1-b78e2abb493b@linaro.org>
X-B4-Tracking: v=1; b=H4sIADSPmWQC/x3MQQqAIBBG4avErBNKQairRItJ/2ogNDQiCO+et
 Pzg8V7KSIJMY/NSwi1ZYqjo24bczmGDEl9NutOms9oqzxcndlCwGsPiVjYA1fxMWOX5VxMdsmy
 nRE9zKR+a3NwxZAAAAA==
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Erik Schilling <erik.schilling@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687785299; l=3077;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=72Fx2doLn4O84T6vo7tferUFTleG7xRoc2Au33RSdqw=;
 b=jPzCxQzQvtZTpXNHhq+V+X1oEv1Fg/u7Ar3z+TGceUbjBASRCzG6d+MNYUbYGmUM+2TS4uSgE
 TBrT1XnRKPjCzL1gO0aE1wL/77biOF2dmV2y+z7Z/Fm31UMiSulvZ7L
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hit this while seeing some heap corruptions when running cargo test on
the Rust bindings.

Took a bit to track down since I first used address sanitizers, but with
the thread sanitizer it becomes obvious immediately (output simplified):

    ==================
    WARNING: ThreadSanitizer: data race (pid=288119)
      Write of size 8 at 0x0000018f1e78 by thread T6:
        #0 id_free /libgpiod/tests/gpiosim/gpiosim.c:141:17
        #1 dev_release /libgpiod/tests/gpiosim/gpiosim.c:600:2
        #2 refcount_dec /libgpiod/tests/gpiosim/gpiosim.c:176:3
        #3 gpiosim_dev_unref /libgpiod/tests/gpiosim/gpiosim.c:671:2
        #4 bank_release /libgpiod/tests/gpiosim/gpiosim.c:873:2
        #5 refcount_dec /libgpiod/tests/gpiosim/gpiosim.c:176:3
        #6 gpiosim_bank_unref /libgpiod/tests/gpiosim/gpiosim.c:941:2
        [...]

      Previous write of size 8 at 0x0000018f1e78 by thread T1:
        #0 id_free /libgpiod/tests/gpiosim/gpiosim.c:141:17
        #1 bank_release /libgpiod/tests/gpiosim/gpiosim.c:878:2
        #2 refcount_dec /libgpiod/tests/gpiosim/gpiosim.c:176:3
        #3 gpiosim_bank_unref /libgpiod/tests/gpiosim/gpiosim.c:941:2
        [...]

      Location is global 'id_del_ctx' of size 16 at 0x0000018f1e70

      Thread T6 'chip::verify::f' (tid=288126, running) created by main thread at:
        #7 test::run_tests::hd53a07a011bd771f /.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/test/src/lib.rs:407:21
        [...]

      Thread T1 'chip::open::gpi' (tid=288121, finished) created by main thread at:
        #7 test::run_tests::hd53a07a011bd771f /.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/test/src/lib.rs:407:21
        [...]

    SUMMARY: ThreadSanitizer: data race /libgpiod/tests/gpiosim/gpiosim.c:141:17 in id_free
    ==================

This eventually can either lead to leaks or double free's that corrupt
the heap and lead to crashes.

The issue got introduced when a previously local variable that did not
require protection was turned into a global variable.

Fixes: 5e111df2fca56d57193a1825e45e78dd8b76c0f1
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim/gpiosim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index b49a61a..fca6b7f 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -137,11 +137,11 @@ static int id_alloc(void)
 
 static void id_free(int id)
 {
+	pthread_mutex_lock(&id_lock);
+
 	id_del_ctx.id = id;
 	id_del_ctx.idp = NULL;
 
-	pthread_mutex_lock(&id_lock);
-
 	twalk(id_root, id_del);
 	if (id_del_ctx.idp) {
 		tdelete(id_del_ctx.idp, &id_root, id_compare);

---
base-commit: d04639ddd11ed7d02c630e693bf07d97f53e17d3
change-id: 20230626-datarace-e62e9bcfa3ee

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

