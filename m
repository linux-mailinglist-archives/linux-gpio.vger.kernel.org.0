Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEEC4DA7AC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Mar 2022 03:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345533AbiCPCGO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 22:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbiCPCGO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 22:06:14 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AD75E17B
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 19:05:01 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id mv2-20020a17090b198200b001c65bae5744so102135pjb.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EAbwW0iRgk2cWeylq6I8VH9mHzZdpcW9APCkJWtYYCg=;
        b=XSevVr2yEUT/CzfQx++YdpBLyCWW+o6xYkuh7J7692FSSnP6udxCowoFTQVqu7drCb
         lpNNxCw0xYD053nElviludmsybk0illFoR+Gv+sgIRLOr9amcz5nov6yr4iLu3NrhEVw
         de3gb/SjCnSrTDvc7dltxfkk5fw1vEW20Ww2aupJOab2VN6rSmb7vo+ES1Tu+pT8c4EH
         pOyNcrCWTOSwGqX/XlA+19PE0QABZhCj48jz5D1HjYpngJeEm+aB0i9uvJ9GEZ1JMExe
         hGqCM4qeDko3KCXPLrqfah8COsI0sgaxkdh0oB7t1p4xYcXN3WSkoG7xCaN+6uZj6lgT
         7P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EAbwW0iRgk2cWeylq6I8VH9mHzZdpcW9APCkJWtYYCg=;
        b=spKS/KYWOYTvj5b/H3ttuxnck0u4ddLWnkYnwYpE48zOpyWKpCpZ4Ez5Zv659DHmOs
         d9VLUSyfNMO7qheN/vq6x60GS3z/I4DKMO6AdM98NcIJkvrFndwZ2ERsisKxTU2JMtOd
         zfnek44K0PXswUy1PrK2+p68dNM0A/VwIDGGeiE4+Pp6p2g3I5zpgwuYkgrz8jU5Yhtd
         gJ13dk5V4uXf0glsPx0/DhlBnB6s5VSwbTO/nu2Yg0+giMEfp7x1sR7Leeyk9gS/Pv3i
         dPRMhTok+2Rr+iJoFa/GarmD1+z1bo0MtiXg55zl/yaYBj9b53Pmv3fceXUt23Bor177
         7l9Q==
X-Gm-Message-State: AOAM532K32AXS1UpsqBMfYn6XyUR2JCJzGCvnBqtNvKt3gf12C6RcnFW
        vPAaNtXLbTqCcSHJ566Bf34mueD81lVlbw==
X-Google-Smtp-Source: ABdhPJxa6oWnGejgJhDwr068U0MCdhlIoz1hwHoGK7gSWi7zTsN3t5KPX6WTuxvTIJUFkjBdCueDwQ==
X-Received: by 2002:a17:902:e8c2:b0:151:cae6:46fa with SMTP id v2-20020a170902e8c200b00151cae646famr31127180plg.164.1647396300466;
        Tue, 15 Mar 2022 19:05:00 -0700 (PDT)
Received: from sol.home.arpa ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id u5-20020a056a00158500b004f745148736sm436885pfk.179.2022.03.15.19.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 19:04:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 0/3] doc tweak corrections and renaming
Date:   Wed, 16 Mar 2022 10:04:38 +0800
Message-Id: <20220316020441.30001-1-warthog618@gmail.com>
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

Another small series of patches following up on the two recent series.

The first patch is the corrections for patch 6 of the original series,
after omitting patches 2 and 4 and fixing conflicts and some other renaming.
This brings the conflicted sections into line with the rest of the docs.
There are also a few lines unrelated to the conflicts that differ between
my tree and yours.  Not sure if you have issues with them and dropped them,
or something else happened along the way.  I don't see anything terribly
contraversial so I've kept them in here.
And there is an unrelated indentation fix as well.

The second is using num_values more consistently.
These may actually be more corrections for doc tweaks, that slipped
through because they didn't conflict, and could be squashed into patch 1,
but kept them separate just in case.  And there is a corresponding code
rename as well, so it isn't purely documentation.

The final one is completing the renaming of "buf" variables to a name
more clearly indicating that they refer to uAPI types.
And renaming the conversion functions to match.

I think that is everything for the core for now.  Hopefully.

Cheers,
Kent.

Kent Gibson (3):
  doc: API documentation tweaks corrections
  core: use num_values rather than num_lines when dealing with subsets
    of values
  core: rename uAPI related variables and functions to uapi.

 include/gpiod.h      | 51 +++++++++++++++++++++++---------------------
 lib/chip-info.c      |  2 +-
 lib/chip.c           | 24 ++++++++++-----------
 lib/info-event.c     | 18 ++++++++--------
 lib/internal.h       | 20 ++++++++---------
 lib/line-config.c    | 24 ++++++++++-----------
 lib/line-info.c      |  2 +-
 lib/line-request.c   | 50 +++++++++++++++++++++----------------------
 lib/request-config.c | 12 +++++------
 9 files changed, 103 insertions(+), 100 deletions(-)


base-commit: 9d5112d0448fb2436e926a36842ff5ca365303c3
-- 
2.35.1

