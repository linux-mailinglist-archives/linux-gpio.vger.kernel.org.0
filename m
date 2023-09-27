Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14EEA7B0A22
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 18:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjI0Q3p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 12:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbjI0Q3o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 12:29:44 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5062195
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 09:29:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50325ce89e9so19241530e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695832180; x=1696436980; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtXuatjclu4yaOr/xjyNWCRhmX1krqQhyJNlwId1XwA=;
        b=MSIOOz9OSSHnKK9jW3KVaFfI2zqzkn888joQfePOKk6uTcDJ6dbZIb7rsKhP5wXPxW
         yIh4OWms0aIktV4x4QBMmbRhZVyCedbClqQpJ4u2WQxQ94L70oudtmAr9BZHyCXsu9Fx
         e0tQQoMWZIHZ3s9Jf4aPaQbGGKRmOXh4IyaNQTyFoO6kPd1/uK87AldLo8pcQCqOMp7S
         FA8hhu74hyskvYmoG105PTqpf0JTLzpqcJFfrgEHfquyzQPqRCUCrL0ywE6qgtKD2cxQ
         SMLm505Hc0DiLApf961Atvec46ZgjIt4RvrvfN9s9s/g89EuqKrpXCWYSa9QoBzpeOxR
         9bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695832180; x=1696436980;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtXuatjclu4yaOr/xjyNWCRhmX1krqQhyJNlwId1XwA=;
        b=Y+x2xIeRnQuiXIzO5HDUCklI4dFMNvG/GaAdiyKtU4Vw+6X5NBAhqO91U2Km/cSp0i
         kellHF2gp0OJYI1tu/bhsuiqSCVmiKzefmxt1pdJqO57NUizkahHaZm387FT4ZXyiRZ/
         L4GNwTlBSy2KQuAJ5hCi+ECOtLWs35zToza57TcVCs4sGFvgZud60YnYy089yoTP3YbB
         wjIReh3wDlQKwK1KOnlX7jts5YdYS+R2D4QrB1a73ISW0c5EQNQtG+ZgGBtJzH1pTQG1
         EGUa28p/qL9SGDPyxGtaUzEYOY7uXVgC3ccP6B7n5qFsVnaQYCFuDnadzuqAJkNQaZBn
         v8qg==
X-Gm-Message-State: AOJu0YxK9VBvx1IAWOzmGQZCCMm0ORiHLKKit9zHaxvFHZRIP5hexbx1
        Mb0NjDqzN6GTRasyAODpktWthQ==
X-Google-Smtp-Source: AGHT+IG4Praiw6FASxephb+fdU9CE2iC24dFEOkC7D36Zv9A2wYkMwZc0n9P5YWPPUy+cpKvM2dO0Q==
X-Received: by 2002:a05:6512:3ea:b0:500:b8bc:bd9a with SMTP id n10-20020a05651203ea00b00500b8bcbd9amr2015558lfq.49.1695832180474;
        Wed, 27 Sep 2023 09:29:40 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id q8-20020a056402032800b00522828d438csm8384685edw.7.2023.09.27.09.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:29:40 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH 0/3] bindings: rust: fix modeling of line_info
 lifetimes
Date:   Wed, 27 Sep 2023 18:29:36 +0200
Message-Id: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHBYFGUC/x2M2wpAQBBAf0XzbGotuf2KPGAHU5rVDlLy7zaPp
 9M5DygFJoU2eSDQxcpeImRpAtM6yELILjJYY3PT2ArDqQduLFHI7FH9KU5IFbNiMjUZZ0tqIOZ
 7oJnvf93BxuOys3fQv+8HMR4s2XQAAAA=
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695832179; l=1279;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=QwxVV9UAsjUKwJFjjTawZFgIflb4fWsGUoQQlbZX+VE=;
 b=YzVD+QACLLbuEL8rsrfcCeBwGAGspkoMMBCNozYqEdZRUPloShVDusBU0djmHbJ25pW2HGLjs
 hWWXdy5jAvOC0qZCWIbCyiAw6VR/xhrRNbELBNRFrc3gdhj1VglX2wE
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While reviewing the bindings for thread-safety, I realized that the
bindings did not properly model the lifetimes of non-owned line_info
instances.

This fixes that. It might be a bit might bending. I tried to provide
lengthy comments to clarify what happens.

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (3):
      bindings: rust: fix soundness of line_info modeling
      bindings: rust: allow cloning line::Info -> line::OwnedInfo
      bindings: rust: bump major for libgpiod crate

 bindings/rust/libgpiod/Cargo.toml         |   2 +-
 bindings/rust/libgpiod/src/chip.rs        |  16 +++-
 bindings/rust/libgpiod/src/info_event.rs  |   6 +-
 bindings/rust/libgpiod/src/lib.rs         |   1 +
 bindings/rust/libgpiod/src/line_info.rs   | 138 ++++++++++++++++++++++--------
 bindings/rust/libgpiod/tests/line_info.rs |  53 ++++++++++++
 6 files changed, 171 insertions(+), 45 deletions(-)
---
base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
change-id: 20230927-rust-line-info-soundness-14c08e0d26e9

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

