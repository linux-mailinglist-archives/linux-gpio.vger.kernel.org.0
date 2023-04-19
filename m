Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCC76E773E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Apr 2023 12:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjDSKMH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Apr 2023 06:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjDSKMG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Apr 2023 06:12:06 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D871611B
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 03:12:04 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id kx14so8165570pjb.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681899124; x=1684491124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Ge5V//ilPp9HZpRHlKLyLoE0hSimu9w0rFjrr7GMnw=;
        b=eVx3ZCW4RgC3v3kwzwaJnQ6h9mFkLSGdc4eAjAB/SjT2GLvWyakjVrTW4ThOErnssm
         M/gCZcusgpyWYyBKH8LXFGtcqr82s+701PtIltUB1bTr6wREqsDDceewgOOGPJtzboIC
         XTRAA4LemqaKQPS0kZbHsJEd+Jspc+bw2jyw1G4NWw2uhRYW3tVjAcci2ipLWREePQ0r
         zqdr32rb7qdRNMQ+a5RKJc9/JrTGrZp09gK9gzWToZRy1QMuVBtK9Rit6efog9PXvqVN
         yXTF25L3vZcVV7dmqfJ/3ABcU45dK8WnL/Zdh99zehnktmjf8LJ8jOEPsU6c0YH9DDdj
         hOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681899124; x=1684491124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ge5V//ilPp9HZpRHlKLyLoE0hSimu9w0rFjrr7GMnw=;
        b=Lf4FnJoL1Y/DVcFEJ4xvZj43bHyuEuS2YnBzldQXVZ/5Dr42fRkX/qkmm2V1OzJUi7
         U7lGjI0cBgHU0o9FSApqNE45e7fpACvftOjCc3N0Lf5jheJC1ZoqwPYu483FVTPaiIiJ
         V8Fv9VmN1X6J1e7sbWMDmj1gsEl5u5NJVKrfpGxcSCv/ONjxHcHA9i/s7hNXVtjdtB9r
         XYNG3qxgNJn4KjIKoRwTTvyxewIHHBteNVIRoYZ4MtHw0W3/ASJpvbQ1pfcEr1GDiHUs
         UcYz+Yk48UFQHZG4sY/ZFYrvg4+RUOE1CzjS3GuxELeX7AwGyrzHLfa16xBYD+DDvq4j
         U3Jw==
X-Gm-Message-State: AAQBX9fXaCI0x712ew07VmaIoTYRDelPRRJnDpf1dyDbts7kctGfzsKT
        BSIPCzdeafaHRRvlEkg1lU95mg==
X-Google-Smtp-Source: AKy350aLrn5nxFx1h/zBKKwsrXScmfJ0FCBTanteXxwmCOoh8WppKDlBlzOpblvpX+L2pW4UB4yqtw==
X-Received: by 2002:a05:6a20:3955:b0:f0:69db:ec01 with SMTP id r21-20020a056a20395500b000f069dbec01mr3693269pzg.6.1681899124198;
        Wed, 19 Apr 2023 03:12:04 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id s5-20020aa78d45000000b005941ff79428sm10864890pfe.90.2023.04.19.03.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 03:12:03 -0700 (PDT)
Date:   Wed, 19 Apr 2023 15:42:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: Broken build with rust bindings (without --enable-tests)
Message-ID: <20230419101201.54s7mmduhcct7pfe@vireshk-i7>
References: <20230419072848.gwe3oga57qyg4u42@vireshk-i7>
 <CANiq72mHuu-GWU8KO2Xb0e8vfLPOdSynT7pi4mOjY_kjYOnsTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mHuu-GWU8KO2Xb0e8vfLPOdSynT7pi4mOjY_kjYOnsTw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-04-23, 11:58, Miguel Ojeda wrote:
> On Wed, Apr 19, 2023 at 9:28 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > I earlier thought that if I am doing "cargo build" without "--tests"
> > or "--examples", then dev-dependencies are not built. I was wrong.
> 
> No, it will not get built. If you do `cargo build` on `libgpiod`, then it works.
> 
> The problem is in the `Makefile.am`s instead -- `make` is told to go
> into all of the crates and run `cargo build` for each:
> 
>     SUBDIRS = gpiosim-sys libgpiod libgpiod-sys

Ah, so this is what we need ? It works.

diff --git a/bindings/rust/Makefile.am b/bindings/rust/Makefile.am
index 1e01024b04ea..7903f828d87d 100644
--- a/bindings/rust/Makefile.am
+++ b/bindings/rust/Makefile.am
@@ -2,22 +2,5 @@
 # SPDX-FileCopyrightText: 2022 Linaro Ltd.
 # SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>

-command = cargo build --release --lib
-
-if WITH_TESTS
-command += --tests
-endif
-
-if WITH_EXAMPLES
-command += --examples
-endif
-
-all:
-       $(command)
-
-clean:
-       cargo clean
-
 EXTRA_DIST = Cargo.toml
-
 SUBDIRS = gpiosim-sys libgpiod libgpiod-sys
diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Makefile.am
index 6b55d0d509d1..38f2ebf37aff 100644
--- a/bindings/rust/libgpiod/Makefile.am
+++ b/bindings/rust/libgpiod/Makefile.am
@@ -2,5 +2,21 @@
 # SPDX-FileCopyrightText: 2022 Linaro Ltd.
 # SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

+command = cargo build --release --lib
+
+if WITH_TESTS
+command += --tests
+endif
+
+if WITH_EXAMPLES
+command += --examples
+endif
+
+all:
+       $(command)
+
+clean:
+       cargo clean
+
 EXTRA_DIST = Cargo.toml
 SUBDIRS = examples src tests

-------------------------8<-------------------------

I am also not sure if there is any significance of adding SUBDIRS for
gpiosim-sys and libgpiod, and adding Makefile.am in those directories.

-- 
viresh
