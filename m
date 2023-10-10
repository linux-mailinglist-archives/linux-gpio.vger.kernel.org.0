Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003EF7BF3DD
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 09:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378097AbjJJHNS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 03:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379431AbjJJHNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 03:13:17 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F90C9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 00:13:15 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53b962f09e0so4213519a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 00:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696921994; x=1697526794; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pBteYqBgIBQi/eSL7JHgTBkOogK1PCBtZ+ZUuywLYc=;
        b=tO4QKlPTbXYIh1n/UnmaIZtOfddYKwOR4BNFa4pulnMhAwtA3wgC+amxaZLyowdWMb
         jor530SGSkql8D6wPhxP9gzFjJ5G5fY2SoVZ6TWpHkrxcJOdXPEsjL8r0ZsMBrXWOhSs
         NTENV5wnkjHLiWueZKIHYJhcIGH7j/S2j3e2QFmldAzv3wNuhpWE+BgeYp9yJSJWbz33
         GzEbT8hXkHTCKRsD+DuoVpkRi2NjGRuzhndxJzY+27oJknnW7SmduzgyTH0ExXCJxQVK
         iRzAMWd+K2+OyBRfQELrk5PoEI/MC7bnXbZM1v7bY1JsUVJDTlTq1M1M1iWtDw2xaYRj
         CBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696921994; x=1697526794;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pBteYqBgIBQi/eSL7JHgTBkOogK1PCBtZ+ZUuywLYc=;
        b=q4NoGjiwYaMR7ePdo96TIVjiPckODvBCsYoAAaTPgIIp6YUPkvldGkDb0NmgzltfoB
         /PVJ9vORimKQgxhl3zq66I46HWopDjTm3SLtU5/8fzHKS3HrjCChvp3XMP30RWqBdM1N
         eDcqUJuMwWo3k00PQxw5AgUYVRa0AksDuSDUURlwp+8zlFoFRQnO9Z5Jxwg0hCD5GSFc
         fvrL7EN1wqlH5SOEbS2WVHceUjmaB7F0VntLXU1/d3cKGsOZdtkqgN6EWWFfGDZNRVJ9
         r63Ajf/jLpLtgzopVXplLyRsbDK1eiyCS5Nlh0qZ/QDG1ndQHKm7tjuBGMXOjZSlVKEv
         qeWQ==
X-Gm-Message-State: AOJu0YxwieV8FC4RGODy6j6IYkNyO67hIb88A01b1CtWDRcsrlIycmv7
        nGgBuUJgp48ndQiIsVyLQhEOrg==
X-Google-Smtp-Source: AGHT+IF+tlUgS32UsCHRldHE0DbkdadWTuKwYyM4rSQ3IqmlDX8l6r1xUFHhwEj2/pskcTu9qrftNw==
X-Received: by 2002:a17:906:9a:b0:9ae:68bf:bf2 with SMTP id 26-20020a170906009a00b009ae68bf0bf2mr14779033ejc.69.1696921993703;
        Tue, 10 Oct 2023 00:13:13 -0700 (PDT)
Received: from [192.168.1.149] (i5C743875.versanet.de. [92.116.56.117])
        by smtp.gmail.com with ESMTPSA id l7-20020a170906a40700b009ae587ce133sm7992113ejz.188.2023.10.10.00.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 00:13:13 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Tue, 10 Oct 2023 09:13:11 +0200
Subject: [libgpiod][PATCH] bindings: rust: libgpiod: release 0.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231010-b4-libgpiod-0-2-1-v1-1-291cb0cd23d4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIb5JGUC/zWMQQqAMAzAviI9W+g6RfQr4kFd1YKobCDC2N8dg
 sdAkghBvEqArojg5dag55HBlAXM23isguoyAxNbQ4ZwqnDXab30dEjIaHCZm9YSy9jUDLm7vCz
 6fM8efheGlF7UG8TLbQAAAA==
To:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696921993; l=1236;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=qSBhfAONC366VO5YrXBR1nlakQH0i9Ey2dDrmT0WNqg=;
 b=QQm2/sifk4NE7hTPevFzgjGy6MrqU2nYKeuP0AbjPj9zctJ37dpEyqKg11QeKQBXNybpetVRI
 k0b9fNhBu9MCPqclbxA3G/EpOVsdfcFf9RVBJTcw0aJhAzGgyR4MZ5x
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While the release technically removes a function, that function was not
available in any released libgpiod version. Therefore, this only bumps
the minor.

This release fixes building with releases from the 2.x series of the C
lib.

Changelog:
=========

acebcf2 (bindings: rust: feature gate unreleased features, 2023-10-06)

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
Same as last release: Once this is merged, I will publish a new release
of the crate to crates.io.
---
 bindings/rust/libgpiod/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 3fd1d74..3ce05df 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod"
-version = "0.2.0"
+version = "0.2.1"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

---
base-commit: acebcf2cbefb735eaddc06ee52eb1b1c85886d1b
change-id: 20231010-b4-libgpiod-0-2-1-fc79302ea752

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>

