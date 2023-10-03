Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA66B7B659F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 11:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjJCJkN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 05:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbjJCJkM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 05:40:12 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E61F9B
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 02:40:08 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99bf3f59905so119045366b.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696326007; x=1696930807; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7vKtlPzQNGfIAgf0m7kxZagBCUsHaTeaxdPpGjNYoU=;
        b=tDktRShPAjhNqGoCOR+thRFkVV8sU3+2DX0xVCv0EuM8+2546wntBsH1cjWV4E90f/
         7bz8PvgJgw6lTfRwV6Tbsve40YIRpo+MDwl/5wpJcQHLA8ZUAYo1ZtQke8Jw/LeDIpgu
         B9RN+aIeQ6QXrczaQB6WS04orvQEWV3gicNZgJbrHKmEpEOmjh0BUpSjUsaYwmH7cNmT
         xVEgqjUbwmGKxkMetsnwTLHtbpqB+knd0gOZNFCpS4SSAwXhrXp4fINsMo//7lJO6gCA
         Vbc4NTc6E53WsJxpTCFrt06CRBlU7jqoSTFdSLOMqJYdMYOiZ8lkXiCtVtaIL+a/j5FB
         k6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696326007; x=1696930807;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7vKtlPzQNGfIAgf0m7kxZagBCUsHaTeaxdPpGjNYoU=;
        b=BZ+XCTVR1acxS8oOt8QAPABlTSSUqlg0U2kgdYYNP36iNMugUbJOw3IPvNea4Wn9iL
         k3F9ePuwaTqGy9mRKtmFydvhvEYhwniwAwfiuIA2r017aUUJz/kCS6LQIF4emiN6n7Dn
         JcfyH7+BYM/ivcKhaMzaNLL0VQ55Skf27bPLOcjUDi5IffuzLfguwHlrZwv2XpLNdoao
         8M9LitVM4IH4mnYHmnVvh19VOOfLTaDfvkmYZjbCHSYMEH0xkzNWBXOt5PAr0McXKoja
         rs/1oIhKu2Y8UBtj2pIXO8UAQcSUk62GWr91roSajlXcEQw2sJYsfps8NILqlW50W3RR
         fe3A==
X-Gm-Message-State: AOJu0Yxl06TcCiqu+Bjoab7VNavJ7yUmv8KTYllFxbvWvV3VAKtRFtdR
        KxJBb4CsYnIEZ9j/dEDVTmXjdbEst9aUXua/viQ=
X-Google-Smtp-Source: AGHT+IE4Z2DyarczuQOKMpCAgnLYRouWFVH4QKQpd8mLdQTCOo8UQ1XO3DR26h+7qvm0ZN7Sg9KCPg==
X-Received: by 2002:a17:906:19b:b0:9ae:48e7:bac9 with SMTP id 27-20020a170906019b00b009ae48e7bac9mr13616512ejb.52.1696326007069;
        Tue, 03 Oct 2023 02:40:07 -0700 (PDT)
Received: from [192.168.1.149] (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b0098e2969ed44sm749747ejo.45.2023.10.03.02.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 02:40:06 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH v3 0/3] bindings: rust: fix modeling of line_info
 lifetimes
Date:   Tue, 03 Oct 2023 11:39:56 +0200
Message-Id: <20231003-rust-line-info-soundness-v3-0-555ba21b4632@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzhG2UC/4XNQQ6CMBAF0KuYrq0pgwHqynsYF0CnMAlpSQcaD
 eHu1q50o8ufP//NJhgDIYvLYRMBIzF5l0J5PIh+bN2AkkzKAhSUSkMtw8qLnMilwlkv2a/OOGS
 WxblXDSoDFWqR5nNAS49M38RE3TCTN+KempF48eGZf8Yi9//5WEgltVamx8oWTdtd01Ub/MmHI
 asRPiX9Q4K3VDfQ1RaUhepL2vf9Bdo/NC8VAQAA
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696326006; l=2204;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=4AzqEQaX0oHvms/RL1ub/ewblROgdhbBBJD0kFLelw8=;
 b=AtcwQ3R+AC0zw0Xlra2/i1temuui9RaK/RLBYrlkzfPUzQFv8jQMg0QGGP+4eknkrqSH8R+nQ
 8YTzc1UzJ8kCJ5gOZEhguOGVkmhnd758dLsbHUw9GRlzdkxHPj0BWGm
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

This fixes that. It might be a bit mind bending. I tried to provide
lengthy comments to clarify what happens.

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Changes in v3:
- Renamed from_raw_{owned,non_owning}() -> from_raw()
- Link to v2: https://lore.kernel.org/r/20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org

Changes in v2:
- Removed unneeded temporary variables
- Added missing SAFETY comment
- Renamed owning wrapper to `Event`, non-owning to `EventRef`
- Renamed existing clone methods to try_clone()
- Slightly tweaked try_clone() documentation
- Dropped version bump commit
- Added Fixes tag
- CC'd Kent - suggested by vireshk since he reviewed his commits
- Link to v1: https://lore.kernel.org/r/20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org

---
Erik Schilling (3):
      bindings: rust: fix soundness of line_info modeling
      bindings: rust: rename {event,settings}_clone to try_clone
      bindings: rust: allow cloning line::InfoRef -> line::Info

 .../libgpiod/examples/buffered_event_lifetimes.rs  |   2 +-
 bindings/rust/libgpiod/src/chip.rs                 |   8 +-
 bindings/rust/libgpiod/src/edge_event.rs           |   3 +-
 bindings/rust/libgpiod/src/info_event.rs           |   8 +-
 bindings/rust/libgpiod/src/lib.rs                  |   1 +
 bindings/rust/libgpiod/src/line_info.rs            | 140 +++++++++++++++------
 bindings/rust/libgpiod/src/line_settings.rs        |   4 +-
 bindings/rust/libgpiod/tests/line_info.rs          |  53 ++++++++
 bindings/rust/libgpiod/tests/line_request.rs       |   2 +-
 9 files changed, 173 insertions(+), 48 deletions(-)
---
base-commit: 0a570b6d5ea32dbd771092c52ee427ee5be6ad22
change-id: 20230927-rust-line-info-soundness-14c08e0d26e9

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

