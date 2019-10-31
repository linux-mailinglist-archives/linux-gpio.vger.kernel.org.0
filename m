Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5FFEAAAC
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 07:41:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfJaGl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 02:41:28 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44375 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfJaGl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 02:41:27 -0400
Received: by mail-oi1-f193.google.com with SMTP id s71so4219324oih.11
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 23:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M5aqfRUwMC8kkZNS08EKrqYaYUA7QXeP5u3u8FUlnsQ=;
        b=TpBIzfwnhWtYz1ac0q/WtKeIOkg2bl0BExkdEvRboPM5W/ia7X63B/GeJPDjxwBAss
         Vqv766ulgHm726Z5m+6TO78QFbj8V+z+59zcdUMmJZQs7li/AzHyfP3rdsXFyyJRNMsY
         /h6ksG0cwjsN7tnrHVbLhufnD8yZ3uHfNq/pf1w8h/9Ro2i/Ng/7UF2hglXJ0MCfMf/4
         O42JQN5VWgjTmE8LZeDtr2NFsuyA0ZNSry0g168qoLTHHjcFqbOAi8xxjbp2vWtlUhL4
         D6fuVBKCfsscc0QXJ/5ao4RDNRDgWa+gSAe4yKrm+qbi9KVdQzvBTqNBGeAxQwGbjLru
         elQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M5aqfRUwMC8kkZNS08EKrqYaYUA7QXeP5u3u8FUlnsQ=;
        b=Qn3K1/GJrlw4l6r1WcXIAS42nQNi1pc0ZY5jVTC85yVI+AOKwKDGBN4CX6zg2NZhMn
         km3tMtgSgKeM2h9fcstSqcZIVIMBCH6Te7VRuXSnESRtQ17JJIvGlKkzvn2k7iRx+N4v
         z6id69gGnA9j+LWP/zO46WXkOtbaD4+GJ9uCcCr8HO0AxoNl0CBYLiBdkzQnYtzlTvpN
         04uoLaVluPCxtrzQ6SGI682sXinyGHHrSgrnWlaIClaXt2bRi1gmsG13Ahemw8My3IJc
         3XIoENdD7gQO7KNJMP/vIeLN7j1omhqZdhAVjlNiuOmGv75knA46Rjk98k7PpZOmlNoh
         NX+A==
X-Gm-Message-State: APjAAAXR67nqllQhaL2M4phJykWjrfpZfmisHd41DgMxtnrXo0cohSWo
        hLov+3IRYserMbT0DaLm9pz5GjlBX8qK9sH0vSY4IA==
X-Google-Smtp-Source: APXvYqziUkmRJkxhjBwfWg3KbrZSONgKs5i7yaP6xmaWXghCp4DmWaGD9OFRC20Q30jMl6QH5W9EwTOpi6/pu3qeyB8=
X-Received: by 2002:aca:cc11:: with SMTP id c17mr2768954oig.147.1572504086843;
 Wed, 30 Oct 2019 23:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191006053916.8849-1-brgl@bgdev.pl> <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
 <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com>
 <CAMRc=Me8g2gFiag0UQwuu4UZONcowQw900+MUbGF+4-E0z09Zg@mail.gmail.com>
 <CAK8P3a2mh+Eh+W1GFL2Mi5R3t55SRwWyXW_iBxXB-nBhdCO8LA@mail.gmail.com> <20191030213555.GA25515@infradead.org>
In-Reply-To: <20191030213555.GA25515@infradead.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 31 Oct 2019 07:41:16 +0100
Message-ID: <CAMpxmJXOANjxZgTcReRmd6TGaUKNi=8Cxwj4K69aRY=bF3jDiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Christoph Hellwig <hch@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 30 pa=C5=BA 2019 o 22:35 Christoph Hellwig <hch@infradead.org> na=
pisa=C5=82(a):
>
> On Mon, Oct 21, 2019 at 09:29:30PM +0200, Arnd Bergmann wrote:
> > > Is Christoph's work in next? The series doesn't apply cleanly on next=
,
> > > I needed to fix a couple conflicts. What branch should I rebase it on
> > > before resending?
> >
> > Not sure, maybe Christoph can comment.
> >
> > Your patches would best go through the char-misc tree and be based
> > on top of that, for Christoph's I think the idea is to have some go
> > through the architecture maintainer trees, and have whatever is
> > left go through my asm-generic tree.
>
> Actually I thought of just doing an ioremap tree for this merge window.
>
> What kind of changes does Bartosz have?  I'm kinda missing the context
> here.

Just the series you've responded to here, but I don't think it should
conflict with your changes (not very much anyway).

Greg: can this be picked up into char-misc?

Bart
