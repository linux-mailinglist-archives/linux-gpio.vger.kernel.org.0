Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5266A103CBE
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 14:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbfKTN7E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 08:59:04 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33981 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbfKTN7E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 08:59:04 -0500
Received: by mail-pj1-f65.google.com with SMTP id bo14so4131331pjb.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 05:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=j7joOdR9Iobvsgf+0QHonCwN9pIZxgqZYcdWE8JAi7s=;
        b=dKAVi41df2ikXjUWAvuvfVs2uZ7+pr3BFfu3IvTArtTqkE/37IkY9hWSZd6cD/1cR3
         Y7/Eh3r9KX6Uujb21hQZmur760QQVwC2VHcAORA3qjtx1ygHYeDy7KcCaQlpNzrOG7pB
         PMg4Ft6/cHcBBrdtKUAt23f3TwEc7gXqw9pK3EjvMOPTioaLGvQz7fgICCWjNgC6gDxG
         9HCNG1ob4nZNysTk/mmvRqRHb+Ing+rso0sfkL5fzBgB0zx9lf8gRp1yyTk6mSYLCfeh
         /3M/HxaZJmNVCnJC+dyFNB5/fIty7VmrfbEi86EAz6ZxaBQLqd8swe9k8fIEN6t9aPWm
         EQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=j7joOdR9Iobvsgf+0QHonCwN9pIZxgqZYcdWE8JAi7s=;
        b=oAclDd607goXFnJX4BeaUdZu8gnSAnWn3Zyr4R1KwJV47ZUcYWgNDv/3/yptrlTIa0
         eKJh8Ca2JEOE0HU0IlSnoTLdeTKpfMtP0wprYn+B+lqprGXK81GTu+XTI72+NMXwMhpT
         CXifOK87OYFgfWFMk3G4BwUWm5KUccmLW1riVb1vPlYo8TsH6lHUdSvOqs2dxDQqU429
         zRg2eHt2/SsRDaElAJ2lgkS+4WlNo3+s2tRsrkdDwR7kZTw07p02rtcE16Jx93VkuDvy
         loELPszK3nuLevV7exjitEpFOrUKkPi/Qcj8/JxVuemfR/Ll9CjxWKENzaJvDSWV+SQf
         sJJw==
X-Gm-Message-State: APjAAAX893ZFGpeY3Zu2BbjOAVKv2zWwYsG8Nj8DX2ueIntlk/eIwEUp
        1HewB2euXzZ0TB1lvmoKKG8=
X-Google-Smtp-Source: APXvYqygCS0Afy3pA+kAktNcKykoqlswmbP9fKgKTndLoXu+jJ5u+EMbXeU7zPIPO94G4c7e6BIGFw==
X-Received: by 2002:a17:902:5a41:: with SMTP id f1mr3179500plm.168.1574258343127;
        Wed, 20 Nov 2019 05:59:03 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y11sm30480170pfq.1.2019.11.20.05.59.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 05:59:02 -0800 (PST)
Date:   Wed, 20 Nov 2019 21:58:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191120135857.GA4218@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol>
 <20191119155249.GA20834@sol>
 <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > +
> > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > > > +{
> > > > > +       struct gpiod_line *line;
> > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > +       unsigned int i;
> > > > > +       int direction;
> > > > > +
> > > > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > > > +       if (line->as_is) {
> > > >
> > > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > > really needed.
> > > >
> > >
> > > It is there for gpiod_set_flags, which has to populate the direction
> > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > as-is is gets mapped to input.
> > > I didn't want to change the existing line->direction, and adding the
> > > as-is seemed clearer than adding another flavour of direction that
> > > contained all three.
> > >
> >
> > Hmmm, I think I see what you were getting at - the line->direction is the
> > direction from the kernel, so it doesn't hurt to use that value to set the
> > corresponding request flags - even if the original request was as-is??
> >
> > If that is the case then the line->as_is can be dropped throughout.
> >
> > Kent.
> >
> 
> Yes, this is what I was thinking. Just need to make sure the value
> from the kernel is up-to-date.
> 

So fail if needs_update?

Kent.
