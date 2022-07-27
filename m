Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1BE581F9F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 07:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiG0Fpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 01:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiG0Fpv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 01:45:51 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2F23CBDF
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:45:50 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d7so15247206plr.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ydOIOyH2+1Fr6ELIpajsWki6As2Xz03RYtDwpd6Hoe0=;
        b=EKH7sSzcubRdRe48/9qliubX+9ydV2cNiQeAnNQzPIKi/G/ACBFuoh+DrGJTQtZH6m
         AwRfP8MZi32myqjGTTHgbKgme4GqAvH7S1ljLzABpuca1HqE31FNDavk68pnBroNf2Be
         4tJwG3l3Qr0aAga4ut9PmEQfbnlIL8v04XMH91V1JSYPVsDoj5iL0IEJSVrXaFj78zVd
         VFG4DwlVQq5IspObJkqwOpsBk/n169/XgS6RlxXarbJ/AYUKM3jnLRzihhoDoO/xhj8z
         NIm5UiAiFu5bmJM7D5j7eAFIZcs2Ij+h+hkRMp9ziVr09Myly5V8KxBKqhjpfX3dtgXM
         hkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ydOIOyH2+1Fr6ELIpajsWki6As2Xz03RYtDwpd6Hoe0=;
        b=bYRg9iufMCcog+qqJE4ia2U0SLp5q72/rzr8SoMmJz/fL71EZCdBOeMgBTfMhfQfed
         FcgsK+JsBAl0LpCsHHNjs8u5YnQ8DH1ISTauUr+m6t+NfqqDf9SClqYvjCE/a1Zx9t+9
         zLubJ099UH9n5t6m8oB5O8HBMncolXQTUdxVPAUaP4rnTdZcpBIVjqf9fmLOml+AL7To
         y4zB6VnvECQFGI9kLuPMS3rLrjvKxWzr5J6hlOzzSF3CEh7Yfyeo90Ss4FVrKXU1t6Tp
         18kfT2bwHZFZeMp0/gjfYM5lEfjrcedK+XoCmL4jZEYflY/3mkV3vbimuAJ+YsOZwzRP
         3ZsQ==
X-Gm-Message-State: AJIora84SOG2VROM8iGljyKz0jw5lSdKxBHRHBvZLJtxtsR6iazvLwVW
        WOJNq6YneiI7hsDPLdfuiRWfNx5kIbnVJQ==
X-Google-Smtp-Source: AGRyM1sB+0a849Hllf2DO+7v3M0AvdGjVF8iyrYSNiOP+EHSetEW0QSF5/7zsznW7XpZvLOrL9OkOg==
X-Received: by 2002:a17:902:9a01:b0:16c:e554:5de with SMTP id v1-20020a1709029a0100b0016ce55405demr19926295plp.53.1658900749668;
        Tue, 26 Jul 2022 22:45:49 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id s133-20020a632c8b000000b003fadfd7be5asm11054048pgs.18.2022.07.26.22.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 22:45:49 -0700 (PDT)
Date:   Wed, 27 Jul 2022 11:15:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20220727054547.lrnjz6j5vzadhovu@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
 <20220727025706.GA88787@sol>
 <20220727045158.z72byax7pc7kokca@vireshk-i7>
 <20220727051743.GA108225@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727051743.GA108225@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 13:17, Kent Gibson wrote:
> Sure, it is a problem, but static isn't the solution.
> You should be able to get the appropriate paths from autoconf, but I would
> refer you to Bart on that.

Sure, if someone can suggest a better way of doing this, I am up for it. I just
don't know how to do it as of now.

> By "all builds" I meant build/tests/fmt/clippy etc of this module, not
> others.

Ahh.

> My concern being that a subsequent bindgen may introduce a problem into
> the generated code that the allows would hide.  So try to keep them
> restricted to the problem at hand as much as possible.

I agree.

> #[cfg_attr(any(test,fmt,clippy), allow(deref_nullptr, non_snake_case))]
> ?

Finally just this was enough for fmt/clippy too :)

#[cfg_attr(test, allow(deref_nullptr, non_snake_case))]

> Specifically the tutoral says:
> "The wrapper.h file will include all the various headers containing
> declarations of structs and functions we would like bindings for."
> 
> If you do need to bundle several headers then fair enough, but I don't
> see any benefit in this case - gpiod.h contains all that.
> 
> The tutorial is probably written that way so it is easy for them to
> refer to the general "wrapper.h", but there is nothing in bindgen that
> requires it.

Sure nothing will break if the file isn't there. Okay removed it now:

diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index 147daaf6b1da..96f832134431 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -8,7 +8,7 @@ use std::path::PathBuf;
 #[cfg(feature = "generate")]
 fn generate_bindings(files: &Vec<&str>) {
     // Tell cargo to invalidate the built crate whenever following files change
-    println!("cargo:rerun-if-changed=wrapper.h");
+    println!("cargo:rerun-if-changed=../../../include/gpiod.h");

     for file in files {
         println!("cargo:rerun-if-changed={}", file);
@@ -24,7 +24,7 @@ fn generate_bindings(files: &Vec<&str>) {
     let mut builder = bindgen::Builder::default()
         // The input header we would like to generate
         // bindings for.
-        .header("wrapper.h");
+        .header("../../../include/gpiod.h");

     if cfg!(feature = "gpiosim") {
         builder = builder.header("gpiosim_wrapper.h");
diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
deleted file mode 100644
index 32290711642a..000000000000
--- a/bindings/rust/libgpiod-sys/wrapper.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../../include/gpiod.h"

-- 
viresh
