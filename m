Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B435634343C
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Mar 2021 20:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhCUS7z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sun, 21 Mar 2021 14:59:55 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43170 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230192AbhCUS7h (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Mar 2021 14:59:37 -0400
Received: from p508fc3a3.dip0.t-ipconnect.de ([80.143.195.163] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lO3IR-0006zk-Tf; Sun, 21 Mar 2021 19:59:31 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] pinctrl: PINCTRL_ROCKCHIP should depend on ARCH_ROCKCHIP
Date:   Sun, 21 Mar 2021 19:59:31 +0100
Message-ID: <9858038.nUPlyArG6x@phil>
In-Reply-To: <20210316134059.2377081-1-geert+renesas@glider.be>
References: <20210316134059.2377081-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Dienstag, 16. März 2021, 14:40:59 CET schrieb Geert Uytterhoeven:
> The Rockchip GPIO and pin control modules are only present on Rockchip
> SoCs.  Hence add a dependency on ARCH_ROCKCHIP, to prevent asking the
> user about this driver when configuring a kernel without Rockchip
> platform support.
> 
> Note that before, the PINCTRL_ROCKCHIP symbol was not visible, and
> automatically selected when needed.  By making it tristate and
> user-selectable, it became visible for everyone.
> 
> Fixes: be786ac5a6c4bf4e ("pinctrl: rockchip: make driver be tristate module")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



