Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7207314A6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 11:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241149AbjFOJzm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 05:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343711AbjFOJzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 05:55:03 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021A01BF9
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 02:54:41 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-783eef15004so953295241.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686822880; x=1689414880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpwovHR7HJGNYdjbRYtxCDbrsDT7wxTAXPgBl1sajvU=;
        b=y5I6Ry4tFKZswJrlNyiqebDT/OLQnYs05Kr0vXdzDqrAlAJDYau/SxdB6drwQ4dtAf
         eTf/HDng/kvRsouLH+o0L41zlGAofg4PrtGAHchvY04SZxJmCNTMNVLQun0mYujPRrcX
         qXQvNW9zhAeyVzopBUfriovens40uxwOtJ6c3Z6XxKg+bjqgkjO5A1uhVN0z9NnqrARp
         bq7RB0PLWHvBXBb7p2DucirOEiYrFBhpn/Pjl15FQQp4ke6D4FQIU+4Sagxm9VHZD5t7
         3cWYWhFNqQG5y8q6nmq9KHUw9dH3wunDvPeLi/CYlPCprDrMEEOCdhgnJ6ANonGL6MPQ
         fMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686822880; x=1689414880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpwovHR7HJGNYdjbRYtxCDbrsDT7wxTAXPgBl1sajvU=;
        b=O7IV37u0k7CpbnFM5S07Nl8eg/P6nszO5VgLRBwUvS7CXvsqsDk5LgsPO/kAnvLpiJ
         0yh8KBLsjhBabv+yS1bU2G/Z3KP9O2sr0ihjCTF0H089WfX39qIin5yWjrBaXUVDAtap
         YE44POrcPy+VD2zbd3QiAUkvptAv0g0V2PtAC+t9Ss0f1FZ1BxVtsgJvoZbBJEW02cpm
         /M824MWd6JRfCMbBYsZUM2dbzui+OPCjwY+c++iz0nEbw6+gHWRCykhAqosA5vhcu2Hm
         qi5CmEIJlax4IwB+IcGHrsiDcKy9doTrVFj3h2bJbMX8q7ZWaYI+OXjfX5v9JfJTRwVP
         xZpw==
X-Gm-Message-State: AC+VfDxhGMVTIaAgyzMnxuyUya3iNCV8oI1JwZFnhiGM6Ee+v+bubAgD
        PgrJ/cY3G3oq3TJxs+2+XCXZ67j0r/DgM4kxp0X0eA==
X-Google-Smtp-Source: ACHHUZ4wiVAujNN/W976T+f+ds9TIEa99DMA9Y8x4BCxYMsU8a+FLD6trohzarOm+sOAd+zApiQ2wmF+d6NgeI7uSBc=
X-Received: by 2002:a1f:4b82:0:b0:46d:9170:4c54 with SMTP id
 y124-20020a1f4b82000000b0046d91704c54mr3947216vka.13.1686822879658; Thu, 15
 Jun 2023 02:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230605204335.4060789-1-joe.slater@windriver.com>
 <ZH6rRD5B2hNyXcuV@sol> <BY5PR11MB3992BFAFD3714C8247BCA2E98852A@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MccW=n+WDXdu2sBP+dn+kfStg9o7yxdkVJfi8sBdqWUJQ@mail.gmail.com>
In-Reply-To: <CAMRc=MccW=n+WDXdu2sBP+dn+kfStg9o7yxdkVJfi8sBdqWUJQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 15 Jun 2023 11:54:28 +0200
Message-ID: <CAMRc=Md8OWUHVSV4qK1uq+Xa+JH+kJuZFWo-rHbkCeVEw5zH6A@mail.gmail.com>
Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
To:     "Slater, Joseph" <joe.slater@windriver.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
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

On Tue, Jun 6, 2023 at 5:12=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Tue, Jun 6, 2023 at 5:11=E2=80=AFPM Slater, Joseph <joe.slater@windriv=
er.com> wrote:
> >
> > I finally (I hope) got rid of the "sleep" comment.
> >
> > I have not used bats before, but I gather that the bats file will get p=
arsed 160 times since you have 159 tests.  Breaking the file up into pieces=
 might help, but that's only a guess.  For me, the bats tests take about 4 =
minutes in qemu.
> >
> > Joe
> >
>
> FYI, I've opened an issue[1] on bats-core github as strace output for
> -c -f switches was right after all.
>
> Bart
>
> [1] https://github.com/bats-core/bats-core/issues/733
>

I'm afraid this is just how bats works - I'm getting similar output
when running bats' own test-suite:

% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ------------------
 94,78   87,937096        2697     32603     14298 wait4
  1,20    1,117514           0   1695481           rt_sigprocmask
  1,09    1,008525           0   1045150        27 read
  0,66    0,608701          36     16741           clone
  0,48    0,441647          11     37725     23464 execve
  0,21    0,199233           0    274617    107718 newfstatat
  0,20    0,182347           1     98627      4962 openat
  0,18    0,165625           0    169950           mmap
  0,15    0,134789           0    184782    162361 ioctl
  0,14    0,129233           3     40735           write
  0,12    0,113985           0    198739      4196 close
  0,10    0,095850           0    139639      3159 fcntl
  0,09    0,086048           0    312173           rt_sigaction
  0,08    0,070505           0     95010     34204 lseek
  0,06    0,053366           0     56400           dup2
  0,06    0,052509           1     51470           mprotect
  0,05    0,045429           7      5704      3457 mkdir

When the tests are running, bats spawns a tree of 6 subprocesses for
every test-case and each parent waits for its child to exit which adds
up and shows up as spending most time in wait4().

Bart

> > > -----Original Message-----
> > > From: Kent Gibson <warthog618@gmail.com>
> > > Sent: Monday, June 5, 2023 8:43 PM
> > > To: Slater, Joseph <joe.slater@windriver.com>
> > > Cc: linux-gpio@vger.kernel.org; MacLeod, Randy
> > > <Randy.MacLeod@windriver.com>
> > > Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify d=
elays in
> > > toggle test
> > >
> > > On Mon, Jun 05, 2023 at 01:43:35PM -0700, joe.slater@windriver.com wr=
ote:
> > > > From: Joe Slater <joe.slater@windriver.com>
> > > >
> > > > The test "gpioset: toggle (continuous)" uses fixed delays to test
> > > > toggling values.  This is not reliable, so we switch to looking for
> > > > transitions from one value to another.
> > > >
> > > > We wait for a transition up to 1.5 seconds.
> > > >
> > >
> > > For future reference, the subject line should've been "[libgpiod][PAT=
CH v3]".
> > > The version goes within the [PATCH], and 1/1 is optional unless you h=
ave a cover
> > > letter.
> > >
> > > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > > ---
> > >
> > > Here you would normally list the changes between revisions.
> > > So I'm not sure what has actually changed since v1.
> > > The loop limit went from 10 to 15?
> > >
> > > >  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
> > > >  1 file changed, 19 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bat=
s
> > > > index c83ca7d..05d7138 100755
> > > > --- a/tools/gpio-tools-test.bats
> > > > +++ b/tools/gpio-tools-test.bats
> > > > @@ -141,6 +141,20 @@ gpiosim_check_value() {
> > > >     [ "$VAL" =3D "$EXPECTED" ]
> > > >  }
> > > >
> > > > +gpiosim_wait_value() {
> > > > +   local OFFSET=3D$2
> > > > +   local EXPECTED=3D$3
> > > > +   local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > > > +   local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > > > +   local
> > > PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
> > > > +
> > > > +   for i in {1..15}; do
> > > > +           [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > > > +           sleep 0.1
> > > > +   done
> > > > +   return 1
> > > > +}
> > > > +
> > > >  gpiosim_cleanup() {
> > > >     for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> > > >     do
> > > > @@ -1567,15 +1581,15 @@ request_release_line() {
> > > >     gpiosim_check_value sim0 4 0
> > > >     gpiosim_check_value sim0 7 0
> > > >
> > > > -   sleep 1
> > > > -
> > > > -   gpiosim_check_value sim0 1 0
> > > > +   # sleeping fixed amounts can be unreliable, so we
> > > > +   # sync to the toggles
> > > > +   #
> > >
> > > You said you would get rid of this comment.
> > >
> > >
> > > The patch works for me, so I'm otherwise fine with it.
> > >
> > > Cheers,
> > > Kent.
