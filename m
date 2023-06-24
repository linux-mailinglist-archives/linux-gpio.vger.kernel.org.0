Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60BA873C6E9
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jun 2023 07:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjFXFVq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Jun 2023 01:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjFXFVp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Jun 2023 01:21:45 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DBF5E67
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:44 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-763ddc4259dso124364785a.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687584103; x=1690176103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6XBOnIPfK/D7TyWjfv848szEgbB/yUubSzUaHVR0ZQ=;
        b=nits95aQgbKC0Uu+jDD3NVxllqc33QN/6aUoq+vnAuXPvb0bFLMr6ofdbWuy+mieK1
         sLeATQsYU7w3m8U+HXKzA/i2hkhDu2ieJytAYTDor3dXS81eH6XVT/AQ9VSksCFvX3Wt
         DbabpkxVOaGv6aFpXO1bVojCvxUmqkHTz/803NCkayoOiezaiEQsh32rwnr0U3UoT5rj
         uLljxXva+UL0+/5eCT/iWR2E/OJ7tWwbKhqaTewb0MuMZrreqexrif1Nh+n5XzsFwuso
         N3Yz2j0PuA+CDIuXZVwXLJevMtScliPDBth//wrl4HxCbiCIJb/gAikm7c6WPs5N6CVA
         cgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584103; x=1690176103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6XBOnIPfK/D7TyWjfv848szEgbB/yUubSzUaHVR0ZQ=;
        b=LzdA08LoAP/vUHyMjOjmnt/t3EnaoQ7wnMGoVgwlY1nBNDsV+zp7CqAx842+1aaL7J
         Nk1fW7qfpH8EKUuPE2nNXnGNQdbICJ5apVgwNMD1yTfp3xhZgK76CxCL1nLsqWGpOb9Z
         UtUnnSMja4ddEGvBm57eQQSpgMmFzGDyRB3CXqUlCCoW/5jeHqeXjaShboOFZ3pm3Che
         8RMC7PJLY/3/pTU4crRriX8D2Z24xVwtez0RwGFLB/B9y3ZB5eCRvPNawbFxKeH8K90j
         TZW7TK/PwvkySRdUVcANeCtFfKNhbGy1OUVHgnPAX7rATzZMO5IhPqpXQA2ySbc7llvK
         sJpA==
X-Gm-Message-State: AC+VfDwjVxD4RRbI+7k/kHgHTWFQ3MV3xTy+yMs8V14f8lNGyjdr8gyc
        eMSt/p0GciacxXm3DE+FCWN1d8CiQcc=
X-Google-Smtp-Source: ACHHUZ4vnOiBFx9mEoIILQ4qBqgiKC3yhrgWvID4Nv39m3q8O+Cc2SdhgCLqagTsjxFJka3bvYupFw==
X-Received: by 2002:a05:620a:8f07:b0:763:643c:d6e7 with SMTP id rh7-20020a05620a8f0700b00763643cd6e7mr6760106qkn.47.1687584103639;
        Fri, 23 Jun 2023 22:21:43 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00256dff5f8e3sm487103pjb.49.2023.06.23.22.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 22:21:43 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 4/4] rust: examples: file comment consistency
Date:   Sat, 24 Jun 2023 13:20:54 +0800
Message-ID: <20230624052054.13206-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230624052054.13206-1-warthog618@gmail.com>
References: <20230624052054.13206-1-warthog618@gmail.com>
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

Make the file comment for reconfigure_input_to_output consistent with
other language examples.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
index 3e2f2c7..fb5402b 100644
--- a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
+++ b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
 // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
 //
-// Minimal example of requesting a line intended for bi-directional use as input and then switching to output.
+// Example of a bi-directional line requested as input and then switched to output.
 
 use libgpiod::line;
 
-- 
2.41.0

