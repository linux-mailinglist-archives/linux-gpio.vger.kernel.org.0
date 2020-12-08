Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0986F2D26DA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 10:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728652AbgLHJDn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 04:03:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:58040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728647AbgLHJDk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Dec 2020 04:03:40 -0500
Date:   Tue, 8 Dec 2020 10:04:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607418180;
        bh=3d/Fkn9H5Rqs73iZAbPEejt4Yj7ve3ULsCzHc7JQQWw=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=cuvRUmogdGcCJ/CivpcOegXqLAtH/YfWt6nOpXr7y71sYCPPeVKZ32UT8A+DSKiWW
         x/Wa8ormQofW9NwuO6CWi8Ipf0uJZuNtlCRiXX1u1YklBJMUgYgyzvQsQ1h26xkEMB
         VP9zMeEvTCkOrSYue775OsmlRmqiHdc06jyfHH+8=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH v2 2/2] pinctrl: ralink: add a pinctrl driver for the
 rt2880 family
Message-ID: <X89BiDacLNQ7ZQOH@kroah.com>
References: <20201208075523.7060-1-sergio.paracuellos@gmail.com>
 <20201208075523.7060-3-sergio.paracuellos@gmail.com>
 <CACRpkdY_Me8kO-Fa-vUspJNv+2vy0fswTM-RaUoaZJ5rCfuynA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY_Me8kO-Fa-vUspJNv+2vy0fswTM-RaUoaZJ5rCfuynA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 09:21:31AM +0100, Linus Walleij wrote:
> On Tue, Dec 8, 2020 at 8:55 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> 
> > These Socs have 1-3 banks of 8-32 gpios. Rather then setting the muxing of each
> > pin individually, these socs have mux groups that when set will effect 1-N pins.
> > Pin groups have a 2, 4 or 8 different muxes.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> 
> Greg I'm happy if you just apply this right now for v5.11, as Sergio
> is obviously on top of things and the DT bindings will get there
> eventually so I don't see any need to hold back the de-staging just
> waiting for patch 1 (which I will eventually apply directly anyway).

Now merged into my tree, thanks!

greg k-h
