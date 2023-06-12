Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A668372C2F4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 13:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbjFLLhJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 07:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbjFLLg3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 07:36:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E88CBB
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:15:01 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5147f4bbfdaso5904398a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686568500; x=1689160500;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrYp1jpD766hNu+JiRQDKuLK2kCjWhFpkBSPUhZV5cI=;
        b=pIj03uw7eEX3e3rQ7Td/u1lFuv7SJUtTRfoHWBHFdtQGmJhFv0/XVCFPJLwUmKHDam
         rf00USYQ7ChJTpo1ARh2Ih4LRe8Lei/T7Sngv6mY7W8Q5sCTYVIdCCUJylqYV+2WAisG
         5KyboFoVUHuBEgKeVR7s3KjnXtN4ES48rgxZkedqXUdUI3oTytKo9Qktgjey+GGJpj2T
         ZEnOGs0SsI10rT3d9HL4qS1po+pGOvFTXvMfeJKWek2JUHH0HNQW4jUFFvANK8kWzW1s
         AhTQEMi2w3bGk0ti9lS04/hbfa6b08KDVU2P8IsnlXkCyWGfGA0H8TqXoXz3+6ZOMxW+
         QErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568500; x=1689160500;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrYp1jpD766hNu+JiRQDKuLK2kCjWhFpkBSPUhZV5cI=;
        b=dOYF4DiUQ7kOCsxLWytxJNgEbKvXKcG4IU1upVh6TcMRwqTF1UpStcLI3zmhNSSOjF
         py0FSeWFFVxomiTd7P6i2jMIebwHZByeSmFvTomTzGr6eKHhoKKbEmSsaRt6SNX2mYnw
         xXBed5AiBIUvWL3jhIJ1OVHyACev+MewEuJn+o/QvZuLxxJ/mU9jZ6WcsH3UuN7aqw7Y
         CtYE4pE/MjPDPf9HPaJFcbJqbLFn/Vc6YqJVrIOXirXVMqTHBufcfeVYwF2oPNIq/JbW
         qDRkoRmjXAh+zpE/Bt5gunwvhRtBSCfnSzTOD81JAC/3p9bnDMDuq5GCnXNTk4Vryb/A
         rW+Q==
X-Gm-Message-State: AC+VfDzdz7ULPNiWU8gmrmZdjKkN6umBFV7h2hJdD++4kijKU6PavU1/
        BkxmsJqzHGF2zLpIcsVrI3gnU258k1J1BN6gzWk=
X-Google-Smtp-Source: ACHHUZ5Nu99nrhUEB5uebIwvL1dRWpUQF6LURfWBD0FN7nGyQQV5EPKjExQu/AjMl+N53KwQ6L6Czw==
X-Received: by 2002:a17:907:3688:b0:978:8d1b:3a24 with SMTP id bi8-20020a170907368800b009788d1b3a24mr9206492ejc.27.1686568499941;
        Mon, 12 Jun 2023 04:14:59 -0700 (PDT)
Received: from [192.168.1.149] (i5C74066A.versanet.de. [92.116.6.106])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709064e4c00b00965e1be3002sm3463054ejw.166.2023.06.12.04.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 04:14:59 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH libgpiod 0/3] bindings: rust: prepare for crates.io publish
Date:   Mon, 12 Jun 2023 13:14:47 +0200
Message-Id: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACf+hmQC/x2N0QrCMAwAf2Xk2UJX3XD+ishIu7gGZluSKcLYv
 9v5eBzHbaAkTAq3ZgOhDyvnVKE9NRAippkMT5XBWXe2fetMEFxJR85jefuFNZrh0pO9doMNnYf
 aeVQyXjCFeJQv1JXkEEXoyd//7A4L+7lwnuCx7z95FedqhgAAAA==
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686568499; l=1093;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=HUG4kZGmEKN/dZZoFBwiTpys/xJ4AquBT8DQnaKYuYc=;
 b=tFAB2TYMo5xNxaJNuw2MeF9IM1Sp4t8EXUgBDMzeeyDdI7Yexjznne4y9Xu881RSTKFSdg8lY
 cSKaHQ2xPK4Ai0xPiFuGo7SLHBVTAtcZTL2aR3AXsdS4VFH9lgT/j/e
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

After libgpiod-sys is published [1]. This series does a little bit of
cleanup and prepares libgpiod for publishing.

[1] https://crates.io/crates/libgpiod-sys

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (3):
      bindings: rust: add version number to dependencies
      bindings: rust: exclude Makefile.am from package
      bindings: rust: document build without install

 bindings/rust/libgpiod-sys/Cargo.toml | 4 ++++
 bindings/rust/libgpiod-sys/README.md  | 9 +++++++++
 bindings/rust/libgpiod/Cargo.toml     | 6 +++++-
 3 files changed, 18 insertions(+), 1 deletion(-)
---
base-commit: 9788bdd3d6791205431e65366dcc518446f7ca6a
change-id: 20230612-crates_io_publish-946e08590c5b

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

