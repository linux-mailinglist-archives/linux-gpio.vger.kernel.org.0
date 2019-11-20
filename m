Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A27B103D5E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 15:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731699AbfKTOgw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 09:36:52 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44701 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731492AbfKTOgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 09:36:52 -0500
Received: by mail-pf1-f196.google.com with SMTP id q26so14299126pfn.11
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=24nLMCKiP5RaTeDMbaqlEfwP/6yNwYnID56ewBxNA04=;
        b=D06+IqmevYdHL161pjmbNv8of++ciqGu9nG2QwQEn6+tqY2RED3gfXV0wxfRNHPpYS
         zXaWoCDnrPTtCAn0r6QWvQXgSKS58HmsC9X0R/b3iCoF/OTJab11C/s3cdRF5kFLwv6A
         k3XHH9+iPs78lhxh2OwkKcXWEIVBxKRGS5hzYXMxi/cQb8Z2S/Q08/MUWoLchOsA50r+
         ir1SSx1FgoEkaVT7rGXVhW4aYB0/YigZJunvslmzVrjmoUhZmE2Yu9IKeHa96zE3kHlO
         kcDFIJ8a6JyO6UKdfohlXN1DAaCTHt4y7w/fTT+mJv7sJTu7kBPiesOrWOMLCP1B6XPg
         dSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=24nLMCKiP5RaTeDMbaqlEfwP/6yNwYnID56ewBxNA04=;
        b=ZM3JX1ISfe0O5d4UfRIv6tD59k46JalWy4rXW0bnKrOk6UzQmf8BMSw730nveesL35
         cBrecjIxDfVQOD7chIA/d+CI3/K1PKdZhdkGb0LD2zNLa90080j1SLIRJxdvnCQZM/Hp
         Abdlx9duuO/QZhUpdLq9Bg7L/2aPLer/SS/Pu2JftjIStqSYan5QnIMVQf9XDCJbfnq6
         aIvjyvdEgZRyygX0uz26m08ALv9g1hT2UkxttUSX4E87/pPt09kgdbB6lWQwa268osbK
         rBMgH/GY04gvbv/7rmKFCkg5OudZ6ahiJoxKRPWRCdITQ3IyGm1AtcF6eafQQIsUHxPf
         9TRA==
X-Gm-Message-State: APjAAAVnTx2u/mqRH44zqMI7AJbvNBUc3weyW+Ls4nYUUaaOyu0GO0BD
        xgrCtFCMQH3X0GkFOIxFwortf0o4g48=
X-Google-Smtp-Source: APXvYqzJU3N9sIRTIO7kUOstAmlKs2emOUgf0j7fUJwd56bX+XuHD8aX8p7FeMcxuNgoLO1ceBSqNw==
X-Received: by 2002:aa7:9a96:: with SMTP id w22mr4591381pfi.162.1574260609647;
        Wed, 20 Nov 2019 06:36:49 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id m34sm29276773pgb.26.2019.11.20.06.36.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 06:36:49 -0800 (PST)
Date:   Wed, 20 Nov 2019 22:36:44 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191120143644.GA5865@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol>
 <20191119155249.GA20834@sol>
 <CAMRc=MeG2FJeKVdKSywOT3271jA_sDfcPNHe4BzyiEgxRKtKBg@mail.gmail.com>
 <20191120135857.GA4218@sol>
 <CAMRc=McNdcaLJKG3TRvX08Ddwmi-V9AJUDG5zmBgqL8bwjCSYg@mail.gmail.com>
 <20191120141353.GA5154@sol>
 <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdWj_+kd2wGUoRVRSd+kq597h-jetiHMwRiOvuUi8qRQQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 03:18:36PM +0100, Bartosz Golaszewski wrote:
> śr., 20 lis 2019 o 15:13 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Nov 20, 2019 at 03:08:57PM +0100, Bartosz Golaszewski wrote:
> > > śr., 20 lis 2019 o 14:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Wed, Nov 20, 2019 at 12:00:45PM +0100, Bartosz Golaszewski wrote:
> > > > > wt., 19 lis 2019 o 16:53 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> > > > > > > On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > > > > > > > +
> > > > > > > > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > > > > > > > +{
> > > > > > > > > +       struct gpiod_line *line;
> > > > > > > > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > > > > > > > +       unsigned int i;
> > > > > > > > > +       int direction;
> > > > > > > > > +
> > > > > > > > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > > > > > > > +       if (line->as_is) {
> > > > > > > >
> > > > > > > > Can you explain the purpose of this as_is field? I'm not sure this is
> > > > > > > > really needed.
> > > > > > > >
> > > > > > >
> > > > > > > It is there for gpiod_set_flags, which has to populate the direction
> > > > > > > flags in the SET_CONFIG ioctl. The existing line->direction is
> > > > > > > either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> > > > > > > as-is is gets mapped to input.
> > > > > > > I didn't want to change the existing line->direction, and adding the
> > > > > > > as-is seemed clearer than adding another flavour of direction that
> > > > > > > contained all three.
> > > > > > >
> > > > > >
> > > > > > Hmmm, I think I see what you were getting at - the line->direction is the
> > > > > > direction from the kernel, so it doesn't hurt to use that value to set the
> > > > > > corresponding request flags - even if the original request was as-is??
> > > > > >
> > > > > > If that is the case then the line->as_is can be dropped throughout.
> > > > > >
> > > > > > Kent.
> > > > > >
> > > > >
> > > > > Yes, this is what I was thinking. Just need to make sure the value
> > > > > from the kernel is up-to-date.
> > > > >
> > > >
> > > > So fail if needs_update?
> > > >
> > > > Kent.
> > >
> > > I'd say: do an implicit update before setting config.
> > >
> >
> > So gpiod_line_update if needs_update, and fail if that fails?
> >
> > Kent.
> 
> Without the if - needs_update is only set if an implicit update fails
> in line_maybe_update(). But in this case we need to be sure, so do it
> unconditionally.
> 

Given that line_maybe_update is called at the end of request creation, and
whenever set_config is called, how can line->direction be inconsistent
with the kernel state - as long as needs_update is false?

Kent.
