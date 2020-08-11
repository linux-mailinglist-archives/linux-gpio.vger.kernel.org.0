Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C802241FA5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Aug 2020 20:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgHKSYk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Aug 2020 14:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgHKSYj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2020 14:24:39 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D50C06174A
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 11:24:39 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BR1Sz6mSqzKmtX;
        Tue, 11 Aug 2020 20:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:content-transfer-encoding:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received; s=mail20150812; t=1597170270; bh=hhuuKF2SiU
        qNsn78Dky+M+yK0G9fuqNyLwVzsXAtmoY=; b=N1YT1d5vFBGqfHt6yuoRGAhcJf
        hFzAphnoxWVgVeSpVvPupbGEz7BNm4asXUrwmdQPrf1w2cI3SZd2KdOOb8sIe1kD
        nxN4isRtX2t+A9Tup/olqO2xb7h8gQRzGqQcU+zleLWVTsHBm5goM4nqvlF4ru+c
        5rhSvQypYQbMquNtHrlF4CJVUPnm8NKhMi+Sz/9FqkMuw42QsthJd0ujwtoE5Sl/
        hzs4XPOvs83Kmsbpij3qG/Ad9xxEw8knVHPetxUNdyROGA6IBtJjAryl4dIQ0Z2Q
        5wTRKJ6rvNyMMbk5n5ED2zsXshFkM5rsWngIIPCO8cYLQXDnSH63LsJQNLxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1597170274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3NLXcF150qzgKWT9ymc6w+EwvT8AwkVUJzwxnSjmOYk=;
        b=R5uDHJl2n9xwrFAGu0Nwl8fdmmc97hvs1VRnnNKH/EExec+9bQyk0AtxqzoiUPBuZ7zYBC
        6TQCU8R6DXCARffvYx0FoKurpJf2ypIzPoeloTr1afkOT8uj0k5PboZalrhcNZ2xNYCb+z
        Kdq7PKdRnjhL/HUlfGI5Huj6p2QSpnW2nsJS2EAzQovwmc7Nk+DsI8vXQTRx66LwAHiqXm
        KrBudNE03V4zBDyIYMcmpWSV/wyCRywDEAly4tzi/wPOzkuR1vHSiExwJJuo1ohMt75WV7
        pK3nbREE4zTQJHGqoRN2nb2w6o5OgBhAXMeas8EANYLVExIs1nNPWsJ7ieLAyg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id VqWijXD3eG8i; Tue, 11 Aug 2020 20:24:30 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 0/5] Documentation improvements
Date:   Tue, 11 Aug 2020 20:24:29 +0200
Message-ID: <2066152.rvAzjVaaYW@kongar>
In-Reply-To: <20200811013950.GA25507@sol>
References: <20200808095944.188479-1-alexander.stein@mailbox.org> <CAMRc=MeVKBHgU6u5gVjzaysQuwrudo3Zun+AHDb74pGXzkB4dg@mail.gmail.com> <20200811013950.GA25507@sol>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.82 / 15.00 / 15.00
X-Rspamd-Queue-Id: EFEB1180E
X-Rspamd-UID: bc1f5d
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Dienstag, 11. August 2020, 03:39:50 CEST schrieb Kent Gibson:
> On Mon, Aug 10, 2020 at 06:49:21PM +0200, Bartosz Golaszewski wrote:
> > On Sat, Aug 8, 2020 at 12:06 PM Alexander Stein
> > <alexander.stein@mailbox.org> wrote:
> > >
> > > Hey,
> > > this changeset improves the document generation by reducing warnings
> > > as well as supporting building doc out of tree now.
> > >
> > > Alexander Stein (5):
> > >   doc: Fix doxygen warnings
> > >   doc: Use autotoolized Doxyfile
> > >   doc: Fix doxygen warning
> > >   doc: Remove obsolete PERL_PATH
> > >   doc: Add @file to headers
> > >
> > >  .gitignore              |  1 +
> > >  Doxyfile => Doxyfile.in |  8 ++++----
> > >  Makefile.am             |  4 +---
> > >  bindings/cxx/gpiod.hpp  |  6 +++++-
> > >  configure.ac            |  1 +
> > >  include/gpiod.h         | 30 +++++++++++++++++-------------
> > >  6 files changed, 29 insertions(+), 21 deletions(-)
> > >  rename Doxyfile => Doxyfile.in (93%)
> > >
> > > --
> > > 2.28.0
> > >
> > 
> > Thanks for sending those! I guess I don't see any of the warnings you
> > mention because doxygen on my laptop is too old (1.8.13)?
> > 
> 
> For reference, I get some of the warnings addressed with doxygen 1.8.17
> in my setup.
> I don't get the a4wide (patch 3) so that might be new in 1.8.18, or
> otherwise dependent on setup??
> 
> Either way, it would be useful for the patch to mention what version
> of doxygen is being targetted so everyone is on the same page.

Yes, I'm on 1.8.18, current release for archlinux. You are right, I should
have mentioned it in the patch though, sorry aobut that.

Best regards,
Alexander



