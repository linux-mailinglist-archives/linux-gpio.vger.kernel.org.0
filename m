Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52131A7644
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 10:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436826AbgDNIiJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 04:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2436953AbgDNIiJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 04:38:09 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA3BC0A3BE2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 01:38:07 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id o11so11197698ilq.7
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jo/o9ww/4cJSnmnkD3CjyH8WMNoX0+k4o9KsdfhD1SU=;
        b=y8PtE+gTsDZZwWFwSeHHeCFQ33Ojb2y6ulbiOVndaSWifuuU1qY5CJhInz8wkvASVH
         yVPA5Cg4kidytaGezrBCLdW4Ot8vgNCUOjK1xXp0gMXNgy8sAT71WrdTTw6cF9Lg/9aR
         0j5+CLbOZOKInlCz7qORieFxv7d/WB/5Ft+UWYOoOcqt45CjWh0vGWn+jiDIsbJub6Zx
         6RTgxEu9otv8/DDGf2UCmwNYUDW1jtxjvh3oN5hh+yh8eGHq0OO3mKBpvqGx7mJBFtFt
         FPlMkosertwNnlsQqcXiYpSZpteWM6yEM5v1cMAMZi4xQ9cYoOikip2laVHl5Mv5niBy
         b5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jo/o9ww/4cJSnmnkD3CjyH8WMNoX0+k4o9KsdfhD1SU=;
        b=t7f2QKK9HTPlTEc5Ah2sJ9MeqzRg22YT27vGPq2bYaSRusTB16uyPD0vdt8KOob4Nj
         /tc59h8XbOE56+sr+G/M9wLuAPod6hM9M/JLT04vSK+Z88HCjKdY5/TrjbyiNchB8bJC
         njAmoOLTMT6W0OnRyOLHq9U8mMgLl+SFwhBIFm2WH4HugjF0WI09FjQZ31nGB/AKJzoO
         1kBDYs6aORBIhgiKOhUtNt/4kUx/y3cm/YRPxhe+3jrAm2snzsHEKWYvi1oh0pOGolGV
         RCoRqHD2ai6hbHDw/yUBF2wxijuBPOz68Y85YOzGmn6sFZ+RWiKV74AYsUz4LNKNailY
         PZ+Q==
X-Gm-Message-State: AGi0PuYkHA9j0tuXmWPjzCQQqC2aHwLuvlb/km5e2cwh7ZjRR7PCxWdx
        CIG96NIyYN1tOKsekNjKuNFin3QC6d5r8BvhZbtWXQ==
X-Google-Smtp-Source: APiQypJLEx+4wdr30LFxsnO4FePdVk1/hUYO2QfJBCM4GEMyVVTdfS1Zgqb6bqkEsd+A63s85UfcT0IaUyDRqecuwjY=
X-Received: by 2002:a92:dac8:: with SMTP id o8mr12258552ilq.189.1586853487047;
 Tue, 14 Apr 2020 01:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200211131240.15853-1-brgl@bgdev.pl> <CAMRc=Mc=gTrpQsMdOTBJaYT6JLg=o17Mm78ijAGUJYE2pXcCQQ@mail.gmail.com>
 <20200413180728.0714da3d@archlinux>
In-Reply-To: <20200413180728.0714da3d@archlinux>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 14 Apr 2020 10:37:55 +0200
Message-ID: <CAMRc=MenWERT6VegvdRkwJ5xKwa01QRK+BbE2GhEk-+Jw36GvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] irq/irq_sim: try to improve the API
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-iio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 13 kwi 2020 o 19:07 Jonathan Cameron <jic23@kernel.org> napisa=C5=82(=
a):
>
> > Hi,
> >
> > it's been three weeks, so gentle ping on that.
> >
> > Or should I resend the entire series with a more elaborate commit
> > message for patch 1/6?
>
> I'd resend it now if nothing has happened that I missed.  Merge window
> having just closed, it's the perfect time for a rebase on rc1.
>

Yeah, I'll resend the first two patches which are less controversial
and then see with the rest of them.

Bart
