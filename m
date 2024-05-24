Return-Path: <linux-gpio+bounces-6607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68B8CE94E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 19:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9E1AB21610
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 17:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7259D381CC;
	Fri, 24 May 2024 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dcBBaLTQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0C63BBC0
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716573558; cv=none; b=tkNjgX0bbOYfVyoF39kPaL01tiH4onytyRhmVN0sPrbavWsNq/QHzP2LCL85Wp67/mqufNtaUVaXB1OtdVnwDtf4bUoaB577U4PJlnRfX+1ExXAiqTwhuSQh6aCbKSxBO/KzsfKE0pQISlIDDRCaalBxj6hb5sBxhEyN4v6E2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716573558; c=relaxed/simple;
	bh=mC9qX95n2SdGish+S2j2BgUFPIX1sxJOm86gBiaa24o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqU6LzOQNuVVpV0U7ClrHRxCafaokSwVVl4pYszNgmWIhcpZQc0Dctnj/EllhHVURXOhQjeiFIy/905RLOaurzHR4G/KKPVJk6q+JPyAO1XMqIAn2uPs+1ttQBvQIUNlJm4Rf1fZnn8tUAuq0kl8wAQe2ukHLa5ivAUBj+hokog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dcBBaLTQ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52327368e59so10187911e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716573553; x=1717178353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZoiixYITOj1pWsEwm9bNZLxSrSxt+lDFIvyce6XVtA=;
        b=dcBBaLTQbNeU7dpkeAeGEXJMK/IeFZCEvoOFBdtTSXDxr/hstCI5DWVZG6rybpetdy
         38xlw4Z1gIYL6CHLhabsqGzbB53XyiAzsnRtjPw24JCTh38r+eHf3xc4h52XnGxfF1LN
         kKbxs8jVaBHtImknZ0VfNR17PgoRZpGACdHA2FEhP13zBvS8d/7SSxETy8++psUpS47u
         Pi1POMY0WabGdZ+Ai1Npd6yEmwCldihEAv+Hy1nsWPZiJXPIwbmHZIUNAYhtFGhRcFmf
         qcjNwMQ0DqJX/rN+7FL32azVnAWqZPtK0oY5PyWi/TmTIIVJ9vgryi3EHZ+QjK0/r/Hz
         oydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716573553; x=1717178353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZoiixYITOj1pWsEwm9bNZLxSrSxt+lDFIvyce6XVtA=;
        b=SSj+C7NIpo0CUf5sC8MvdT1nHlZG938JLXBtwsB8jzHGT3+IMWsF4EQ8IUlirv3AXT
         RI0jL+GrQxMroOrUt0Ry1z5vsiDsjhCzLlbgk+/KgVnWaKDDTJcUXtSiCbxaNZgAoNW+
         x2QNivB1Z4Y3nfKnjl7vs+1Qswg8HA51kYg44a5pNJFe1/cpZTsz9yrWgVAaVWvB+/F1
         7qvCvMd1Dnuahyp7Ck+nN/vj33EE1ZID9H6H2BLY/EBo8HvMmAtXGOTtrnjxYcZoZ5oT
         wYx5/IrhByOEhDoUvqL21pLqJStJE6Q8/aW/gneM1LJ0uLY9QThVXgdNpkBmuwERmSNo
         z3jw==
X-Forwarded-Encrypted: i=1; AJvYcCXcV8qLAL45qQ6s6SKfrP9+aUy8VkqH1vKgxrQWJ8F67KCiI1Z65IfqE0rU3b6DJk2iHjKaq/g0fY57fKMbtSgvDqyyRuWbPYIoCQ==
X-Gm-Message-State: AOJu0YyMJstk/C5jRPBEOwgp5lRtMWBrZ4J/e6Jg/T5MxudhN42qX2NR
	xqwD8CabYRGGOVsTtkVT/w1nq2ZyrQMmMn0pQK3djNzzgarKrhRNRW+HYwyFWUaNCaZ62eCMg6e
	qsUtww0yUHAKGOgIFFbsEGtSx8xIttfEEuAPGig==
X-Google-Smtp-Source: AGHT+IFxlTs2gkd1jqfxHRSTXmwDAMk+i4p2GqAhGEEpGZXbKrwfjAGp9fpEzkugOeILKuxow2UxaBxYcJDw0DkOUco=
X-Received: by 2002:a05:6512:1152:b0:51b:9254:91e2 with SMTP id
 2adb3069b0e04-529661f2cf1mr2211722e87.55.1716573553352; Fri, 24 May 2024
 10:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412122804.109323-1-brgl@bgdev.pl> <20240412122804.109323-3-brgl@bgdev.pl>
 <Zif7McOO-1d2coCO@smile.fi.intel.com>
In-Reply-To: <Zif7McOO-1d2coCO@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 May 2024 19:59:01 +0200
Message-ID: <CAMRc=Me5eeBsYM3zXr21RucEPx4yiw5Uhxu0-Dr8C-qguOSoBQ@mail.gmail.com>
Subject: Re: [libgpiod][RFC/RFT 02/18] tests: split out the common test code
 for bash scripts
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 8:17=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Apr 12, 2024 at 02:27:48PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to allow the upcoming DBus command-line client tests to reuse =
the
> > existing bash test harness, let's put the common code into an importabl=
e
> > file and rename run_tool to run_prog to reflect that it now can run any
> > program.
>
> >  tests/bash/Makefile.am                |   4 +
> >  tests/bash/gpiod-bash-test-helper.inc | 328 +++++++++++++++
>
> Is the 'bash' a new folder name?
>
> If so, it might be problematic for make as it may recognize it as a bash
> command. I would rather name it 'scripts' or 'shell' or alike.
>

Good point, 'scripts' works fine.

For the rest: it's out of scope for this series - you reviewed code
that has existed for a while - and needs to be addressed separately.

> ...
>
> > +++ b/tests/bash/gpiod-bash-test-helper.inc
>
> And why not a simple shell? Do you use bashisms?
>

Yes, quite a lot actually.

> ...
>
> > +# Run the command in $* and fail the test if the command succeeds.
>
> "$*" in most cases is simply wrong. "$@" is better.
>
> https://unix.stackexchange.com/questions/294052/how-to-properly-pass-set-=
of-parameters-with-spaces-into-shell-function
>

I'll change this.

> ...
>
> > +num_lines_is() {
> > +     [ "$1" -eq "0" ] || [ -z "$output" ] && return 0
>
> -o inside [] will do better than ||
>
> > +     local NUM_LINES=3D$(echo "$output" | wc -l)
> > +     assertEquals " number of lines:" "$1" "$NUM_LINES"
> > +}
>
> ...
>
> > +     for ARG in $*
>
> This may be wrong.
>
> > +     do
>
> > +     done
>
> ...
>
> > +gpiosim_chip_symlink_cleanup() {
> > +     if [ -n "$GPIOSIM_CHIP_LINK" ]
> > +     then
> > +             rm "$GPIOSIM_CHIP_LINK"
> > +     fi
>
> If you use already || or && you may continue doing that, this will be one=
 liner
> with it.
>
>         [ -n "$GPIOSIM_CHIP_LINK" ] && rm "$GPIOSIM_CHIP_LINK"
>
> > +     unset GPIOSIM_CHIP_LINK
> > +}
>
> ...
>
> > +     for i in {1..30}; do
>
> $(seq 1 30) or IIRC $(seq 30)
>
> Less bashisms are better.
>

Disagree. We know we'll keep on using bash here in tests. No issue
with using it here.

> > +             [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > +             sleep 0.01
> > +     done
>
> ...
>
> > +             if [ "$?" =3D "0" ]
> > +             then
> > +                     for LINE in $(find $BANKPATH/ | grep -E "line[0-9=
]+$")
>
> What's the point in -E ?
>
> Yet another `Useless use of grep`.
>

Right, we only use grep in one place. I think we used to depend on it
more in the past. I'll drop it.

> IIRC how `find` works. You may filter names there (and with regex IIRC ag=
ain).
>
> > +                     do
> > +                             test -e $LINE/hog && rmdir $LINE/hog
>
> Why not [ -e ... ] && ?
>
> > +                             rmdir $LINE
> > +                     done
> > +             fi
>
> ...
>
> > +dut_read_redirect() {
> > +     output=3D$(<$SHUNIT_TMPDIR/$DUT_OUTPUT)
> > +        local ORIG_IFS=3D"$IFS"
> > +        IFS=3D$'\n' lines=3D($output)
> > +        IFS=3D"$ORIG_IFS"
>
> TABs vs. spaces indentation issues?
>

Indeed and not only here.

> > +}
>
> ...
>
> > +dut_read() {
> > +     local LINE
> > +     lines=3D()
> > +     while read -t 0.2 -u ${COPROC[0]} LINE;
>
> What is ; for as you are using three-lines form?
>
> > +     do
> > +             if [ -n "$DUT_FIRST_CHAR" ]
> > +             then
> > +                     LINE=3D${DUT_FIRST_CHAR}${LINE}
> > +                     unset DUT_FIRST_CHAR
> > +             fi
> > +             lines+=3D("$LINE")
>
> Don't remember the syntax, but something like this
>
> lines=3D$((LINE + $lines))
>
> is better than bashisms.
>
> > +     done
> > +     output=3D"${lines[@]}"
> > +}
>
> ...
>
> > +     read -t 0.2 -u ${COPROC[0]} LINE || (echo Timeout && false)
>
> Wouldn't () fork a shell?
> (The () vs. {} discussion, don't remember by heart though.)
>
> ...
>
> > +dut_write() {
> > +     echo $* >&${COPROC[1]}
>
> Oh.
>
> > +}
>
> ...
>
> > +# Must be done after we sources shunit2 as we need SHUNIT_VERSION to b=
e set.
> > +oneTimeSetUp() {
> > +     test "$SHUNIT_VERSION" =3D "$MIN_SHUNIT_VERSION" && return 0
> > +     local FIRST=3D$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" |=
 sort -Vr | head -1)
>
> I believe you can do it with a simple test rather than involving sort and=
 head
> and printf. And test most likely will be builtin.
>
> > +     test "$FIRST" =3D "$MIN_SHUNIT_VERSION" && \
> > +             die "minimum shunit version required is $MIN_SHUNIT_VERSI=
ON (current version is $SHUNIT_VERSION"
> > +}
>
> ...
>
> > +     SORTED=3D$(printf "$REQUIRED\n$CURRENT" | sort -V | head -n 1)
>
> Ditto.
>
> > +     if [ "$SORTED" !=3D "$REQUIRED" ]
>
> Dup? Seems to me you can run a single test to get the answer.
>
> > +     then
> > +             die "linux kernel version must be at least: v$REQUIRED - =
got: v$CURRENT"
>
> Linux
>
> > +     fi
>
> ...
>
> Okay, it seems you moved existing code... That code needs more love towar=
ds
> becoming a nicely formatted shell.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I will send a series addressing some of the issues. Others I choose to
ignore for now as they are a matter of personal taste and Kent is the
author of most of the bash code here.

Bart

