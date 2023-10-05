Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F8F7BA032
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 16:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236147AbjJEOfy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 10:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235745AbjJEOeW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 10:34:22 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFB37DA0
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 00:42:32 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so1020930a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696491750; x=1697096550; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLnTS38DyxCuIhZvuKF6L9larEXjV5fmGyQF7glUG0Y=;
        b=K9/1Q1hBGvxvyRrPc7s7sdOSATAEVgNETEmG8wFJwI+mklunDFLlQLNWCEsveNZRND
         cwXEpRpx9Lm4G+ZVHYywGwyS3pdaz8VnePofCi4UtS4L91bbXYURYtxh4zrcBaR9HCWB
         WyNywMSNyVwe4IWOx5eGQlfR0e2gWd8HqsTyu8NzSgHID2cr57zisf1+8/15EdGEG5ga
         koNvPjDdlznVuAJcSofJctISPazoCUt1uUxH/ohIVxI4azdstzjEuGEYgL9JzXhH9mpa
         MGLVlhYBRVZoZUeoxSExbPomF9Dh3VPlgeAOVJpGUlGPkErwrGvg7R78NookwaCzK9gE
         JLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696491750; x=1697096550;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLnTS38DyxCuIhZvuKF6L9larEXjV5fmGyQF7glUG0Y=;
        b=geK+YKE7+VhOGwDU8xi0O7AW5McU4b3ih1us/4NoZSXOivL8Th3QJyaViUNz/FVDQC
         cTkei2Hq47jhrBsV8j93qXHGNJQdk6OXKrC97v+Tp87Mi1tU99IRobSllrCJVN9CHrOQ
         acmd9wDutNOYFu02dv3gfWjMrRnEEAG+r2BG165le/5wQ5Sxmax9W+o/G2GZCGni61s3
         5o4H1stRFfC4PniqmF75b1688EfHuWXknO/3N+hiGiuIQkUcoL480N1Wl2X3siwwfGOV
         fN9UjXSoICDljwCDX9RahgZz91tbUKsaYzaPeME5JfXRv7GzHXE+fM+rH/rDiKHDICkv
         7G6w==
X-Gm-Message-State: AOJu0YzuCKtU6GtzbAAvxGO/D99c2pEKTA6J0fC+CrnAnwjTTixM2OeJ
        RNEnULFi1dguwX83CCmJPaMpfQtnHcupC4gzin0=
X-Google-Smtp-Source: AGHT+IHeIgFTHZM8RR3g4H3e4AyuL0snoCMYCvPeDynUm+dCNqvZTx30FCkTvR093izRXceXggqfZQ==
X-Received: by 2002:aa7:db45:0:b0:533:520:a5a8 with SMTP id n5-20020aa7db45000000b005330520a5a8mr4001115edt.29.1696491750662;
        Thu, 05 Oct 2023 00:42:30 -0700 (PDT)
Received: from [192.168.1.149] (i5C743835.versanet.de. [92.116.56.53])
        by smtp.gmail.com with ESMTPSA id n10-20020a056402060a00b0053447d022f9sm649014edv.18.2023.10.05.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 00:42:30 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 05 Oct 2023 09:42:23 +0200
Subject: [libgpiod][PATCH] bindings: rust: libgpiod: release 0.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231005-b4-rust-release-0_2_0-v1-1-0fab05c09962@linaro.org>
X-B4-Tracking: v=1; b=H4sIAN5oHmUC/x3M0QqCQBBG4VeRuW5gdt0KepUIWddfGxCVmYpAf
 PeWLr+Lc3ZymMLp1uxk+KjrulSEU0PlmZcJrEM1RYltEDlzn9je/mLDjOxg6WInHNqUcMnjtZR
 Itd0Mo37/3zvN2k+brgM9juMHXs+0qHEAAAA=
To:     Linux-GPIO <linux-gpio@vger.kernel.org>, brgl@bgdev.pl
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696491749; l=2898;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=AVJt5L0DbnfcwDUAdZyqyPAbvqncCt8e8r5ky7wbYDU=;
 b=CQ9DMBAQaDJwYh7LOgCYYRUg7LPmPC7hgobVHhHu50XjVef43lysljoTpyh+NmJriTegBxIIT
 0C1ER0jn3PwD38G30wW5IFHG4G27/N8zdIT5Vu7VKRyITy3gDLILY1Z
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we had some (potentially-)breaking changes, we bump the major for
the next release of the crate.

Note:
I am using the term "major" as defined in the Rust SemVer compatibility
guide [1], where the first non-zero digit is considered as "major".

[1] https://doc.rust-lang.org/cargo/reference/semver.html

Changelog:
=========

(potentially-)breaking changes:
  a29f3e6 (bindings: rust: rename {event,settings}_clone to try_clone, 2023-10-04)
  b290348 (bindings: rust: fix soundness of line_info modeling, 2023-10-03)
  d04639d (bindings: rust: bump MSRV to 1.60, 2023-06-16)

new functionality:
  808d15e (bindings: rust: allow cloning line::InfoRef -> line::Info, 2023-10-03)
  64aac85 (bindings: rust: mark all owning types as `Send`, 2023-09-28)
  d12ce74 (bindings: rust: provide LineRequest::chip_name(), 2023-07-20)
  53226d5 (bindings: rust: examples: add dedicated examples, 2023-06-14)

other changes:
  0a570b6 (bindings: rust: drop unneeded Arc within Chip, 2023-09-27)
  a97fe96 (bindings: rust: construct chip infos by reference, 2023-09-27)
  27afa47 (bindings: rust: remove useless clone, 2023-09-28)
  3f6e0bf (bindings: rust: add README.md for libgpiod crate, 2023-07-03)
  4b8357b (bindings: rust: clippy: silence false-positive on iterator, 2023-06-30)
  39189f0 (bindings: rust: clippy: drop unneeded conversions, 2023-06-30)
  46115fd (bindings: rust: clippy: silence false-positives on casts, 2023-06-30)
  901104e (bindings: rust: clippy: drop unnecessary casts, 2023-06-30)
  46ecbe0 (rust: examples: file comment consistency, 2023-06-24)
  aaed0f2 (bindings: rust: examples: replace tools examples with use case examples, 2023-06-23)
  b37bd9e (bindings: rust: examples: consistency cleanup, 2023-06-23)
  06c8ad9 (bindings: rust: package new examples in the distro tarball, 2023-06-15)

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
After merging a couple of important soundness fixes and threading API
adjustments, I suggest doing a new release for the Rust bindings.

Once this is merged, I will publish the tree of this commit to
https://crates.io/crates/libgpiod/.
---
 bindings/rust/libgpiod/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 518e5e5..3be4aa0 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod"
-version = "0.1.0"
+version = "0.2.0"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

---
base-commit: a29f3e6957914dc564c723a8fc405cd99e407fd2
change-id: 20231005-b4-rust-release-0_2_0-1344e6af7cc2

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

