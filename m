Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAF870F03F
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 10:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjEXIKC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 04:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbjEXIKA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 04:10:00 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5C0E9
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:09:58 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96fe88cd2fcso107381766b.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 01:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684915796; x=1687507796;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIkMNYW4znEQbN6r37aL8xRXRdNMK8FkoMjtIsbZ5mA=;
        b=di+REu5urgO8BuNnSk9MMIfl7OZB8WP2SihZj6Ik1+Woz+r6+BHTO4cQY7mTwkpFzZ
         ap/sISjESCKrBBdl8u+c8myY5kNQeEttuwSXCkmPvdVJ9UD40tygJktZR8yMiJHxwxJc
         GRUkolQgXY9CCwVY330YXpfYnFgSJoQ3jN8KjQMkast/NQYgHGyqiwPUdR+c5ETtdBNu
         KHbVLc8QMFH4kY4jXLg9YhE+rmzHc8f0m2KFcPTCoFQAKkTZTi3n3k1lRDVTyHDm0uRt
         qyAvJwi/G79Q0nFDpXYdZsOQs7bUkWJ/bPRMHvZYc0D4j9NkIiUby4T3k8ZYoeG2Uhq6
         J9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684915796; x=1687507796;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIkMNYW4znEQbN6r37aL8xRXRdNMK8FkoMjtIsbZ5mA=;
        b=En/FrjHADNO85zcgVCdEaynNHB7BlJpudGjPxWAwjnRWjii6baLfluneccMu9z8V0O
         qlkVe6c+QyX9IiG6toQRD9gVqfqgYWiwCoSYMET437bATv6gFt0SSzSYKXvGONinI1Zn
         ZHKGohEGPrelBdmN3vY/n4xG7gRo6Fd0tkCLTeDvduviWQs9GqN8ZS6+qBZB+1OR/nRH
         q/S7UhuD+fKxFe6s2+GHjEOLbPxho+/KNQxSGoXOEcU9rTDL2/3DCkTlCAaaS8c2CdDe
         9vq7KGKVmf0gslGunbtdxbfyaT57HJfqfUU4S+dTTV389kAscGIEa+NydFLoSMYQX6XI
         xC8g==
X-Gm-Message-State: AC+VfDy9zZ29NNHD2PrvDk5ljTuaT6ombdvAhNiuJgcJPL6VnB0ls6do
        P63iZZ0ktbByYkn7S6DUJ4nZ1g==
X-Google-Smtp-Source: ACHHUZ4gtwNjd/jJhm5uG3kZ33VwzqkfvKNr0BRU28ofeVtM0kfxB99VykW4c2QDXeA2WdPBf+3QTw==
X-Received: by 2002:a17:907:98e:b0:960:ddba:e5c3 with SMTP id bf14-20020a170907098e00b00960ddbae5c3mr16114770ejc.32.1684915796493;
        Wed, 24 May 2023 01:09:56 -0700 (PDT)
Received: from localhost (i5C7404E8.versanet.de. [92.116.4.232])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709066d4600b00965e9a23f2bsm5396708ejt.134.2023.05.24.01.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 01:09:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 24 May 2023 10:09:55 +0200
Message-Id: <CSUCSUR6CSH3.NHT0430XGAIO@fedora>
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of
 libgpiod-sys
From:   "Erik Schilling" <erik.schilling@linaro.org>
To:     "Viresh Kumar" <viresh.kumar@linaro.org>
X-Mailer: aerc 0.14.0
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230524060341.khmsd2lw32u3jxsc@vireshk-i7>
In-Reply-To: <20230524060341.khmsd2lw32u3jxsc@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed May 24, 2023 at 8:03 AM CEST, Viresh Kumar wrote:
> On 23-05-23, 13:25, Erik Schilling wrote:
> > As of now, the Rust bindings are only consumable as git dependencies
> > (and even then come with some restrictions when wanting to control
> > the build and linkage behaviour).
> >=20
> > This series does some (hopefully) cleanup and then proposes a change
> > in how the Rust bindings are built and linked.
> >=20
> > Since the changes may require people hacking on the bindings to set som=
e
> > additional environment variables (at least if they want to avoid runnin=
g
> > make install), I am sending this as an RFC in order
> > to hear opinions.
> >=20
> > For gpiosim-sys the situation is slightly more complex. Right now,
> > libgpiosim installs without a pkg-config. If it is desireable to add
> > one, that could be done and the same mechanism could be used. Otherwise=
,
> > if packaging that lib is desirable (it looks like it?), we could either
> > still query for libgpiod (and hope that the linker and include paths ar=
e
> > matching) or need some other way to acquire the linker and include path=
s
> > (and flags).
> >=20
> > So... The open questions:
> > - Is this OK at all? Are people depending on this building against
> >   relative paths?
>
> Not sure if the build of the libgpiod git repo depends on that relative p=
ath,
> did you try to do `make` in the libgpiod directory ? Like:
>
> $ ./autogen.sh --enable-tools=3Dyes --enable-bindings-rust --enable-examp=
les --enable-tests; make

Ah! I did not catch that libgpiod is built via `make` too. I only
checked the Makefile under libgpiod-sys.

But we can do something like this (I would probably redo the
documentation part in the README then though...):

diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Ma=
kefile.am
index 38f2ebf..8bbf530 100644
--- a/bindings/rust/libgpiod/Makefile.am
+++ b/bindings/rust/libgpiod/Makefile.am
@@ -2,7 +2,13 @@
 # SPDX-FileCopyrightText: 2022 Linaro Ltd.
 # SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@li=
naro.org>
=20
-command =3D cargo build --release --lib
+# We do not want to build against the system libs here. So we specify the =
paths
+# to the build directory of the C lib.
+command =3D SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=3D1 \
+               SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE=3D"${PWD}/../../../lib/.=
libs/" \
+               SYSTEM_DEPS_LIBGPIOD_LIB=3Dgpiod \
+               SYSTEM_DEPS_LIBGPIOD_INCLUDE=3D"${PWD}/../../../include/"  =
\
+               cargo build --release --lib
=20
 if WITH_TESTS
 command +=3D --tests

>
> > - What to do with gpiosim-sys (see above)?
>
> The only user for the cargo tests for libgpiod stuff is for the vhost-dev=
ice
> crate with the help of rust-vmm containers. I am installing libgpiod ther=
e
> currently and so it works, not sure of how it may be required to be used =
later
> on though.

I am not exactly sure if I understood the above comment correctly. But
if we want to eventually be able to consume gpiosim-sys via crates.io
(or any packaging mechanism that relies on cargo package), then we will
need to decouple the header and .so file referencing in a similar way.
The easiest solution for me seems to be to just add a pkg-config file
for gpiosim and use the same mechanism that I sketched for libgpiod-sys
here.


