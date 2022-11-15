Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547716290EF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 04:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbiKODoh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 22:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237429AbiKODoa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 22:44:30 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C87819006
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 19:44:28 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so15692811pjs.4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 19:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0RuvJ91jRbOuW1RwJ7AKpoCXD/5xy+QuNAAHiWz5Mmk=;
        b=fBq520dwl8JfbLVfypJXgprJryZRukZuUcAtH6JSUuquKkv0tx0aG5dhxIniTts4mM
         OpiTgtWj17zdf88QmAuDTYDyWeFVhZtmDRg7VO0Oy3Uxr0OOIipBW7qBdZXlJiTKN9bN
         /Z6V6UG3c6/jtVJ583cnqc8ROt5KL3FFPk8IXPb2YBb9s2ojIbpomYXartVD7sutAgLO
         9b67HKe8BEf/3gHg+utpWkqcC9IZb8K7Uc+OQAsJU2wFgYojK7HMWuupjXwngiZLvW+k
         i4do0Qeo57of+kfdLu8urlL7VfmMi8Gy0evpzTyCFwOEWd000S60zDDgtvC3KpQ4OBbr
         eSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RuvJ91jRbOuW1RwJ7AKpoCXD/5xy+QuNAAHiWz5Mmk=;
        b=Cnra2Rn/HKbtR2AceyB3Mn7S3yJAU2KDvoab3Va6zaWZyY9BVN8KRm2SI3Ozy4Hz+K
         AL1p+iyKWm3Y9bY0AMMvWBsgwHplUA2rornz22BaHGlJtTc0Fg8lOP+ZyQM+1YNFm1ru
         8R9bM7yi6663f4AW/NBWSrBj5P23fsOhbKKprdNQJHEnrrxalFLDKejL+esHUMUkkXXy
         kvYMnymUYTyuQ6LwdgtbdPwk3/btzWj8vnmD2A1Mv8B9UKb3fyQ/ZWt7AgdZ+pBfGw6z
         pjZOybvaaZHYteYLY8ihdHm0QR26s81tphCBGwf+KBVyWGWifoHzjOgb5fA0VTFFtbhh
         ILnw==
X-Gm-Message-State: ANoB5plMuikeU8YvtHM2NCnfUScdJjy1Rby9kS0yitki/RKq+iWdaRZb
        tzyQdY03ZLaeBZ0JRCG4N9PueczOobk=
X-Google-Smtp-Source: AA0mqf6sX9ODQh9bvfW8MHN1PRq1iyqTW1HyOb2jIduGLyMika0uJD0JgK34Z7qdAZUdlD9BsV6iBA==
X-Received: by 2002:a17:902:6a8c:b0:188:6c5b:ffb0 with SMTP id n12-20020a1709026a8c00b001886c5bffb0mr2170059plk.125.1668483867800;
        Mon, 14 Nov 2022 19:44:27 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b00186ff402508sm8304768plb.281.2022.11.14.19.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 19:44:27 -0800 (PST)
Date:   Tue, 15 Nov 2022 11:44:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 0/5] tools: improvements for v2
Message-ID: <Y3MLF3ilWDXhD2P4@sol>
References: <20221114040102.66031-1-warthog618@gmail.com>
 <CAMRc=MdUNHsL3_uFR1j2ao4GCMvH_1W0ZMxe4QBG0HFu4xNcew@mail.gmail.com>
 <Y3Ja2d1X0vC663gl@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Ja2d1X0vC663gl@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 11:12:25PM +0800, Kent Gibson wrote:
> On Mon, Nov 14, 2022 at 03:26:38PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Nov 14, 2022 at 5:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > 
> > I played with the tools a bit and really like the way they look now. I
> > think they're ready to hop into master, I'll do some more testing and
> > they should be in this week. Just one last request from my side: would
> > you mind updating the TOOLS section of the README? I'm aware it's not
> > yet updated for v2 and I plan to do it soon but we could already start
> > with the tools examples. You can send an incremental patch on top of
> > this series.
> > 
> 
> Good point - I totally forgot about the README.
> I'll take a look at it.
> 

And while collecting examples for the README I find the interactive mode
tab completion is now broken. It seems I broke it when fixing the prompt
behaviour when called from a script.
And when fixing that I notice some other odd tab completion behaviour -
seems there are at least two separate bugs in in_line_buffer().
All things that gpio-tools-tests doesn't currently test for, so I
should extend the test coverage as well.

And gpiomon --unquoted aborts as I forgot to cut-and-paste the parser
handler - and forgot to add a test for it too.
So another fix and more tests to add.

I probably wont get that done for a day or two, so you might want to hold
off on merging - or I can always provide patches later.

I also note that interactive mode does not support quoted line names on
the interactive command line yet. Adding that is sure to be entertaining.
Do you want to wait for me to patch that, or add it to the TODO list?

Cheers,
Kent.
