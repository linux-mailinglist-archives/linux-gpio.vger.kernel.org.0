Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6175D376B5E
	for <lists+linux-gpio@lfdr.de>; Fri,  7 May 2021 22:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbhEGVAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 May 2021 17:00:21 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42510 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230216AbhEGVAV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 May 2021 17:00:21 -0400
Received: from p5b127e83.dip0.t-ipconnect.de ([91.18.126.131] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lf7Z1-000525-5N; Fri, 07 May 2021 22:59:11 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: convert rk3328-grf-gpio.txt to YAML
Date:   Fri, 07 May 2021 22:59:09 +0200
Message-ID: <4104568.ejJDZkT8p0@phil>
In-Reply-To: <20210505134028.13431-2-jbx6244@gmail.com>
References: <20210505134028.13431-1-jbx6244@gmail.com> <20210505134028.13431-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

Am Mittwoch, 5. Mai 2021, 15:40:25 CEST schrieb Johan Jonker:
> Current dts files with RK3328 GRF 'gpio' nodes are manually verified.
> In order to automate this process rk3328-grf-gpio.txt has to be
> converted to YAML.
> 
> Rename 'grf-gpio' nodename to 'gpio'.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

just to not step on any toes, do you plan to apply this patch1 later on?
Patches 2-4 are in my domain so I'll get them after -rc1, but in theory
the gpio binding should go through the gpio tree.

Heiko


