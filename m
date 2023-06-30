Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA137439D8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 12:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbjF3KrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 06:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbjF3KrP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 06:47:15 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334AC30C5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:47:12 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992b2249d82so180417166b.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688122030; x=1690714030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/80bJ/O1bOIAbBscpEO/OFmkLXwX9Ne2UxF7HI8KOz0=;
        b=wd6QAJEsdiWyFSGmt47vgNblE2Qz0n50vcOxOtht51OdFcBuZFjZA9TS0EY++Nb5I6
         3Fc2mCKdJ4XDQxk7s6VIcsbN/sWzEcWE/z7Ett9pDKkq71e8ZKY27G6EQydygvIBJWaM
         BO309/eQaCl9hJQ6qakcpMfdwLT726oBRRrusUoXU+SA3wIIOvhOqXIwAjP+lovzlUyf
         9ZEq2vKsXv3+xm9jb8naiedSHzDVXHqnkJxzC7HxKjqEfRvkNO7kA4INqCong1IzY7w8
         BzX8oWWD8hjA+1fPXRb/qzoOiBBXIvBqscw8E8dtiYeCm3seFHp7iEBnZl605YjDdIDK
         P24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688122030; x=1690714030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/80bJ/O1bOIAbBscpEO/OFmkLXwX9Ne2UxF7HI8KOz0=;
        b=GdlpWBwuWLE1K0wVvgf3oBwgHS2r0j0hKB75RxdhIHmlhsa4JrlmJ+kxIT7mTiox8U
         2NXqECxDmbxtbbGwhLNtpitquoW/UfLGF3xd1iTkPyYIUflHxjp8HEV0AmNMIJFJzh2b
         2cTZ8PMEiXVw/mQ57ED3VIZoXzzuXMLWlymuPSCq6eTUJ7K8QKgMudh9Vv5NTrXnVgmt
         pwCUaUUQ0CUPfCCv7fBg1z3klZEpDtSJLuFpOj3s9oAWVCSzy0GxK6l0JtErWX39OfIl
         rEOn+o8Ix4BUGQfiFmykxr+CUzWVN+gIrQAEFPRIgh/Bbm53EJSnaUfXgCAo1bjDWKgt
         ds5g==
X-Gm-Message-State: ABy/qLacHwQq2j+mj4uIj1TQAG8gYlBGiFndVKiGmI/Sperj3qhOrEP1
        Do9aZyuGj3bVzwBpO2/X6TnQZA==
X-Google-Smtp-Source: APBJJlGfefIbZ2yWJnUaBNN+1YL69rnj7euRkii2EVWn3eL9Yf7q1e4mh5j6DEHUh+qU1W5XzGy/+Q==
X-Received: by 2002:a17:906:1b54:b0:992:a80e:e5bd with SMTP id p20-20020a1709061b5400b00992a80ee5bdmr1611276ejg.48.1688122030768;
        Fri, 30 Jun 2023 03:47:10 -0700 (PDT)
Received: from [192.168.1.127] (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id op16-20020a170906bcf000b0099251a40184sm3436001ejb.99.2023.06.30.03.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:47:10 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Fri, 30 Jun 2023 12:46:44 +0200
Subject: [libgpiod][PATCH 2/2] bindings: rust: mention the libgpiod crate
 from libgpiod-sys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230630-rust-readme-v1-2-1ce9e6f7985c@linaro.org>
References: <20230630-rust-readme-v1-0-1ce9e6f7985c@linaro.org>
In-Reply-To: <20230630-rust-readme-v1-0-1ce9e6f7985c@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688122029; l=929;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=IzJaC8Lnt5zZvoPv9tLaZ1MH/4ihSiuyubw80RA7D20=;
 b=9r1sBR3eeGvHZ2J5bN9jxPEzVszfJ1UImZkjdly4oN6qEeYQPjRiaR3W7pPR2J14vOVnwobcd
 ira78SZyyV1DhOBtQlli/VBO7z7YhU+ds8zZgU0DfziseYElwkxz5h1
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

If people view this README.md on crates.io [1], they likely want to
use the safe wrapper instead. So this hints the existence of that other
crate.

[1] https://crates.io/crates/libgpiod-sys
---
 bindings/rust/libgpiod-sys/README.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
index f9db496..05acd9e 100644
--- a/bindings/rust/libgpiod-sys/README.md
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -8,6 +8,9 @@ SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 Automatically generated Rust FFI bindings via
 	[bindgen](https://github.com/rust-lang/rust-bindgen).
 
+Typically, you will want to use the safe `libgpiod` wrapper crate instead of
+these unsafe wrappers around the C lib.
+
 ## Build requirements
 
 A compatible variant of the C library needs to detectable using pkg-config.

-- 
2.41.0

