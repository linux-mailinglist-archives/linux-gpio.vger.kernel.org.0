Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C55C7423CD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 12:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjF2KQJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 06:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjF2KPU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 06:15:20 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A83735B7
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 03:15:16 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b7fb02edfaso4077575ad.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 03:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688033716; x=1690625716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NOj3wi28honUWM9RPgRICBoErJ3JqoQg5e+Jljp90c=;
        b=OYJFindcC0N4MQ2fkduoaRK6Pi/BG5UVsn3x4UBp8wcSgqur9Hdr1MdIj/MiA2azjM
         TG6WM/tB1TD49K3/O3/0WPI/i7WMU+QXs9tt86yz/cxgiiZHam6s8j+RTx1FeLmH9IDz
         +u4vOb8Khma29zxPkN+Mk/SYHYRORjEA4f69um4thqOH9QnyJQN8IGAmjhdFDxZ+s6i8
         wedtOSkdwD5prVrsYCo3WDVp4xvkqw55AnQC/QaG8UwTDmuVnmLECVEfkuk+uIM8qkTg
         CF4yn7N/wvtzbui9YDLTXiB7HatCrqEUROR++Mv3GuvVNBxv5zYEiXJPJUFT8Qv6NJzO
         xDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688033716; x=1690625716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NOj3wi28honUWM9RPgRICBoErJ3JqoQg5e+Jljp90c=;
        b=XugLPtGU2+yBlzcm9ex3TADyPWvCiMH4AzFWJYp9Z6l+PfF2eVgw8YlHK/1udfNxIa
         592Edw9+a97fKQOxPX+YNg+xXaDWEVcSZJaLvRPTxb2xd3QWboGZdbDKNdNrC05t+GnB
         CpV3BeUV0miQWW4nYwXtaOjXXAP6t9nmAe4pabI214pU7aNcr7OTjau14yanYuBr8231
         OpHuUkITtl+e5H81fJXFGtoJFnBGYQg3+6S7eb6S6Rwa2zNI1RJXTr8mYZwzDJ4yyhIL
         g+RAI+6wVbivURY8P6vFaPOtQ11NioQ2Gega6eKG9vDkIHG1o49I6j92l3jumHZunT3k
         GtnA==
X-Gm-Message-State: AC+VfDxhdFOH5Cxj5iHex/aHywmKkKfiyDGMl+u23t++onumsbLTmtzB
        6598UlvyAN38Emo/4oof8o0MY31MyHU=
X-Google-Smtp-Source: ACHHUZ7h3TTO+guuZmtsc5zS/PnFbZak53kfXFqB/DXuoPn41w8gK+t6FdeEWQ7j9onI9QaK5rycvw==
X-Received: by 2002:a17:902:b288:b0:1aa:d971:4623 with SMTP id u8-20020a170902b28800b001aad9714623mr15459872plr.38.1688033715795;
        Thu, 29 Jun 2023 03:15:15 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902a60d00b001b7f71ec608sm7394249plq.155.2023.06.29.03.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 03:15:15 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/2] examples: fix typo in Makefile.am
Date:   Thu, 29 Jun 2023 18:14:54 +0800
Message-ID: <20230629101455.127795-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629101455.127795-1-warthog618@gmail.com>
References: <20230629101455.127795-1-warthog618@gmail.com>
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

The trailing "s" is missing from "toggle_multiple_line_values" in
several places, so add it.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 examples/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/examples/Makefile.am b/examples/Makefile.am
index daf902b..e92f303 100644
--- a/examples/Makefile.am
+++ b/examples/Makefile.am
@@ -37,7 +37,7 @@ reconfigure_input_to_output_SOURCES = reconfigure_input_to_output.c
 
 toggle_line_value_SOURCES = toggle_line_value.c
 
-toggle_multiple_line_value_SOURCES = toggle_multiple_line_value.c
+toggle_multiple_line_values_SOURCES = toggle_multiple_line_values.c
 
 watch_line_info_SOURCES = watch_line_info.c
 
-- 
2.41.0

