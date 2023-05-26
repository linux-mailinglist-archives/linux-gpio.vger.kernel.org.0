Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2215712971
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 17:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjEZP2M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 11:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjEZP2L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 11:28:11 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0484F3
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 08:27:42 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9700219be87so153357466b.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685114861; x=1687706861;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/z6pTDdC+YUUhTEF/1N2q3xzY9VbMHjkHn9PDkDoKM=;
        b=RToPjitzpIoS5v3Mh/iIPYV/ZY1NGSp7DxMn98tc8/eOqflmuD8XaBehEbWJdVQRrC
         57f33st4gkon12VsqcBCUElFFv0iiqlYUmN7g4Kj2M9jpSej8RbyNr9w+Zg08SBvUf8J
         pf/xiHpK/27zDVMN1WIpieZU4AXa2KIf9oS47P5L9zU05ombXzWmmtqst+IoHQP+zvtS
         5YdaWgyeVRf87yEzwxLFJQKOLP0xNCDWntCjMK3oAzQ/5DOvUHUr9VvWie6zuu1VaWfi
         I5hSULrjGOgsdsdTw6bGJHzI7REJ5QKSDzItU7g9rK5sVoeTTS652VziS4SdUzE0CcaV
         sQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685114861; x=1687706861;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/z6pTDdC+YUUhTEF/1N2q3xzY9VbMHjkHn9PDkDoKM=;
        b=NTsNfwqK8leCTqJewt9WdIoBHFj1GUTa5+4SPHWjKZtU/7C4L8S2bevE+cmr1sqhjl
         KTo1OZ+CMjIaUMWTvIQqp1nz33j8WOydWELE40yLoemYh+Vbd7RNT3bvOG8F9/KuXGhO
         cZBNJyR+v/TngsKE+nze8FcRXcqPvDACxOoEcwne37uN/lrS1ErOLvMYrjVhN8Hu2K42
         uJ7NofwSpq+bsmZLktfIAWenclSBl8S9dbPdj2M8uQxzdcRrTFvQHzsPKHtDkTwciXv0
         NQpzk9ZwkFM945Ilw0c8402B8bZzBsioW44XPwWByz9qw/q5UOramZPXe6mEpW2KCvK1
         2dXg==
X-Gm-Message-State: AC+VfDy8iH/8PqYPFoUMPFGEYivyqHIXMByoLWl6qYIPcQmO5ha1eYB9
        GvYNOKyH/eDXhjpeDsc5PLtdTA==
X-Google-Smtp-Source: ACHHUZ6PfqyXhXYBJGSXwYgeqZcV9lWsGlw3MHz/Vq4FCmfJpiLBSvHjUT95YXB+eQICZWjxHwJOxw==
X-Received: by 2002:a17:907:160f:b0:970:1a15:62d1 with SMTP id hb15-20020a170907160f00b009701a1562d1mr2483460ejc.34.1685114860942;
        Fri, 26 May 2023 08:27:40 -0700 (PDT)
Received: from [192.168.1.149] (i59F67C10.versanet.de. [89.246.124.16])
        by smtp.gmail.com with ESMTPSA id m13-20020a170906160d00b0095342bfb701sm2305894ejd.16.2023.05.26.08.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 08:27:40 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH libgpiod v2 0/2] bindings: rust: allow packaging of
 libgpiod-sys
Date:   Fri, 26 May 2023 17:27:31 +0200
Message-Id: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPPcGQC/22NywqDMBBFf0Vm3Snp+Ah01f8oLhKd6kBIZGKlR
 fz3Bte9u/vi7JBZhTPcqx2UN8mSYjF0qWCYXZwYZSweyFBtWiIc1K2cURJaWzvjO99QPULZe5c
 Zvbo4zOUR3yGUcFF+yecEPCGInxZJI/SlmSWvSb8nebud/R/IdkODDXGRtS377hEkOk3XpBP0x
 3H8AAsD8F3CAAAA
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685114860; l=1657;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=aHeuOWB39qvF+BiRl9etMrrvOE+HB6y0adEPJ5lgY+c=;
 b=+E5mv7bCL8chlOsIbykRDesNVrxuc2TNUhdjhfy8uzl5OUxNBRVBSRtpdFTxlAJIxD5N2YWcL
 Pn+AbiTMtIoC5mjtey0NCPaxEmvVnlKF4hTCSbe8kkYwn2AK0qEUFjP
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As of now, the Rust bindings are only consumable as git dependencies
(and even then come with some restrictions when wanting to control
the build and linkage behaviour).

This series does some cleanup and then proposes a change in how the Rust
bindings are built and linked in order to prepare libgpiod-sys (and thus
also libgpiod) for being packageable via `cargo package` (which is a
prerequisite for eventually publishing to crates.io).

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Changes in v2:
- Added wrapper.h that I forgot in v1 (Thanks Viresh!)
- Rebased on top of the commits that already got merged as part of v1
- Automatically set the right flags when using `make`
- Tweaked the docs (setting the flags is now done automatically, so it
  is not as important anymore)
- Link to v1: https://lore.kernel.org/r/20230522-crates-io-v1-0-42eeee775eb6@linaro.org

---
Erik Schilling (2):
      rust: bindings: turn SPDX tags into comments
      bindings: rust: build against pkg-config info

 README                                |  4 +++-
 bindings/rust/gpiosim-sys/README.md   |  8 ++++---
 bindings/rust/libgpiod-sys/Cargo.toml |  4 ++++
 bindings/rust/libgpiod-sys/README.md  | 16 +++++++++++---
 bindings/rust/libgpiod-sys/build.rs   | 40 +++++++++++++++++++++++------------
 bindings/rust/libgpiod-sys/wrapper.h  |  1 +
 bindings/rust/libgpiod/Makefile.am    |  8 ++++++-
 7 files changed, 59 insertions(+), 22 deletions(-)
---
base-commit: 4687bcc4f48a9894469ee240e0c67c42d56169c3
change-id: 20230522-crates-io-773a0b6b423d

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

