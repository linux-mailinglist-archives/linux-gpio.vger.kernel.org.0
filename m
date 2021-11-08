Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677C3447C32
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 09:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237552AbhKHIsi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 03:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbhKHIsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 03:48:37 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A241C061714
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 00:45:53 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id b15so40038588edd.7
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 00:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3m86pyGVPBMP52r/Y1c8ER09SIwIEolGjkxNb4+jiGY=;
        b=GsqSgfk0lXteviyGL++Knn3DNY1lpJtgK3aYO12Iat+3kt9yJkLYY+GV5jGZ7vvAHA
         pVWH31YzPrsx/p2NBjfQaFeJT/rjoc9s2RNXd2JOKHrrtohgXDiuoXbXLeQuDPSK+8wq
         eow2638WDdilYvP/qeiL2b//FkBLoKDty85KcRU7XN8VgPuzTv8qbcci98H4PrxjytVT
         g7Tc5gASdWxHoRBkmb0Dg/kmPiCpsBE9+M7buA/gQ3QAum4IJFDg07Xwlsj23p+yrqfS
         s4E/FfrBo1nfds8kWL0ZtJAsghcp0qz2EomsIkavDKTmjD+yVBY+9JJ4h68ZX37jkU3S
         ztWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3m86pyGVPBMP52r/Y1c8ER09SIwIEolGjkxNb4+jiGY=;
        b=IepdeLhRl2cXhmrAqTDtPqHcSKUdBheVe9guE/ULSo//vHrPBcw1xeFiHI143pp0A4
         o41NGU46kqZsihpd/UFwzVqtBXMU8tmrAhwb9zR3edj65Ql693ARC1pnwKczC/U3Ds2R
         E61F2KxLKWD/0xD8Xa5q2hfIRNV6xKUBY74QNqWAwCDls/biR9g4n1yUEdexgRkYzrrg
         F937EzAOGeQjGlCDjSD6o7noyQcaeMHHHfVYx2mvdiyE74lyZ41VSuPzhn0EtDqPM/ho
         IaW6K2AJd/6a22dFtvZss5pDHvoPMeMqIt+OKmQKj+iozZmV9BV0YQMSiE9fiAp5eosn
         8utA==
X-Gm-Message-State: AOAM533MFUi0TKh3lt4zUVV6RcPJS3C6CzMkxvEDv5TQEY75gz8ikZFX
        wg46fhpoDn0EsB1a6wNhTD/I/qdkzZ3UbFMMPA3rvA==
X-Google-Smtp-Source: ABdhPJzGYmqcG4Jo+lMnGLPbIUi8IrUcPZ4KE4/tVBteeAXmoLZ0TwMtHUoVhpGNFuaGav4DS9nIxBbP8nARxP5SvpY=
X-Received: by 2002:a17:907:1deb:: with SMTP id og43mr37014080ejc.189.1636361151952;
 Mon, 08 Nov 2021 00:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20211104190030.20660-1-brgl@bgdev.pl> <CACRpkdZchV1M+BYhMYoXNj_+uUHZeydW5-nHGTjD2bZedAqKKw@mail.gmail.com>
 <YYfIS/sK+OAF8xsA@kroah.com> <20211108074414.GA24829@lst.de>
In-Reply-To: <20211108074414.GA24829@lst.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 8 Nov 2021 09:45:41 +0100
Message-ID: <CAMRc=MfPANj7jwFd9WeqNTJkxxn4+oiO7yiDTP4b3q83=yWOQw@mail.gmail.com>
Subject: Re: [GIT PULL] configfs-based GPIO simulator for v5.16
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Becker <jlbec@evilplan.org>,
        Kent Gibson <warthog618@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 8, 2021 at 8:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sun, Nov 07, 2021 at 01:36:27PM +0100, Greg KH wrote:
> > configfs has two current maintainers, I don't think we need another one,
> > but they should have at least responded to the patch series previously
>
> I've clearly stated that I'm not going to take these "interesting" new
> atomic semantics without an ACK from Al.  And to be honest even with that
> feature creep isn't exactly on my wish list.

I've just went through my inbox to make sure I didn't miss anything
but, barring some undelivered email, the only thing you ever stated
wrt this series (other than your general dislike of the BIT() macro)
is this: https://lkml.org/lkml/2021/1/27/202 four versions ago.

It's Linus Torvalds who stated he'll need an Ack from Al and I have
Cc'ed him on multiple iterations over the course of several weeks
after that. I assume he's got more important things on his plate but
there's not much more I can do...

Feature creep is an exaggeration IMO for something that the very
maintainer of configfs (Joel Becker) defined in detail in the
documentation a long time ago. Most likely the need for committable
items was clear from the start but as there were no users, no
implementation ever followed. Now we've presented a very clear
use-case hence the proposed implementation of the concept designed by
Joel.

Bart
