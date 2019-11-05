Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88424EF330
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 03:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729823AbfKECDu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 21:03:50 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38980 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729597AbfKECDu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 21:03:50 -0500
Received: by mail-pg1-f194.google.com with SMTP id 29so1558035pgm.6
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 18:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=P7HUvzjr7rLiIVLsln2wY88wldy+mMA3dyacJVEfn8c=;
        b=GQnAxsKmoYs+B8hkAyqxYX5ojKWGJ62QPsZFdID7uZKLD4pMrY/N3K1Uw3Ekg7nAZD
         QYol+zmLEe0tSWGz4f4Ff1r/KQY2tN5TMkBTpeL/C+eFJ+X0tEB3bKqdzeHzcumGPiDL
         toqYbcXesMd+0tx/f4HMCrK0LTvxM3+VC69mIYigwcLzZVy1+KkmC7kV6Q3IjVOxavxF
         W25wTEIonIhiU0wxslKUhmMWJfKcboGYRmVJjC9lgYetri4YjpnFQBi2dpeDpVGZk5az
         XshIr3tvMq1+VccdxahSSN2cz8gscRkx6SiDK3gM8J9aO7c3GIxz8qG7nc8nIOrrFCpe
         1DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=P7HUvzjr7rLiIVLsln2wY88wldy+mMA3dyacJVEfn8c=;
        b=qTAaBQ+3sTavobz0x6p4+D/L41E9uuDsB587f+A0UtAl1Gqz9/LRlx8KKSnmBJnFVv
         zxa4t991RFntaa9IJlIzET/MdmS4uPPNYpV1dvkzYbjIhG648LRcYxP48lqGQ/oHBFFm
         kCRpGPFyeMyAa6XT19ySSRZYliTOAk3MbkjVpiyDHysbZ9fQ96TbzuWEetrCNOqSAmha
         gKkKNW/tHA85uQwzqtxMLZD7sT+NU3sSoABglWUZHuEUMW9RJ7Wiva+4Asg+UJ6YDK2g
         AAuvA0/DZVGop5BDuEs7wlIlbYNII9/fX8SpcK8pQBynrkZKmq/fpzbFetB1/Q/ca9Ys
         ZVqw==
X-Gm-Message-State: APjAAAWqdEL7wIRYW6j5ar9W4lJ3EsxCFtuzERC1K0r1NJFXKCHWoI4T
        CUAylTfbbvtMyy/tLqyUePQFyx3t51okeg==
X-Google-Smtp-Source: APXvYqyrKxDb+G/RM+0ad/xjRRCeVsEdOeWPrE+YxqPz/SnPCJhtBYakEX3d3eL6UW2KtDotkZMYxw==
X-Received: by 2002:aa7:9f0e:: with SMTP id g14mr35785667pfr.202.1572919429529;
        Mon, 04 Nov 2019 18:03:49 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s13sm13712584pfe.94.2019.11.04.18.03.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 18:03:48 -0800 (PST)
Date:   Tue, 5 Nov 2019 10:03:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 4/7] gpiolib: add support for biasing output lines
Message-ID: <20191105020342.GA16739@sol>
References: <20191104153841.16911-1-warthog618@gmail.com>
 <20191104153841.16911-5-warthog618@gmail.com>
 <CAMpxmJUExXZ=ptMyRczvdujc7x9JP62Zy9m+WByYD4=w=1180w@mail.gmail.com>
 <20191104155927.GA17106@sol>
 <CAMpxmJUTFb_Bxsc8e006ohP6D3PP+kQgFYAPoZA2T1-HA41vSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUTFb_Bxsc8e006ohP6D3PP+kQgFYAPoZA2T1-HA41vSA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 05:19:14PM +0100, Bartosz Golaszewski wrote:
> pon., 4 lis 2019 o 16:59 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > > Ugh, I missed one thing here - my for-next branch doesn't contain the
> > > following commit e735244e2cf0 ("gpiolib: don't clear FLAG_IS_OUT when
> > > emulating open-drain/open-source") which happens to modify this
> > > function.
> > >
> > > If I provided you with a branch containing it - would it be a lot of
> > > effort on your part to rebase it on top of it? If so - I can do it
> > > myself.
> > >
> >
> > I can do a rebase - though not until tomorrow (it is getting late here).
> > I would like that commit in as well - I suspect it being missing is
> > the reason a couple of the gpiod tests I was working on are failing.
> > I was in the process of tracking that down when I switched back to this.
> >
> > Cheers,
> > Kent.
> >
> >
> 
> No problem, it can wait until tomorrow. Please use the following
> branch - gpio/for-kent - from my tree.
> 

That was a lot simpler than I expected - it rebased cleanly onto the 
new branch.  And fixed the gpiod test errors I was trying to track down.
Will submit v6 shortly.

Cheers,
Kent.
