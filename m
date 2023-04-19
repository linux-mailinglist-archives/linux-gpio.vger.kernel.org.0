Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA386E76F2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Apr 2023 11:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbjDSJ7P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Apr 2023 05:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbjDSJ7O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Apr 2023 05:59:14 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602C513C03
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 02:58:44 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-54c12009c30so599945117b3.9
        for <linux-gpio@vger.kernel.org>; Wed, 19 Apr 2023 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681898323; x=1684490323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G/WSZo+gcH6X6a1a2caBC9aHUd84iNzgEOnV4p0Mlk=;
        b=bQi3HLYKCH1/8G+OpThAaZzC9IRR5jRpC6DZAuX0XVuPccFqvdps9wAKZTazR1Q04W
         CcASfNW7/A6+wS2N3ZMUhYOaeBD71g0rlQLEamrj1P1AIOShbgSFaWj/oZic5d/IH4gM
         7l0INQA7pJBRBbTCLJJhzi/Gp0N/F3XrV/nngE7SpsUk+GR1/0aSSxvV7/5f5aoWGMjk
         O5safwi7X9huQkHGG8DZwg8+v8DpeaPwHAUmtixkFZnjF9EtPR1jny/RsgC8myDK5Twv
         k0pAJvaX/4xCnrHbRXV494Hbx7CeI402QomIKfLderF5yEdIMMIkseg8RSfrREvdFCDF
         dSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681898323; x=1684490323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G/WSZo+gcH6X6a1a2caBC9aHUd84iNzgEOnV4p0Mlk=;
        b=iBFpA/OambgDhWXrClx7cB3SSln7ArBdQBiXPZLc4HQ9D7deuKfcr6MjE3/3zy1qjM
         u45qvuxmxmmk2Z3gTxgDU4McsqNUtargDL9DAKoEI/SuPX4O/eDyByfrxo5pxU9tTaHL
         04IoSRs+tk6Rs7pwrUEywEzfBhlSj6XeXXFUEmAA6389QPSXQA/nUgM0P9Wq8xQs3PKr
         0uYwY4LPAv16PbMkmIDF01ZS/F4KXwqCCgpN2eSvGvaR0wxnRaaEU2KI5PgSf09M0oMm
         Q4kAlu29qxCwCCjsJahPwUYR2EHYUMxWE7yvYSs7MKcOF1PIcPYgjgla7lMcCx0EJr7a
         accg==
X-Gm-Message-State: AAQBX9ddRkiUJQLYbVP3nZKpZfUZC5TDuCWtPwUykE7XEn8o0LeaoV/L
        8mx0kC3aa5J+uA7KJvHY3l0YEokulyb21DtVxxxHUUBMJ9Eyewd/
X-Google-Smtp-Source: AKy350acsT0E4K6ol3tkI/tXP64rKIFIIW2NIyRxCOSDdj1EhyYenQ2tx7NHCcDnG790k6W7B/D1G5VVxH1ZFAy2TIc=
X-Received: by 2002:a0d:e287:0:b0:54f:752e:9e60 with SMTP id
 l129-20020a0de287000000b0054f752e9e60mr2457916ywe.37.1681898323539; Wed, 19
 Apr 2023 02:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230419072848.gwe3oga57qyg4u42@vireshk-i7>
In-Reply-To: <20230419072848.gwe3oga57qyg4u42@vireshk-i7>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 19 Apr 2023 11:58:32 +0200
Message-ID: <CANiq72mHuu-GWU8KO2Xb0e8vfLPOdSynT7pi4mOjY_kjYOnsTw@mail.gmail.com>
Subject: Re: Broken build with rust bindings (without --enable-tests)
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 19, 2023 at 9:28=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> I earlier thought that if I am doing "cargo build" without "--tests"
> or "--examples", then dev-dependencies are not built. I was wrong.

No, it will not get built. If you do `cargo build` on `libgpiod`, then it w=
orks.

The problem is in the `Makefile.am`s instead -- `make` is told to go
into all of the crates and run `cargo build` for each:

    SUBDIRS =3D gpiosim-sys libgpiod libgpiod-sys

Cheers,
Miguel
