Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BD130F006
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 10:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbhBDJ5O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 04:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbhBDJ5N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 04:57:13 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC24AC061573
        for <linux-gpio@vger.kernel.org>; Thu,  4 Feb 2021 01:56:32 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id u15so1497362plf.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Feb 2021 01:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2BGPSwpHBtN+xXl3tePobfmoN1cFcF9CM3nyha6SkAc=;
        b=kt6SquFv0id7fm2gKtLMJbgiWsSQUUfj4OduZen4nqPf8gvB6N970VxVq2QSW1VJQA
         oN9FgejYWNX5fhuuak4oEDgQIV+bATExvMgz8skKLQyOC0T8hM1mdwaZOcfMmYvSElDq
         ANkMswegHcPGcBhlI1FMnU1yxvFNR5qPmT15RTB/haSzCnvl5Hr2vqOmjH7PaS+D2Ba+
         BAZRQ3BpPNX3s+z1OOWtV2diKg0KloI57f9i0hB0kVdQBDa3ckkGb5R2J3EFcxeXKZhh
         8bAy/SGYA08P3esDs/DTAJBDhQv2Yd9ednzYX4QyYww2uJ9akGb2qp7nht1Zrn18I95H
         /HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2BGPSwpHBtN+xXl3tePobfmoN1cFcF9CM3nyha6SkAc=;
        b=rOLWiKukPlYewHa8dxOMti2/+ImN9GNiiFEpw6aVPFXIzjz7KYSy5JwakHBH+bwMyU
         L0MHmYNHXWo6bCNeQZM8kZYu2GbQP2p75wRuxkbNplW4nrnCrJcg2aBf7veZiRId5g3K
         hTIIFgyjUWiBoJd2gf5Gsa7X/OxVHFNn6jYhrm1dXLtlgwyk1tA1Yz6j6nfSA8SGtcG4
         pholcPxHUaIIT1tOmidGtPFNzFDdiAvrvIwz845ithFK1zbT1un/P87uazytoG/16Qaa
         hTIlC6HGZJ40w85Ci3we7W2/b1gv4cex3W4NGaiITt6rysynlj0LajzyFHhv3l05gtEt
         vhbQ==
X-Gm-Message-State: AOAM531M1BPCDlB16/D61y+KPFw0HwwFSBckea1j0C/MKj83wZdnA5AE
        BtYTwBpSCj/pCP0reeJdsag=
X-Google-Smtp-Source: ABdhPJz2szQxZ8E5oEfnVfg1+8cnIu5u323tB3xlcou4k0KQiPmVJnzt28C21VDXf0tPhxsPU3mHew==
X-Received: by 2002:a17:90a:7bc2:: with SMTP id d2mr8156186pjl.68.1612432592188;
        Thu, 04 Feb 2021 01:56:32 -0800 (PST)
Received: from sol (106-69-169-43.dyn.iinet.net.au. [106.69.169.43])
        by smtp.gmail.com with ESMTPSA id o4sm4630943pjs.57.2021.02.04.01.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 01:56:31 -0800 (PST)
Date:   Thu, 4 Feb 2021 17:56:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] COPYING: organize the licenses in a separate
 LICENSES directory
Message-ID: <20210204095626.GA38203@sol>
References: <20210203122325.19427-1-brgl@bgdev.pl>
 <20210204011923.GA9515@sol>
 <CAMpxmJX99n4JtUyNVqkAa1kCuSBX3dtee-5CXSe3z4Bf+SnOHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJX99n4JtUyNVqkAa1kCuSBX3dtee-5CXSe3z4Bf+SnOHQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 04, 2021 at 10:43:49AM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 4, 2021 at 2:19 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Feb 03, 2021 at 01:23:25PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Add the LICENSES directory as suggested by Greg KH. It will contain the
> > > license files relevant to this project that is: LGPL-2.1 for the library
> > > and GPL-2.0 & the Linux-syscall-note for the Linux Kernel uAPI header.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > I see you are following the kernel licencing rules wrt license file
> > naming and formatting.
> > Have you considered following the REUSE spec, as Greg also suggested,
> > instead?
> >
> > Cheers,
> > Kent.
> >
> 
> The library is tightly coupled with the kernel so I thought it's best
> to follow the same scheme. Every file also has an SPDX identifier so
> together this looks clean to me.
> 

Sure, but if following the REUSE spec would make life easier for projects
built on top of libgpiod then I'm all for it.

The existing SPDX headers are REUSE compliant so you are actually quite
close to REUSE compliance already, but ironically the license files
themselves, both before and after your changes, aren't.

Cheers,
Kent.

