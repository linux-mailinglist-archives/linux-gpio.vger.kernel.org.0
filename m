Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16C79DE4A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 10:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfD2ItZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 04:49:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34810 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbfD2ItZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 04:49:25 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 640B025B263;
        Mon, 29 Apr 2019 18:49:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6F6F3940376; Mon, 29 Apr 2019 10:49:21 +0200 (CEST)
Date:   Mon, 29 Apr 2019 10:49:21 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/4] pinctrl: sh-pfc: Correct printk level of group
 referral warning
Message-ID: <20190429084921.nywiq6w3qcad3w4s@verge.net.au>
References: <20190425095542.726-1-geert+renesas@glider.be>
 <20190425095542.726-2-geert+renesas@glider.be>
 <20190426092139.5mwjtmm5fnpek6bb@verge.net.au>
 <CAMuHMdXMeaO8uTT1thMGp+rfk=pcy-ejEU1EPNc_z+0Gw1GF5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXMeaO8uTT1thMGp+rfk=pcy-ejEU1EPNc_z+0Gw1GF5w@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 29, 2019 at 10:38:52AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Apr 26, 2019 at 11:21 AM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Apr 25, 2019 at 11:55:39AM +0200, Geert Uytterhoeven wrote:

...

> Thanks!
> 
> Is the atypical email address for sh-pfc reviews intentional?

Sorry about that, I meant this:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> > But I do wonder if "referred" should be "referenced"
> 
> Yes, sounds better.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
