Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE784ED137
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 03:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352298AbiCaBOY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 21:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352296AbiCaBOW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 21:14:22 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBECE66C8D
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:24 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mj15-20020a17090b368f00b001c637aa358eso1300860pjb.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 18:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AefIuC4rm+GeraSOrBP2sRV8khqpEosEd9Wd5Xqzs9Q=;
        b=NKigok4mojsmjnkOLMqs9pRj22pZcUjnz6rvdjD76bV01+0cxSAFHKz8L0gc9FnVIq
         wuOU0+2l2Bp8Uoo2yqeoCLOKJB3IV1Ek98jSPthkZ/pRyQy5rUFfKnMeqzMBDAToDXiD
         l37yPTscb5CRoV2G3pWMV3LzASP+eltmcpoKwAKbll1DBr76kXAd0z7siPt6ffMNCGUD
         PpURYqL3zkW3AfAVXbtUsRtTNPkREoYlNNEkRK9/moqZKPFOZSNMbmqW4w4y+GOZrlZ/
         6ld6MbNltOL+NxC2WSrGGMR8IWk2o3ETEgX99CFJabYnLbY8S1lU7ZA0Y1fHsiCPxt5V
         jGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AefIuC4rm+GeraSOrBP2sRV8khqpEosEd9Wd5Xqzs9Q=;
        b=PhnsniiC9Jhw13qRAWp1+8jXdFsgqJEzYvAIqf+G/CUK2FGDUCPYkedsR749keO+sF
         0i4lBWfMTwa+GV+sxZqDR56s4eugKsMnf47k0x2fC9RtO/alkS1QAD13Ahjl8ZhU/qgK
         +f8yOlCCM3YMTVm9VmKUt0QjlFbKgYXkNIFS8pf7mYYImeLuUAc//igQNwzlFPu9iFg7
         Lx7xKnKrxUZcf5+5IYkZVA+pJJqq/FBHdRml4AWi5cjST5nGWt3LhZMHxI9oWJIKrlyk
         fGsYit8SLWCHHQC+tMC/EzQohyus7094l8KOE8MsaRXzm51KBjvGPT+QZepTaESQTwS/
         ChLA==
X-Gm-Message-State: AOAM530y/NCvLNrslhAUAqEex+V5w7L8Gvpec4IdelZsbaGxt6uljAD3
        zT6lXgPdj642saYvd2gB3hlo5b4MWNwSHA==
X-Google-Smtp-Source: ABdhPJxWivlx7I5pewcoBkZyqHSKoCB74D5qs12gd+P08p+U5X2D9eMsP6ibhWWhOcWtkfWCUZLPTQ==
X-Received: by 2002:a17:90a:560a:b0:1bc:72e7:3c13 with SMTP id r10-20020a17090a560a00b001bc72e73c13mr3052601pjf.246.1648689144023;
        Wed, 30 Mar 2022 18:12:24 -0700 (PDT)
Received: from sol.home.arpa ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id e6-20020a63aa06000000b00380c8bed5a6sm21232176pgf.46.2022.03.30.18.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 18:12:23 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 2/4] tools: rename inexistent to nonexistent
Date:   Thu, 31 Mar 2022 09:11:39 +0800
Message-Id: <20220331011141.53489-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331011141.53489-1-warthog618@gmail.com>
References: <20220331011141.53489-1-warthog618@gmail.com>
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

The use of inexistent is virtually nonexistent, so switch to the more
usual form.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index 69ad786..32c3861 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -309,8 +309,8 @@ teardown() {
 	assert_fail output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
 }
 
-@test "gpioinfo: inexistent chip" {
-	run_tool gpioinfo "inexistent"
+@test "gpioinfo: nonexistent chip" {
+	run_tool gpioinfo "nonexistent"
 
 	test "$status" -eq 1
 }
-- 
2.35.1

