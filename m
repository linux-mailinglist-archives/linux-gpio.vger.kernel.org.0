Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EAD7B334F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 15:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbjI2NSX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 09:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233163AbjI2NSX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 09:18:23 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56351AA
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 06:18:20 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c3c8adb27so1916162166b.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695993499; x=1696598299; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lV0ibgwQX5PkhCO9aOZFrfHjhu055OsuavQde+3bh9c=;
        b=JjerD9jsBoP1wfNCp1VN+ceo/GZUYcplBLuAqHqzW2Bw9HyxDv1VPQ+vpUd406ZSIA
         E211d+GKvJ5uVaBMxIEmn6so9T6BFeRwzJqF62UWMUKLAcBMhmD/YYFd99g1AnT0JwvI
         r7s9DxM8S9cG/v+i/Vrdgpkd1uKp7o373FtKApu1ut/uYKeNqkosHNPvNPrylc2XA3sn
         iMqqI6Q5NVnO9ZgQFOjBbHn2PTP2xsk/v6iiuZeTBNk3tbpQjZoCnkzmRT9Wy3w5pHjy
         lRaMN+HDIqgZB/JqHOQWSRpDZPxgHfu3uXqIigVujlY2OvR/RVdN2nvnq9QDUgmQBnDv
         470w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695993499; x=1696598299;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV0ibgwQX5PkhCO9aOZFrfHjhu055OsuavQde+3bh9c=;
        b=rBiBVNGthQb6yl7pFEdGiA/+ranUw2Y+f+0WfhKLSV5A+CibyRCLjDa8g+eAbb7f/8
         7IenjxYoUxKAYnOS4ksefQVzUmYEBkWlf7tBx8Ed2KdhMEQMSuGqRnDhoNLo/7VpthAv
         TTvmnVteUVeMamSURvyQ5KV3l3mao8X+W0fSSyS9/HZ8XrGKHP/eVwKor95OeE7ZVqzU
         AGoLGuhF8cRSiGu08u6Gi8oa8Yjw6r7UHg6ST7VbtskKnNdn7x0p4J6da+rBbjawUbgT
         jTJXlX7hZTrxhJN7GhlTbO++uZBxP1kQo76QrhgTPcjo9kiW6gGXNsveBzaj/RBeZw7o
         2fqw==
X-Gm-Message-State: AOJu0YyJP39+afgSGivqJWoPNpU4tdwI/Wu92mt4T/UdKWQpKp5LbORf
        WMZ8Y5JBQXM0HXK8vBmEes2cxavWXWBGmzQ+QDM=
X-Google-Smtp-Source: AGHT+IGUqD+SkcKXHm8WIQcG8zB3dNBTmTqkBkt0ykFtEdWVGfoOx0GDsmc1egeNFNTBecWcG3cCiA==
X-Received: by 2002:a17:906:5384:b0:9b2:b119:4909 with SMTP id g4-20020a170906538400b009b2b1194909mr4097015ejo.75.1695993499165;
        Fri, 29 Sep 2023 06:18:19 -0700 (PDT)
Received: from [192.168.1.149] (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id ck17-20020a170906c45100b00992e14af9c3sm12510086ejb.143.2023.09.29.06.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:18:18 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH v2 0/3] bindings: rust: fix modeling of line_info
 lifetimes
Date:   Fri, 29 Sep 2023 15:18:14 +0200
Message-Id: <20230929-rust-line-info-soundness-v2-0-9782b7f20f26@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbOFmUC/4WNQQqDMBBFryKz7pQkLdZ01XsUF2pGHZCMZFRax
 Ls3eIEuP+//93dQSkwKz2KHRBsrS8zBXQroxiYOhBxyBmfczXj3wLTqghPHDGIvqLLGEEkV7b0
 zFZngSvKQ53Oinj+n+g0Tt8PMEqDOZGRdJH3Pz82e/L9+s2jQexM6KntbNe0rt5okV0kD1Mdx/
 ABW/aJxywAAAA==
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695993498; l=2027;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=rXXZsIsQsq0JgQjZU1HO1QZjkVvuQHpcrxOis9K3324=;
 b=q+YBdmy8Jeo4LI+zlQj21wcNJKkavt8ono+5NseUu06zZBE/glfYxvxybxIORPBTBPg4OBgVj
 TGPYVyogdv9A8rPh7xIH+BG6rZ81wj8Bap0E5CCB649CQETehdINrfu
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
base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
change-id: 20230927-rust-line-info-soundness-14c08e0d26e9

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

