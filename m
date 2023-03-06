Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFDD6ACCEB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 19:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjCFSqE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 13:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCFSqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 13:46:03 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0593E625
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 10:46:01 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id f14so4426985iow.5
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 10:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google; t=1678128361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B+iVwscJCQd2bPBDO1UN8rhe3U3KagWA9d2piwIn/ps=;
        b=cR76CUBEfEcAj95Df5gYuyhK2CsCQ9C146OD0rNEmArJ+w5B4gL8ZGfWVpoIbqrDjX
         uQIRP0DSaLxCo2thuJKeL5QgP7vTKM1PTfbuolwWCm3XVt+7Q5EkEXB3y++mNSrMwrGI
         nzS+j9oOGdsY6UUvMRRlHqW8D/DMul2St6YmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678128361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+iVwscJCQd2bPBDO1UN8rhe3U3KagWA9d2piwIn/ps=;
        b=JD/6M5Mg+uRpnKtDd0In7N8tmf8hZrWdpLpIC0Wpoa36/zmSLMVirEwKH9alqcu/uY
         drjT+yLkM+adABhV3gTpMZlFOu1MAjtKgE6NHkF0Q2hw6FYWSNz2d168lGXdy6wpuE1c
         9wt/Ra1F8lzHE7rRmPFbUXLEQ4Aw6gGpzO6VjjDTFDFDdxJOWu05f4HBXvT3WgBFr2rc
         GnyqKbSEYGKqgwbmaCcSo+KJVG/yPJlT3aQvs8UuFB9SPGXm85gS4Yq+70NINWT9UXB6
         JbQM/E9uqkdg/khB0rRnV9Zwonq0N43fUyHN6PHZ+8aF/A427kn8A2Urkp4pr67pFCsW
         UFEg==
X-Gm-Message-State: AO0yUKXfJU9HehA/pcXn8Fc8m4eYshEEYGqRVm1LMUSED3ZnPDvke5Mc
        0wMjOl8F2NPhg3gp3TVsfWmaGesbljrHTMnROKM=
X-Google-Smtp-Source: AK7set/tmaRIQ6sTrk/ayn+6CWRlBzkhdbDPq5NgnyDGzrfxHUWXhGOOEWmwnNwLZvNvVtPAh6sIPQ==
X-Received: by 2002:a6b:e306:0:b0:74c:904a:612d with SMTP id u6-20020a6be306000000b0074c904a612dmr7197137ioc.21.1678128360785;
        Mon, 06 Mar 2023 10:46:00 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d8e10000000b00746041ecbf9sm3467893iod.39.2023.03.06.10.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 10:46:00 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v4 0/2] tools: fix compile issues when GNU extensions are not present
Date:   Mon,  6 Mar 2023 10:45:43 -0800
Message-Id: <20230306184545.1316993-1-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v4:
- Keep semantics consistent with before: help messages should return the full
  name, not the short name. (Bart)

v3:
- Collapse --version print into a single line. (Andy)
- Handle program name fully independently rather than rely on any extensions
  at all. (Bart)
- Move Android.bp into contrib/ folder. (Bart)
- Add SPDX license tag and clean up Android.bp patch comments in the context
  of it possibly being accepted into the upstream tree.

v2:
- Add missing Signed-off-by: tags.

v1:
Fix issue when building against a C library without GNU extensions, such
as Android's Bionic libc.

A commit with a sample Android.bp file that's working against Android 11 is
included for informational purposes, which I don't expect Bartosz to pull.

Benjamin Li (2):
  tools: remove dependency on glibc program_invocation_[short_]name
  contrib: add sample Android.bp to build within an Android tree

 contrib/Android.bp   | 136 +++++++++++++++++++++++++++++++++++++++++++
 tools/gpiodetect.c   |   5 +-
 tools/gpioget.c      |   5 +-
 tools/gpioinfo.c     |   5 +-
 tools/gpiomon.c      |   5 +-
 tools/gpionotify.c   |   5 +-
 tools/gpioset.c      |   5 +-
 tools/tools-common.c |  34 ++++++++---
 tools/tools-common.h |   4 +-
 9 files changed, 183 insertions(+), 21 deletions(-)
 create mode 100644 contrib/Android.bp

-- 
2.25.1

