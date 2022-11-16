Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1313B62AFE8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 01:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiKPAMa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 19:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiKPAM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 19:12:29 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352E42A716
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 16:12:28 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id q9so15899311pfg.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 16:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xO84DdgRKxuTMn2yLg2AmudKjRhlS5WH0IczUTU6PU=;
        b=ft0pFkJX44FkH2QfnLkXWjKJUDw1SKcE3nu1Q2anbTtebWn7v+C5BknIHmRbjrRlWt
         fH3waDPQbG9q7eNCDBydefl9/+jzy+omg48K39GXotCoDRDemtvca9XP3ARdKoViUms8
         DZKWl8N5RngF6IhOsi9vi168sYDpbmPDGRkD3j7Lkjhs9ssLM/Ni+CSobfdEQzlFDy+M
         zGKjV5O3hQP6STo3JwcuDFfo2H74jmTIiIA9meKyimcLdHC+e4/fmNhMKo0wI7Flalig
         Tz6UF8zBDpNbYB0TFenRruk8IZAZB6fawUQd5ykL+7xMViKdpoI+EEgqu9jynM2VDAtV
         N+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xO84DdgRKxuTMn2yLg2AmudKjRhlS5WH0IczUTU6PU=;
        b=J5lgv4XgFXnPn6j5hMoc53qhVED0+MKPi+ci2CdSOQ8WPm5AIYFUdj9SheHj+1dNzT
         V8TjrH1sbkQowWA2O04SQyh9rSlEl860aN2PsnyPnjK13zALBYNdPNs2Gb1iknOgyoK0
         4fsnpW83ad03/wRd1H53u9Wwg5a2MfebLZvUs7Os1LZUV55+ZUwO3QuGtpyeiNtBz259
         rUFMbw8NCe7vCYlJyZB3FYxerGZmgRhfvr6ajzfRWtvth/rNkraJQAxu3m3g+kiQivhI
         A9Qg4PvoMKkUFApj96zrQTSB/yZABsSI0gu1d7TptgF6AgV1G14l6rlDR7a/Z9jM9um2
         UBhw==
X-Gm-Message-State: ANoB5pm4y8iuB91pUm96P+QQpdVQ0hYWxtmcmi24hnPM8rDyNTO+2ZuS
        OyDbMjoCLpViPYDgu06BWIQgoygGB/4=
X-Google-Smtp-Source: AA0mqf4AgnTDL2Tgt3Oqsct3opPoO1JwudxbPoyK9SHcuN6M5SSKkPFfAqUzJJHPaEISzVHvtDxMCw==
X-Received: by 2002:a62:f941:0:b0:561:b2ea:bfe9 with SMTP id g1-20020a62f941000000b00561b2eabfe9mr20848274pfm.4.1668557547673;
        Tue, 15 Nov 2022 16:12:27 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id c15-20020a17090abf0f00b00210125b789dsm133414pjs.54.2022.11.15.16.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:12:27 -0800 (PST)
Date:   Wed, 16 Nov 2022 08:12:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 0/5] tools: improvements for v2
Message-ID: <Y3Qq512/3lPqc4xt@sol>
References: <20221114040102.66031-1-warthog618@gmail.com>
 <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
 <Y3Ja2d1X0vC663gl@sol>
 <Y3MLF3ilWDXhD2P4@sol>
 <CAMRc=McQQYPRO1NzbJ26SSD+b_Q+-sLiDHCesSn1tcv8nM52sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McQQYPRO1NzbJ26SSD+b_Q+-sLiDHCesSn1tcv8nM52sg@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 03:32:57PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 15, 2022 at 4:44 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Nov 14, 2022 at 11:12:25PM +0800, Kent Gibson wrote:
> > > On Mon, Nov 14, 2022 at 03:26:38PM +0100, Bartosz Golaszewski wrote:
> > > > On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > >
> > > > I played with the tools a bit and really like the way they look now. I
> > > > think they're ready to hop into master, I'll do some more testing and
> > > > they should be in this week. Just one last request from my side: would
> > > > you mind updating the TOOLS section of the README? I'm aware it's not
> > > > yet updated for v2 and I plan to do it soon but we could already start
> > > > with the tools examples. You can send an incremental patch on top of
> > > > this series.
> > > >
> > >
> > > Good point - I totally forgot about the README.
> > > I'll take a look at it.
> > >
> >
> > And while collecting examples for the README I find the interactive mode
> > tab completion is now broken. It seems I broke it when fixing the prompt
> > behaviour when called from a script.
> > And when fixing that I notice some other odd tab completion behaviour -
> > seems there are at least two separate bugs in in_line_buffer().
> > All things that gpio-tools-tests doesn't currently test for, so I
> > should extend the test coverage as well.
> >
> > And gpiomon --unquoted aborts as I forgot to cut-and-paste the parser
> > handler - and forgot to add a test for it too.
> > So another fix and more tests to add.
> >
> > I probably wont get that done for a day or two, so you might want to hold
> > off on merging - or I can always provide patches later.
> >
> > I also note that interactive mode does not support quoted line names on
> > the interactive command line yet. Adding that is sure to be entertaining.
> > Do you want to wait for me to patch that, or add it to the TODO list?
> >
> 
> Yeah, I can wait.
> 

It seems that, as per the prompt, libedit doesn't provide tab completion
when stdin/stdout isn't a tty, so automated testing of it will require a
different approach such as a pty. Not sure how to do that from bash.
Unless I have an epiphany, or you have a better suggestion, for the moment
I'll just test it manually as it isn't critical functionality - it is just
a nice to have.

> While at it: can you move the following test case:
> 
> @test "gpioget: with consumer" {
> gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
> gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
> 
> dut_run gpionotify --banner -F "%l %E %C" foo baz
> 
> run_tool gpioget --consumer gpio-tools-tests foo baz
> status_is 0
> 
> dut_read
> output_regex_match "foo requested gpio-tools-tests"
> output_regex_match "baz requested gpio-tools-tests"
> }
> 
> to after you actually add gpionotify? Otherwise the test suite fails
> and bisectability is lost.
> 

Well that is iritating.  I could rework the test to not rely on
gpionotify - it could use the settling period to make gpioget hold the
line while gpioinfo checks - but it would be slower and uglier.
So I'll add that test with the gpionotify tests, as you suggest.

Cheers,
Kent.
