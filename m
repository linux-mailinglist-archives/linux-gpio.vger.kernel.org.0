Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16CBE376B6B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 May 2021 23:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhEGVHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 May 2021 17:07:41 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42608 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230093AbhEGVHk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 May 2021 17:07:40 -0400
Received: from p5b127e83.dip0.t-ipconnect.de ([91.18.126.131] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lf7gA-00054f-Rs; Fri, 07 May 2021 23:06:34 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Johan Jonker <jbx6244@gmail.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: convert rk3328-grf-gpio.txt to YAML
Date:   Fri, 07 May 2021 23:06:33 +0200
Message-ID: <3540274.MHq7AAxBmi@phil>
In-Reply-To: <20210507210239.GA2875797@robh.at.kernel.org>
References: <20210505134028.13431-1-jbx6244@gmail.com> <4104568.ejJDZkT8p0@phil> <20210507210239.GA2875797@robh.at.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Freitag, 7. Mai 2021, 23:02:39 CEST schrieb Rob Herring:
> On Fri, May 07, 2021 at 10:59:09PM +0200, Heiko Stuebner wrote:
> > Hi Bartosz,
> > 
> > Am Mittwoch, 5. Mai 2021, 15:40:25 CEST schrieb Johan Jonker:
> > > Current dts files with RK3328 GRF 'gpio' nodes are manually verified.
> > > In order to automate this process rk3328-grf-gpio.txt has to be
> > > converted to YAML.
> > > 
> > > Rename 'grf-gpio' nodename to 'gpio'.
> > > 
> > > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > 
> > just to not step on any toes, do you plan to apply this patch1 later on?
> > Patches 2-4 are in my domain so I'll get them after -rc1, but in theory
> > the gpio binding should go through the gpio tree.
> 
> Different trees will break the schema checks because the grf schema 
> refers to the gpio schema.

Ah, thanks for the heads up.
I guess we need to agree on one then.

Bartosz, gpio tree or the rockchip tree for patches 1+2? ;-)


Heiko


