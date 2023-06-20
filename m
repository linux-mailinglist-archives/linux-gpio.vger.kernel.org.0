Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2A847372DA
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 19:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjFTR2j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 13:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbjFTR2i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 13:28:38 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1911739
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 10:28:16 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4715758343aso1421598e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687282094; x=1689874094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FtlObKjxEvbuBatxaZEIY8U7Qu76IXGU2ksK5EtIdk=;
        b=AlzXbywx98eiQ3DdIHtm8FwyFWdOUDxFZ4J6WB+nE+wPHoPYo1rSzymrkZ1FrSSrij
         uvzB575ndrSEak7w90R29LvXifmeSRcDzbe+lv9WjP/dkT8wMvG0LJIbFV6+V/AwO9eN
         Uu+Ku6EslDvng0Wdz+MKBNnrXISM1Spnjz8b6zz/pKlRIYLWR3B3cwPFMTGQvWvhDOLG
         2HUVfEJ/ShW9jUNZ93KT50ctWyJkRwHxvTCwJU6IbHSBIoqaU6aFJmv+j9xeUi3/irwB
         X2CKwkntkAMPkDWsJt+TzwCTd8BOVEj+ZrcXBaxirDsJPVBs+WIWmdCGKe+eznlqYmV2
         zG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687282094; x=1689874094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FtlObKjxEvbuBatxaZEIY8U7Qu76IXGU2ksK5EtIdk=;
        b=H7uYxT45xzSFZ9+KQlEj0aNb8li18erlz1rSvUEI/dW89Krkon1HT0YvgKiSr+cdQ9
         O91I0tMFbrDxU3WcpQfPRqQrlLlKah1veJgnnVtm5DKYVKFt4ywgH+BzDLRZ5/ZeSga2
         zyRUp76qrYpc8Ikq+/ctaNZx3j3HsdO3IRl9fH6qfnohRaFGf8AxALoKoBF/Va54KlH9
         rBd20vkWKor4vx8NxQK9L9HeQsORJavnZCFOhlEwsxp04xAUukNzqhZM9vibei8Lw0B1
         Y0cvdVw4wHFddGYGEH07PH1VOghnYca4L3iqNDNJDk87qfdNLoO9NFCdNbKeTQ2XTpuO
         6AvQ==
X-Gm-Message-State: AC+VfDwJirOjmBykEkoOokavFqun3zFACP9lyrMLU5s/w+A5v9S1AV8S
        /U0zrFLuFCJl3zsnbnpYmx+ZPF+ZDgQS3iX2vMG1iA==
X-Google-Smtp-Source: ACHHUZ4Uo2Kdkulxs3JP433UMVSQ+mkvPsSzSJSMtVZF1dtiItE5mg8pcdxgk8B8FtOBEwg48wLT99AMbfooUwcHxoQ=
X-Received: by 2002:a1f:c18b:0:b0:471:7498:e871 with SMTP id
 r133-20020a1fc18b000000b004717498e871mr4275504vkf.10.1687282093944; Tue, 20
 Jun 2023 10:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230620124130.303427-1-brgl@bgdev.pl> <ZJGtDJtcWwdSOyGJ@sol>
 <CAMRc=Mc3-Uj7hjqdY=pihQRURY=rgSXkvqLaL2Wvneqq86G6fw@mail.gmail.com> <ZJHHb/7VpsTi81rc@sol>
In-Reply-To: <ZJHHb/7VpsTi81rc@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 20 Jun 2023 19:28:03 +0200
Message-ID: <CAMRc=Mcek_1bhjwmuRvTz6Z+BYUAFuRNeuznzNtjGsD1bPS5+g@mail.gmail.com>
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

On Tue, Jun 20, 2023 at 5:36=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, Jun 20, 2023 at 05:19:27PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Jun 20, 2023 at 3:43=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > > >
> > > >  gpiosim_chip_symlink() {
> > > > -     GPIOSIM_CHIP_LINK=3D"$2/${GPIOSIM_APP_NAME}-$$-lnk"
> > > > +     GPIOSIM_CHIP_LINK=3D"/tmp/${GPIOSIM_APP_NAME}-$$-lnk"
> > > >       ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
> > > >  }
> > >
> > > The $2 dicates where the symlink was placed.
> > > Now it is ignored and placed in /tmp regardless, which is wrong.
> > > Refer to where it is called.
> > >
> >
> > I understand the $2 was ignored here but why is it wrong to use /tmp?
> > Why would we want to create the link in .? Also: shunit defines
> > SHUNIT_TMPDIR which seems to be exposed for temporary files generated
> > by tests, I'm more inclined towards using this one.
> >
>
> The $2 is there for a reason - that is where you want the symlink
> located.
>
> "gpiodetect: all chips" puts a symlink in /dev to check that it is
> ignored.
>
> ""gpiodetect: a chip" puts one in the PWD to check that gpiodetect will
> find it.
>
> If you want to remove that parameter then review and revise  all the
> places it is used.
>

Indeed, thanks. I'll keep it as is then, as these are valid use-cases.

> > > > @@ -2072,9 +2063,13 @@ request_release_line() {
> > > >       dut_run_redirect gpiomon --num-events=3D4 --chip $sim0 4
> > > >
> > > >       gpiosim_set_pull sim0 4 pull-up
> > > > +     sleep 0.01
> > > >       gpiosim_set_pull sim0 4 pull-down
> > > > +     sleep 0.01
> > > >       gpiosim_set_pull sim0 4 pull-up
> > > > +     sleep 0.01
> > > >       gpiosim_set_pull sim0 4 pull-down
> > > > +     sleep 0.01
> > > >
> > >
> > > Why are delays now required between sim pulls?
> > > Might toggle the pull before it gets propagated to the cdev?
> > > Add a function that describes that rather than a raw sleep?
> > > gpiosim_wait_pull?
> > >
> > > Split that out from the shunit2 change if if is a general problem?
> >
> > Porting to shunit revealed a problem similar to the one I saw in C
> > tests - toggling the sim pull too fast would lead to losing events.
> > Turns out BATS was slow enough to hide the problem. If I run shunit
> > over strace, the problem is gone too because it slows down the
> > execution.
> >
>
> I see the same in some of my compiled unit tests, and add propagation
> delays to allow for it.  For me, the tool tests have always been too slow
> to trigger it - and still are, but it wouldn't surprise me to see it
> on a faster machine.  So no problem with adding some allowance there.
>

I'll put it into a separate patch.

Bart

> Cheers,
> Kent.
