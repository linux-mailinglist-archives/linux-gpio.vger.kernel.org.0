Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE7154C569
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 12:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbiFOKFU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 06:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346667AbiFOKFO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 06:05:14 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA694990F
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 03:05:13 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id s12so22195709ejx.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=qYO1cFi0puhmKXWyTpad99QlrmN9AJl0Eu1Y1xIfVvw=;
        b=L9BF7G8oAFr8wvWZj2ln7lIxKL017IfKgQjZa7hb9w0Tz3UxSC8GBTd9V8ru8OsXc5
         1lkSDvwrmZA2C/qJju/KORjkgXw6taYsLD+7AHR7hmZuojvRAqElPtSesUglKwAqw3NX
         Z8J3nLyM30/W3u2Kr9Jp+W0ei9o086XlOicxoAGNEeM426d/fKkp1eCXxUKoYhg0Ioua
         cKM2yR0qyST0Rt7COPGZ+lY97oWZTD8ypfMSuQ00oT18Cj+HC5QOw3s4tHAXFz//2NOh
         bODwBEv+4vW4OPU0/ih7Tsy7WVsaOqJEllcywKfaOJ6HEpQuoq5zRwsU/BZdYOn6PMLU
         +W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qYO1cFi0puhmKXWyTpad99QlrmN9AJl0Eu1Y1xIfVvw=;
        b=twFbxsYDftghop1jrWkM2qCjJNn44w54sNOsvcpXKTpYVygSQBooL+8HyKU5WvofaH
         KBYTkmGT3hIuZlMhNLZAbQ7Rl/ZcikN36OtIcF2npTv88Mn/8NC8UQZzn85ZvXxzB6YD
         W8a+vhRooNBcZ6yGTuAA8nxGMYQJPwBRDqx0qEkn6fqT+WafORCLYSVT9HwHDaYVBoq0
         BX1BzLfcLGB8VVthLKbn0NPyCV+djIqDDPK/AzCc4C8ql4rXYU170zicd6pH5VXbpNB0
         2AZUIDTbq5DvqO0jilwiliBJBDWzKskPQdYtFJ1ZSXApO1l9tePBCvOUVN5sUULaEUwX
         Cdlg==
X-Gm-Message-State: AOAM530IL3TezaPVsTpdmPJYvRLulNq5vZl9sLL+3Xi7lmPZu3QaHj6m
        Adbn3v+diuiQ7aJen5kt85Nr+R8RDzz6yw==
X-Google-Smtp-Source: ABdhPJyHMU/YI1bFUnIpOcfNpVLQdkvMlPFZGUjo4pJRxTPczhm/PGryDyqvLlNikNeikstbv8iNZg==
X-Received: by 2002:a17:906:7049:b0:70c:a5fe:d4f8 with SMTP id r9-20020a170906704900b0070ca5fed4f8mr7931309ejj.493.1655287512020;
        Wed, 15 Jun 2022 03:05:12 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709066bcf00b006ff19354f9fsm6103669ejs.215.2022.06.15.03.05.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jun 2022 03:05:11 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-gpio@vger.kernel.org
Cc:     brgl@bgdev.pl, Yegor Yefremov <yegorslists@googlemail.com>
Subject: [libgpiod][PATCH] gitignore: ignore ctags generated tags file
Date:   Wed, 15 Jun 2022 12:05:05 +0200
Message-Id: <20220615100505.3972-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

This index file will be used by editors like, for example, vim.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 2d7cc7f..24136ce 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,6 +9,7 @@ doc
 *.tar.gz
 *.patch
 *.swp
+tags
 
 # autotools stuff
 .deps/
-- 
2.17.0

