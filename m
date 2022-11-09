Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E9B622824
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 11:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbiKIKMQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 05:12:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiKIKMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 05:12:13 -0500
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F401D316
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 02:12:12 -0800 (PST)
Date:   Wed, 09 Nov 2022 10:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1667988729; x=1668247929;
        bh=sfEzrEjmM7iMLFpX8HnS5oPTyZbUtAIqI+D4BILBLKY=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=QomSysndz1iVh6esKChLFplHtAQDVgMXo6j+KgIy2hBJuVzprQE8mm/Q0Zs+H0C/S
         QBGlwmFD7Pz65tXR9ZOQh0/OjITBJUhUMSpvQTPkydXlNlta7XlQs/srN+JRGvARga
         SY2lUtylUtxUGX1xb0XSLem4SkeVvM1d9sfqYiEeK2SLQQ2xo9VQZrgzm4Zs/Q35sx
         BendQUNY4lr6NhmUC0SNJFcV3q+tEUuf7efYcUWQIHx53uZge/MPKzG+w9fp7xOq+H
         5Lh3z13TlvOz7lfVbzJ+K/jlrxDRlnau945vZL99R64amZojf5LJDk62xRhxmvS7lb
         vRseNjlXwdtrg==
To:     Bartosz Golaszewski <brgl@bgdev.pl>
From:   =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 7/8] bindings: rust: Add tests for libgpiod crate
Message-ID: <0vBj-aJdBA862C_lhhXmDju9vtaHahGOK57lEX4yZx6CRUtH9SGHJgPP_noow8Zs_ghry9tnEfnwAhLe5tuqNlkVPr2dLgAaYEn44ybX3S0=@protonmail.com>
In-Reply-To: <CAMRc=Mfb+CVA+2fThZqUFWYYmk1dU9NiMMP+rZtbcNFyGehKrQ@mail.gmail.com>
References: <cover.1667815011.git.viresh.kumar@linaro.org> <d9d71dc939ad39abf262f5442d423c2241336548.1667815011.git.viresh.kumar@linaro.org> <CAMRc=Mfb+CVA+2fThZqUFWYYmk1dU9NiMMP+rZtbcNFyGehKrQ@mail.gmail.com>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wednesday, November 9th, 2022 at 10:30, Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:


> On Mon, Nov 7, 2022 at 10:58 AM Viresh Kumar viresh.kumar@linaro.org wrot=
e:
>=20
> > Add tests for the rust bindings, quite similar to the ones in cxx
> > bindings.
> >=20
> > Signed-off-by: Viresh Kumar viresh.kumar@linaro.org
>=20
>=20
> Without modifying udev rules on my system - is there a one-liner I
> could use to launch the tests? I guess using cargo as sudo is wrong
> but the executables are there so can I somehow run them all at once as
> if running `cargo test`?
>=20
> Bartosz

For running doc tests setting the RUSTDOC env var to a shell script that ru=
ns rustdoc as sudo may work. You should probably unset it when using cargo =
doc though to prevent the generated documentation from being owned by root.=
 For unit tests and integration tests you can set the CARGO_TARGET_X86_64_U=
NKNOWN_LINUX_GNU_RUNNER (adapt for the target triple of your system) env va=
r to "sudo" to run just the tests as root using sudo, but keep cargo runnin=
g as regular user. The runner env var also applies to cargo run and cargo b=
ench. See [1] for some basic documentation.

[1] https://doc.rust-lang.org/cargo/reference/config.html#targettriplerunne=
r

Cheers,
Bj=C3=B6rn
