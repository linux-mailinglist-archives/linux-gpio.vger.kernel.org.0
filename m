Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6760729EA9
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 17:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238515AbjFIPg3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 11:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbjFIPg2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 11:36:28 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDF826B3
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 08:36:26 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-662f0feafb2so1483354b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686324986; x=1688916986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rr/b2Wi7ApfDyv4OLEzKOoRxhdboVK21GxdL66JxQUA=;
        b=l+uTps51AMSzUGmrvrzOzD3TLR3Bgi8nU4lZ8sxsO0kQF3lAIJU45ZQK/HOirX8huM
         L9JX4BU9WevW8IiVvtou43pWq2LyGcx6pirJeDMHcn2ZpSqPvxl2/CwBdPpZvxUjfq8C
         9LnN6lc3IWt//lqOLEW4KxejfGosa00xMZzOag74BpcTmKSjmwUkNVmSFc7uy0UBpLBU
         pIbwQ34GenW1hpSHrgneYGFLYJ6BDWcIq/YaSTosU8AcS14pRV+IvRtooWbjcYnEBjvH
         SoltYzQfnxJGNG7/eCbTtdoEYURnnYkRYjFfGwWJ5gYWfSXr1quQEarHhuB+ya8s6KXk
         qhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686324986; x=1688916986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rr/b2Wi7ApfDyv4OLEzKOoRxhdboVK21GxdL66JxQUA=;
        b=R/kj3nQNgILjdbf/9A0FGIQtcJ7PENxp3fjxAHCorvKyDtcze12Y4lHzYdGOfUgrzL
         /kTzqewpMjxV8E7iEBMf5IJeumv1mIYziNULkGAYA0ErKNtZmUfgrDW3BmCcfoY5xIAm
         E6brdMrkhlld55jXghq+snVJnef+sZgcQsmxovDE/SRXRexFeFtXPg+Zp62WT7lKzwsL
         wBODQ7Mo1FN9L/BF5uKcWjtYILu5YNDsQvjg8EGPQB5yIZ96SJsLUiBk9FtHHboleBmW
         VXqu2PRAOkwx6CwY1geCmfp+nfjClCuqfwXc8ZSaWyCn2P/rJ2Albgh2NfpCyKJTQKKm
         DMwg==
X-Gm-Message-State: AC+VfDxNinfp2FLusuis9Rz/rPveikWtgWtES5T9Yj+q0UxqYmmwgxUD
        RllKZNH6/+gr/MDlePFmFKMIWl5gEKY=
X-Google-Smtp-Source: ACHHUZ7FcEUt+mUsoIDQRUS4UEdSWKZ8w5pyBcrG2SfwWwEQI1S11I8yxmTRIOnhvhaP4oGO+eSPvA==
X-Received: by 2002:a05:6a00:994:b0:656:5182:5e61 with SMTP id u20-20020a056a00099400b0065651825e61mr2449434pfg.2.1686324985575;
        Fri, 09 Jun 2023 08:36:25 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b0053051d50a48sm2850288pgp.79.2023.06.09.08.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:36:25 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/2] fix potential glitches in bindings example gpiosets
Date:   Fri,  9 Jun 2023 23:36:05 +0800
Message-Id: <20230609153607.133379-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A couple of minor fixes to the bindings examples.
Noticed the python one in passing, and fixed that, then checked the
other bindings to see if they had the same problem.

The rust example is ok, but the cxx example has the same issue, so
fixed that as well.

The checkin comments are virtually identical, as they fix the same thing
for each of the bindings, but the alternative of combining them in one
patch seemed weird.

Cheers,
Kent.

Kent Gibson (2):
  bindings: python: examples: fix potential glitch in gpioset.py
  bindings: cxx: examples: fix potential glitch in gpiosetcxx

 bindings/cxx/examples/gpiosetcxx.cpp | 25 ++++++++++---------------
 bindings/python/examples/gpioset.py  | 10 +++++-----
 2 files changed, 15 insertions(+), 20 deletions(-)

-- 
2.40.1

