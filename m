Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB1E2A7A99
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKEJbp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:31:45 -0500
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:46209 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726737AbgKEJbp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 04:31:45 -0500
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 0A59V7WU021287;
        Thu, 5 Nov 2020 10:31:07 +0100
Date:   Thu, 5 Nov 2020 10:31:07 +0100
From:   Willy Tarreau <w@1wt.eu>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/5] gpio: msc313: MStar MSC313 GPIO driver
Message-ID: <20201105093107.GB21245@1wt.eu>
References: <20201011024831.3868571-1-daniel@0x0f.com>
 <20201011024831.3868571-4-daniel@0x0f.com>
 <CACRpkdYmdZ81q_tsXRQ56aFjGsvV3AwJ8_hiu31mD14DGiK84A@mail.gmail.com>
 <CAFr9PXnX7QyM0VUmosFYueSe4ewA7uT2VZMfxFPaFt6-jUhoSw@mail.gmail.com>
 <CACRpkdbx+T3uX9taZNjsURHGc6qVLvGGC2boEC4=NaOi4_uZTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbx+T3uX9taZNjsURHGc6qVLvGGC2boEC4=NaOi4_uZTQ@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 10:21:27AM +0100, Linus Walleij wrote:
> If your SoC is only used by OpenWrt (like ixp4xx) then it is fine
> to just use bool because that distribution is always built with an
> image for a specific hardware, whereas distributions are generic.

Speaking for myself (since I have a few now), I'm not running OpenWRT
on mine but my own distro, and I guess most users will run either
Buildroot or their own distro. It's unlikely that we'll see very
generic distros there given the limited storage you'd typically have
in an SPI NOR (16-32 MB) and the small RAM (64MB) which tends to
discourage anyone from booting a regular distro over other storage
anyway.

Thus my guess is that most users will keep building their own kernels.

But this just emphasizes your points :-)

Just my two cents,
Willy
