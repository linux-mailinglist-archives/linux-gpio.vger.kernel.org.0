Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F42307455DC
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 09:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjGCHUV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 03:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjGCHUT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 03:20:19 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BB4E42
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 00:20:16 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51d9128494cso3661392a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2023 00:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688368815; x=1690960815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4QpraCEYGheli1JdGmJ9D56BwcMGJ15TekW1Vg71jw=;
        b=yzazIzKgNHHv7woMkBTdocNmUMXZ+QkHnYWp/EUk1oF22zPdHNnmVpR7S0qSfJwClL
         MNZWuprwtj/iYOALjXmyA85RXe8kn8ueUTyZvZl8+GnTOapRQZdtRkNnnOB55kiFLLAm
         jn3X4FGAxqF7qTtsKGFhWfVj8s/zD/s4aB2CKUFHavHzuVd4oFvTNYJ0MADimuiYiOml
         nW+W68qDE4cJWaKaZFBKMIxSN1UOm3HmC+w4Pj2tKkWv4J+wuN2DO09WQGhp2TxQ7F8f
         JhktgsszG4oGdwTyrbOybI443A4BrMd3tOT2fHv1Vaw8R24Fd0l0yEyFBU+re4DHyxwe
         MtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688368815; x=1690960815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4QpraCEYGheli1JdGmJ9D56BwcMGJ15TekW1Vg71jw=;
        b=hZZmAgSEROCkWHKe4yUzQ1JkH4L268Zt9D5IgILgX4iwtPThWn2681x0WyKVlDjBIj
         b5SVEscT22Z0+NS9QOfDVDY/N1e7PAUH14y3Ue9Uy/dVzA7uN9rNrRXyLZr5sj3SgiaD
         PPPsz57pYzzkJ920d4FgQPVV5ru2kl7wUIScKQ/598Br9JfTccmi1HeBOvCtcHJQeLEG
         mCARoPTkUgpT+47Sqr35NgQrQ772NKu88u+O1lfGHLge5nuEKIey8HZWs7RHjNgH4YbJ
         O59q9t2kekoZ86TLhVEQ0DunA1uZnWJIvnVoS5NzWe9owF2KY9qmZg85kJwUV7eHrsAc
         UXqQ==
X-Gm-Message-State: ABy/qLa+uiVNHS92NkmPaPnXCESa6n+wF+kD22CVRTaEhJR5HY9rpfLp
        kNj52huP3LPYWjDKAPhOBme5Rw==
X-Google-Smtp-Source: APBJJlEY1lrkzKLUJtmqG2mZN8Aa8n68Xsz4uj2Riu+bcwKyOUpgGrW68a6tiJzgI5Dsr0hL7Gw8eA==
X-Received: by 2002:a05:6402:516a:b0:51a:468c:b46c with SMTP id d10-20020a056402516a00b0051a468cb46cmr6475773ede.30.1688368815590;
        Mon, 03 Jul 2023 00:20:15 -0700 (PDT)
Received: from [192.168.1.127] (i5C7438F8.versanet.de. [92.116.56.248])
        by smtp.gmail.com with ESMTPSA id s13-20020aa7c54d000000b0051e1660a34esm391449edr.51.2023.07.03.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 00:20:15 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Mon, 03 Jul 2023 09:20:00 +0200
Subject: [libgpiod][PATCH v2 2/2] bindings: rust: mention the libgpiod
 crate from libgpiod-sys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-rust-readme-v2-2-ba7d7f04bed6@linaro.org>
References: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
In-Reply-To: <20230703-rust-readme-v2-0-ba7d7f04bed6@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688368813; l=1040;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=I3Lvenf9ixcuPhSOgUdL4Ea92lnFRThego0waHda6bQ=;
 b=qrsl6drfAckZOf38lS/M14UIN/UVFUbY7+xgpkMyHdkgrZTt+X7Kl6hsc945gWsP1v3OH0ePh
 CUfdVRLmy6PCPt9rqLfZg0YAF5YOp5+NziWWYNg/Tw8bz+twSj0atj4
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

If people view this README.md on crates.io [1], they likely want to
use the safe wrapper instead. So this hints the existence of that other
crate.

[1] https://crates.io/crates/libgpiod-sys

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
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

