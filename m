Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80EAE629C2B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 15:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiKOOdL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 09:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiKOOdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 09:33:10 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0A43BF
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 06:33:08 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id t5so14817807vsh.8
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 06:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ql5Dpk9CyUuSxvNXn+gMJrL3PKw+a0bnATMG8sMuGxo=;
        b=E2VJOpvcOiBbQD+l0VSvfEwj3RnQNeUqgBDICJmdYBy71ExE8jdLvAdJD57vRPkHFJ
         IraoVZZn5OcmZ7h+MneSv6OB1/Zakl7Yba/No8jwmQ3m4B8ceX+ZQgbQLnqhsSfa2+0G
         5QGxrjj41NDO8qfMMPFe/72sPyLXsOCh80FXneEfMPtOklmFG4sVlBHfykKk3egiWCq5
         zpTYqwrsxGsHfEjgvTjC4nUiCUdlcUrdyRHuvCOR5QRkchnIUTryFSVYkWNh8PD7jC5+
         pSLwgZufHoX7PYbCWs84NTynLyuf8u+YG3ZdZuvWV93IeGqm3AdwsB7O00oWYcTxhKg4
         aKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql5Dpk9CyUuSxvNXn+gMJrL3PKw+a0bnATMG8sMuGxo=;
        b=AwKxy/agHInn/LdivEJj0gpVBmIbb895MNhRMqUwLdpCSNb6cbnPcj2uO88NwIfGAu
         lHAOfDjTYF1GMZtyBG7e18DTzV8IupskLF6R++TK4RwW89xpPY3WSDu5X0LVm16lAxPm
         /nc8YOh0un3FKLJ9xHJ69PILWAQmUHQU+Oazf4inX+MQfo3oMzOzhkT0OKDH+auoZIvE
         bBGBQd9cgrzBzFH4zlPps12PvSwkZ8E2b3YB572Amz25dEUdgHVGkFBofKfiRPuwwSzW
         j7Ld38vOUeKphTulNvOS4t73NVIYOX1bxlGgWReQsKC7u8gF1vPlQ2fxS7CXBo21GchT
         rJuA==
X-Gm-Message-State: ANoB5pnXbOj2DFJ9NUOoA3lrCUA1cRySVG5deOOBMghyF7lt5BS9o98c
        7A0BJ0wNU0FPsCepbPrEK/h51Syh9IKXwpW3jnW8jnnoFbXT6Q==
X-Google-Smtp-Source: AA0mqf7Rzfj9Adg5tlO2/OwLcgeVXsd1fDZ+IHzwcsJPby2MtgozzFDKfpUJcNaJaHAQxbn/B9SpB+HbydNcfKI3m/w=
X-Received: by 2002:a05:6102:4187:b0:3aa:c58:66 with SMTP id
 cd7-20020a056102418700b003aa0c580066mr8961016vsb.47.1668522787852; Tue, 15
 Nov 2022 06:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20221114040102.66031-1-warthog618@gmail.com> <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
 <Y3Ja2d1X0vC663gl@sol> <Y3MLF3ilWDXhD2P4@sol>
In-Reply-To: <Y3MLF3ilWDXhD2P4@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Nov 2022 15:32:57 +0100
Message-ID: <CAMRc=McQQYPRO1NzbJ26SSD+b_Q+-sLiDHCesSn1tcv8nM52sg@mail.gmail.com>
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

On Tue, Nov 15, 2022 at 4:44 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Nov 14, 2022 at 11:12:25PM +0800, Kent Gibson wrote:
> > On Mon, Nov 14, 2022 at 03:26:38PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > >
> > > I played with the tools a bit and really like the way they look now. I
> > > think they're ready to hop into master, I'll do some more testing and
> > > they should be in this week. Just one last request from my side: would
> > > you mind updating the TOOLS section of the README? I'm aware it's not
> > > yet updated for v2 and I plan to do it soon but we could already start
> > > with the tools examples. You can send an incremental patch on top of
> > > this series.
> > >
> >
> > Good point - I totally forgot about the README.
> > I'll take a look at it.
> >
>
> And while collecting examples for the README I find the interactive mode
> tab completion is now broken. It seems I broke it when fixing the prompt
> behaviour when called from a script.
> And when fixing that I notice some other odd tab completion behaviour -
> seems there are at least two separate bugs in in_line_buffer().
> All things that gpio-tools-tests doesn't currently test for, so I
> should extend the test coverage as well.
>
> And gpiomon --unquoted aborts as I forgot to cut-and-paste the parser
> handler - and forgot to add a test for it too.
> So another fix and more tests to add.
>
> I probably wont get that done for a day or two, so you might want to hold
> off on merging - or I can always provide patches later.
>
> I also note that interactive mode does not support quoted line names on
> the interactive command line yet. Adding that is sure to be entertaining.
> Do you want to wait for me to patch that, or add it to the TODO list?
>

Yeah, I can wait.

While at it: can you move the following test case:

@test "gpioget: with consumer" {
gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz

dut_run gpionotify --banner -F "%l %E %C" foo baz

run_tool gpioget --consumer gpio-tools-tests foo baz
status_is 0

dut_read
output_regex_match "foo requested gpio-tools-tests"
output_regex_match "baz requested gpio-tools-tests"
}

to after you actually add gpionotify? Otherwise the test suite fails
and bisectability is lost.

Thanks!
Bartosz
