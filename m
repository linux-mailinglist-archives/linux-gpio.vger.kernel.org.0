Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7984770A4D3
	for <lists+linux-gpio@lfdr.de>; Sat, 20 May 2023 05:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjETDMQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 23:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjETDMM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 23:12:12 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F41E4D
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 20:12:04 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ae851f2a7dso9002695ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 20:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684552323; x=1687144323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipc/fH1HtTc9iVCyYaRzRttwn/c7QEusN/EaZt1y0z0=;
        b=F+yPQxObAL4/HBM7OoLXf6mnzbRostg1s1j4V2RgvkWndyl22RYJnsDftwT2UwZ1Lg
         lc3Z+xatrsf9ElJ9XqAPnd0UhHB0NUsyholaC8/UiEtpsZAJ25qiI7i0sWouleTX9TfU
         h6YIz9NSQrZhZ6C28wO0nV4U3W0NIbrK85hAm5YxbeXyWBdY4+bZNJpLJSxds9uePqqJ
         0/sX8r2ilxiAZQ54k+6Tisrn6Bag6d0C86TCFV+F+IGp+IX1tBrC9JuvQ6G3nm70OkZ8
         ESRF+fAYawYbC9yUP39oUHW3kye3gV5Wet3B/CEuehmSt3ueQy6VXRlVSfEJ6VYThHfi
         9c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684552323; x=1687144323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipc/fH1HtTc9iVCyYaRzRttwn/c7QEusN/EaZt1y0z0=;
        b=JjBleU6m0p3R/Fz3BIaJwKBRz22b0ulk1NOdL2ZSASVR04D8Z2CE788fF70L6MiIhb
         WGyqXEghMzdd9TA36rBujj14j0ZvFxHPzvPldUNIdq83/mD9SC35p8d4GBd4KSK56gef
         O0sXGAUXd8pVjspwxvi6AWsJPbOe4h5A3MG41IyAjOoHvePu/t4TyuzzVZm14oZ1NfAz
         4TFZfYwOqw3KzCUwzLu0U9HIh1TZ4nB/8Opo/0w0g1LZJmEbvYly4LW65dpGEAzkbWaK
         Av8z/jD0bRe/E2xU9taTzKz7uTnNhl4NTWTLBG6satWoSoqwOf7fICcoJNXXDZX5cjLa
         fXQw==
X-Gm-Message-State: AC+VfDxUBMme4xZ5A4RdlvvTvnSPCKlrzWx0UoLrQBq0zE5H3LKiezTp
        LiKZ4rqzgR6N+FUYY6Uz1CIN2VaGw6I=
X-Google-Smtp-Source: ACHHUZ6OtxQpvn6TvaUVKQgrtyYtBdZ/r5/DFNTMKPjAlu+OLsL0v64dTbKQGLDcdv0K8H7pjXLtDQ==
X-Received: by 2002:a17:902:f545:b0:1ac:750e:33d6 with SMTP id h5-20020a170902f54500b001ac750e33d6mr9601654plf.23.1684552323453;
        Fri, 19 May 2023 20:12:03 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902c08400b001a6ed2d0ef8sm322381pld.273.2023.05.19.20.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 20:12:03 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] README: provide more info in Contributing
Date:   Sat, 20 May 2023 11:11:50 +0800
Message-Id: <20230520031150.20062-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add more detail to Contributing to make it easier for new users to
contribute.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
I was tempted to add something on formatting with clang-format, but I'm
not 100% clear on the formatting policy myself.
Would be nice for that to be clarified.

 README | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/README b/README
index b71739e..8e726fe 100644
--- a/README
+++ b/README
@@ -275,8 +275,16 @@ were selected and help2man is available in the system.
 CONTRIBUTING
 ------------
 
-Contributions are welcome - please send patches and bug reports to
-linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail subject
-line) and stick to the linux kernel coding style when submitting new code.
+Contributions are welcome - please send questions, patches and bug reports
+to linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail
+subject line).  Note that the mailing list quietly drops HTML formatted
+e-mail, so be sure to send plain text[2].
+
+Code submissions should stick to the linux kernel coding style[3] and
+follow the kernel patch submission process[4] as applied to the libgpiod
+source tree.
 
 [1] https://github.com/bats-core/bats-core
+[2] https://docs.kernel.org/process/email-clients.html
+[3] https://docs.kernel.org/process/coding-style.html
+[4] https://docs.kernel.org/process/submitting-patches.html
-- 
2.40.1

