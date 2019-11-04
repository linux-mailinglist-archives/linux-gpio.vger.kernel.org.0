Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CEDEE213
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 15:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbfKDOWh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 09:22:37 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37700 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbfKDOWh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 09:22:37 -0500
Received: by mail-pg1-f194.google.com with SMTP id z24so6848926pgu.4
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8Ewy6yFCIJQeJzeUUzw7ivlDwtmXkA9mHYOFTDFolpw=;
        b=DwNwAMwS+l6Wx98TwA2sPBm8Xi/q0X6wbnsvZB48+LuvpuV2B7sO7TYz4hKBjvQKg7
         QYiSb65Wokgkg2WV8i4p5QSiicVu8FOKR35+rsMSQV/Fx8vYsAbjwsuraUKfFllqJJnE
         hPkai/+C179J15Z4+7wfF9iUqy/trxEgjRG2sjVv8FwWB4QzRijwM5Ieyh/TYbFG7+Jz
         xEcXfCoLB7Yzmh7BmsrJJ3z6xuMPw9FJ+xPcFSLIsC0YiU9VBkbM6ZPvcmH3ufUdo2pi
         7rZ62D3CT67yeziVHBatjxutqVfX18IvtYwGBxI0BVBpr98tfdbKO+wHhw2nM0zgVvd+
         LkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8Ewy6yFCIJQeJzeUUzw7ivlDwtmXkA9mHYOFTDFolpw=;
        b=kMUrtoaZ1bT6HrtC8l4Vg1vMsF5Si4YUhUToDZp9Ftks0l2wIB2/EpHWFQnZiciRR9
         MrqGHKW54zDc4fGW0dwNLWkv/6UPyy+EspPpI9ekv0mHgt8/HjAmWS2RsQR4FO62oJec
         ndar8WQxJFATyuB9qJjAHHAzbIf2wLuLiS+7T+dIe33UyFGFJurUGjazYwkg/R57/PaH
         XwXdTzZU2R/EYUxtd4kpJ+p7CGrLH4SDjtmgnL6q8OHxuS/393bjaVHae8BA+iFQExZE
         QlUh5DeIPSsO5/W0bf1A3br13rl+eC++5Hk56Uo0R3ZgSw/TJTDTFj7H3p7ydmvwz3rz
         tpvQ==
X-Gm-Message-State: APjAAAUHrtZA7vnwU7Zv6DaaR/z0RVu7RTedQ3s3gLG/yfDPhIGJyIzC
        orH80B/h+izKpg4acqGSnCs=
X-Google-Smtp-Source: APXvYqzx1GxXmInW27yhe72ZcOlFQ9b5TOcyiIWP56Jh4hZbbtqdKX+EuW7RkrkhpcFtYWjzp6UF6g==
X-Received: by 2002:a63:d802:: with SMTP id b2mr30313726pgh.414.1572877355866;
        Mon, 04 Nov 2019 06:22:35 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id 76sm3925622pfw.75.2019.11.04.06.22.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 06:22:35 -0800 (PST)
Date:   Mon, 4 Nov 2019 22:22:29 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v4 0/5] gpio: expose line bias flags to userspace
Message-ID: <20191104142229.GA13556@sol>
References: <20191028073713.25664-1-warthog618@gmail.com>
 <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
 <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com>
 <20191104010736.GA9134@sol>
 <CAMpxmJUim4SV43McHR2X0Ukc2_zZrdj=cZPvAaETyp4kSObCSA@mail.gmail.com>
 <20191104111148.GA3648@firefly>
 <CAMpxmJWqsZxK-C7UYz_PbgFA=bNVz6xvbCXEoxgbVZQ7znk86w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJWqsZxK-C7UYz_PbgFA=bNVz6xvbCXEoxgbVZQ7znk86w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 12:48:33PM +0100, Bartosz Golaszewski wrote:
> pon., 4 lis 2019 o 12:12 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Mon, Nov 04, 2019 at 11:14:56AM +0100, Bartosz Golaszewski wrote:
> > > pon., 4 lis 2019 o 02:07 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Mon, Nov 04, 2019 at 01:26:54AM +0100, Linus Walleij wrote:
> > > > > On Thu, Oct 31, 2019 at 8:10 AM Bartosz Golaszewski
> > > > > <bgolaszewski@baylibre.com> wrote:
> > > > >
> > > > > > [Kent]
> > > > > > > This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> > > > > > > Gross control means enabling and disabling of bias functionality,
> > > > > > > not finer grained control such as setting biasing impedances.
> > > > >
> > > > > Right, excellent and persistent work here, much appreciated!
> > > > >
> > > >
> > > > No problem - hopefully I haven't irritated too many people in the process.
> > > >
> > > > > As long as I get Bartosz's blanket ACK on v5 I think it is ready
> > > > > to merge. His consent is required for this.
> > > > >
> > > >
> > > > I'm still waiting on open questions from v4 before submitting v5:
> > > >
> > > > One, handling of errors when setting bias, Bart has referred to Thomas,
> > > > so waiting for feedback on that.
> > > >
> > >
> > > If we can get it merged for v5.5, then I don't want to block it
> > > waiting for answers. Looking at the code I think we should only ignore
> > > the EOPNOTSUPP error and propagate all other codes. Can you add a
> > > patch changing that and then fix the other nits I pointed out? Also:
> > > please Cc Thomas Petazzoni so that he gets the chance to yell at us if
> > > it breaks something.
> > >
> >

Can you just confirm if it is EOPNOTSUPP or ENOTSUPP that you want ignored?

> > Will do.
> >
> > > > The other, where gpio_set_bias is hooked into gpiod_direction_output,
> > > > is fine as is for the UAPI - it can always be relocated subsequently if
> > > > other APIs need to set bias.  On the other hand, if decoupling setting
> > > > direction and bias is in order then that really should be done now.
> > > > Can I get an an ACK on that either way?
> > > >
> > >
> > > This is in line with what you did for input. I don't think it should
> > > be decoupled (any particular reason for that? There is none mentioned
> > > in the cover letter), so I propose to leave it as it is in patch 5/5.
> > >
> >
> > Wrt decoupling, I was thinking of both input and output, not just output,
> > though it was the output that got me onto that line of thought as
> > gpiod_direction_output sets bias, but gpiod_direction_output_raw doesn't.
> > That seemed totally arbitrary.
> >
> > That lead to thinking that the gpiod_direction_output (and _input) is now
> > doing more than implied by the name, and by the documentation for that
> > matter.  So perhaps it should be split out and promote gpio_set_bias to
> > gpiod_set_bias?  Anyway, that was the line of thought.
> > The problem there being some callers of gpiod_direction_input already
> > expect it to set bias, at least on a best effort basis, and they would
> > have to be updated to call gpiod_set_bias.
> >
> 
> I see. I think that in this case, the _raw variants should stay as
> simple as possible (hence the name) while the bias *should* be set in
> the regular gpiod_direction_intput()/output(). For now I don't think
> we need an exported gpiod_set_bias(), but if someone should request it
> in the future it will be straightforward to add.
> 

OK.

> > Maybe just update the documentation for exported functions that do set
> > bias?
> 
> Sure, sounds good. You can even extend the doc to include other flags
> these functions handle.
> 

OK to add this later, or does it need to be in this series?

> >
> > > One more thing - since we all want this to make it for v5.5 - can you
> > > make the set config patches part of this series (simply bunch it all
> > > together)? This will make it easy to review and merge everything.
> > >
> >
> > May as well - I've got it all in the one branch anyway.
> >
> > > Thanks in advance and great job!
> >
> > I was about to start updating libgpiod to add set_config, after adding
> > the equivalent to my gpiod library (nearly finished writing the tests
> > for that), but I'll put all that on the back burner and get v5,
> > including in the set_config patches, out as soon as I can.
> >
> 
> Let me know if you still want to do it and you'll have patches ready
> before v5.5 is released. Otherwise I can do it myself too if needed.
> 

When does the window close for v5.5?
I've got an updated series ready - other than the doc updates mentioned
above.

Cheers,
Kent.
