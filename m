Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356514BB56F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Feb 2022 10:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbiBRJXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 04:23:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233301AbiBRJXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 04:23:21 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B43E29834
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 01:23:02 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id gb39so13586267ejc.1
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 01:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3uOFwpwMRpdxte60KL4xKJqTJnrBZ3gdgHbh63z8PY=;
        b=xgj4nKXZ2hmh6aulfsbC8LRTOgEYyP0XJAd5L2RCQnAMvb5iwYZuAehv9qGlMBAXmV
         OQMPkKlH5ihg28F7i1QuHEroVK9upV7Kon2yYqo1NlJTqo5mqucFV/z71WVf2JnirJT3
         5uIlkRUjD0vnyjvmDy1CaL2qG5ToWzYRcUgFVtL7HCMBvevOUJH5Qe3ti4OQ4cZduKGD
         1ztjcHW2Z5h7qtQOqLgQLpnIHZuxuwBRpTrr6zjfJRqSvSu6B5zbZVi/8jKenYRNaFUJ
         wqxe1D3rZ4o7oV7gnUr9Wkt4JJDHQo0+Wz63J9dQ9fXssc3vwR3HwJSoaQLXjC/ZNNSv
         Ih2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3uOFwpwMRpdxte60KL4xKJqTJnrBZ3gdgHbh63z8PY=;
        b=wAOp8Cmx57gyCbGC/3ABGG4k2JwS0WKnGjTa6oZf2oydJ9I4eggJaJKtOR51gLMfAG
         V/mhUnYPGWqUOaonEOeTbphlKZQeGwcmtILLCsXXHnzHGCoN5ujPF1OYrnkL8ffcHzP9
         7pAesZql/FgfKP8y3QiUYv1qIxYfuLZSW+S+WmALYDl44VBkAI8dxobXK9s6gxndF5uf
         QoaCLF6hahfrO+TVqujBziwK2xkt42/M511PwZ6uqtXKYnPQoT6uALHREJGv1un7alFR
         snJGNmkZPpj5CJFkFCYDeFf8d6xQW7mI6HHZu5nb+F8McB4gas67vYQFOocytF0qHLCO
         KwxQ==
X-Gm-Message-State: AOAM532ega9OWyVDQqeaXNYaL3gQvebj2wdJiS1g6YRXTav11FsKDfu7
        qVYkewYup4Vw0043MMYdoHmrR52hcqLqZYIPIfjNfA==
X-Google-Smtp-Source: ABdhPJy0w/jWGWqCRxeUkjv6VYOhRgaABDqNzZYv1v5zTHy75eWT9OzPioze28O2aGpNsW94/Fa3+K1+Eko4Qrs5l1I=
X-Received: by 2002:a17:906:5815:b0:6ce:890b:2da7 with SMTP id
 m21-20020a170906581500b006ce890b2da7mr5722354ejq.734.1645176180383; Fri, 18
 Feb 2022 01:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20220216150512.863462-1-brgl@bgdev.pl> <20220217015042.GA8195@sol>
In-Reply-To: <20220217015042.GA8195@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Feb 2022 10:22:49 +0100
Message-ID: <CAMRc=Md4_Q5q6WxTCy_bCSwdXLri1WTcC+Gi=ANQM5u9J0SXuQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: port the test-suite to using gpio-sim
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 17, 2022 at 2:50 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Feb 16, 2022 at 04:05:12PM +0100, Bartosz Golaszewski wrote:
> > This makes the gpio-tools tests use the gpio-sim kernel module instead
> > of the old gpio-mockup.
> >
>
> I have a problem with unconditionally switching the tests to gpiosim as
> that restricts building and running libgpiod tests to kernel v5.17 or
> later.
> That is fine for v2, but v1 is effectively legacy and so tests should
> still build and run on legacy kernels.
>

v1 is going to be supported for an indefinite period of time in the
v1.6.x branch. The master branch is moving forward though. I'm
applying changes that can go into v2 already to master and the big API
change is still WIP so it's kept in the next/libgpiod-2.0 branch.

Only master will get this patch, not v1.6.x - it keeps using
gpio-mockup because users depend on it - for instance
meta-openembedded has a ptest package running the libgpiod tests based
on gpio-mockup.

> What is the benefit of the switch (other than exercising gpiosim)?
>

So this conversion is pretty much one-to-one for now but just like the
core C tests - gpio-sim will enable us to drop using gpioset when
testing gpioget for instance (we can use hogs but I need to add this).
We can also have gaps in line names etc.

Bart

> Cheers,
> Kent.
>
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  tools/gpio-tools-test      |   7 +-
> >  tools/gpio-tools-test.bats | 626 +++++++++++++++++++++----------------
> >  2 files changed, 354 insertions(+), 279 deletions(-)
> >
> > diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
> > index 9517974..234f9bd 100755
> > --- a/tools/gpio-tools-test
> > +++ b/tools/gpio-tools-test
> > @@ -2,7 +2,8 @@
> >  # SPDX-License-Identifier: GPL-2.0-or-later
> >  # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
> >
> > -MIN_KERNEL_VERSION="5.5.0"
> > +# Switch to v5.17.0 once released
> > +MIN_KERNEL_VERSION="5.16.0"
> >  BATS_SCRIPT="gpio-tools-test.bats"
> >  SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})"
> >
> > @@ -51,4 +52,8 @@ fi
> >
> >  BATS_PATH=$(which bats)
> >
> > +modprobe gpio-sim || die "unable to load the gpio-sim module"
> > +mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
> > +     die "configfs not mounted at /sys/kernel/config/"
> > +
> >  exec $BATS_PATH $SOURCE_DIR/$BATS_SCRIPT ${1+"$@"}
> > diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> > index a5b97e1..68da3f2 100755
> > --- a/tools/gpio-tools-test.bats
> > +++ b/tools/gpio-tools-test.bats
> > @@ -10,6 +10,10 @@ COPROC_OUTPUT=$BATS_TMPDIR/gpio-tools-test-output
> >  # once it exits as the COPROC_PID will be cleared.
> >  COPROC_SAVED_PID=""
> >
> > +GPIOSIM_CHIPS=""
> > +GPIOSIM_CONFIGFS="/sys/kernel/config/gpio-sim/"
> > +GPIOSIM_SYSFS="/sys/devices/platform/"
> > +
> >  # Run the command in $* and return 0 if the command failed. The way we do it
> >  # here is a workaround for the way bats handles failing processes.
> >  assert_fail() {
> > @@ -50,64 +54,122 @@ output_regex_match() {
> >       return 1
> >  }
> >
> > -# Probe the gpio-mockup kernel module. The routine expects a list of chip
> > -# sizes and optionally the 'named-lines' flag.
> > -gpio_mockup_probe() {
> > -     local CMDLINE="gpio_mockup_ranges="
> > +random_name() {
> > +     cat /proc/sys/kernel/random/uuid
> > +}
> > +
> > +gpiosim_chip() {
> > +     local VAR=$1
> > +     local NAME=$(random_name)
> > +     local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
> > +     local BANKPATH=$DEVPATH/$NAME
> > +
> > +     mkdir -p $BANKPATH
> >
> >       for ARG in $*
> >       do
> > -             if [ $ARG = "named-lines" ]
> > +             local KEY=$(echo $ARG | cut -d"=" -f1)
> > +             local VAL=$(echo $ARG | cut -d"=" -f2)
> > +
> > +             if [ "$KEY" = "num_lines" ]
> >               then
> > -                     CMDLINE="gpio_mockup_named_lines $CMDLINE"
> > -                     continue
> > +                     echo $VAL > $BANKPATH/num_lines
> > +             elif [ "$KEY" = "line_name" ]
> > +             then
> > +                     local OFFSET=$(echo $VAL | cut -d":" -f1)
> > +                     local LINENAME=$(echo $VAL | cut -d":" -f2)
> > +                     local LINEPATH=$BANKPATH/line$OFFSET
> > +
> > +                     mkdir -p $LINEPATH
> > +                     echo $LINENAME > $LINEPATH/name
> >               fi
> > +     done
> >
> > -             regex_matches "[0-9]+" "$ARG"
> > +     echo 1 > $DEVPATH/live
> >
> > -             CMDLINE="$CMDLINE-1,$ARG,"
> > -     done
> > +     GPIOSIM_CHIPS="$VAR:$NAME $GPIOSIM_CHIPS"
> > +}
> > +
> > +gpiosim_chip_map_name() {
> > +     local VAR=$1
> >
> > -     CMDLINE=${CMDLINE%?}
> > +     for CHIP in $GPIOSIM_CHIPS
> > +     do
> > +             KEY=$(echo $CHIP | cut -d":" -f1)
> > +             VAL=$(echo $CHIP | cut -d":" -f2)
> >
> > -     modprobe gpio-mockup $CMDLINE
> > -     udevadm settle
> > +             if [ "$KEY" = "$VAR" ]
> > +             then
> > +                     echo $VAL
> > +             fi
> > +     done
> >  }
> >
> > -gpio_mockup_remove() {
> > -     if [ -d /sys/module/gpio_mockup ]
> > -     then
> > -             rmmod gpio-mockup
> > -     fi
> > +gpiosim_chip_name() {
> > +     local VAR=$1
> > +     local NAME=$(gpiosim_chip_map_name $VAR)
> > +
> > +     cat $GPIOSIM_CONFIGFS/$NAME/$NAME/chip_name
> >  }
> >
> > -gpio_mockup_chip_name() {
> > -     local CHIPNUM=$1
> > +gpiosim_dev_name() {
> > +     local VAR=$1
> > +     local NAME=$(gpiosim_chip_map_name $VAR)
> >
> > -     test -d /sys/devices/platform/gpio-mockup.$CHIPNUM/ || return 1
> > -     echo $(ls /sys/devices/platform/gpio-mockup.$CHIPNUM/ | grep gpiochip)
> > +     cat $GPIOSIM_CONFIGFS/$NAME/dev_name
> >  }
> >
> > -gpio_mockup_set_pull() {
> > -     local CHIPNUM=$1
> > -     local LINE=$2
> > +gpiosim_set_pull() {
> > +     local VAR=$1
> > +     local OFFSET=$2
> >       local PULL=$3
> > +     local DEVNAME=$(gpiosim_dev_name $VAR)
> > +     local CHIPNAME=$(gpiosim_chip_name $VAR)
> >
> > -     FILE="/sys/kernel/debug/gpio-mockup/$(gpio_mockup_chip_name $CHIPNUM)/$LINE"
> > -     test -f $FILE || return 1
> > -     echo "$PULL" > $FILE
> > +     echo $PULL > $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/pull
> >  }
> >
> > -gpio_mockup_check_value() {
> > -     local CHIPNUM=$1
> > -     local LINE=$2
> > +gpiosim_check_value() {
> > +     local VAR=$1
> > +     local OFFSET=$2
> >       local EXPECTED=$3
> > +     local DEVNAME=$(gpiosim_dev_name $VAR)
> > +     local CHIPNAME=$(gpiosim_chip_name $VAR)
> >
> > -     FILE="/sys/kernel/debug/gpio-mockup/$(gpio_mockup_chip_name $CHIPNUM)/$LINE"
> > -     test -f $FILE || return 1
> > +     VAL=$(cat $GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value)
> > +     if [ "$VAL" = "$EXPECTED" ]
> > +     then
> > +             return 0
> > +     fi
> >
> > -     VAL=$(cat $FILE)
> > -     test $VAL -eq $EXPECTED || return 1
> > +     return 1
> > +}
> > +
> > +gpiosim_cleanup() {
> > +     for CHIP in $GPIOSIM_CHIPS
> > +     do
> > +             local NAME=$(echo $CHIP | cut -d":" -f2)
> > +
> > +             local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
> > +             local BANKPATH=$DEVPATH/$NAME
> > +
> > +             echo 0 > $DEVPATH/live
> > +
> > +             ls $BANKPATH/line* 2> /dev/null
> > +             if [ "$?" = "0" ]
> > +             then
> > +                     for LINE in $(find $BANKPATH/ | egrep "line[0-9]+$")
> > +                     do
> > +                             test -e $LINE/hog && rmdir $LINE/hog
> > +                             rmdir $LINE
> > +                     done
> > +             fi
> > +
> > +             rmdir $BANKPATH
> > +             rmdir $DEVPATH
> > +     done
> > +
> > +     GPIOSIM_CHIPS=""
> >  }
> >
> >  run_tool() {
> > @@ -147,10 +209,6 @@ coproc_tool_wait() {
> >       rm -f $COPROC_OUTPUT
> >  }
> >
> > -setup() {
> > -     gpio_mockup_remove
> > -}
> > -
> >  teardown() {
> >       if [ -n "$BG_PROC_PID" ]
> >       then
> > @@ -159,7 +217,7 @@ teardown() {
> >               BG_PROC_PID=""
> >       fi
> >
> > -     gpio_mockup_remove
> > +     gpiosim_cleanup
> >  }
> >
> >  #
> > @@ -167,14 +225,16 @@ teardown() {
> >  #
> >
> >  @test "gpiodetect: list chips" {
> > -     gpio_mockup_probe 4 8 16
> > +     gpiosim_chip sim0 num_lines=4
> > +     gpiosim_chip sim1 num_lines=8
> > +     gpiosim_chip sim2 num_lines=16
> >
> >       run_tool gpiodetect
> >
> >       test "$status" -eq 0
> > -     output_contains_line "$(gpio_mockup_chip_name 0) [gpio-mockup-A] (4 lines)"
> > -     output_contains_line "$(gpio_mockup_chip_name 1) [gpio-mockup-B] (8 lines)"
> > -     output_contains_line "$(gpio_mockup_chip_name 2) [gpio-mockup-C] (16 lines)"
> > +     output_contains_line "$(gpiosim_chip_name sim0) [$(gpiosim_dev_name sim0)-node0] (4 lines)"
> > +     output_contains_line "$(gpiosim_chip_name sim1) [$(gpiosim_dev_name sim1)-node0] (8 lines)"
> > +     output_contains_line "$(gpiosim_chip_name sim2) [$(gpiosim_dev_name sim2)-node0] (16 lines)"
> >  }
> >
> >  @test "gpiodetect: invalid args" {
> > @@ -187,28 +247,30 @@ teardown() {
> >  #
> >
> >  @test "gpioinfo: dump all chips" {
> > -     gpio_mockup_probe 4 8
> > +     gpiosim_chip sim0 num_lines=4
> > +     gpiosim_chip sim1 num_lines=8
> >
> >       run_tool gpioinfo
> >
> >       test "$status" -eq 0
> > -     output_contains_line "$(gpio_mockup_chip_name 0) - 4 lines:"
> > -     output_contains_line "$(gpio_mockup_chip_name 1) - 8 lines:"
> > +     output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
> > +     output_contains_line "$(gpiosim_chip_name sim1) - 8 lines:"
> >
> >       output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
> >       output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
> >  }
> >
> >  @test "gpioinfo: dump all chips with one line exported" {
> > -     gpio_mockup_probe 4 8
> > +     gpiosim_chip sim0 num_lines=4
> > +     gpiosim_chip sim1 num_lines=8
> >
> > -     coproc_run_tool gpioset --mode=signal --active-low "$(gpio_mockup_chip_name 1)" 7=1
> > +     coproc_run_tool gpioset --mode=signal --active-low "$(gpiosim_chip_name sim1)" 7=1
> >
> >       run_tool gpioinfo
> >
> >       test "$status" -eq 0
> > -     output_contains_line "$(gpio_mockup_chip_name 0) - 4 lines:"
> > -     output_contains_line "$(gpio_mockup_chip_name 1) - 8 lines:"
> > +     output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
> > +     output_contains_line "$(gpiosim_chip_name sim1) - 8 lines:"
> >       output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
> >       output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+\\\"gpioset\\\"\\s+output\\s+active-low"
> >
> > @@ -217,28 +279,32 @@ teardown() {
> >  }
> >
> >  @test "gpioinfo: dump one chip" {
> > -     gpio_mockup_probe 8 4
> > +     gpiosim_chip sim0 num_lines=8
> > +     gpiosim_chip sim1 num_lines=4
> >
> > -     run_tool gpioinfo "$(gpio_mockup_chip_name 1)"
> > +     run_tool gpioinfo "$(gpiosim_chip_name sim1)"
> >
> >       test "$status" -eq 0
> > -     assert_fail output_contains_line "$(gpio_mockup_chip_name 0) - 8 lines:"
> > -     output_contains_line "$(gpio_mockup_chip_name 1) - 4 lines:"
> > +     assert_fail output_contains_line "$(gpiosim_chip_name sim0) - 8 lines:"
> > +     output_contains_line "$(gpiosim_chip_name sim1) - 4 lines:"
> >       output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
> >       assert_fail output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
> >  }
> >
> >  @test "gpioinfo: dump all but one chip" {
> > -     gpio_mockup_probe 4 4 8 4
> > +     gpiosim_chip sim0 num_lines=4
> > +     gpiosim_chip sim1 num_lines=4
> > +     gpiosim_chip sim2 num_lines=8
> > +     gpiosim_chip sim3 num_lines=4
> >
> > -     run_tool gpioinfo "$(gpio_mockup_chip_name 0)" \
> > -                     "$(gpio_mockup_chip_name 1)" "$(gpio_mockup_chip_name 3)"
> > +     run_tool gpioinfo "$(gpiosim_chip_name sim0)" \
> > +                     "$(gpiosim_chip_name sim1)" "$(gpiosim_chip_name sim3)"
> >
> >       test "$status" -eq 0
> > -     output_contains_line "$(gpio_mockup_chip_name 0) - 4 lines:"
> > -     output_contains_line "$(gpio_mockup_chip_name 1) - 4 lines:"
> > -     assert_fail output_contains_line "$(gpio_mockup_chip_name 2) - 8 lines:"
> > -     output_contains_line "$(gpio_mockup_chip_name 3) - 4 lines:"
> > +     output_contains_line "$(gpiosim_chip_name sim0) - 4 lines:"
> > +     output_contains_line "$(gpiosim_chip_name sim1) - 4 lines:"
> > +     assert_fail output_contains_line "$(gpiosim_chip_name sim2) - 8 lines:"
> > +     output_contains_line "$(gpiosim_chip_name sim3) - 4 lines:"
> >       output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+unused\\s+input\\s+active-high"
> >       assert_fail output_regex_match "\\s+line\\s+7:\\s+unnamed\\s+unused\\s+input\\s+active-high"
> >  }
> > @@ -254,16 +320,20 @@ teardown() {
> >  #
> >
> >  @test "gpiofind: line found" {
> > -     gpio_mockup_probe named-lines 4 8 16
> > +     gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=3:bar
> > +     gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz line_name=7:foobar
> > +     gpiosim_chip sim2 num_lines=16
> >
> > -     run_tool gpiofind gpio-mockup-B-7
> > +     run_tool gpiofind foobar
> >
> >       test "$status" -eq "0"
> > -     test "$output" = "$(gpio_mockup_chip_name 1) 7"
> > +     test "$output" = "$(gpiosim_chip_name sim1) 7"
> >  }
> >
> >  @test "gpiofind: line not found" {
> > -     gpio_mockup_probe named-lines 4 8 16
> > +     gpiosim_chip sim0 num_lines=4
> > +     gpiosim_chip sim1 num_lines=8
> > +     gpiosim_chip sim2 num_lines=16
> >
> >       run_tool gpiofind nonexistent-line
> >
> > @@ -280,69 +350,69 @@ teardown() {
> >  #
> >
> >  @test "gpioget: read all lines" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 1 2 1
> > -     gpio_mockup_set_pull 1 3 1
> > -     gpio_mockup_set_pull 1 5 1
> > -     gpio_mockup_set_pull 1 7 1
> > +     gpiosim_set_pull sim0 2 pull-up
> > +     gpiosim_set_pull sim0 3 pull-up
> > +     gpiosim_set_pull sim0 5 pull-up
> > +     gpiosim_set_pull sim0 7 pull-up
> >
> > -     run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
> > +     run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
> >
> >       test "$status" -eq "0"
> >       test "$output" = "0 0 1 1 0 1 0 1"
> >  }
> >
> >  @test "gpioget: read all lines (active-low)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 1 2 1
> > -     gpio_mockup_set_pull 1 3 1
> > -     gpio_mockup_set_pull 1 5 1
> > -     gpio_mockup_set_pull 1 7 1
> > +     gpiosim_set_pull sim0 2 pull-up
> > +     gpiosim_set_pull sim0 3 pull-up
> > +     gpiosim_set_pull sim0 5 pull-up
> > +     gpiosim_set_pull sim0 7 pull-up
> >
> > -     run_tool gpioget --active-low "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
> > +     run_tool gpioget --active-low "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
> >
> >       test "$status" -eq "0"
> >       test "$output" = "1 1 0 0 1 0 1 0"
> >  }
> >
> >  @test "gpioget: read all lines (pull-up)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 1 2 1
> > -     gpio_mockup_set_pull 1 3 1
> > -     gpio_mockup_set_pull 1 5 1
> > -     gpio_mockup_set_pull 1 7 1
> > +     gpiosim_set_pull sim0 2 pull-up
> > +     gpiosim_set_pull sim0 3 pull-up
> > +     gpiosim_set_pull sim0 5 pull-up
> > +     gpiosim_set_pull sim0 7 pull-up
> >
> > -     run_tool gpioget --bias=pull-up "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
> > +     run_tool gpioget --bias=pull-up "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
> >
> >       test "$status" -eq "0"
> >       test "$output" = "1 1 1 1 1 1 1 1"
> >  }
> >
> >  @test "gpioget: read all lines (pull-down)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 1 2 1
> > -     gpio_mockup_set_pull 1 3 1
> > -     gpio_mockup_set_pull 1 5 1
> > -     gpio_mockup_set_pull 1 7 1
> > +     gpiosim_set_pull sim0 2 pull-up
> > +     gpiosim_set_pull sim0 3 pull-up
> > +     gpiosim_set_pull sim0 5 pull-up
> > +     gpiosim_set_pull sim0 7 pull-up
> >
> > -     run_tool gpioget --bias=pull-down "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
> > +     run_tool gpioget --bias=pull-down "$(gpiosim_chip_name sim0)" 0 1 2 3 4 5 6 7
> >
> >       test "$status" -eq "0"
> >       test "$output" = "0 0 0 0 0 0 0 0"
> >  }
> >
> >  @test "gpioget: read some lines" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 1 1 1
> > -     gpio_mockup_set_pull 1 4 1
> > -     gpio_mockup_set_pull 1 6 1
> > +     gpiosim_set_pull sim0 1 pull-up
> > +     gpiosim_set_pull sim0 4 pull-up
> > +     gpiosim_set_pull sim0 6 pull-up
> >
> > -     run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 1 4 6
> > +     run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 4 6
> >
> >       test "$status" -eq "0"
> >       test "$output" = "0 1 1 1"
> > @@ -356,36 +426,36 @@ teardown() {
> >  }
> >
> >  @test "gpioget: no lines specified" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioget "$(gpio_mockup_chip_name 1)"
> > +     run_tool gpioget "$(gpiosim_chip_name sim0)"
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*at least one GPIO line offset must be specified"
> >  }
> >
> >  @test "gpioget: too many lines specified" {
> > -     gpio_mockup_probe 4
> > +     gpiosim_chip sim0 num_lines=4
> >
> > -     run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 1 2 3 4
> > +     run_tool gpioget "$(gpiosim_chip_name sim0)" 0 1 2 3 4
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*unable to retrieve GPIO lines from chip"
> >  }
> >
> >  @test "gpioget: same line twice" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioget "$(gpio_mockup_chip_name 1)" 0 0
> > +     run_tool gpioget "$(gpiosim_chip_name sim0)" 0 0
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*unable to request lines.*"
> >  }
> >
> >  @test "gpioget: invalid bias" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioget --bias=bad "$(gpio_mockup_chip_name 1)" 0 1
> > +     run_tool gpioget --bias=bad "$(gpiosim_chip_name sim0)" 0 1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*invalid bias.*"
> > @@ -396,19 +466,19 @@ teardown() {
> >  #
> >
> >  @test "gpioset: set lines and wait for SIGTERM" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpioset --mode=signal "$(gpio_mockup_chip_name 2)" \
> > +     coproc_run_tool gpioset --mode=signal "$(gpiosim_chip_name sim0)" \
> >                                       0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
> >
> > -     gpio_mockup_check_value 2 0 0
> > -     gpio_mockup_check_value 2 1 0
> > -     gpio_mockup_check_value 2 2 1
> > -     gpio_mockup_check_value 2 3 1
> > -     gpio_mockup_check_value 2 4 1
> > -     gpio_mockup_check_value 2 5 1
> > -     gpio_mockup_check_value 2 6 0
> > -     gpio_mockup_check_value 2 7 1
> > +     gpiosim_check_value sim0 0 0
> > +     gpiosim_check_value sim0 1 0
> > +     gpiosim_check_value sim0 2 1
> > +     gpiosim_check_value sim0 3 1
> > +     gpiosim_check_value sim0 4 1
> > +     gpiosim_check_value sim0 5 1
> > +     gpiosim_check_value sim0 6 0
> > +     gpiosim_check_value sim0 7 1
> >
> >       coproc_tool_kill
> >       coproc_tool_wait
> > @@ -417,19 +487,19 @@ teardown() {
> >  }
> >
> >  @test "gpioset: set lines and wait for SIGTERM (active-low)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpioset --active-low --mode=signal "$(gpio_mockup_chip_name 2)" \
> > +     coproc_run_tool gpioset --active-low --mode=signal "$(gpiosim_chip_name sim0)" \
> >                                       0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
> >
> > -     gpio_mockup_check_value 2 0 1
> > -     gpio_mockup_check_value 2 1 1
> > -     gpio_mockup_check_value 2 2 0
> > -     gpio_mockup_check_value 2 3 0
> > -     gpio_mockup_check_value 2 4 0
> > -     gpio_mockup_check_value 2 5 0
> > -     gpio_mockup_check_value 2 6 1
> > -     gpio_mockup_check_value 2 7 0
> > +     gpiosim_check_value sim0 0 1
> > +     gpiosim_check_value sim0 1 1
> > +     gpiosim_check_value sim0 2 0
> > +     gpiosim_check_value sim0 3 0
> > +     gpiosim_check_value sim0 4 0
> > +     gpiosim_check_value sim0 5 0
> > +     gpiosim_check_value sim0 6 1
> > +     gpiosim_check_value sim0 7 0
> >
> >       coproc_tool_kill
> >       coproc_tool_wait
> > @@ -438,19 +508,19 @@ teardown() {
> >  }
> >
> >  @test "gpioset: set lines and wait for SIGTERM (push-pull)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpioset --drive=push-pull --mode=signal "$(gpio_mockup_chip_name 2)" \
> > +     coproc_run_tool gpioset --drive=push-pull --mode=signal "$(gpiosim_chip_name sim0)" \
> >                                       0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
> >
> > -     gpio_mockup_check_value 2 0 0
> > -     gpio_mockup_check_value 2 1 0
> > -     gpio_mockup_check_value 2 2 1
> > -     gpio_mockup_check_value 2 3 1
> > -     gpio_mockup_check_value 2 4 1
> > -     gpio_mockup_check_value 2 5 1
> > -     gpio_mockup_check_value 2 6 0
> > -     gpio_mockup_check_value 2 7 1
> > +     gpiosim_check_value sim0 0 0
> > +     gpiosim_check_value sim0 1 0
> > +     gpiosim_check_value sim0 2 1
> > +     gpiosim_check_value sim0 3 1
> > +     gpiosim_check_value sim0 4 1
> > +     gpiosim_check_value sim0 5 1
> > +     gpiosim_check_value sim0 6 0
> > +     gpiosim_check_value sim0 7 1
> >
> >       coproc_tool_kill
> >       coproc_tool_wait
> > @@ -459,24 +529,24 @@ teardown() {
> >  }
> >
> >  @test "gpioset: set lines and wait for SIGTERM (open-drain)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 2 2 1
> > -     gpio_mockup_set_pull 2 3 1
> > -     gpio_mockup_set_pull 2 5 1
> > -     gpio_mockup_set_pull 2 7 1
> > +     gpiosim_set_pull sim0 2 pull-up
> > +     gpiosim_set_pull sim0 3 pull-up
> > +     gpiosim_set_pull sim0 5 pull-up
> > +     gpiosim_set_pull sim0 7 pull-up
> >
> > -     coproc_run_tool gpioset --drive=open-drain --mode=signal "$(gpio_mockup_chip_name 2)" \
> > +     coproc_run_tool gpioset --drive=open-drain --mode=signal "$(gpiosim_chip_name sim0)" \
> >                                       0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
> >
> > -     gpio_mockup_check_value 2 0 0
> > -     gpio_mockup_check_value 2 1 0
> > -     gpio_mockup_check_value 2 2 1
> > -     gpio_mockup_check_value 2 3 1
> > -     gpio_mockup_check_value 2 4 0
> > -     gpio_mockup_check_value 2 5 1
> > -     gpio_mockup_check_value 2 6 0
> > -     gpio_mockup_check_value 2 7 1
> > +     gpiosim_check_value sim0 0 0
> > +     gpiosim_check_value sim0 1 0
> > +     gpiosim_check_value sim0 2 1
> > +     gpiosim_check_value sim0 3 1
> > +     gpiosim_check_value sim0 4 0
> > +     gpiosim_check_value sim0 5 1
> > +     gpiosim_check_value sim0 6 0
> > +     gpiosim_check_value sim0 7 1
> >
> >       coproc_tool_kill
> >       coproc_tool_wait
> > @@ -485,24 +555,24 @@ teardown() {
> >  }
> >
> >  @test "gpioset: set lines and wait for SIGTERM (open-source)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 2 2 1
> > -     gpio_mockup_set_pull 2 3 1
> > -     gpio_mockup_set_pull 2 5 1
> > -     gpio_mockup_set_pull 2 7 1
> > +     gpiosim_set_pull sim0 2 pull-up
> > +     gpiosim_set_pull sim0 3 pull-up
> > +     gpiosim_set_pull sim0 5 pull-up
> > +     gpiosim_set_pull sim0 7 pull-up
> >
> > -     coproc_run_tool gpioset --drive=open-source --mode=signal "$(gpio_mockup_chip_name 2)" \
> > +     coproc_run_tool gpioset --drive=open-source --mode=signal "$(gpiosim_chip_name sim0)" \
> >                                       0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
> >
> > -     gpio_mockup_check_value 2 0 0
> > -     gpio_mockup_check_value 2 1 0
> > -     gpio_mockup_check_value 2 2 1
> > -     gpio_mockup_check_value 2 3 1
> > -     gpio_mockup_check_value 2 4 1
> > -     gpio_mockup_check_value 2 5 1
> > -     gpio_mockup_check_value 2 6 0
> > -     gpio_mockup_check_value 2 7 1
> > +     gpiosim_check_value sim0 0 0
> > +     gpiosim_check_value sim0 1 0
> > +     gpiosim_check_value sim0 2 1
> > +     gpiosim_check_value sim0 3 1
> > +     gpiosim_check_value sim0 4 1
> > +     gpiosim_check_value sim0 5 1
> > +     gpiosim_check_value sim0 6 0
> > +     gpiosim_check_value sim0 7 1
> >
> >       coproc_tool_kill
> >       coproc_tool_wait
> > @@ -511,16 +581,16 @@ teardown() {
> >  }
> >
> >  @test "gpioset: set some lines and wait for ENTER" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpioset --mode=wait "$(gpio_mockup_chip_name 2)" \
> > +     coproc_run_tool gpioset --mode=wait "$(gpiosim_chip_name sim0)" \
> >                                       1=0 2=1 5=1 6=0 7=1
> >
> > -     gpio_mockup_check_value 2 1 0
> > -     gpio_mockup_check_value 2 2 1
> > -     gpio_mockup_check_value 2 5 1
> > -     gpio_mockup_check_value 2 6 0
> > -     gpio_mockup_check_value 2 7 1
> > +     gpiosim_check_value sim0 1 0
> > +     gpiosim_check_value sim0 2 1
> > +     gpiosim_check_value sim0 5 1
> > +     gpiosim_check_value sim0 6 0
> > +     gpiosim_check_value sim0 7 1
> >
> >       coproc_tool_stdin_write ""
> >       coproc_tool_wait
> > @@ -529,11 +599,11 @@ teardown() {
> >  }
> >
> >  @test "gpioset: set some lines and wait for SIGINT" {
> > -     gpio_mockup_probe 8
> > +     gpiosim_chip sim0 num_lines=4
> >
> > -     coproc_run_tool gpioset --mode=signal "$(gpio_mockup_chip_name 0)" 0=1
> > +     coproc_run_tool gpioset --mode=signal "$(gpiosim_chip_name sim0)" 0=1
> >
> > -     gpio_mockup_check_value 0 0 1
> > +     gpiosim_check_value sim0 0 1
> >
> >       coproc_tool_kill -SIGINT
> >       coproc_tool_wait
> > @@ -542,14 +612,14 @@ teardown() {
> >  }
> >
> >  @test "gpioset: set some lines and wait with --mode=time" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> >       coproc_run_tool gpioset --mode=time --sec=1 --usec=200000 \
> > -                             "$(gpio_mockup_chip_name 1)" 0=1 5=0 7=1
> > +                             "$(gpiosim_chip_name sim0)" 0=1 5=0 7=1
> >
> > -     gpio_mockup_check_value 1 0 1
> > -     gpio_mockup_check_value 1 5 0
> > -     gpio_mockup_check_value 1 7 1
> > +     gpiosim_check_value sim0 0 1
> > +     gpiosim_check_value sim0 5 0
> > +     gpiosim_check_value sim0 7 1
> >
> >       coproc_tool_wait
> >
> > @@ -564,107 +634,107 @@ teardown() {
> >  }
> >
> >  @test "gpioset: no lines specified" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset "$(gpio_mockup_chip_name 1)"
> > +     run_tool gpioset "$(gpiosim_chip_name sim1)"
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*at least one GPIO line offset to value mapping must be specified"
> >  }
> >
> >  @test "gpioset: too many lines specified" {
> > -     gpio_mockup_probe 4
> > +     gpiosim_chip sim0 num_lines=4
> >
> > -     run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1 1=1 2=1 3=1 4=1 5=1
> > +     run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1 1=1 2=1 3=1 4=1 5=1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*unable to retrieve GPIO lines from chip"
> >  }
> >
> >  @test "gpioset: use --sec without --mode=time" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset --mode=exit --sec=1 "$(gpio_mockup_chip_name 1)" 0=1
> > +     run_tool gpioset --mode=exit --sec=1 "$(gpiosim_chip_name sim0)" 0=1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*can't specify wait time in this mode"
> >  }
> >
> >  @test "gpioset: use --usec without --mode=time" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset --mode=exit --usec=1 "$(gpio_mockup_chip_name 1)" 0=1
> > +     run_tool gpioset --mode=exit --usec=1 "$(gpiosim_chip_name sim1)" 0=1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*can't specify wait time in this mode"
> >  }
> >
> >  @test "gpioset: default mode" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1
> > +     run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1
> >
> >       test "$status" -eq "0"
> >  }
> >
> >  @test "gpioset: invalid mapping" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=c
> > +     run_tool gpioset "$(gpiosim_chip_name sim1)" 0=c
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*invalid offset<->value mapping"
> >  }
> >
> >  @test "gpioset: invalid value" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=3
> > +     run_tool gpioset "$(gpiosim_chip_name sim1)" 0=3
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*value must be 0 or 1"
> >  }
> >
> >  @test "gpioset: invalid offset" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset "$(gpio_mockup_chip_name 1)" 4000000000=0
> > +     run_tool gpioset "$(gpiosim_chip_name sim1)" 4000000000=0
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*invalid offset"
> >  }
> >
> >  @test "gpioset: invalid bias" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset --bias=bad "$(gpio_mockup_chip_name 1)" 0=1 1=1
> > +     run_tool gpioset --bias=bad "$(gpiosim_chip_name sim1)" 0=1 1=1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*invalid bias.*"
> >  }
> >
> >  @test "gpioset: invalid drive" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset --drive=bad "$(gpio_mockup_chip_name 1)" 0=1 1=1
> > +     run_tool gpioset --drive=bad "$(gpiosim_chip_name sim1)" 0=1 1=1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*invalid drive.*"
> >  }
> >
> >  @test "gpioset: daemonize in invalid mode" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset --background "$(gpio_mockup_chip_name 1)" 0=1
> > +     run_tool gpioset --background "$(gpiosim_chip_name sim1)" 0=1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*can't daemonize in this mode"
> >  }
> >
> >  @test "gpioset: same line twice" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpioset "$(gpio_mockup_chip_name 1)" 0=1 0=1
> > +     run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1 0=1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*unable to request lines.*"
> > @@ -675,11 +745,11 @@ teardown() {
> >  #
> >
> >  @test "gpiomon: single rising edge event" {
> > -     gpio_mockup_probe 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon --rising-edge "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon --rising-edge "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -691,12 +761,12 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: single falling edge event" {
> > -     gpio_mockup_probe 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon --falling-edge "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon --falling-edge "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > -     gpio_mockup_set_pull 1 4 0
> > +     gpiosim_set_pull sim0 4 pull-up
> > +     gpiosim_set_pull sim0 4 pull-down
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -708,13 +778,13 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: single falling edge event (pull-up)" {
> > -     gpio_mockup_probe 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 1 4 0
> > +     gpiosim_set_pull sim0 4 pull-down
> >
> > -     coproc_run_tool gpiomon --bias=pull-up "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon --bias=pull-up "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 0
> > +     gpiosim_set_pull sim0 4 pull-down
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -726,13 +796,13 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: single rising edge event (pull-down)" {
> > -     gpio_mockup_probe 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >
> > -     coproc_run_tool gpiomon --bias=pull-down "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon --bias=pull-down "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -744,13 +814,13 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: single rising edge event (active-low)" {
> > -     gpio_mockup_probe 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >
> > -     coproc_run_tool gpiomon --rising-edge --active-low "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon --rising-edge --active-low "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 0
> > +     gpiosim_set_pull sim0 4 pull-down
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -762,11 +832,11 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: single rising edge event (silent mode)" {
> > -     gpio_mockup_probe 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon --rising-edge --silent "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon --rising-edge --silent "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -777,17 +847,17 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: four alternating events" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon --num-events=4 "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon --num-events=4 "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> > -     gpio_mockup_set_pull 1 4 0
> > +     gpiosim_set_pull sim0 4 pull-down
> >       sleep 0.2
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> > -     gpio_mockup_set_pull 1 4 0
> > +     gpiosim_set_pull sim0 4 pull-down
> >       sleep 0.2
> >
> >       coproc_tool_wait
> > @@ -800,9 +870,9 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: exit after SIGINT" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "$(gpiosim_chip_name sim0)" 4
> >
> >       coproc_tool_kill -SIGINT
> >       coproc_tool_wait
> > @@ -812,9 +882,9 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: exit after SIGTERM" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "$(gpiosim_chip_name sim0)" 4
> >
> >       coproc_tool_kill -SIGTERM
> >       coproc_tool_wait
> > @@ -824,13 +894,13 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: both event flags" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon --falling-edge --rising-edge "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon --falling-edge --rising-edge "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> > -     gpio_mockup_set_pull 1 4 0
> > +     gpiosim_set_pull sim0 4 pull-down
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -844,13 +914,13 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: watch multiple lines" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon --format=%o "$(gpio_mockup_chip_name 1)" 1 2 3 4 5
> > +     coproc_run_tool gpiomon --format=%o "$(gpiosim_chip_name sim0)" 1 2 3 4 5
> >
> > -     gpio_mockup_set_pull 1 2 1
> > -     gpio_mockup_set_pull 1 3 1
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 2 pull-up
> > +     gpiosim_set_pull sim0 3 pull-up
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -863,13 +933,13 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: watch multiple lines (lines in mixed-up order)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon --format=%o "$(gpio_mockup_chip_name 1)" 5 2 7 1 6
> > +     coproc_run_tool gpiomon --format=%o "$(gpiosim_chip_name sim0)" 5 2 7 1 6
> >
> > -     gpio_mockup_set_pull 1 2 1
> > -     gpio_mockup_set_pull 1 1 1
> > -     gpio_mockup_set_pull 1 6 1
> > +     gpiosim_set_pull sim0 2 pull-up
> > +     gpiosim_set_pull sim0 1 pull-up
> > +     gpiosim_set_pull sim0 6 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -882,9 +952,9 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: same line twice" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpiomon "$(gpio_mockup_chip_name 1)" 0 0
> > +     run_tool gpiomon "$(gpiosim_chip_name sim0)" 0 0
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*unable to request GPIO lines for events"
> > @@ -898,38 +968,38 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: line not specified" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpiomon "$(gpio_mockup_chip_name 1)"
> > +     run_tool gpiomon "$(gpiosim_chip_name sim0)"
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*GPIO line offset must be specified"
> >  }
> >
> >  @test "gpiomon: line out of range" {
> > -     gpio_mockup_probe 4
> > +     gpiosim_chip sim0 num_lines=4
> >
> > -     run_tool gpiomon "$(gpio_mockup_chip_name 0)" 5
> > +     run_tool gpiomon "$(gpiosim_chip_name sim0)" 5
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*unable to retrieve GPIO lines from chip"
> >  }
> >
> >  @test "gpiomon: invalid bias" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     run_tool gpiomon --bias=bad "$(gpio_mockup_chip_name 1)" 0 1
> > +     run_tool gpiomon --bias=bad "$(gpiosim_chip_name sim0)" 0 1
> >
> >       test "$status" -eq "1"
> >       output_regex_match ".*invalid bias.*"
> >  }
> >
> >  @test "gpiomon: custom format (event type + offset)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "--format=%e %o" "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "--format=%e %o" "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -940,11 +1010,11 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: custom format (event type + offset joined)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "--format=%e%o" "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "--format=%e%o" "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -955,11 +1025,11 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: custom format (timestamp)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "--format=%e %o %s.%n" "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "--format=%e %o %s.%n" "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -970,11 +1040,11 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: custom format (double percent sign)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "--format=%%" "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "--format=%%" "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -985,11 +1055,11 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: custom format (double percent sign + event type specifier)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "--format=%%e" "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "--format=%%e" "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -1000,11 +1070,11 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: custom format (single percent sign)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "--format=%" "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "--format=%" "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -1015,11 +1085,11 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: custom format (single percent sign between other characters)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "--format=foo % bar" "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "--format=foo % bar" "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > @@ -1030,11 +1100,11 @@ teardown() {
> >  }
> >
> >  @test "gpiomon: custom format (unknown specifier)" {
> > -     gpio_mockup_probe 8 8 8
> > +     gpiosim_chip sim0 num_lines=8
> >
> > -     coproc_run_tool gpiomon "--format=%x" "$(gpio_mockup_chip_name 1)" 4
> > +     coproc_run_tool gpiomon "--format=%x" "$(gpiosim_chip_name sim0)" 4
> >
> > -     gpio_mockup_set_pull 1 4 1
> > +     gpiosim_set_pull sim0 4 pull-up
> >       sleep 0.2
> >
> >       coproc_tool_kill
> > --
> > 2.30.1
> >
