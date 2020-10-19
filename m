Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E2D292832
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 15:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgJSNbU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 09:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728279AbgJSNbU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 09:31:20 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F893C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:31:19 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id l16so10391183ilt.13
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUzypxfQjVoOjtpjLn2KBIFwrKc5+oeqN9MdEVJUd8g=;
        b=NHe8XhzGL/1O38eBkDyfgs2iY4f7O+CVv4BqqjuNXtPbRpnRdq14oNIalVLF3AQlYh
         ytG5oZuNPvjDXeFxRFwvEcys9qpoj0WaXxC7dBV4RugL5/5vFTVw9tSCgodpgGROnbhW
         IR/Z22sSjp5fCr5Mkkx3c3eH7/xV+mxS/eN+yWkmdyeuGedR7CGFs/TYUZNM9687wtwN
         RuSaQmma/T/jTBUK4N8j4pEP09sYt9MAgOq2nqPUpT9JTqW+oxIl2GmMqIjPpHWZ0NuB
         rbi3AMdVkNVYU23hdP51seIk7G6NljLWhSVtBHuPOg1GgL9MH6k1qrX6vhshcaA818H0
         wiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUzypxfQjVoOjtpjLn2KBIFwrKc5+oeqN9MdEVJUd8g=;
        b=VdHwuVMzRBEL0YmZ5ghzCN4py+xwsj7EPICqCIm5A964ts3POCvb/ZhXJQVzzYrq/6
         Hwl/tekrcqI8IKF4Bv1ly0DNo1ZKaibPDHCRD/QEt2ikcISb66dtP6KmQr4SEHIi9HyG
         ED9QGFwRZIhw712TmXGjDJeezvEUv4QgXyyHF4oTLlwOtiZMgfWpyNO0LHf0k0r9+dkX
         REu1E+RBTKqlm5FKLaiz04IaioO8Hr+VzQECuXG7KwScKq1BvqumeRBwLtfuULJp8Lav
         xxSE6rxa7vz5AuNW/rZS1lQdO42de6sTU05UKtsJMvgEjvcFKeT7nkXHa0z0Jm2xI4SB
         24Zg==
X-Gm-Message-State: AOAM532zfVSAm3Oz3clB2qSGUbONo4aN9V9ncm5/Kl5PJdjQtbMa0WQE
        Ln1TLvY2iU9kfrfdjdrD8913wFzgiuw3mv3pjPyceg==
X-Google-Smtp-Source: ABdhPJwaggJHOrfKDqq5q927SVySwSzmnsriFzWrPms7OpKDvqSqKP2N7dPdP17WEucGihiLOxQF5iCvfYZV0bl5weA=
X-Received: by 2002:a05:6e02:926:: with SMTP id o6mr1653508ilt.287.1603114278592;
 Mon, 19 Oct 2020 06:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJVWr-M3R-PfsrDvtpZTtSTBLHL95sAorO5EHVwg1eX67A@mail.gmail.com>
 <20201013005252.GA9387@sol> <CAMRc=Mf_ZG5FqEAd0CSCqx_GeEG_4ghEXf8S3Sdws4+XOFV2Ag@mail.gmail.com>
 <20201013085310.GB3119809@sol>
In-Reply-To: <20201013085310.GB3119809@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Oct 2020 15:31:07 +0200
Message-ID: <CAMRc=Mc_kNmWBUhyxMHvr9bComG03=_rR4KM8X4wgzkqjK6FZw@mail.gmail.com>
Subject: Re: [libgpiod] Rethinking struct gpiod_line_bulk
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 10:53 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> >
> > struct gpiod_line_bulk {
> >     struct gpiod_chip *owner;
> >     unsigned int num_lines;
> >     uint64_t lines;
> > };
> >
> > And the 'lines' bitmap should actually refer to offsets at which the
> > owning chip stores the line pointers in its own 'lines' array - up to
> > 64 lines.
> >
> > But we'd still have to sanitize the values when adding lines to a bulk
> > object and probably check the return value. I'm wondering if there's a
> > better way to store group references to lines on the stack but I'm out
> > of ideas.
> >
>
> So you are proposing keeping the bulk of the bulk in the background and
> passing around a flyweight in its place.  Makes sense.
>

So this won't fly of course because a bitmap doesn't hold enough
information to reference an arbitrary number of lines in the chip in
any meaningful way.

I have another idea. I can live with struct gpiod_bulk being allocated
dynamically whenever users of the library use it - because it's quite
unlikely they'd do it all that often. What I'd like to avoid is
allocating a new bulk object whenever we want to package a single line
passed to e.g. gpiod_line_request() before we propagate it to
gpiod_line_request_bulk().

How about we define struct gpiod_line_bulk as:

struct gpiod_line_bulk {
    unsigned int num_lines;
    unsigned int max_num_lines;
    struct gpiod_line *lines[1];
};

And expose it in gpiod.h header?

That way we can still allocate it on the stack while using very little
memory - whenever packaging a single line - or we can allocate it
dynamically with the following interface:

struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
{
    struct gpiod_line_bulk *ret;

    if (max_lines < 1) {
        errno = EINVAL;
        return NULL;
    }

    ret = malloc(sizeof(struct gpiod_line_bulk) + (max_lines - 1) *
sizeof(struct gpiod_line *));
    if (!ret)
        return NULL;

    gpiod_line_bulk_init(max_lines);

    return ret;
}

Or we can even not expose it to users, make it completely opaque,
provide needed accessors and only allow internal users inside the
library to use the stack for single line bulks.

Bartosz
