Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4C63899CD
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhESX2G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:28:06 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40188 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229952AbhESX2G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 19:28:06 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1ljVaM-0003Mc-Sg; Thu, 20 May 2021 01:26:42 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 7/7] gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
Date:   Thu, 20 May 2021 01:26:42 +0200
Message-ID: <1817539.g5d078U9FE@diego>
In-Reply-To: <20210510063734.506063-1-jay.xu@rock-chips.com>
References: <20210510063602.505829-1-jay.xu@rock-chips.com> <20210510063734.506063-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Montag, 10. Mai 2021, 08:37:34 CEST schrieb Jianqun Xu:
> There has spin lock for irq set type already, so drop irq_gc_lock and
> irq_gc_unlock.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

I've looked that up, and yes the irq_gc_lock stuff really seems to be
redundant when there is already another spinlock in place, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


