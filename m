Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9044828CA2C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 10:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403833AbgJMIWd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 04:22:33 -0400
Received: from gloria.sntech.de ([185.11.138.130]:60068 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391409AbgJMIWd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Oct 2020 04:22:33 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kSFZj-0005Q6-Bl; Tue, 13 Oct 2020 10:22:27 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH v3 0/3] rockchip-pinctrl fixes
Date:   Tue, 13 Oct 2020 10:22:26 +0200
Message-ID: <34840448.7XeAIBGaoL@diego>
In-Reply-To: <20201013063731.3618-1-jay.xu@rock-chips.com>
References: <20201013063731.3618-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Am Dienstag, 13. Oktober 2020, 08:37:28 CEST schrieb Jianqun Xu:
> These patches are required by GKI.
> 
> Jianqun Xu (3):
>   pinctrl: rockchip: make driver be tristate module
>   pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
>   pinctrl: rockchip: create irq mapping in gpio_to_irq

looks good to go as fixes.

What happenend to the "populate platform device for rockchip gpio"
patch though - more out of cursiosity.

Heiko


