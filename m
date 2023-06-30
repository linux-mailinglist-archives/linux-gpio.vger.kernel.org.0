Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3833C743AA7
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbjF3LTI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjF3LTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:19:05 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58312680
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:18:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso2877696e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688123938; x=1690715938;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DvA4OsqEt8uk7N1l5EhH+khjedF3qEoCfOHJJgV6XqE=;
        b=l0zhNUF4gpLIFyCDMpdHXhfgB02RtaDdaaRDz7wRL4SFqBIPuEPP3nqBNF7zmkEL0I
         VgMSmLKca1mJzjHcb1lV/lTIu47Z0X8eINcrgu51pFTXWlbim9qKEPv7ej9Y3+wcQpNc
         r7h+8VSvlHsqFuAkkaXB3lcBI8qORCQ2ipikweuTFq9lo3ISnScb0d+M01PUjwiU0cgk
         vzvSvVF9Gz/QVAFnNBYjSm2xibvELC/ywkYjCFbg8OCBIyn0upNnmotMXWk0Qf1PYYmm
         0P3PTndmBgUWoG/sc+AsGFUjEJIKcMDjKMv0OMSRH22f/K5/btJ0FRqve4XyT4fpoEru
         IORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688123938; x=1690715938;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvA4OsqEt8uk7N1l5EhH+khjedF3qEoCfOHJJgV6XqE=;
        b=SOTv+nhbp7E4WQZ4WsnqJAdTO97d+D6qsNEslZqwDHMnefv2WpZqNOrVASxV70SDoU
         2FHizGWrU+9mh/a+Bg7PLwp/oBA1iWv3TS+jjYlS79xi74MEaqtbNce3QwTXE3dBTnwo
         S31zNUDT+yLitgXJIIU9JT7o1Ugjm1tOKWLel/8jmIsNX6xhaz8e2KjZMxbV4G6SgmGC
         WqPQMOon2yyIKc3Wfw3alvAQyoC4cqfI4ukOFcCbeUUhnAbyyn46EHYfE5KOGGcnQWei
         2vg+eruht8yUbp8uPMjTiKrzCTeu8Bxup8v+n8EE3eHp5SbU8tsyyfeJjhEiklWjCr9k
         dLFQ==
X-Gm-Message-State: ABy/qLa3lORBXhhoEqDDavrg9WcfF/nHXG4US2a7bBKwXu7hcRSyqoVU
        ks8pOmJyGDfTv6tpXeqvC2hGhygHU0MleKVtAOk=
X-Google-Smtp-Source: APBJJlEl259vWPcmxvP6MQWUcxkLWjjSZIgX20AvabLfrnTl1XsWL8uGnR5UXBIPiOrsmUnz/c880Q==
X-Received: by 2002:a05:6512:3b8b:b0:4fb:774f:9a84 with SMTP id g11-20020a0565123b8b00b004fb774f9a84mr2496004lfv.13.1688123938097;
        Fri, 30 Jun 2023 04:18:58 -0700 (PDT)
Received: from [192.168.1.127] (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003fbb618f7adsm4621917wml.15.2023.06.30.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:18:57 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH v2 0/4] bindings: rust: clippy: fix warnings
Date:   Fri, 30 Jun 2023 13:18:43 +0200
Message-Id: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABO6nmQC/12NywrDIBQFfyXcdS1q2lSz6n+ULFJfuSBRtEhD8
 N8rLrsc5jDnhGwSmgzzcEIyBTOGvQG/DKC2dXeGoG4MnPKRTlwS5THGgwhJ1f3G1KSphDaOyVj
 89tALPL5dxKBhaWbD/Anp6A+Fdf8fK4xQIq2lQjzY2LpPj/uawjUkB0ut9QdHbUiHpwAAAA==
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688123937; l=2414;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=9d6GzmZa9rNBO4euD6w9rfxdQXv1zKo9gx9PUhqmtOE=;
 b=Oek1QqV10ZWXSFhTHuoZYhOlGwXG2stFq2qEgjBdh44+/H+pqCpH6+2ay7ht44XldsF47XBun
 T1KT6v04nhTCXC5oI+PMTws1HiZtSGAuVojvzoLRgjaYHpTeYfTvPGj
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

This follows up on my promise on Kent's series [1] to look into whether
these casts are needed or not. Most are not, a few are false-positives.

I also explored some shunit2 based test-script to automate the testing,
but that became ugly with linking issue and needs me to revisit it
another time. So this only sends the clippy fixes for now.

Tested the build (lib + examples + test) and clippy report on:
- Fedora 38 x86_64
- Fedora 38 aarch64
- Debian 12 armv7hf

Test execution (cargo test) was tested on:
- Fedora 38 x86_64
- Fedora 38 aarch64

Could not execute tests on armv7hf due to lack of suitable test
environment.

[1] https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Kent Gibson <warthog618@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Changes in v2:
- Changed cover letter title to active language
- Improved commit messages (hopefully)
- Elaborated what was built and tested
- Resent with hacked b4 for proper [libgpiod] tag
- Link to v1: https://lore.kernel.org/r/20230629-clippy-v1-0-9ff088713c54@linaro.org

---
Erik Schilling (4):
      bindings: rust: clippy: drop unnecessary casts
      bindings: rust: clippy: silence false-positives on casts
      bindings: rust: clippy: drop unneeded conversions
      bindings: rust: clippy: silence false-positive on iterator

 bindings/rust/gpiosim-sys/src/lib.rs         | 2 +-
 bindings/rust/gpiosim-sys/src/sim.rs         | 4 ++--
 bindings/rust/libgpiod/src/chip.rs           | 2 +-
 bindings/rust/libgpiod/src/edge_event.rs     | 2 +-
 bindings/rust/libgpiod/src/event_buffer.rs   | 7 +++++--
 bindings/rust/libgpiod/src/info_event.rs     | 2 +-
 bindings/rust/libgpiod/src/lib.rs            | 2 +-
 bindings/rust/libgpiod/src/line_config.rs    | 4 ++--
 bindings/rust/libgpiod/src/line_info.rs      | 3 +++
 bindings/rust/libgpiod/src/line_request.rs   | 8 ++++----
 bindings/rust/libgpiod/src/line_settings.rs  | 5 ++++-
 bindings/rust/libgpiod/src/request_config.rs | 2 +-
 bindings/rust/libgpiod/tests/chip.rs         | 2 +-
 13 files changed, 27 insertions(+), 18 deletions(-)
---
base-commit: 4510231c95a087f58a155cf74164e403e1e0584f
change-id: 20230629-clippy-890c541c6d09

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

