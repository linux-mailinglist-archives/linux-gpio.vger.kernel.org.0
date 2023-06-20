Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C4E737096
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 17:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjFTPgY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 11:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbjFTPgX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 11:36:23 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47459186
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 08:36:22 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-54f75f85a17so2543382a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687275381; x=1689867381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8P0GjFL/yJ5msfCJtzDQCL4Uztm/oriD65nNw1c+EvU=;
        b=JqeGV0q3x5XFcDMStoh6OfnwnO04uzJCDxxghsJF5t779hYW1aBzXs4x7hO/EBWIVC
         5y3izibCJvx/prKJ7OHOiZluZM978LxI8cyuIkFRUbVLZEwRvMuq8pBr0Wd0P41yodXH
         ZA5G7Y/HHJ2KTnHErN+w4jPo9AevA1zjO6bcUxMXWeOG/hZDbAhKQjFjk+XEhMpyCuGT
         A2KeKb2vL6vqTabcoLL6yChtZDCoIY+8y7dvZ3pjZ3fGrHzoxJLd6sexLwoVfG93ZWgI
         Q9qw+p+siB1fv2Uo/p0iRTlKCPBVFqoPAY5J6G4xUOuq+UqDM07SFFG3UCTcNB2sN+Jw
         t0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275381; x=1689867381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P0GjFL/yJ5msfCJtzDQCL4Uztm/oriD65nNw1c+EvU=;
        b=VuUGk714EpyRy37RXDY+B6cj3ZzuzQ6Re493o1n8Xb8NaSYCXOWN6Cq3BAlSgiCY9s
         wU6b0gCWTTOrAzEtOYkgSVai8YXS3ECyIWKKmzeiUTkAo/osGdjmUvrggbjE1SISq6Z4
         +SD8xLDAnmLRC0AgC3ae3vUmYqUsA5bQM4vNx0nkblnBTTqrn0jv8K55Il/lGQdtNDg/
         t0ueYzp2PDAuj/jxkXJQ3ECneQxYrESDD+Uub2Tjs5q3PTQmp3zZOrboOigvzipaQ4Yq
         3IUt7MqEDQM97yPtsj5bmivdAxBGaVXvBIaQdgMFThn87/iPYReALp+s3sx1eYo2hf0s
         k+EQ==
X-Gm-Message-State: AC+VfDwAW3bI4z6CjHH6SP3z4XfxwLRFxYbmpL3/TxynjH2LlBRt4AzC
        Wq3WSMio5jpvS2a4fxhLRh0=
X-Google-Smtp-Source: ACHHUZ7g5ECINVtpyZtuTyfiAlCx2taFTB6rPPc4wMrouJtvm4Q6iOjJnRAR4NBskylJzBfe70t/wA==
X-Received: by 2002:a17:902:fa8d:b0:1b0:7739:657a with SMTP id lc13-20020a170902fa8d00b001b07739657amr6415040plb.50.1687275381534;
        Tue, 20 Jun 2023 08:36:21 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id y5-20020a170902700500b001aadd0d7364sm1807015plk.83.2023.06.20.08.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:36:21 -0700 (PDT)
Date:   Tue, 20 Jun 2023 23:36:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: port tests to shunit2
Message-ID: <ZJHHb/7VpsTi81rc@sol>
References: <20230620124130.303427-1-brgl@bgdev.pl>
 <ZJGtDJtcWwdSOyGJ@sol>
 <CAMRc=Mc3-Uj7hjqdY=pihQRURY=rgSXkvqLaL2Wvneqq86G6fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc3-Uj7hjqdY=pihQRURY=rgSXkvqLaL2Wvneqq86G6fw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 20, 2023 at 05:19:27PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 20, 2023 at 3:43 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > >  gpiosim_chip_symlink() {
> > > -     GPIOSIM_CHIP_LINK="$2/${GPIOSIM_APP_NAME}-$$-lnk"
> > > +     GPIOSIM_CHIP_LINK="/tmp/${GPIOSIM_APP_NAME}-$$-lnk"
> > >       ln -s ${GPIOSIM_CHIP_PATH[$1]} "$GPIOSIM_CHIP_LINK"
> > >  }
> >
> > The $2 dicates where the symlink was placed.
> > Now it is ignored and placed in /tmp regardless, which is wrong.
> > Refer to where it is called.
> >
> 
> I understand the $2 was ignored here but why is it wrong to use /tmp?
> Why would we want to create the link in .? Also: shunit defines
> SHUNIT_TMPDIR which seems to be exposed for temporary files generated
> by tests, I'm more inclined towards using this one.
> 

The $2 is there for a reason - that is where you want the symlink
located.

"gpiodetect: all chips" puts a symlink in /dev to check that it is
ignored.

""gpiodetect: a chip" puts one in the PWD to check that gpiodetect will
find it.

If you want to remove that parameter then review and revise  all the
places it is used.

> > > @@ -2072,9 +2063,13 @@ request_release_line() {
> > >       dut_run_redirect gpiomon --num-events=4 --chip $sim0 4
> > >
> > >       gpiosim_set_pull sim0 4 pull-up
> > > +     sleep 0.01
> > >       gpiosim_set_pull sim0 4 pull-down
> > > +     sleep 0.01
> > >       gpiosim_set_pull sim0 4 pull-up
> > > +     sleep 0.01
> > >       gpiosim_set_pull sim0 4 pull-down
> > > +     sleep 0.01
> > >
> >
> > Why are delays now required between sim pulls?
> > Might toggle the pull before it gets propagated to the cdev?
> > Add a function that describes that rather than a raw sleep?
> > gpiosim_wait_pull?
> >
> > Split that out from the shunit2 change if if is a general problem?
> 
> Porting to shunit revealed a problem similar to the one I saw in C
> tests - toggling the sim pull too fast would lead to losing events.
> Turns out BATS was slow enough to hide the problem. If I run shunit
> over strace, the problem is gone too because it slows down the
> execution.
> 

I see the same in some of my compiled unit tests, and add propagation
delays to allow for it.  For me, the tool tests have always been too slow
to trigger it - and still are, but it wouldn't surprise me to see it
on a faster machine.  So no problem with adding some allowance there.

Cheers,
Kent.
