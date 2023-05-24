Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0142370F1FD
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 11:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236531AbjEXJRj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 05:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbjEXJRi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 05:17:38 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DC08E
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 02:17:34 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-784f7f7deddso271517241.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684919853; x=1687511853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkl0Nc4TaUYGJqYVvMW86JBKQk3i+WebuvWr+2eU4gQ=;
        b=k9vpgJ23fyS6m8Fg/AFwCkvlQhdTTuCxh1D8s7j5mYAR5agu4RfvObZdAl+yaXD5dL
         yzvU/TWj06iWtSt7PcokxIwKV436RjMw7Bnn9rGrqMpyRhAvP6uJCIP4gV9j8LYptnrJ
         lpEg1jV23hQBEXqOHwMoNVoZCNsE2oB8LK/gUO2fKIS/6TPMLJ9fuZkv7AIh1gN9WSGn
         Bu3gqnkTCP67o6OVQw3CL/CeSrDQF3LV1JPtWJJOwJ024CaOGH4VerzQDf+6fq7hJ9fH
         aP6a1gNVJ+g0bavp9egCWjDrofjgenTIympD2FE6XmqDKTPqManMOKvfrJr7G74d2Man
         uz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684919853; x=1687511853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rkl0Nc4TaUYGJqYVvMW86JBKQk3i+WebuvWr+2eU4gQ=;
        b=L6WsPi0TgdTJ29D+XnQIq+F3o5xzolH3T2IaHKGuadfzp5irf7UW95CT0pbtXYKRDQ
         nyxl3dW/jtaJg+yaNKxHvf5mFTJAoH+l3TAOfFcnlwjkSUofjyolHOMtXyGBdwVFbhqo
         KJ/aAJ96cP1Fk2EACJnnaZqH1a9nPwAnat4g2KwP3SyTxNV3If0MbZ6iW6gVabgqOWQO
         kMnOYQ5E3OjMxmxusNbhIg6NkvIKANmplymvGlyjPVZPRRWW3NJm8bbdPEY4+ARoYBWh
         DqdnOSnNdvi+0wkmBcT/SFtOIc6gsR9EG2rjFiRFCb58XHeEeitD9JsY84ZMAZcdHug2
         G/aA==
X-Gm-Message-State: AC+VfDxTKMP6BILWPNU3RcRI6eTwfUppQ/HlECoxbB4ENBYfTHnw9nAd
        rcSfopK5saYyITN6cWjMIHrmcT+tqanNBwi7y27voQ==
X-Google-Smtp-Source: ACHHUZ5ufbWTbgw+cqjo3v5VeAZWZIipXYmI9c5MHIVvpBZrDHysGTKBRhsIXA+W7Z+EKDIso9K9dUdxW14TgZglzyQ=
X-Received: by 2002:a05:6102:3a6c:b0:439:4664:6a71 with SMTP id
 bf12-20020a0561023a6c00b0043946646a71mr3301619vsb.26.1684919853147; Wed, 24
 May 2023 02:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
In-Reply-To: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 May 2023 11:17:22 +0200
Message-ID: <CAMRc=Mfmo0vVpa8xgcf4E7190AMjiDAz_7SOP2-1ghk0FPxijw@mail.gmail.com>
Subject: Re: [PATCH libgpiod RFC 0/3] bindings: rust: allow packaging of libgpiod-sys
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 1:26=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> As of now, the Rust bindings are only consumable as git dependencies
> (and even then come with some restrictions when wanting to control
> the build and linkage behaviour).
>
> This series does some (hopefully) cleanup and then proposes a change
> in how the Rust bindings are built and linked.
>
> Since the changes may require people hacking on the bindings to set some
> additional environment variables (at least if they want to avoid running
> make install), I am sending this as an RFC in order
> to hear opinions.
>
> For gpiosim-sys the situation is slightly more complex. Right now,
> libgpiosim installs without a pkg-config. If it is desireable to add
> one, that could be done and the same mechanism could be used. Otherwise,
> if packaging that lib is desirable (it looks like it?), we could either
> still query for libgpiod (and hope that the linker and include paths are
> matching) or need some other way to acquire the linker and include paths
> (and flags).
>
> So... The open questions:
> - Is this OK at all? Are people depending on this building against
>   relative paths?
> - What to do with gpiosim-sys (see above)?
> - Is there interest into getting this published on crates.io after
>   packaging is fixed?
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Erik Schilling (3):
>       bindings: rust: drop legacy extern crate syntax
>       bindings: rust: remove unneeded cc dependency
>       bindings: rust: build against pkg-config info
>
>  README                                | 13 ++++++++++-
>  bindings/rust/libgpiod-sys/Cargo.toml |  5 ++++-
>  bindings/rust/libgpiod-sys/build.rs   | 42 ++++++++++++++++++++++-------=
------
>  3 files changed, 42 insertions(+), 18 deletions(-)
> ---
> base-commit: 0a51d62f060dbc1b036dfd45e52d4d90f0ce3eeb
> change-id: 20230522-crates-io-773a0b6b423d
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

I applied the first two patches, I'll wait for the respon of 3/3.

Bart
