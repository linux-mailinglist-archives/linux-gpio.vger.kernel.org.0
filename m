Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E9A72C2F5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 13:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237518AbjFLLhK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 07:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234230AbjFLLg3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 07:36:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6964518B
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:15:04 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977cc662f62so618219266b.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 04:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686568503; x=1689160503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJCE+1fuWVtMaz9EHfnAWHnNiUanDidN3rc+6SvJYoE=;
        b=jXu8XXOgqJG1c/2BqwMLw86Ptg7hVbDxyNG0g1G0tO+pJ93tpMm3njhqQh6HwSSRt/
         cmBl+UVI4sljrorJxRirIjqDEOKRH33tHfuOcSgSM5/mLqkJT621AZGCRF50N5M4dXhI
         NxuN61qRJpVnWSzrJci7PoYZ5CYk1ioso+KWAV0wsEeXtC872DyJDtdhhhj39hsaTyEx
         faUdINyn7WKAV4Jw0OKgDAsgwDpQTNfAA/O2fwW0q5if6Q+LVa/42N4CSKHJo5DbQ5Yd
         8QfRd+Dz0p14Tsmluty+WqROH6zc5DkCjevfyzazJfFUuXlcJxaR0IOM+jhrApuxHHIY
         lwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568503; x=1689160503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJCE+1fuWVtMaz9EHfnAWHnNiUanDidN3rc+6SvJYoE=;
        b=WEm4fEWBX24oQt2A3fLknLCBQOtz/LmD9bRTJslI7owLwi+jAsv+kPoaDhC16549ui
         E3Fa3Qju3rxZqTqTNtHiCNfKdCZ32yHa+0uMfCR5RsvxM45+mZ7yL91NnoKP/Ym3oyjd
         Cq0eBizk6CfsqQVnElD5R3lwuWkzjB5XAntorp0mKljHjwp7HbcxDYAuuvrZqEB7hMYW
         zXxeArKRPaPCFhRJ6KHLlNgEg+YVThqcJwU6oUNem1iwtiN9qc2dtdUmvcBn4Gq1LrUs
         82q0Lhier6v/2ybouPNpVS4dqcXf657q9ZU52XnB8c1kDKxTsDfjE9cNdLyMmPWpZlkf
         bZDQ==
X-Gm-Message-State: AC+VfDwLOfOkOunl4ne4kqY07SPiQeB6mv5gdgExsY/itupaoGsBsiTr
        u5g9Lm+GgejO3042qB/ur3PevtSawIoQ20aSyr0=
X-Google-Smtp-Source: ACHHUZ47gyrJoZge2mlr2jmFuPxoz12hCkx3cc854GFgU74O8T/xqVtPoU/Xd/OevOGA6P2rDadXuQ==
X-Received: by 2002:a17:907:9728:b0:97d:f8db:601 with SMTP id jg40-20020a170907972800b0097df8db0601mr6079097ejc.62.1686568502845;
        Mon, 12 Jun 2023 04:15:02 -0700 (PDT)
Received: from [192.168.1.149] (i5C74066A.versanet.de. [92.116.6.106])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709064e4c00b00965e1be3002sm3463054ejw.166.2023.06.12.04.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 04:15:02 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Mon, 12 Jun 2023 13:14:50 +0200
Subject: [PATCH libgpiod 3/3] bindings: rust: document build without
 install
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-crates_io_publish-v1-3-70988ee9a655@linaro.org>
References: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
In-Reply-To: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686568499; l=1340;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=9hj92/J4aEKe6yjLkwxtY/de6Oko13n5mW+Lz9nN/VU=;
 b=2z6B877xz3/ypfjoRmABE7KGa+AdfftaE9DWUowe2Ii2wEsrG0bNMm/gQ2vF9y/4FwWgY9Ti/
 KPvLPuDfDvLB15PdmUwZOk3clHGVEUPD4y9be+MT8caSANESdilf/BA
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

While the Makefile does this automatically, a user may want to do
something similar for other cargo commands.

Reported-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/ZIQJquwzNacp1Nuh@sol/
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod-sys/README.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
index 90198d8..f9db496 100644
--- a/bindings/rust/libgpiod-sys/README.md
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -16,6 +16,15 @@ libs and headers by setting environment variables. The mechanism for that is
 documented in the
 [system_deps crate documentation](https://docs.rs/system-deps/6.1.0/system_deps/#overriding-build-flags).
 
+If installing libgpiod is undesired, one can set the following environent
+variables in order to build against the intermediate build results of a `make`
+build of the C lib (paths are relative to the Cargo.toml):
+
+	export SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=1
+	export SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="<PATH-TO-LIBGPIOD>/lib/.libs/"
+	export SYSTEM_DEPS_LIBGPIOD_LIB=gpiod
+	export SYSTEM_DEPS_LIBGPIOD_INCLUDE="<PATH-TO-LIBGPIOD>/include/"
+
 ## License
 
 This project is licensed under either of

-- 
2.40.1

