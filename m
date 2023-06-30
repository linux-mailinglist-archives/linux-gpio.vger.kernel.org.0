Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5574C743AA9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbjF3LTK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjF3LTG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:19:06 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD424358A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:19:02 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso9066495e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688123941; x=1690715941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foDn46B+pZpT2Whbht946XgZWMtJblU3mUCYvT4/IJM=;
        b=IszdtquCF5l84t6q4IKRsBzybSI1cba4qox1aR0rGAG4gLq3ZNV9wjQArpAp+4rQO3
         8D15kUNb7VrY8zL/HzbA9F1WthgEIdm8eLux8lxS4fWZqNANaiW+d/QflirKhGnFwRnU
         C72ki6cjtbCAyEC/F8+WVF/1LpEzzOxF7Gr6zp7KguhQLhhezhhWexVL1rIftlhKbgOm
         TD3uLoGJI2OyrOfg8yTNDKYBUYlzqzO/2jTJhgwpag77OBPeKdPb9FKBbZIrSyum4C+S
         KN5++nE64Jy9kG7gUMl/psiwBJKuIH0AUDP6EjsgyM3Zdcg2nfy2QIRfduDidomOSAEu
         PuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688123941; x=1690715941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foDn46B+pZpT2Whbht946XgZWMtJblU3mUCYvT4/IJM=;
        b=gGshm+C6/NSSUM6gIHm0VJFtKUk5UXOrcAS4PQIGKc7JYWkjm0967YwqNjpaMvsFnc
         xN8unNJkgjm03pnaNWgU016i701Kh52e1Hf560RGi3B0XH48OZeA+PpAEL+GrAzVWyer
         rLIfMs/Kvba5m0ICZtDnGZEMA0ig8hVVKIHTsC8sMQ+vRijcPZ0Z5eDM/LGPowwrP7T2
         tfBtOl9wpIRLbWRB6FmD3JNQZgda6O3dc9IH3mPrbZI20SKFBI2JJtAWmVKhoGeJgWUi
         +yA91xeGY35Y14uSbD093YmyAv6qrJi8145j+9JX+L2GZblYRoObZm20FfkaaJziAk4K
         ffZQ==
X-Gm-Message-State: AC+VfDx6cxIROx8qOo/r/iop2btjsURT3nlMqxQovpLfuREhSxUrQ7hs
        nSmRFlSabViM6ZGeXHZQpvC5b2IsfXvjVlD3pTw=
X-Google-Smtp-Source: ACHHUZ5OWOF/wU7UFBllboMbEfVLqfZrY5eneE72kjbTj9nb1B2PSmFBaPACv6wPcqRSB9po36f+qg==
X-Received: by 2002:a1c:4c08:0:b0:3fb:b287:b0ad with SMTP id z8-20020a1c4c08000000b003fbb287b0admr1957215wmf.13.1688123941392;
        Fri, 30 Jun 2023 04:19:01 -0700 (PDT)
Received: from [192.168.1.127] (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003fbb618f7adsm4621917wml.15.2023.06.30.04.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:19:01 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 30 Jun 2023 13:18:47 +0200
Subject: [libgpiod][PATCH v2 4/4] bindings: rust: clippy: silence
 false-positive on iterator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-clippy-v2-4-f44447925ad6@linaro.org>
References: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
In-Reply-To: <20230630-clippy-v2-0-f44447925ad6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688123937; l=1136;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=c74vXxa4MAhI21WLFDLO8nb3tQLt/j3LlAIZ9/MOxpk=;
 b=jo8yedh87k+2pDTwpnEkLgAqWo1Z2aEewmrX678/bCufOc2OkXl3dFxFrBJcIjuUiUaWkJbO3
 n0000zki7PTC1g4fhFEEombvscGMpAYSL+V2t9au4yhFTFR/xOnVdi4
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

This was fixed on clippy master [1], but it is still broken on 0.1.70. So
lets silence it until the clippy fix is widely available.

clippy version: clippy 0.1.70 (90c5418 2023-05-31).

[1] https://github.com/rust-lang/rust-clippy/commit/9fa40894103e32364fdbade539d4ecb3d40f3d7f

Reported-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/event_buffer.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index b79e9ea..2e4bfd3 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -54,6 +54,9 @@ impl<'a> Iterator for Events<'a> {
     }
 
     fn next(&mut self) -> Option<Self::Item> {
+        // clippy false-positive, fixed in next clippy release:
+        // https://github.com/rust-lang/rust-clippy/issues/9820
+        #[allow(clippy::iter_nth_zero)]
         self.nth(0)
     }
 }

-- 
2.41.0

