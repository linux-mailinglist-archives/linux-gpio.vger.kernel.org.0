Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7654ED138
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 03:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiCaBNt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 21:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiCaBNs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 21:13:48 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F276766222
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:02 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id t2so20459563pfj.10
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lc3P+EKITHiusJACtW4XdQUkN86IjqDIixOWUg35gh8=;
        b=Ns1wth4UwRecnzd/ue5in6iGbScOIg/e9P6o4JMlAbPpaaOs4U4CZ/CVrmSTi7VhQ7
         Fvo7QMvKQHoPiA/8UOlHrBNwIxrnESQq3s8CWZFwJkyj+14e/Yr0br6+9vd29LMqCK6g
         gzZ3HIpjOe+2IR1uGm1FU74CMeAWUSvVo9lVRFH1pRaja11QlNtmqBDld6C7r9ufMV3m
         hp/CJR/Bm7yW0mKzBbcfIE4p42C/8+XpeqZanVcpv4v1NH4Bc+wHOagKJC5AhWSKCXtl
         H+2ya7lClIAKUzbT0UIQq8ku0qUX8kU6Cm8hXJ1hpbDtE8GunWZ67GMM9JO59UFNV5rL
         SOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lc3P+EKITHiusJACtW4XdQUkN86IjqDIixOWUg35gh8=;
        b=mxg6Ig4xoLIXXKGQLGnQlOAa4kURP4UhMU7YRIBAkkrLx1VXI/PyVFNVWmXzt7pdHW
         CSgxhQe42CmqBLVGF0MlCsfph1hdrpx41Kseds+jB/wTMSFBcKgfBxymvBaZpb7xtSdU
         etl+r4ZwayxD9wvuI3yfZzwNvrr9W4pj30/K3RWHbOY3Wyx772AnQKZ5Td1CuIopt/OF
         MkFThXhp+fUvLX9KcBfb9opbj0rnQt3dYXSfNzfslvYG6kEFYBYK6AwdeehliipVnKDX
         g8t8sPnGUaYhV6FZVAJyTyA+96vVpgHHXXmL7zFhQDvO+XnrC3uO3jIOgeqFkbppbLkW
         ueyQ==
X-Gm-Message-State: AOAM532DP5hu/2TeVMHmmirow8zEOu+/EQPHhwlgPfzyIUhFXGWgU2+k
        2ixGncdH22+50Wkwj1h04slz0s+MugRmUQ==
X-Google-Smtp-Source: ABdhPJxNggJGOaFqBUMNcTaFbOq+nj1/st3V25Ho99Edg9UpKg1U4XRuH6VFS2xJul309r0GAD9+xA==
X-Received: by 2002:a05:6a00:1991:b0:4fa:fdb8:8082 with SMTP id d17-20020a056a00199100b004fafdb88082mr2598281pfl.20.1648689121950;
        Wed, 30 Mar 2022 18:12:01 -0700 (PDT)
Received: from sol.home.arpa ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id e6-20020a63aa06000000b00380c8bed5a6sm21232176pgf.46.2022.03.30.18.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 18:12:01 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 0/4] core: add gpiod_request_lines
Date:   Thu, 31 Mar 2022 09:11:37 +0800
Message-Id: <20220331011141.53489-1-warthog618@gmail.com>
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

In my review of the CXX bindings I suggested a top-level version of
Chip.request_lines(), and possibly a C API version as well, so here
is the C version, plus a couple of semi-related tweaks I made along
the way.

The first patch adds the gpiod_request_lines().
Patch 3 migrates the appropriate tools.
Patch 4 minimizes the lifetimes of objects in the tools as I've
previously seen confusion over how long lived objects need to be.
Patch 2 is just a rename cos "inexistent" looks weird to me.
Strictly speaking it is fine, but unless there is a problem with
using "nonexistent" I would go with the latter.

This series may be require my unsigned values patch.

Cheers,
Kent.

Kent Gibson (4):
  core: add gpiod_request_lines
  tools: rename inexistent to nonexistent
  tools: migrate to gpiod_request_lines
  tools: minimize object lifetimes

 include/gpiod.h            | 15 ++++++++
 lib/line-request.c         | 17 +++++++++
 tests/tests-line-request.c | 73 ++++++++++++++++++++++++++++++++++++++
 tools/gpio-tools-test.bats |  4 +--
 tools/gpiodetect.c         |  2 +-
 tools/gpiofind.c           |  2 +-
 tools/gpioget.c            | 25 +++++++------
 tools/gpioinfo.c           |  4 +--
 tools/gpiomon.c            | 16 ++++-----
 tools/gpioset.c            | 18 +++++-----
 tools/tools-common.c       | 50 ++++++++++----------------
 tools/tools-common.h       |  5 +--
 12 files changed, 164 insertions(+), 67 deletions(-)

-- 
2.35.1

