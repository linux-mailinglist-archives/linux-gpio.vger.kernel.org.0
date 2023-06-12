Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 401DB72B58C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 04:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbjFLC5r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 22:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjFLC5q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 22:57:46 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6111E44
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:57:45 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-65311774e52so2926811b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686538665; x=1689130665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a61e9pb6myCg/Irl98/s7srinV9PfhfA5Lc7nVYELq0=;
        b=DRDMkQAFgCSMArfNBTu8BEf3GT/FlgTiwNWPBn35r11PnXCbDzvh/5mpkbgMAF54rX
         pZElMVImp/rowhySi31RQJceBuBriUzFa6gkUsvJJFoILRTJaZrsId8wsjIpytuEPood
         5+VIEOsv84cIwdGz3cisku1RdkRwQvw3lrAUIm9sF/JhfldjUOWj3LAkpmNhBRDq23eu
         VMwq693D0QGq1C3wGM/BjJ/4c9HgSxZBXsZZS1cilLilt/7kDx/CUOUB2QqallO0+SdB
         D7FXmZV7RB9ffSr4fpcKiJUl1SKARH4tUq+82qhDb3HjTCGueM0epvANAbNy8HFpre1m
         +gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686538665; x=1689130665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a61e9pb6myCg/Irl98/s7srinV9PfhfA5Lc7nVYELq0=;
        b=P0+RTqcQLBic5PHo8jNH1UVVL012477K8CJbaPxDPcRE8Wb8i2pwiy2RX43p+aQE9M
         I66SVP28kRxcClAEj+HYV4Oq4hDNH1LJ0yzk6V/L6Kq+ZBT22stqrh2CRYaGcAWO1tnr
         7SGS3FuVTojCy5ZP8RlhOyazvlJTrjCyqIhLmOrF6L0IWnun1AqkJEr20LlQvI8xNYwe
         tqkiCcBur9xD1Dp/S4aWS7DUCofKhH2HwAJiwJ7j9ieOFwaY8y6s3uf7RS+aQnh8Y6wK
         h3inVnRXlklYQevTPw7yvzwuvY+04Fs9FD9dEQqJOfNidcE44hrVBQQgcbyAJv7qaEfN
         STgw==
X-Gm-Message-State: AC+VfDzvOns0DWdgCG/HctvwY8NBFsBiTvB1BxJPezU+VhGwwxLKa7Xz
        F04s4Z23OvAYq8bQxtxPBDiUU2tc0v0=
X-Google-Smtp-Source: ACHHUZ6gSSOVkKTC/8S+T1PDCswlREBMp+Wt8igFX/0m6r1uS1RMp6ocIMYVj+pP6ovqcvDPntEWrQ==
X-Received: by 2002:a05:6a20:835e:b0:10b:8bc7:e112 with SMTP id z30-20020a056a20835e00b0010b8bc7e112mr7682858pzc.10.1686538665125;
        Sun, 11 Jun 2023 19:57:45 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id jm18-20020a17090304d200b001a1d553de0fsm6980992plb.271.2023.06.11.19.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 19:57:44 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 3/3] tools: tests: force bats to use tap output format to remove indirect dependency on ncurses
Date:   Mon, 12 Jun 2023 10:56:42 +0800
Message-Id: <20230612025642.11554-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612025642.11554-1-warthog618@gmail.com>
References: <20230612025642.11554-1-warthog618@gmail.com>
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

bats has an implicit depencency on ncurses, as I found when trying to
run the tests on a minimal install that lacked ncurses.
Rather than make the dependency explicit, force the output formatting to
use the TAP format which does not require ncurses.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
index ed39ed5..441ec66 100755
--- a/tools/gpio-tools-test
+++ b/tools/gpio-tools-test
@@ -54,4 +54,4 @@ modprobe gpio-sim || die "unable to load the gpio-sim module"
 mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
 	die "configfs not mounted at /sys/kernel/config/"
 
-exec $BATS_PATH $SOURCE_DIR/$BATS_SCRIPT ${1+"$@"}
+exec $BATS_PATH -F tap $SOURCE_DIR/$BATS_SCRIPT ${1+"$@"}
-- 
2.40.1

