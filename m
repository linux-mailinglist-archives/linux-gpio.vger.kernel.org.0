Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5B27424C9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 13:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbjF2LKM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 07:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232217AbjF2LJk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 07:09:40 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2826359A
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:15 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3113dabc549so679133f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688036954; x=1690628954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjWAD3xgu1+4S9LVLxxSlciTYFK1Sbr5R+tn3bj2G0k=;
        b=gVWClMK0LMEjCA+Cr66MLnP07kew3KsobGBHni4riMV5vplGsj8nWwxkIHYf3P9k3w
         gzfMP9sop6jIPWPsos++orMAXmPGy0vEFJ7TJnNy4rb+08h2ljRax2E0vhoBbI1i6mNz
         rcksmEUi43xhXZuOAmTJIK4l97IhnUGLkwUSKS5x7pEAO6Iz/y5qw+xf23hAxBBvFXQe
         jNitli+KX7Q3SINOL8YSTJhUXBoJ0SHKZ8mnAddhH/paA9aMYwg7TNI2/bkJpOQNnkjU
         A8aWO38fD3mUbHI43jEpbE7LcGhV5FW4xZyuFBY5i2LSz7Iyf230dn9K8T+7RDcFu4q5
         EzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036954; x=1690628954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjWAD3xgu1+4S9LVLxxSlciTYFK1Sbr5R+tn3bj2G0k=;
        b=FnGvce55dpTyDSJQLO53Py1QdWQuHoclJwqJdRarkmAsCT82nnxk3QJ0tOyxPHFnM6
         9oQTo9TvUbirdEl//oUWYVkK1P1ILBTnrW4m3+0lZmkOPijqGmQoY0GnzfEk0R0qVZbn
         K9F39/rKgsXT6h4mu5EydOuy5AGcBt010cP+aGX/SOsPQOFwA1QcMNnC6FZgPbT4pbfs
         H2dNjUTZmjqH1DOFm35azqdHtX/4kpBRWNPDaStR5mA+zRWWV809A0VkkYwLrXvoEkrU
         wkbZW9ZG1knYRUeiJpPquRae9eC3rEkg0291BNUU5A29FJF3gH8ZZ3TaMKyfT7MQT3WA
         2bqw==
X-Gm-Message-State: AC+VfDxWlWoha9rFJJPTzuV4B4o8bCqBWfzsXY0JwPPqqow0bt2yeHva
        l4/MoNrgn9rKbNmxWOU5mvi88w==
X-Google-Smtp-Source: ACHHUZ6Agms1izqZFq2ZEz4/xWdZhilG1zJqIP2O4Qko/5OhsErvaRZ21jXg362o2tmXb0YmL2EBpw==
X-Received: by 2002:a5d:62d2:0:b0:313:e8f9:dbfa with SMTP id o18-20020a5d62d2000000b00313e8f9dbfamr16802417wrv.35.1688036954300;
        Thu, 29 Jun 2023 04:09:14 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438BA.versanet.de. [92.116.56.186])
        by smtp.gmail.com with ESMTPSA id cw13-20020a056000090d00b003112f836d4esm15571197wrb.85.2023.06.29.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 04:09:14 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 29 Jun 2023 13:09:02 +0200
Subject: [PATCH libgpiod 4/4] bindings: rust: clippy: silence
 false-positive on iterator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230629-clippy-v1-4-9ff088713c54@linaro.org>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
In-Reply-To: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688036951; l=942;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=9Ef2blUdIBqaRS/IvtnkKFRbjUV0UgyUroU9uhls5MA=;
 b=7rBiZI2yUc3BFbljxJKD23EYBxc3RFIJSdb/gbUyqoSboDq/t5299DiitZ6pXDkl9s0wn8FwB
 yp07eYcDXEpA8nCuVIJvXCYaZrOPutSBQdULkeSntvKOnP670pCPIBI
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This was fixed, but it is not in stable yet.

Tested build on x86_64, armv7hf, aarch64.

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
2.40.1

