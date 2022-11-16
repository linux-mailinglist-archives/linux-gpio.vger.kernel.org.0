Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F9B62B4CD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 09:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238760AbiKPIPq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 03:15:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbiKPIPO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 03:15:14 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842D31082
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 00:14:51 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id p4so17155646vsa.11
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 00:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TqfdeBXuTRvIvhyZgW4P/xG+3+mfQVL0mBS8rDkhsE8=;
        b=CiAuk4TQMmT587S4u7oDW5Ht3PItqbCFL7HKhBh1wRDAUeePMp8h7iIBFGD7QraW/q
         0s015dDtoJ6UH0QHchab9Ku45F2Q3Ju4YAYOTEB7PyQ8QlGobAk1LgLvnZGj9CmADM8R
         6a1M22FA9cMkRt3T6sfu2JsLVMT5asn0tqpWYrRpqJroGndCjogctlE6GAJevCWCMq+E
         As4H6vSVlyUxilgP/5Q8XKtqXDLPBC8KEWi2OlMjDZSUvbYx1yxkHS9/yNqpZrJk7n5B
         n/rHCOM0nq/RZURcXk7sa7C+nRgsPQKFKxUIJwf/jAMvglTbDir7YBg4gaZ4UTwSPCjL
         RtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqfdeBXuTRvIvhyZgW4P/xG+3+mfQVL0mBS8rDkhsE8=;
        b=2fw8P/Ta1W+vqYDTxaeK96PjSrRDd2ipVqa+Qr8ulCURKO/9dW7PkH7H7wewSmBdbw
         TAwupGiP2FTlqJnZywXaS5ROwmdiu6d3fcwOC/wkURhGsKtsm+PN7rJnlIu2erZgUTft
         6+3oL5zT483cYA90/pLbaPAbduaM7NkMrNyiwW7aq5kOoo4k8T77SCCUhPwzXWCnq43l
         t5CUhbqpScI3JZFM20z+BZcYbsfk9z7p1PpW3sfzJZr7UREnFk7dbaYz7OcV68YtKkTC
         ezpsNmUzzEagUcBeCQZTe7abxTTMApWPUNez08h9BUfg/hispP3IRaZaRwj/EHbPRT6H
         /42g==
X-Gm-Message-State: ANoB5pm5qdh4Bzvwi8HlRPqPfGb4Vx3CwtukWq874/QHFmIYi9xJBlL1
        oveIOLcofmd1L4Rf1UZHEXr5bVg3yIiY7+50G4r2kiCLv0A=
X-Google-Smtp-Source: AA0mqf4xsIaYevB3SeiF1QtTz4pUJL1j906xQLQUMHsteQpM/+285FNBYoiWZtUVWCurhwkt6rBXrumi/BevCkNARS0=
X-Received: by 2002:a67:fb81:0:b0:3a9:afe1:eef6 with SMTP id
 n1-20020a67fb81000000b003a9afe1eef6mr11131936vsr.61.1668586490453; Wed, 16
 Nov 2022 00:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20221114040102.66031-1-warthog618@gmail.com> <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
 <Y3Ja2d1X0vC663gl@sol> <Y3MLF3ilWDXhD2P4@sol> <CAMRc=McQQYPRO1NzbJ26SSD+b_Q+-sLiDHCesSn1tcv8nM52sg@mail.gmail.com>
 <Y3Qq512/3lPqc4xt@sol>
In-Reply-To: <Y3Qq512/3lPqc4xt@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 16 Nov 2022 09:14:39 +0100
Message-ID: <CAMRc=MfWUHKY4GZQ9qb_q3oHW0aWRhTstMcHxcgGe7-jyw0nvg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v4 0/5] tools: improvements for v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 1:12 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Nov 15, 2022 at 03:32:57PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 15, 2022 at 4:44 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Mon, Nov 14, 2022 at 11:12:25PM +0800, Kent Gibson wrote:
> > > > On Mon, Nov 14, 2022 at 03:26:38PM +0100, Bartosz Golaszewski wrote:
> > > > > On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > >
> > > > > I played with the tools a bit and really like the way they look now. I
> > > > > think they're ready to hop into master, I'll do some more testing and
> > > > > they should be in this week. Just one last request from my side: would
> > > > > you mind updating the TOOLS section of the README? I'm aware it's not
> > > > > yet updated for v2 and I plan to do it soon but we could already start
> > > > > with the tools examples. You can send an incremental patch on top of
> > > > > this series.
> > > > >
> > > >
> > > > Good point - I totally forgot about the README.
> > > > I'll take a look at it.
> > > >
> > >
> > > And while collecting examples for the README I find the interactive mode
> > > tab completion is now broken. It seems I broke it when fixing the prompt
> > > behaviour when called from a script.
> > > And when fixing that I notice some other odd tab completion behaviour -
> > > seems there are at least two separate bugs in in_line_buffer().
> > > All things that gpio-tools-tests doesn't currently test for, so I
> > > should extend the test coverage as well.
> > >
> > > And gpiomon --unquoted aborts as I forgot to cut-and-paste the parser
> > > handler - and forgot to add a test for it too.
> > > So another fix and more tests to add.
> > >
> > > I probably wont get that done for a day or two, so you might want to hold
> > > off on merging - or I can always provide patches later.
> > >
> > > I also note that interactive mode does not support quoted line names on
> > > the interactive command line yet. Adding that is sure to be entertaining.
> > > Do you want to wait for me to patch that, or add it to the TODO list?
> > >
> >
> > Yeah, I can wait.
> >
>
> It seems that, as per the prompt, libedit doesn't provide tab completion
> when stdin/stdout isn't a tty, so automated testing of it will require a
> different approach such as a pty. Not sure how to do that from bash.
> Unless I have an epiphany, or you have a better suggestion, for the moment
> I'll just test it manually as it isn't critical functionality - it is just
> a nice to have.
>

Sounds good, just add it to the TODO file in the repo.

Bart

> > While at it: can you move the following test case:
> >
> > @test "gpioget: with consumer" {
> > gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
> > gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
> >
> > dut_run gpionotify --banner -F "%l %E %C" foo baz
> >
> > run_tool gpioget --consumer gpio-tools-tests foo baz
> > status_is 0
> >
> > dut_read
> > output_regex_match "foo requested gpio-tools-tests"
> > output_regex_match "baz requested gpio-tools-tests"
> > }
> >
> > to after you actually add gpionotify? Otherwise the test suite fails
> > and bisectability is lost.
> >
>
> Well that is iritating.  I could rework the test to not rely on
> gpionotify - it could use the settling period to make gpioget hold the
> line while gpioinfo checks - but it would be slower and uglier.
> So I'll add that test with the gpionotify tests, as you suggest.
>
> Cheers,
> Kent.
