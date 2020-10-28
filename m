Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2211529E1EB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 03:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgJ1Vst (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 17:48:49 -0400
Received: from smtp1.axis.com ([195.60.68.17]:30468 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbgJ1VnJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Oct 2020 17:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=804; q=dns/txt; s=axis-central1;
  t=1603921389; x=1635457389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F6MN/uO+nZhEZn8UKCMHeVR40PzJ1awCMAr6r4wsYSE=;
  b=jHDZVUhYBY1WZi+ToWNvNvuVPcC5sSsnX9AC0BHRUFDBmIf/k+xfBfUa
   FeKgzIAVBq3a6SJg4hE6gZodq1pplIcg3AcNAxfrPbTuniwrkg1EpPYad
   rYfhuBG3R9HbDLTwpC1ovXelwUT7cL5JDjyZbHeeKK6o/I7F3hgELvAa8
   JwHUsaFq6/+Ug59qZ/hIcDQQToZhJt9RTfd+ZBXHG7O1DtTkQNZ1mDYSr
   R6rhah4ysZhngR6seXwJtyUPEKOINpf6ZF1Aa9HpPuMoPP+3bBBaCvlnu
   rXs2fRi8nEGP6eQOl6DS38M/gPs57WtngAxo+okhc4gtevuhWez6Xp90D
   Q==;
IronPort-SDR: cYtzYpRE4ffcb8Wv/hAAgDHdfIenCZI/Rd99GRpa7fEt9SNBvtZPn9EomrIMLP4lvDRqtzdO48
 2nonh0SaAEbwLXwSEQBCx4syTGSm/Mj3LpubeBUdx6VUErzEWa9SBZKjmNH6ftp8e2B/t0nd5Y
 h3Z+46dA8QG3Pt/NJKZunMrXX5lXbof3nCZCwKAiKF7Tw0dXJZYFVCwj/t8kBpPX3diwzo3RmA
 +Y4e+jSUzH8253YR6UnCOFr4cSpdJlYXye6ZRnG2LxgmYmorXKJsfA3RsXAPo1FigdyG2a1mmC
 Hto=
X-IronPort-AV: E=Sophos;i="5.77,426,1596492000"; 
   d="scan'208";a="14502943"
Date:   Wed, 28 Oct 2020 12:52:03 +0100
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel <kernel@axis.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>
Subject: Re: [PATCH v2] gpio: mockup: Allow probing from device tree
Message-ID: <20201028115203.qy7nu6bn7dy77vzm@axis.com>
References: <20201027135325.22235-1-vincent.whitchurch@axis.com>
 <CAHp75Vcy-m6tT3ChPYQ8vvsAOwV4CUM3feewb5bpk8h7mqa+AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Vcy-m6tT3ChPYQ8vvsAOwV4CUM3feewb5bpk8h7mqa+AA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 12:43:22PM +0100, Andy Shevchenko wrote:
> On Wed, Oct 28, 2020 at 10:00 AM Vincent Whitchurch
> <vincent.whitchurch@axis.com> wrote:
> > Allow the mockup driver to be probed via the device tree without any
> > module parameters, allowing it to be used to configure and test higher
> > level drivers like the leds-gpio driver and corresponding userspace
> > before actual hardware is available.
> 
> You have to officially announce a DT binding for that.

Rob Herring has earlier said that was not required for this driver.  As
I mentioned a little further down in the email you are replying to:

| Drop DT binding document, since Rob Herring was OK with not documenting
| this:
| https://lore.kernel.org/linux-devicetree/5baa1ae6.1c69fb81.847f2.3ab1@mx.google.com/
