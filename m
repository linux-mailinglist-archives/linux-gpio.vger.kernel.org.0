Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBA5E7455DA
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 09:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGCHUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 03:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjGCHUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 03:20:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE6BCC
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 00:20:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d91e9b533so4496388a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2023 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688368814; x=1690960814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze+Hizdk0P4QL6s55K2SSjg6J+ewFedq4CxMtAWpchA=;
        b=J/agHN6IZI/Q9zVBtH+uAcaVUQr/n+/GqrotrD1koWI2CQzXeNd4+Rk4ubwpHJd6YY
         y2O2cyBuu80Ulvf3cbyzyCsurswh6Bii2wAUstGRPt0RopsRobPkWvSJ9ktAAoeOsrYq
         wHRopqipa4TPkZGgzcfmIr9hCbJMnk42LROcq9KcyFJBTvQ4szpwr1I11uiG8OuG4m1v
         TSTlz0T+o9Yj1wdSv/ryg3s3/tGKdRE+JAKn7t52enfs/d4d40MubbmCHpz4xCuhKZuf
         cyXeej4DK6djkcLBxoYq3BB40G5tOj3GyJlAqpBG6VE9xzSY4k6Kca+lMzQAXKUr7mMB
         0Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688368814; x=1690960814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ze+Hizdk0P4QL6s55K2SSjg6J+ewFedq4CxMtAWpchA=;
        b=jFwds161dqKdWf5fX+KjiBTO5B86OFL401vCwHe/SNK1YJahs/KJpRJ+FP3aLVAoxY
         0wPdSbklas1+QPSd/hHAZmKGRiRUiGtMiKdF2ehFTOLW8iM4rDGYMHVETc3tsS1JMTi9
         f/DpVuCb4C7Gw2Z/rSSX52UK+/OctGKBKyc46pZmkC/I9Csa/yo22zp7qZSRq+BrgZj6
         AffxfTxGky7yKnIOnsiZdygxYx/2jba+oRUTolQfatEMQnNsCSW2G+e0UHEjPpvu4msq
         dZuEdwtCNPRxGjM2IlKqyb4qFkW3YwaWQyEuIq30g2HPJnsaJInRDXcUdrfyrOgjdEey
         YR3g==
X-Gm-Message-State: ABy/qLZrn6OcDytAz5MEYpM4+e2YJGDPHu+o1gJ7UTfzNvyxsmLzHrr8
        e4LgzO/sdQlDrmCbdVL9YBaang==
X-Google-Smtp-Source: APBJJlFqtztobSJLmNvlyI0i3LPSWP1UxE4SBZ0sTdqUD9CYU3V51xsjUPHfb17Mbm/J9aqOGaAYHA==
X-Received: by 2002:aa7:c158:0:b0:51d:9ddf:f0f6 with SMTP id r24-20020aa7c158000000b0051d9ddff0f6mr6504358edp.36.1688368814449;
        Mon, 03 Jul 2023 00:20:14 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438F8.versanet.de. [92.116.56.248])
        by smtp.gmail.com with ESMTPSA id s13-20020aa7c54d000000b0051e1660a34esm391449edr.51.2023.07.03.00.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 00:20:14 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH v2 0/2] bindings: rust: add README for crates.io
Date:   Mon, 03 Jul 2023 09:19:58 +0200
Message-Id: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ52omQC/22NQQ6CMBBFr0JmbU1boAgr72FY1HYokyAlUyQaw
 t1tWLt8efnv75CQCRN0xQ6MGyWKcwZ9KcCNdg4oyGcGLXUpTSkFv9MqGK1/oTC1kbqqbKNKD3m
 xMA70OWsPmOgZFooe+mxGSmvk73mzqdP/LW5KSKEctmiGpr3V7j7RbDleIwfoj+P4AYmeZCixA
 AAA
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688368813; l=922;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=LDw3KnS6BRvXZ2FteyOsc1Wv3ewt4ytRc3x/nUvWsSo=;
 b=ck6f01hPQrqaNtL8i3IG775f3v8O83KUsXimcXgjrNQvcXL0dM1N3Ihy7DtIOsLLrah3rm0X5
 kFWYlN1PhuqCqFVy6eJhXM8sYIJW/qdkvtNdmzy0PaRIa+JPpUB7lkz
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

The READMEs are displayed on crates.io for published crates. This tries
to provide a little more context there.

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Changes in v2:
- Fixed typo (thanks Viresh!)
- Added missing sign-off to 2/2
- Link to v1: https://lore.kernel.org/r/20230630-rust-readme-v1-0-1ce9e6f7985c@linaro.org

---
Erik Schilling (2):
      bindings: rust: add README.md for libgpiod crate
      bindings: rust: mention the libgpiod crate from libgpiod-sys

 bindings/rust/libgpiod-sys/README.md |  3 +++
 bindings/rust/libgpiod/README.md     | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: 37b3ac4bb5a35c0e84a98d95124f064ca038c4d1
change-id: 20230630-rust-readme-6560244a713d

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

