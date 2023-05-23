Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D298470DB6B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 13:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235864AbjEWL01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 07:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjEWL0Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 07:26:25 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE878FF
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 04:26:21 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96fa4a6a79bso506716666b.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684841180; x=1687433180;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWnfFLYDLqYGqRCNCvQIq2gQGonojk3wbLd5LP5wZ50=;
        b=pRJk0qe449/TnWw8wNvckO726gHwo9RM0q5THmXJiEr2Me31rgKGBPal2FqIW9l2gZ
         DG4+6oTLxhVUriOPo1zu5DAH0+HeBC19Ari28YZtJqTOKhGFpvpwlrC9yLUaBZmVRsGD
         Uz7VskPoS/rhocKaBw0qsQjQQpDEoMmrNYvJXoOBGwLWfNq0s21sis1n9O+KJePZrXxb
         ToN/c68UCM0ZA+TeddqLzEybf/PAGLBGTSlE6GCzet9iDc981oU1LZXbsUtt0xCvJH0D
         sIUJlf764xgKA+/ceq7GRJzcZ2oTqjpWW4/HWbbzBevUPUCaCU1Pkbd0CZYVWLMbrRlY
         gwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684841180; x=1687433180;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWnfFLYDLqYGqRCNCvQIq2gQGonojk3wbLd5LP5wZ50=;
        b=L383hb3pGAbfRAQa5bYIBNKbAuOexnLIbcZN8+rQs0xpJ9y8udKyffI482lCEGI7Ut
         Ue/IfET6xA1sslsSe3j71wPICzfSOooKV/dVVe+XphFxwi3DZbioYMqg/TjTL0+gwY1e
         8UUaIuPzNq6tKDE0vrOp++zw4fkkUOAH1banl2DN2nIuq3dNZEMr3wCHMM7h9gkz8sNo
         /zc1bk93N3E1skCKk0f3GWABmsqcidyGfUUMUQ37Z1EHYw8Lyh2zzcuDp0lJ+u+CAma4
         J+FGuGVcN3Q5K6XC1asPRYrNyNKravonoQPzaDX85s1G+u2I0Qy6tweOftitDL4x00hM
         oSzA==
X-Gm-Message-State: AC+VfDwJn8N458rSRNcFOANXsE2N7lGBifJqkwiS7RLxB/OnvgMZ0yQm
        78p8eZ82Yr2zC4p1v9l1/sKId357XCkYBRr9yl42ww==
X-Google-Smtp-Source: ACHHUZ7siP+yIPUktNeXOfQ77u/t+SURND4MtZOt3m7MKZ4B/TcT6BUtfVN4MB9PJl3jnE/TBAXnkw==
X-Received: by 2002:a17:907:3601:b0:970:161d:595e with SMTP id bk1-20020a170907360100b00970161d595emr3478976ejc.39.1684841180303;
        Tue, 23 May 2023 04:26:20 -0700 (PDT)
Received: from [192.168.1.149] (i5C7409D3.versanet.de. [92.116.9.211])
        by smtp.gmail.com with ESMTPSA id gv3-20020a1709072bc300b0094f3b18044bsm4342911ejc.218.2023.05.23.04.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:26:19 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Subject: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
Date:   Tue, 23 May 2023 13:25:45 +0200
Message-Id: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmibGQC/x2NQQrCMBBFr1JmbSBO1IJbwQN0Ky4m6dgOhKRMV
 ITSuzt0+T7v8VdorMINrt0Kyl9pUovB8dBBmqlM7GQ0BvQY/BnRJaU3NyfV9X0gHy/xhGEE8yM
 1dlGppNmK8snZxkX5Jb/94AFZ4rRI3e3hfoPntv0B8F/l04EAAAA=
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684841179; l=1877;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=k+w4EX+8FirkiemPZm2PQxlQnA0oYD+cIjQLoFcLlog=;
 b=VPBC/lXkZFfDUNxtR0FR5FKun8/Qn5/BFGjdMQ/UKRAhkl2jIn+EfB9h/rfv0pSPEOM+k/8jS
 uC3Lz3YPErZBHd2SkG3Ihc5kljWDzdt7cIYkwALe1tKtDdqWjiWCRO2
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

As of now, the Rust bindings are only consumable as git dependencies
(and even then come with some restrictions when wanting to control
the build and linkage behaviour).

This series does some (hopefully) cleanup and then proposes a change
in how the Rust bindings are built and linked.

Since the changes may require people hacking on the bindings to set some
additional environment variables (at least if they want to avoid running
make install), I am sending this as an RFC in order
to hear opinions.

For gpiosim-sys the situation is slightly more complex. Right now,
libgpiosim installs without a pkg-config. If it is desireable to add
one, that could be done and the same mechanism could be used. Otherwise,
if packaging that lib is desirable (it looks like it?), we could either
still query for libgpiod (and hope that the linker and include paths are
matching) or need some other way to acquire the linker and include paths
(and flags).

So... The open questions:
- Is this OK at all? Are people depending on this building against
  relative paths?
- What to do with gpiosim-sys (see above)?
- Is there interest into getting this published on crates.io after
  packaging is fixed?

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Erik Schilling (3):
      bindings: rust: drop legacy extern crate syntax
      bindings: rust: remove unneeded cc dependency
      bindings: rust: build against pkg-config info

 README                                | 13 ++++++++++-
 bindings/rust/libgpiod-sys/Cargo.toml |  5 ++++-
 bindings/rust/libgpiod-sys/build.rs   | 42 ++++++++++++++++++++++-------------
 3 files changed, 42 insertions(+), 18 deletions(-)
---
base-commit: 0a51d62f060dbc1b036dfd45e52d4d90f0ce3eeb
change-id: 20230522-crates-io-773a0b6b423d

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

