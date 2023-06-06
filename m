Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A546A72475D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 17:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238562AbjFFPNM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 11:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238544AbjFFPNH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 11:13:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814B4EA
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 08:13:00 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f62b512fe2so3011535e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686064379; x=1688656379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3u3epdBQwmJkbEM16xAJFbIyGD9pM549MMDcZeLFQA=;
        b=Hh7WWUYXo3TYZEqI11CAFR9Cyj6rv+gBsYxbqNzXT2mmaNbUmeKh+8ps2B8oMwLuTg
         UfH/YY1zEKfzE9XFUS/3ZHm8SnNdjWyqJu+78nChjbpNQLJUZPCZ2jjUHeV/517QAMs0
         6gZSn1mL2OO3G5TvE8eRlEYe52TlvRX/0jhF0JeCVwhUxh2pk0RD5f64VOFz3/57vuWY
         j1pGdbY1VKgbrY3yo/s/tcc2ENFQaPySFSs30eYuec1CPP6QVG4DK50YH1i5W3QdeXcE
         HZ3Q2X6/b7xVeWlQ+CcigzGn3aQd+9t8O6Fmk/IaLgv3K5ikVx8vKapHznhDdBSarAoE
         afAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064379; x=1688656379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3u3epdBQwmJkbEM16xAJFbIyGD9pM549MMDcZeLFQA=;
        b=NKVpjYDqukcboq4NI4xVMilv0Wyl0fk5C4xRXHWIJ5cixcmRro6GCjVxLz6cj2CUUz
         sVC60PeLcOzaMCt+sn5ROrxpl9yOzqgFALDqYCq2xKXfDnsSEURixxgGxebxScHmbb0r
         Ewm/6+Pzi4eJxPQcKj8Ie2faLg76KkLHT3njq43RtLYtrfqJAM4fIra7GtG+5Q+opT7e
         YKazKDTsK0GhlOi/U/28fEYEwG2qGQTaF0cJROXrhUt35LbSjgCGIuEoQkFb3LrT+td9
         rXy28+3Swatj9N9jez95TwkmYbgRkiZRuB+pEfznoWUTkDf5sa55ZfnbwHkXks/svW+8
         Ep0Q==
X-Gm-Message-State: AC+VfDzF5iwcFVgeTLLoqw6KfFjNhDb7EU50HlM3FYcnuul8aQ/ECPAU
        F1yuQLweK3knAkzcsZBjONDgosz1nBJtKLyMM9odvw==
X-Google-Smtp-Source: ACHHUZ7UpUtiagYSpxPJ9CgB8xbNs3KNdHPIzNzse85d6DxBNEz0CTi+AYWnb1gFhPXXn6mE+oKpIDVnZobXdnMPpxA=
X-Received: by 2002:ac2:559c:0:b0:4f3:8143:765 with SMTP id
 v28-20020ac2559c000000b004f381430765mr1176287lfg.27.1686064378753; Tue, 06
 Jun 2023 08:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230605204335.4060789-1-joe.slater@windriver.com>
 <ZH6rRD5B2hNyXcuV@sol> <BY5PR11MB3992BFAFD3714C8247BCA2E98852A@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB3992BFAFD3714C8247BCA2E98852A@BY5PR11MB3992.namprd11.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Jun 2023 17:12:46 +0200
Message-ID: <CAMRc=MccW=n+WDXdu2sBP+dn+kfStg9o7yxdkVJfi8sBdqWUJQ@mail.gmail.com>
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

On Tue, Jun 6, 2023 at 5:11=E2=80=AFPM Slater, Joseph <joe.slater@windriver=
.com> wrote:
>
> I finally (I hope) got rid of the "sleep" comment.
>
> I have not used bats before, but I gather that the bats file will get par=
sed 160 times since you have 159 tests.  Breaking the file up into pieces m=
ight help, but that's only a guess.  For me, the bats tests take about 4 mi=
nutes in qemu.
>
> Joe
>

FYI, I've opened an issue[1] on bats-core github as strace output for
-c -f switches was right after all.

Bart

[1] https://github.com/bats-core/bats-core/issues/733

> > -----Original Message-----
> > From: Kent Gibson <warthog618@gmail.com>
> > Sent: Monday, June 5, 2023 8:43 PM
> > To: Slater, Joseph <joe.slater@windriver.com>
> > Cc: linux-gpio@vger.kernel.org; MacLeod, Randy
> > <Randy.MacLeod@windriver.com>
> > Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify del=
ays in
> > toggle test
> >
> > On Mon, Jun 05, 2023 at 01:43:35PM -0700, joe.slater@windriver.com wrot=
e:
> > > From: Joe Slater <joe.slater@windriver.com>
> > >
> > > The test "gpioset: toggle (continuous)" uses fixed delays to test
> > > toggling values.  This is not reliable, so we switch to looking for
> > > transitions from one value to another.
> > >
> > > We wait for a transition up to 1.5 seconds.
> > >
> >
> > For future reference, the subject line should've been "[libgpiod][PATCH=
 v3]".
> > The version goes within the [PATCH], and 1/1 is optional unless you hav=
e a cover
> > letter.
> >
> > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > ---
> >
> > Here you would normally list the changes between revisions.
> > So I'm not sure what has actually changed since v1.
> > The loop limit went from 10 to 15?
> >
> > >  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
> > >  1 file changed, 19 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> > > index c83ca7d..05d7138 100755
> > > --- a/tools/gpio-tools-test.bats
> > > +++ b/tools/gpio-tools-test.bats
> > > @@ -141,6 +141,20 @@ gpiosim_check_value() {
> > >     [ "$VAL" =3D "$EXPECTED" ]
> > >  }
> > >
> > > +gpiosim_wait_value() {
> > > +   local OFFSET=3D$2
> > > +   local EXPECTED=3D$3
> > > +   local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > > +   local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > > +   local
> > PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
> > > +
> > > +   for i in {1..15}; do
> > > +           [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > > +           sleep 0.1
> > > +   done
> > > +   return 1
> > > +}
> > > +
> > >  gpiosim_cleanup() {
> > >     for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> > >     do
> > > @@ -1567,15 +1581,15 @@ request_release_line() {
> > >     gpiosim_check_value sim0 4 0
> > >     gpiosim_check_value sim0 7 0
> > >
> > > -   sleep 1
> > > -
> > > -   gpiosim_check_value sim0 1 0
> > > +   # sleeping fixed amounts can be unreliable, so we
> > > +   # sync to the toggles
> > > +   #
> >
> > You said you would get rid of this comment.
> >
> >
> > The patch works for me, so I'm otherwise fine with it.
> >
> > Cheers,
> > Kent.
