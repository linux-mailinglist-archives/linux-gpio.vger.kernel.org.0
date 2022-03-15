Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F38D4D93E3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 06:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241968AbiCOFdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 01:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236064AbiCOFdu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 01:33:50 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231B849268
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 22:32:39 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id lj8-20020a17090b344800b001bfaa46bca3so1351364pjb.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 22:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gOPTBgWNpvBfAaMpoY1CxtXWRV6K7fxuVP0h3Ap862w=;
        b=Kts4FIjnbXkTwMhIiQWJD/proRPLTpkVThbewTTl3vaQjdhzh2lax09T54FpjRLr7O
         xAZ1P1Lbg5ZhWaRZMA2B5DU2wWA65d9AJznTi3/tdTohsccGvafzAKGRC4r4OwQhJtik
         arRuSwzFpXGboesPxDlG1vf6xec8fcc1FuILf/a0HmRKvMw7Q0+42mXp2JbaQ+fXqx/E
         Rdl5NiUKoaZAoVMNwcHT5C4ysiA/JMUlhFx8TKG0MEm5e5/zRi2NZ6LccWXCEPqi64ru
         5Yiz7Ai19TgVpp4cQRXc/AvIj7k8LbeNDHkSMzyLx+i+tCCYQZOEgd4RTcwG6Dbqs1rV
         R0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gOPTBgWNpvBfAaMpoY1CxtXWRV6K7fxuVP0h3Ap862w=;
        b=TrHNIo8yQh98n7znNnmgca40yaoim6RCUVChuTym9WUPDX7VZkBSrzTaq4XekHvLgO
         5HjBV/69KSj5uNTKPICQHEJlPxg2/V8mjgmdyryaDmCk5BBeYxbARyuRcLKnC98BAP4f
         YhyL+v8EQNuS/+/+1uPdj14SINCezgIwmBOq6dPcQUd5B+pa4Kl3S6Dv8ZAWDFjyPQFF
         Aj0bG7hep8TVhb49lYF5ClYDHLV8AxcgpHetIYFfG+zC+6sz4xr3YyB4EQ9HTEkeVIQj
         TbAzPSHG1mQZnsWf3WWvEM1BFYtt6zk+YT4HI22GkFG44WnOuvju1IeZZhslxwHaus1z
         IKhQ==
X-Gm-Message-State: AOAM530uY34di2qnlSFkUYHYOOEFNIIw8cwccgHoXPVVCYJCrGWRVqnp
        sbUKpWoWKmJ0tWH3U45eJULvT+ncSgWp5A==
X-Google-Smtp-Source: ABdhPJyU43yO0Ug77gbEmx+oSbyMzxAwkTN2Nm/W0pC+o1UGYxeonaV+UCRc3JWcq6Gsk7+ZKBYyMA==
X-Received: by 2002:a17:902:7784:b0:151:a83a:5402 with SMTP id o4-20020a170902778400b00151a83a5402mr19279036pll.21.1647322358237;
        Mon, 14 Mar 2022 22:32:38 -0700 (PDT)
Received: from sol.home.arpa ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id a22-20020a056a000c9600b004f7ba8b445asm8840631pfv.65.2022.03.14.22.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 22:32:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 0/3] api tweaks
Date:   Tue, 15 Mar 2022 13:32:17 +0800
Message-Id: <20220315053220.102934-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
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

This series builds on my recent doc tweaks series, picking up a few
things I missed there.

The first patch is another constistency renaming. This is the last
one of these - this time I checked all the function names in gpiod.h
to ensure all the functions follow the pattern.

The second is splitting chip_info out from chip.  This is probably
something you looked at before and decided against, but it bugs
me that the core library is doing more than it should here.

The final one is a variable renaming for clarity.  You use a "buf"
suffix to indicate the uAPI version of structs.  I find that confusing
as to me buf implies an array of structs.  I used a "u" for uAPI
prefix instead, though on reflection "k" for kernel might be more
visually distinct.  There are other examples of this throughout the
core - happy to do a respin including those - this one just fixes
line-info.c to bring it into line with the corresponding chip-info.c
introduced in the previous patch.

As with all my v2 patches, happy for you to apply them, or not,
in whatever way you find appropriate.

Cheers,
Kent.

Kent Gibson (3):
  core: rename gpiod_chip_info_event_wait and gpiod_chip_info_event_read
  core: split chip_info out of chip
  line-info: rename infobuf to uinfo

 include/gpiod.h            | 73 +++++++++++++++++++++++--------
 lib/Makefile.am            |  1 +
 lib/chip-info.c            | 72 ++++++++++++++++++++++++++++++
 lib/chip.c                 | 89 ++++++++++++++++----------------------
 lib/internal.h             |  2 +
 lib/line-info.c            | 38 ++++++++--------
 tests/Makefile.am          |  1 +
 tests/gpiod-test-helpers.h |  3 ++
 tests/tests-chip-info.c    | 54 +++++++++++++++++++++++
 tests/tests-chip.c         | 32 --------------
 tests/tests-info-event.c   | 22 +++++-----
 tools/gpiodetect.c         | 13 ++++--
 tools/gpiofind.c           |  8 +++-
 tools/gpioinfo.c           | 16 ++++---
 14 files changed, 283 insertions(+), 141 deletions(-)
 create mode 100644 lib/chip-info.c
 create mode 100644 tests/tests-chip-info.c


base-commit: 6e15b78d6e9c956c295c755aed793ffd963b1c53
prerequisite-patch-id: 4c18b0ccbdc27f0478078c520fc831c6f8e99cae
prerequisite-patch-id: 9813ae923bac1692f9558db3c09081c3d088ce78
prerequisite-patch-id: ebd388a7c411a6b730f23a6995852e62c07fb369
prerequisite-patch-id: bf291d6ac4300ed0ef6bf09eb187530098a7a338
prerequisite-patch-id: 3af98e60123f5e4b1199a2e0fb06eb6e1cfda18f
prerequisite-patch-id: 26c5fa12c404c09e78b9dfdf7fab5e3e7afcce4e
-- 
2.35.1

