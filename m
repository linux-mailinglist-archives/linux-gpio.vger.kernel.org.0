Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2098270A493
	for <lists+linux-gpio@lfdr.de>; Sat, 20 May 2023 04:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjETCPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 22:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjETCPf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 22:15:35 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B5119A
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 19:15:34 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64d2a613ec4so1540930b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 19:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684548934; x=1687140934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipc/fH1HtTc9iVCyYaRzRttwn/c7QEusN/EaZt1y0z0=;
        b=YFoAkIkkY0if/ce1ZliQ6xY6jr7pZHf2r62ItYqLU023wiTed7iiydEe+m9KsdCMc8
         Kb4HTiDQBFhEqCZ8fvPoPRgAcf3+0ybQuUicDG+E8qnpOlfCcTbwBhDiF3gM9R7tPmuV
         nOJCCjW58DhUrcxXoZA4xbkq20tnU16zxMXN9a10Ap3MvnGkLGQZc/H1+AirKGGIM8q0
         E4QRTAeLnmNGzj+le8dnTfd1m0oKS3bRlkddD3E/MKlWygYgJAZyP5ag3WDwshFMEUIL
         6ZGH0qyvLururZv4tORc8hLIMX0NAI1arlh71oRxSIA8P09IW+OYfOotEpg+L1/eRVeO
         0P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684548934; x=1687140934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipc/fH1HtTc9iVCyYaRzRttwn/c7QEusN/EaZt1y0z0=;
        b=ZvVgdnXpwls1AEMWaGg46mk5aN4vG6uFYbMkp4tCLprSDUvDVaAd59/r7akC0vsamG
         jOTnA8ivzQb8naDZwqbMnjmTB3shHl0LGNQFPtrQ2t5VhvSclH+tcSu9OG9I7rBN2Gtg
         soBXn67UuzXVAzxdzbR9S7hqn2V5JlwYSG8K3UlM6Nhc4637vXuWTmYdzM2e4hqq8tRL
         fhAgssistso3ulYFbiVTIvGeBDvpLw15wcmzekxokvONJQLKCOSDLRNdn/cAXgNtiaSH
         SUMG48/3Xjqhe/pZ0NT/3b+v6LHO/HlUGvBs9TvtuGu+Lv57GzZ5zQiVAM5OgAhhBlNG
         f/ZQ==
X-Gm-Message-State: AC+VfDyhzghXC4Xu4NTu6YpO1gzJ+9eh6w8xMmw6cSXxVBEaORKBF9Ea
        xMOeckrCjkjIDkZcvSzF2Fschi5LJMM=
X-Google-Smtp-Source: ACHHUZ6ClJTY+6NhBb+J0E28XjN1ZkzJ5x6ygjekF0QlczY562ehyHVQnUqSkeEi6Dnkbmg5tAWN8Q==
X-Received: by 2002:aa7:88c4:0:b0:64c:c65f:7322 with SMTP id k4-20020aa788c4000000b0064cc65f7322mr5550325pff.30.1684548933835;
        Fri, 19 May 2023 19:15:33 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i23-20020aa78b57000000b0063d44634d8csm308938pfd.71.2023.05.19.19.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 19:15:33 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] README: provide more info in Contributing
Date:   Sat, 20 May 2023 10:15:09 +0800
Message-Id: <20230520021509.12135-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
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

Add more detail to Contributing to make it easier for new users to
contribute.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
I was tempted to add something on formatting with clang-format, but I'm
not 100% clear on the formatting policy myself.
Would be nice for that to be clarified.

 README | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/README b/README
index b71739e..8e726fe 100644
--- a/README
+++ b/README
@@ -275,8 +275,16 @@ were selected and help2man is available in the system.
 CONTRIBUTING
 ------------
 
-Contributions are welcome - please send patches and bug reports to
-linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail subject
-line) and stick to the linux kernel coding style when submitting new code.
+Contributions are welcome - please send questions, patches and bug reports
+to linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail
+subject line).  Note that the mailing list quietly drops HTML formatted
+e-mail, so be sure to send plain text[2].
+
+Code submissions should stick to the linux kernel coding style[3] and
+follow the kernel patch submission process[4] as applied to the libgpiod
+source tree.
 
 [1] https://github.com/bats-core/bats-core
+[2] https://docs.kernel.org/process/email-clients.html
+[3] https://docs.kernel.org/process/coding-style.html
+[4] https://docs.kernel.org/process/submitting-patches.html
-- 
2.40.1

