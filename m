Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9CC350D57
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 05:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhDAD5i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 23:57:38 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:46765 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhDAD5I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 23:57:08 -0400
Received: by mail-lf1-f43.google.com with SMTP id 12so718921lfq.13;
        Wed, 31 Mar 2021 20:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=MwONN4d6rrT80wZ3Iz7r/IZaJzF+PvdbGzECpd/Wl7I=;
        b=Dij3ivapn+8VnJmd5rjp/bPE5XYleHGYLAFeEg3rYfOAscgEY5P5bYuBmoq53nBwXi
         gh2cuplRkfgmNDLnLqGzUGR8IznlVLHiEtAZbkYUamtMzM2JyOtgMrTo4GvBLeosqOMx
         lRqwzUHD5aGhxr7Xa+SrQacUXmwh+X4ahiYUczXDbijP3im7PDOx0MKbQSN1leHwtoN+
         JhnuoKaOsFsQUFxfKkEzp0kFLr14C9ZT6qaBv65TjeQhcyRL77ikAqrHRVbsbGjsibim
         +OkmKK5sjlltzwewIX3BiO/Shm6bF5mO7rqB/ESl5ialTWDHtgoqeR/iyuvn6IEQJcSq
         1S5w==
X-Gm-Message-State: AOAM532G1lFUcxYtjPc9q4BJxyP4ovbs3CHqy8g+FUdRDLVpnoU96RvU
        cqhUGnLe2RaN9nFna4nUPDKxiBIgMn5+Kw==
X-Google-Smtp-Source: ABdhPJwF85vDNANqevWvVd2s+5bSTGz5C94VM1WKq4RE53hXjUCkOjG66ZPNtrJuSfJFfTBAPe/ryA==
X-Received: by 2002:a05:6512:348c:: with SMTP id v12mr3993548lfr.271.1617249427460;
        Wed, 31 Mar 2021 20:57:07 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id e11sm470945ljj.59.2021.03.31.20.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 20:57:06 -0700 (PDT)
Message-ID: <a91d2eba2a01a060fdf25a5665fee0f0f15b034c.camel@fi.rohmeurope.com>
Subject: Re: [PATCH 1/2] gpio: sysfs: Obey valid_mask
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <CAMpxmJXL=_8MBwb0Dy4d8vKM8SCbzyXJaE78azo1Es8hY7mN7w@mail.gmail.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
         <d1ec9f4cb6dd9afcfbeecfa717e863d75e18133b.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
         <CAMpxmJVKmBp06_2Hd4XF-eL4KfgZFy1o+xUvvs6H=TaAnkmYhA@mail.gmail.com>
         <CAHp75Vcsw8uQOL9RAxOU3jeq4mGAiK3cNMYbKyWGe7F8Dz2dZQ@mail.gmail.com>
         <CAMpxmJXL=_8MBwb0Dy4d8vKM8SCbzyXJaE78azo1Es8hY7mN7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 01 Apr 2021 06:56:56 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed, 2021-03-31 at 20:29 +0200, Bartosz Golaszewski wrote:
> On Wed, Mar 31, 2021 at 2:25 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Mar 31, 2021 at 10:58 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > On Mon, Mar 29, 2021 at 1:41 PM Matti Vaittinen
> > > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > > Do not allow exporting GPIOs which are set invalid
> > > > by the driver's valid mask.
> > > > 
> > > > Fixes: 726cb3ba49692bdae6caff457755e7cdb432efa4
> > 
> > I have just noticed that this is invalid format for the Fixes tag
> > (luckily, haha, due to a blank line it's not recognized as a tag!).
> > 
> > Matti, I highly recommend to add in your .gitconfig file an alias:
> >         one = show -s --pretty='format:%h (\"%s\")'
> > 
> > Bart, there are real Fixes tag issues from another series. I will
> > comment there as well to let an author know.
> > 
> > --
> 
> Eek, sorry I should have looked more carefully. I'll fix it in my
> tree.

Thanks for fixing this Bartosz.
Andy - well spotted. And the alias you pointed is something I've missed
:)

Sorry for the trouble! I should have used the correct tag format.

Thanks again!

Best Regards
	Matti Vaittinen


