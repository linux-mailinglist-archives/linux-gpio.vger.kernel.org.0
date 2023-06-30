Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A52887439D6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 12:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbjF3KrQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 06:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjF3KrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 06:47:14 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2C5210E
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:47:11 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51d80d81d6eso1896813a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688122029; x=1690714029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bibwnsReqIrDgu3O7JCWzBvgPfuqRTehO2a45m9Io2U=;
        b=vschmIS+rr7+a2CdgtmZZBe3LhAM+60ZmVIy3PCXtrOOr44+ND2Yip31AYXGK8v2ii
         JlImusrdAdQqCgOdPyvw4w+EqXIG05/md8vGLxhoCIliqNClnf4SBgY3jqLPGVVVy3w/
         TcuCsG3T1dWdSlsF3tcVahBA1eLFszINqAS1Rwh3+X6+4mx5PKCYNyx07gj6WYyEgoGM
         397Enm6coxgszHPmSSqAnNxItzORgbI5K24qYgNxsANOeJKNW3uOb5KiLfEFpGL6bHFF
         IT95UYism1RVPr4cNETr5wLIsebD0+yfxoUa2NZvKvMgntVgrXpxn0Ys0sJtTIVFKVbN
         Evnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688122029; x=1690714029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bibwnsReqIrDgu3O7JCWzBvgPfuqRTehO2a45m9Io2U=;
        b=FMJDxi0Gra1y/JQrMtsZ9kXYHEs5K3x2ZBcoGFbHTU5CECOiF0Oi9ZCUs+FVv95owC
         mxxMZEUXakpKv+vYRP4hJbFlrrea9KxW/uxMTYG9U2WcFr6jYcorlaA3FP4hsCnUN7Gj
         o4j6XDnSxD9FOyV/GO57MP6rY7Y8QHauKTU4XOa/i/H4nu8P/UX9UGTw6FBhHFrosEW9
         kPBsfQFNJ/uyysI6G/OcuQ9nGCtKUaAzIpARGbobfvm559HP9WwU/oIF/wXxtm9ta8GA
         t8K0RhLg1s8F4rlbXplMiKjQ4IY4jLwWGtNEdANFgynDt/LT097t26A04Z+t7+n6xkHC
         JBng==
X-Gm-Message-State: ABy/qLa+JYk0iCxSOGJ/1C0ybS/AO6IP7LBBbVv8yeZrlHK5NvFUHEX1
        2+grUbv/20KeR71LVWzDAwci0w==
X-Google-Smtp-Source: APBJJlEVJ2okhd9+NECAxTMST6NEbWZQwzKwFOKXwE3szmwFcNbbNiEMpa0qNdVd09MriVUxFQUMcA==
X-Received: by 2002:a17:906:ae51:b0:98e:16b7:e024 with SMTP id lf17-20020a170906ae5100b0098e16b7e024mr1594103ejb.38.1688122029700;
        Fri, 30 Jun 2023 03:47:09 -0700 (PDT)
Received: from [192.168.1.127] (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id op16-20020a170906bcf000b0099251a40184sm3436001ejb.99.2023.06.30.03.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:47:09 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH 0/2] bindings: rust: add README for crates.io
Date:   Fri, 30 Jun 2023 12:46:42 +0200
Message-Id: <20230630-rust-readme-v1-0-1ce9e6f7985c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKynmQC/x3MQQqAIBBA0avErBNMy6CrRAvLqQZKY6wIwrsnL
 d/i/xciMmGErniB8aZIwWdUZQHTav2Cglw2KKm0NFoKvuIpGK3bUZjGSFXXtq20g1wcjDM9/62
 HjcbloOBgSOkDhwdet2cAAAA=
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688122029; l=744;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=xAKyP5teaFdpnMGbRh0X2EMvEByiJ6hw8zkJYEEghX0=;
 b=S7/DTXnxFjEoK+COsOI5em/7ZRxYwRF1Md7Si5KvIajHanrypHjjYARgIwF2Y3EIbWQJM8jzq
 sJojaEBPikQBOqMMf/scoOHUYa1lU/8NSBl4IQJgTQpcvf2fJOdtG+q
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The READMEs are displayed on crates.io for published crates. This tries
to provide a little more context there.

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (2):
      bindings: rust: add README.md for libgpiod crate
      bindings: rust: mention the libgpiod crate from libgpiod-sys

 bindings/rust/libgpiod-sys/README.md |  3 +++
 bindings/rust/libgpiod/README.md     | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: 4510231c95a087f58a155cf74164e403e1e0584f
change-id: 20230630-rust-readme-6560244a713d

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

