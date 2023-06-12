Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF16472B589
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 04:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbjFLC5N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 22:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjFLC5L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 22:57:11 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5649A122
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:57:10 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b3be39e35dso9779855ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686538629; x=1689130629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6ZwPg3TMl2mEn15BHwOg+vGBKvg2Hpf9lJyJ4QMAEY=;
        b=QFNBlGnuar8/WtxSeDxtCa/KQ72h3KPhVMGBhOafkMBgaK5FmSidb1YiixEdF2g9We
         LLJCINUFBtz+kMvud6+C5HPsgJ3l8bQ+tNHxoD5af5iaWPfh7BT4a1cecqwWttUeHjYq
         Qt2Sobhy8cV8jBHK+0PZ7cH+8mw78L7UxafSFgBHXKLSGMhtJd+GTdts2gDUVxeGQFrO
         rMBUHD8Zz9D8VwdY6R/C+iObh1HvaakqUmP8eRN+UronbPn9GzKBE83kQEjHiR99ELKZ
         zYnyJfkU7XVCQSGXemtPosQv5f6k/RhjRnlgImdVnExA4YcOLnD4sTIxdsMvXY97pxzQ
         bNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686538629; x=1689130629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6ZwPg3TMl2mEn15BHwOg+vGBKvg2Hpf9lJyJ4QMAEY=;
        b=Yh4d5farivn/QLHKLpdad9fBEvre0BrkEruTJmlPusxD1wQ0R+PBRQciFHVj5/W+iZ
         h3f56ZrzrRzMmRUYGP+Dis9uQAPwA9wSU+FzG52W4lGHyEwocjJPQ5mvqtgWnBp/dKQR
         yG/JNMGikBG2kIZ9Pd9vgsRfX2nFm8RXxaP/jAnB0oc8hF2N/gNf78Ce3Rb4kTKXhiZU
         ky1YZ1vf8bUMQET0feVgFjnEAJMx2neo0VHl7FFzZ/MYQi12SDqwBxwFgBoOSUukYbai
         6bG7VyCGm+qAWCE2K4SusjOL9lzl8eO+Q01ia+rWJQS7z02mbKyAvGq+ZSW4rbP4nNU8
         r6Aw==
X-Gm-Message-State: AC+VfDxCy47i987DvgZFulEja54a9t38tiwyTR4N+9+HmZPmbBlIFsoZ
        YlRzdlkMzdjUSzvcw+dgpqN8HEP87Og=
X-Google-Smtp-Source: ACHHUZ6+GtT4uXma3MpTVWwrS7oJexk9S7c3hMppmQy/LXt2YLwmn+nXYoM6NKknWX2yLOqvSF5YcA==
X-Received: by 2002:a17:903:32d1:b0:1af:cbb1:845 with SMTP id i17-20020a17090332d100b001afcbb10845mr7016864plr.16.1686538629594;
        Sun, 11 Jun 2023 19:57:09 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id jm18-20020a17090304d200b001a1d553de0fsm6980992plb.271.2023.06.11.19.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 19:57:09 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/3] tools: tests: minor coverage and
Date:   Mon, 12 Jun 2023 10:56:39 +0800
Message-Id: <20230612025642.11554-1-warthog618@gmail.com>
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

A collection of minor testing improvements for the tools.

The first covers gaps in the test coverage, both newly introduced and
historical.

The second builds on recent changes from Joe Slater to speed up one
particular test.

The last is for a problem I ran across some time ago when setting up a
minimal yocto test environment which lacked ncurses and made bats behave
badly. It doesn't alter the test output, as far as I am aware, as bats
defaults to TAP.  This is really a workaround for a bats issue, but it
is easier to fix here than there.

The series is applied to the current master, with Gabriel Matni's
idle-timeout patch v4 applied, on the assumption that will land soon.

Cheers,
Kent.

Kent Gibson (3):
  tools: tests: add tests for idle-timeout and debounce period.
  tools: tests: speed up continuous toggle test
  tools: tests: force bats to use tap output format to remove indirect
    dependency on ncurses

 tools/gpio-tools-test      |  2 +-
 tools/gpio-tools-test.bats | 89 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 87 insertions(+), 4 deletions(-)


base-commit: 9788bdd3d6791205431e65366dcc518446f7ca6a
prerequisite-patch-id: aab58a4a70a7d7d18cc8a0e72580e605ef1d5dc6
-- 
2.40.1

