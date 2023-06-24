Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2554273C6E8
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jun 2023 07:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjFXFVg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Jun 2023 01:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjFXFVf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Jun 2023 01:21:35 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65438272C
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:34 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-25ecc896007so927805a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 22:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687584093; x=1690176093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GLKygSoQjw70yBPG5IlT9IoMODEHnEu/LvGJFjSepg=;
        b=mzNKlqFoXorEQUa6lD6RT+NO+g82GdJ252aQYOzFBYmhFAQH5KdvIueI269AX1j+C0
         Rf9M/84BosMf8MPFHU1SbZ2VoGMm8D7+MXS9Yd2ICGkcsReL6lTqzYsys1NrTPcOYQJH
         vmiQWPy4ITogGcBqrprshUSC5VrSEUOz0GSFfCI+0WY84gZ20Oro7uZvrDFAxaqJgA4X
         zOkrdrpfKSV3NsRwqqvKKf4uAorV4uwRZbJJjrxdfb4D9Ba6utwn6AXBsEK+ieLTXb6K
         lSmAtvnyYkmi7UHt0yDXWJz4z4Ya2f861Va3Y3yxxlTAzXJvidyUjRyE/16Wj9qViweC
         Se+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687584093; x=1690176093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GLKygSoQjw70yBPG5IlT9IoMODEHnEu/LvGJFjSepg=;
        b=YcS9daNqU4ilMI8SRa3co0/L61Jxr20RFf/+25PFqSeQs1ECtDL6ScWUMYaj64a520
         4J/Xe8SniiU+PN1z3mrlUHc/CU4fgQ5E42DySBOLBBEkSSYIs/p+zfnMflZxMOFayaE4
         yBHKBLeW6dL7b3UGTTHzaoz2/xTNtgjYjClU59XwLPMVM7zjW7Ej5Kd35O6AFARzaDuq
         +Vn+C57YfBJcr9xwcqKAoUHDkIxS9Cxs/lZZylrlxcDzHtdpHnHxr74hHkFzXkiDcR+6
         uOyHoaMT3pV4GkwsDl+ynge5w0cpnMF5PGoq9wqFyK5Lb50zbZdngV6B+olsjUm5th5b
         beqA==
X-Gm-Message-State: AC+VfDzW4huIXqKV3+yfk/ONyu5g8VgqZOwHzocsRSr/sWhqtIWfEPDV
        nm0qZL4YN61EQRa5ua1gS44rMxbqCeM=
X-Google-Smtp-Source: ACHHUZ42rUTUvkucTfIAJMkvvLE/i8pdEsYMLv1S+bCrdTymSQIkU4ffpwRxxYsFGwQN8681JQbKzg==
X-Received: by 2002:a17:90a:dac5:b0:25e:9aa6:2dfc with SMTP id g5-20020a17090adac500b0025e9aa62dfcmr22106420pjx.40.1687584093505;
        Fri, 23 Jun 2023 22:21:33 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00256dff5f8e3sm487103pjb.49.2023.06.23.22.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 22:21:33 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 3/4] cxx: examples: file comment consistency
Date:   Sat, 24 Jun 2023 13:20:53 +0800
Message-ID: <20230624052054.13206-4-warthog618@gmail.com>
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
 bindings/cxx/examples/reconfigure_input_to_output.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/cxx/examples/reconfigure_input_to_output.cpp b/bindings/cxx/examples/reconfigure_input_to_output.cpp
index 7b52dab..896c812 100644
--- a/bindings/cxx/examples/reconfigure_input_to_output.cpp
+++ b/bindings/cxx/examples/reconfigure_input_to_output.cpp
@@ -2,8 +2,8 @@
 // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
 
 /*
- * Minimal example of requesting a line intended for bi-directional use as
- * input and then switching to output.
+ * Example of a bi-directional line requested as input and then switched
+ * to output.
  */
 
 #include <cstdlib>
-- 
2.41.0

