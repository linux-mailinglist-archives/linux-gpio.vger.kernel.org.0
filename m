Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3236A500F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Feb 2023 01:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjB1ANd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 19:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjB1ANc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 19:13:32 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950D3166E3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 16:13:18 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id b12so5354540ils.8
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 16:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wcDhIaU/1LQaFtqS0bPQwdXYAob3tn/VMSD3s9kLJwg=;
        b=e3tTF5tM0ne3yvqfI4AuVoRpU0XHlhXoAq/jaKD5j4biCvNHsKkgujeIzeEg7iMZkE
         GVHJfGx+fTYHUUtnfLwnmcmn8PseHo8pXCaTJ9AcupQlOM+t2VQXpHBDXR8lPh7LekNE
         2u8htJmnnNGiQSSip65U0mDDAK2sCj9gxAFFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcDhIaU/1LQaFtqS0bPQwdXYAob3tn/VMSD3s9kLJwg=;
        b=MvTSrB1bFlgqm4CD7VJTfBq6MfgsvxNu94HaVLp/tR3vu6t3W1vejaQvSKmlIrfRXp
         RgGDXWa+luZNrVXgYAYVGpKtismYftG4xGtzPzsj67mD2bPDF9V4PGehh1A9GDiHOIb4
         thp3cdJrIDfaqD3PQp1w9/ZL9Ft1Si6ovGWd8ZQl68DZ/YfOcsVChGUCYoVnY0qA4jCb
         1vXfFHw8CRQpiW24W0PtFB3zz2CW5nsCtpSn/EvO8eWODwcWSJa/QqbeKJsq57msRblw
         CakgTYrimthwrlBPsBlDK0b8oV9N1P8xp49YucURM5iv0/xPTFDl5+ZZxIExxNDFPtYD
         7WQg==
X-Gm-Message-State: AO0yUKU7nT855m8VsHgbE06l1w8xo3kutWUqU1ccf16sEiPOQv77RXG4
        PJjXZoWaeKuyg3oxJmE2kXM0rv9T/7CrxAbJvus=
X-Google-Smtp-Source: AK7set+KyJ2xqgEjnXbfao/GqI8zTCyqEw01E5sgfGSsQJfUCHbxwAp6dL7razUXCjHERLdlb5Wd+w==
X-Received: by 2002:a05:6e02:20eb:b0:316:e6e4:570b with SMTP id q11-20020a056e0220eb00b00316e6e4570bmr1259012ilv.11.1677543197560;
        Mon, 27 Feb 2023 16:13:17 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id k9-20020a02ccc9000000b0035678e2e175sm2434783jaq.50.2023.02.27.16.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 16:13:17 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v3 0/2] tools: fix compile issues when GNU extensions are not present
Date:   Mon, 27 Feb 2023 16:13:05 -0800
Message-Id: <20230228001307.249811-1-benl@squareup.com>
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

