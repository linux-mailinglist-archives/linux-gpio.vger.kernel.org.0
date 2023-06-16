Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0BA732A05
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 10:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjFPIif (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 04:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245676AbjFPIi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 04:38:27 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1213630CB
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 01:38:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f76a223ca5so497387e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686904695; x=1689496695;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtrAVKQTSs/CRGvZ0vB47gR77jHMGa/tHb8cc+bWOsY=;
        b=w26SNfpTVtTFTqgNCuDzIGdEBK7R+wBQFgEJcADQ7rVzt9A+EJlKTE0hkhbwJDJ004
         ZJruyQTpuedUEBtWXVdx4sIyldv8oZzczkc0F4QVAl94DlIwtYuE25hDoyu0f52QPsCU
         qliMoz/PyeL2FMtDvNfZmH4k1FYuca46OZwh3TjOMKPXaHWgH+YwcZz1W4UDPK6FGody
         jeE2bQZk98NynOq+iDuvbk60DbRFksg4l0GXdTv/x8BzczSV6HTKU/p5Q38IziVGoi3L
         uJrmMQN8C74Lv1r0UJ34ZdhPn7AH6EIaVMO8idKdcjLq6/y+55UQVSW0SwNg6VMqHRL+
         5ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904695; x=1689496695;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtrAVKQTSs/CRGvZ0vB47gR77jHMGa/tHb8cc+bWOsY=;
        b=WUQQtw3vkqRoZHhQBFLAu7o1aL78TpQMxW4FDDZZhKYF60CGPeMHFDtFIgArQorL9F
         AhzhHi7qidN4JUEF3XQ3+a6mH3H4OJbScU10tjENa9Zqng7fM3ZhMtuQxLot70cARkQj
         nO4UvL/TIu1n3zBdP3mjUPduLRMtyR2ebmGTl8XtfCLRw4p/VbHC+2UJoQ3ADRNnDu/h
         fOPkH0ucsXx67kgSXTm2aOKsT0elGlzwN3vPC+JKFjaJsI86yHOZpZPFqm78Xe4AXw3P
         Ob9wk222Mz0iAbJAVnbgotE9z09bMiruxCYfqvkOI54d5hNzmykxZOEVbo1n03ObPNd7
         mfxg==
X-Gm-Message-State: AC+VfDyjRT7CJRrsmziz62xDajIkbV6VsQdvZxoMCIR0fFezT+2LLaLD
        4V2jnu0IwAgRu5nMu7IDAcyXZA==
X-Google-Smtp-Source: ACHHUZ77DZDcrv464iFkpaqRPIDJIomMQ4mM9ryxkM4V2+IcM/jGGA6yMocZWnTuNhnCnpaFaMJEzQ==
X-Received: by 2002:a19:8c17:0:b0:4f4:dbcc:54da with SMTP id o23-20020a198c17000000b004f4dbcc54damr710371lfd.27.1686904695222;
        Fri, 16 Jun 2023 01:38:15 -0700 (PDT)
Received: from [192.168.1.149] (i5C740DE0.versanet.de. [92.116.13.224])
        by smtp.gmail.com with ESMTPSA id n16-20020a7bc5d0000000b003f739a8bcc8sm1545215wmk.19.2023.06.16.01.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 01:38:14 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 16 Jun 2023 10:37:48 +0200
Subject: [PATCH RESEND libgpiod] bindings: rust: bump MSRV to 1.60
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230616-msrv-v1-1-1f0ca25b8222@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Erik Schilling <erik.schilling@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686904694; l=4460;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=UI2YtXQq0QJ2kL/nDY0w1NCPU8pNQouy/g7Z2WmFDgc=;
 b=rusWtetBDafFh9O6LZsNSd/lGJlf9AoJd1/Xb9b9xDxhfl2rRpCpV2YeaYPmey9NLoqkT01BY
 nTk3x++o2LyDMqX9sgiOhuZLg+ypavRvcMnmsFHAf0Vn5qxwxvoYbi4
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

Specifying MSRV (minimum supported rust version) was introduced with
Rust 1.56. So old versions of libraries do not have this restriction
spelled out in their Cargo.toml.

This means that even if we claimed a MSRV of 1.56 until now, that did
not mean that things were actually buildable with 1.56 practically
(without manually researching compatible versions and pinning them
down).

`bindgen` started listing a MSRV from v0.61 (requiring Rust 1.57) [1].
So that may seem like an obvious choice. But if one attempts to build
it with such an old version one will realize that `log` only started
requesting a MSRV with 0.4.19 (requesting Rust 1.60) [2]. Hence, we
would either need to manually restrict log to an old, but compatible
release (which would unnecessarily restrict everyone on newer Rust
versions) or just also bump our MSRV to 1.60.

Rust 1.60 was released on 2022-04-07 [3] and seems like an acceptable
choice if core components such as `log` started their MSRV tracking with
that version. If someone is determined wanting to use this with an older
version of Rust, thats still possible. If one has done the necessary
manual research and pinned their versions down, one can use
--ignore-rust-version (or a < 1.56 version of Rust that does not check
the MSRV yet).

Thanks to Manos Pitsidianakis <manos.pitsidianakis@linaro.org> for
helping me out when I successfully confused myself somewhere.

[1] https://github.com/rust-lang/rust-bindgen/blob/v0.61.0/bindgen/Cargo.toml
[2] https://github.com/rust-lang/log/blob/0.4.19/Cargo.toml
[3] https://blog.rust-lang.org/2022/04/07/Rust-1.60.0.html

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
While looking at the clippy fixes [1], I realized that things do not
actually build with the minimum supported Rust version that we claim.
The simplest way forward seems to be just bumping that version.

[1] https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com/

To: Linux-GPIO <linux-gpio@vger.kernel.org>
Cc: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod/Cargo.toml     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index af30748..1f44a31 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "gpiosim header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 categories = ["external-ffi-bindings", "os::linux-apis"]
-rust-version = "1.56"
+rust-version = "1.60"
 keywords = ["libgpiod", "gpio", "gpiosim"]
 license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 0c814ee..b4d26e9 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod public header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 categories = ["external-ffi-bindings", "os::linux-apis"]
-rust-version = "1.56"
+rust-version = "1.60"
 keywords = ["libgpiod", "gpio"]
 license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index d6758be..518e5e5 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 categories = ["api-bindings", "hardware-support", "embedded", "os::linux-apis"]
-rust-version = "1.56"
+rust-version = "1.60"
 keywords = ["libgpiod", "gpio"]
 license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"

---
base-commit: 9a80247cf4a70c837055271c978afda7ef107338
change-id: 20230616-msrv-0f1d20f5bd09

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

