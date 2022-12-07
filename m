Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB85A6456B0
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 10:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiLGJjr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 04:39:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiLGJjq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 04:39:46 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE591FE
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 01:39:46 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id b11so17062606pjp.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 01:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TCgNsi9ymhWYrl10XGWSQGThDlJFjwp5Yf1lpWAHlU=;
        b=F0OdA3x4ajoyU1MDppxgL8NS6t5OYFX9sROKNKzD6VErqX5/RaJ91j0dHf9DvCXi55
         Oo3PcrKNGR2Sd25I70PoZBjdxNXEvthqyqXqMSMmo056nzGA8+K/3rdEdwSP16RN9Kqu
         1hGG/8CPZHQwMecf/JPJnvZog7fh0dldOhRPe6UEYoTa8qurt/IMZ+Mnsokw8xQyb0cM
         HCS0VGR4sHpsKZrOYThsQz+PumqSeDKLR0aAMoqK45larO1o/k0shRrMfl85dN4fWOYQ
         5aMLDN+SM7ZvomViSIk+dWB3I9z4smPDYKmjYsD1XZoCMPjn97KlFJIO2gcnC6Dp9Nao
         3nWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TCgNsi9ymhWYrl10XGWSQGThDlJFjwp5Yf1lpWAHlU=;
        b=NAwrq/O+uQjvvUJWu4X/EUdRygs6FXlZNyKmDEclcCAt3unEvhjzBRqGsvBdiXUZiY
         eZIjUnw6IO1J7p4/8ZOJngFkK5MxiaqEBbyjCtrpN845De9fRkYbI3c7TiGryGRHLmpX
         fxD94lRl/lW+cuVYFJiNlQSkotKmyX6F88lZF8kJq/tmhcadVqTmmj5g1ShpPSDqUqPT
         wpjQDowWgY8xHm5xoOR50fLxzMoiBN6M0/lq6IbA0KxVxRHGm8Zhf3VdUIAiDOgGkd8z
         xPStK10KZ3PhHLI+cCNALGkr91/ZtiNULhBJAT4gCSJIy3vyIec1CJzGHANE9Aw6oCBr
         zojg==
X-Gm-Message-State: ANoB5pnjTra3dduZ2UgGnaAO57vE5XC3x6lNqnTrTTHIcYQgKHWdmbE3
        9+rdB9qfjBvRibtVZ8zSf5CwjR4JwZE=
X-Google-Smtp-Source: AA0mqf7HDY87waWdMXB4S/2ooOUYXRQE6BoHaHNWomAeBgnPe9umpOFC3RiCZZGMW6v0oDJMfj8gng==
X-Received: by 2002:a17:90a:b706:b0:212:e75b:1602 with SMTP id l6-20020a17090ab70600b00212e75b1602mr97466846pjr.139.1670405985348;
        Wed, 07 Dec 2022 01:39:45 -0800 (PST)
Received: from sol.home.arpa (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id r5-20020a17090a438500b0021929c71b14sm792036pjg.40.2022.12.07.01.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 01:39:45 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] tools: gpioset: remove pointless whitespace
Date:   Wed,  7 Dec 2022 17:39:37 +0800
Message-Id: <20221207093937.62048-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove pointless whitespace in interact().

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpioset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index c49d229..68b3922 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -842,8 +842,7 @@ static void interact(struct gpiod_line_request **requests,
 		}
 
 		printf("unknown command: '%s'\n", words[0]);
-		printf("Try the 'help' command\n")
-			;
+		printf("Try the 'help' command\n");
 
 cmd_ok:
 		for (i = 0; isspace(line[i]); i++)
-- 
2.38.1

