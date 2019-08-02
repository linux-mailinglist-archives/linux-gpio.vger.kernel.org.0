Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6A37EC7E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 08:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388515AbfHBGPN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 02:15:13 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37879 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730060AbfHBGPN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 02:15:13 -0400
Received: by mail-qt1-f196.google.com with SMTP id y26so72823811qto.4;
        Thu, 01 Aug 2019 23:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NJK0vgby3QC9u2a5qKlpfOibBVA+YhLUqRUYNCsX67s=;
        b=PgP7focY6IphrJ0Ka6VBAFp34SGs4AFVlbQ8h+T5hEgGjrsGAtyfS5VtWYxuf1fB3m
         G+G/whb1JuWvP8jS5gKDkp8csr8jyEVbEGfMgycCRW987rpX71qlDCuF5C+foPZpnr8s
         eFjM9tysfTKhL3Cuoj+drO25SsCwBeC4Ja5tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NJK0vgby3QC9u2a5qKlpfOibBVA+YhLUqRUYNCsX67s=;
        b=ELgrDPtevRM/zBUmIavoRZo3FMuFTn4AjbwFMRWvgenUaZ15AL90b7IAYxqE8HLTVm
         QU/RuuJ4aRkrMDwVWq4kDsnHtPEb9o7mk/bkzXjJ/qsqXrSpoL4CATCrw1kVRl7mCW7R
         ffq4fC5jE7+faHGlANTdDdM+bELggSXmcwBERYHjHVJ92Rr/pWnramX9OCPXjn642sfq
         eYQqpTmQW68T2mhOKa8e9srhZ4LvpRx6CXw3htt4paLB9nSmnBgZ+QlxcyvDp57EOQDG
         kX4DQ/E2QB2Au5PVyZQ4QrB3B11j3Uut7acoSRqRZxmyBdBa6nB0oGVy1LlMuGdNMuzu
         2URw==
X-Gm-Message-State: APjAAAXru2bQlGvZndZTQIRM0iyHpURCJF4HPpLjTdXE8xCzJyu3NWC2
        qvDUd7EoY9s4tOp+v0uEpONWn28pe1u56WKAcx0=
X-Google-Smtp-Source: APXvYqxWVuZjhzsME6hUNKy4bA2amIPVfDbn9cMpQvV9ctZBzTD1Uxuckz0CHPM+oREl2o6o08TXkm81e59OxjE6k6I=
X-Received: by 2002:ac8:1887:: with SMTP id s7mr94164225qtj.220.1564726512547;
 Thu, 01 Aug 2019 23:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au> <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
 <9d0f2b20-e6f6-419c-a866-c4a0dd92aa63@www.fastmail.com> <3691f6cb-2451-43f7-9f00-d5693071ba59@www.fastmail.com>
In-Reply-To: <3691f6cb-2451-43f7-9f00-d5693071ba59@www.fastmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 2 Aug 2019 06:15:01 +0000
Message-ID: <CACPK8XcWK9Gf=pW5ds=3muoXHAWnyYfHcVSVh+anaTigtMO8yA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 1 Aug 2019 at 05:45, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 30 Jul 2019, at 10:27, Andrew Jeffery wrote:
> >
> >
> > On Tue, 30 Jul 2019, at 07:23, Linus Walleij wrote:
> > > On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > > It's probably best if we push the three patches all through one tree rather
> > > > than fragmenting. Is everyone happy if Joel applies them to the aspeed tree?
> > >
> > > If you are sure it will not collide with parallell work in the
> > > pinctrl tree, yes.
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > (If it does collide I'd prefer to take the pinctrl patches and fix the
> > > conflicts in my tree.)
> >
> > Fair enough, I don't know the answer so I'll poke around. I don't
> > really mind
> > where the series goes in, I just want to avoid landing only part of it
> > if I split it up.
>
> Okay, it currently conflicts with my cleanup-devicetree-warnings series.
>
> Joel, do you mind if Linus takes this series through the pinctrl tree, given
> the fix to the devicetrees is patch 1/3?

It depends if you plan more changes to that part of the device tree
this merge window :)

Linus, perhaps the safer option is for me to take 1/3 through my tree
and you can take the rest through yours?

Cheers,

Joel
