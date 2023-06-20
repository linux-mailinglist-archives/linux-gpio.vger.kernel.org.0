Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE56C73703C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 17:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbjFTPTm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 11:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjFTPTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 11:19:41 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C941C132
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 08:19:39 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-43dd7791396so1365753137.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687274379; x=1689866379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4r2fP00boU/U3kYpzEbXbZBuviwNX8izS2+LDxyJ8Uk=;
        b=3YP2iapvoZCHzq385e1nGoZR9AV/luG4EF8Sd5LvWC5Ww8I9/zwSCgc5V37tckKj47
         M2tOAKhlJW6U/LPatd6ThofWYRzJs9LKpCuJidtyQezRVnYN/01ofiP4Wd/Xb813EeRz
         wpspmu+4hF7Wh7k2CHZWEKCpjgANES+4qOFw8fUC+sgQVoNvXyZto5ofynN1uSG0igXP
         FgZylIvxuB9kwY8eLdEY9l/dibOYIhcbvUcgxmb7Fg4gy4b5FWDnYxiDHJMNflVI5a31
         jFokpYV6UCaBprSEBtbn7RaG5jEHyiEI/y2ly5e/CUrCcCwUsOs8olVwKUKtKq3ZvtY/
         9orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687274379; x=1689866379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r2fP00boU/U3kYpzEbXbZBuviwNX8izS2+LDxyJ8Uk=;
        b=hrNMt9quTb/WAFyWVTh8GG9PnlmCJJp1NKH9BOhMLaYHUzSe5PolVZ/ouZC5+JD+vI
         IKkhRax+X9NTfc29Jmq6xnI+ftMWPt9MMD7Ai9UvEftvegCSS2eD7iJSbsjySWHCNbWA
         FPSIX2cSfIxzwaFNT4Hd2WSD2658z9pd1Scrww/QVjBTHOu40mLGXZRg4SIeEjaw8pud
         bpllwJuMwi5UmDVL1Gg8sJ5Xk2verq8TJFqUgOIW8SJBR0BV3TFYHIdqJlwD9OMfedYO
         up3hezfi1d9M0DRrZGXZv9IqjIFmNXxNNiQ0AlmtznSE5pl8nnkrDDz59pTNyAIFj1RL
         OMEA==
X-Gm-Message-State: AC+VfDwdodhztvcBb1bqvSTCg35GHPAZ5cni5yTPdYQUgeudlxZjqD/D
        GEtVEeUSZXKBLlUncnUre9vrKMGfkSoys1cHeQS35w==
X-Google-Smtp-Source: ACHHUZ4nTuPwmT5t/pZ35D7dEELfnj8WzaHF8Ig30q7PZ1rvk9RD7ly3Xw8FI147oS8N0x5XQkaKZPhHo3NCYqcZypU=
X-Received: by 2002:a67:cd05:0:b0:440:9eb0:6f17 with SMTP id
 u5-20020a67cd05000000b004409eb06f17mr3702041vsl.0.1687274378876; Tue, 20 Jun
 2023 08:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230620124130.303427-1-brgl@bgdev.pl> <ZJGtDJtcWwdSOyGJ@sol>
In-Reply-To: <ZJGtDJtcWwdSOyGJ@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 20 Jun 2023 17:19:27 +0200
Message-ID: <CAMRc=Mc3-Uj7hjqdY=pihQRURY=rgSXkvqLaL2Wvneqq86G6fw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: tests: port tests to shunit2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, Jun 20, 2023 at 3:43=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, Jun 20, 2023 at 02:41:30PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > - update docs
> > - remove all bats-specific workarounds
>
> Not sure you got them all - more below.
>
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> >  # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gm=
ail.com>
> >  # SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
> > +# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewsk=
i@linaro.org>
> >
>
> Just extend your previous?
> Or is the email address change significant?
>

I'm doing it on linaro payroll in 2023 so let's give them credit. :)

> >  # mappings from local name to system chip name, path, dev name
> > -# -g required for the associative arrays, cos BATS...
> > +# -g required for the associative arrays.
> >  declare -g -A GPIOSIM_CHIP_NAME
> >  declare -g -A GPIOSIM_CHIP_PATH
> >  declare -g -A GPIOSIM_DEV_NAME
>
> As per the comment, the -g was there to satisfy bats, so can be removed
> nowi - both the comment and the -g option.
>

Got it.

> >  gpiosim_chip() {
> > @@ -110,7 +101,7 @@ gpiosim_chip_number() {
> >  }
> >
> >  gpiosim_chip_symlink() {
> > -     GPIOSIM_CHIP_LINK=3D"$2/${GPIOSIM_APP_NAME}-$$-lnk"
> > +     GPIOSIM_CHIP_LINK=3D"/tmp/${GPIOSIM_APP_NAME}-$$-lnk"
> >       ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
> >  }
>
> The $2 dicates where the symlink was placed.
> Now it is ignored and placed in /tmp regardless, which is wrong.
> Refer to where it is called.
>

I understand the $2 was ignored here but why is it wrong to use /tmp?
Why would we want to create the link in .? Also: shunit defines
SHUNIT_TMPDIR which seems to be exposed for temporary files generated
by tests, I'm more inclined towards using this one.

> > @@ -2072,9 +2063,13 @@ request_release_line() {
> >       dut_run_redirect gpiomon --num-events=3D4 --chip $sim0 4
> >
> >       gpiosim_set_pull sim0 4 pull-up
> > +     sleep 0.01
> >       gpiosim_set_pull sim0 4 pull-down
> > +     sleep 0.01
> >       gpiosim_set_pull sim0 4 pull-up
> > +     sleep 0.01
> >       gpiosim_set_pull sim0 4 pull-down
> > +     sleep 0.01
> >
>
> Why are delays now required between sim pulls?
> Might toggle the pull before it gets propagated to the cdev?
> Add a function that describes that rather than a raw sleep?
> gpiosim_wait_pull?
>
> Split that out from the shunit2 change if if is a general problem?

Porting to shunit revealed a problem similar to the one I saw in C
tests - toggling the sim pull too fast would lead to losing events.
Turns out BATS was slow enough to hide the problem. If I run shunit
over strace, the problem is gone too because it slows down the
execution.

I can send it in a separate patch alright.

>
> > -@test "gpiomon: with idle-timeout" {
> > +test_gpiomon_with_idle_timeout() {
> >       gpiosim_chip sim0 num_lines=3D8
> >
> >       local sim0=3D${GPIOSIM_CHIP_NAME[sim0]}
> > @@ -2114,10 +2109,9 @@ request_release_line() {
> >       dut_wait
> >       status_is 0
> >       dut_read_redirect
> > -     num_lines_is 0
>
>
> You have something against testing that there is no incidental output?
> That being the point of that check.
> Without it the dut_read_redirect is redundant too.
>
> Or does the new form of num_lines_is not handle the 0 case?
>

Ah I removed it because it was causing problems and forgot to
investigate it. I'll restore it and fix the issue in v2.

> > @@ -2671,11 +2664,9 @@ request_release_line() {
> >       dut_wait
> >       status_is 0
> >       dut_read_redirect
> > -
> > -     num_lines_is 0
>
> And again.
>
> > +# Check all required non-coreutils tools
> > +check_prog shunit2
>
> As noted previously, assertContains requires 2.1.8, so would be good to
> either check for that if possible, or at least document it.
> As it stands the tests will not run correctly on Debian Bullseye, which
> is still on 2.1.6 - though IIRC they do report success regardless -
> which is either nice or unfortunate, depending how you look at it.
>

Sure, I'll add a test for that.

Bart

> Cheers,
> Kent.
