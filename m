Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583C342CEEE
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 01:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhJMXI4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 19:08:56 -0400
Received: from gloria.sntech.de ([185.11.138.130]:49758 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhJMXI4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Oct 2021 19:08:56 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1manKe-0007mv-Gi; Thu, 14 Oct 2021 01:06:44 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Jonker <jbx6244@gmail.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: convert rockchip,pinctrl.txt to YAML
Date:   Thu, 14 Oct 2021 01:06:43 +0200
Message-ID: <27874771.ckeLuOHhQ7@diego>
In-Reply-To: <CACRpkdYArdPwEVf_5pwsROKPjbnVAtU3mf9v1z6WXGPoBb=SZg@mail.gmail.com>
References: <20211007144019.7461-1-jbx6244@gmail.com> <1633661172.660863.1409603.nullmailer@robh.at.kernel.org> <CACRpkdYArdPwEVf_5pwsROKPjbnVAtU3mf9v1z6WXGPoBb=SZg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Am Donnerstag, 14. Oktober 2021, 00:31:59 CEST schrieb Linus Walleij:
> On Fri, Oct 8, 2021 at 4:46 AM Rob Herring <robh@kernel.org> wrote:
> 
> > On Thu, 07 Oct 2021 16:40:17 +0200, Johan Jonker wrote:
> > > Convert rockchip,pinctrl.txt to YAML
> > >
> > > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > > ---
> > >
> > > Changed V3:
> (...)
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> 
> Rob can you tell me how you like me to handle this?
> Do we merge the nice new bindings and deal with the
> aftermath or do we need to fix the DTS files in the same
> patch series?

I guess personally I'd say it comes together in linux-next.

But if you like your pinctrl-tree without additional warnings dtbs_check
till the next -rc1, I'll add Acks to patches 1+2.


Heiko


