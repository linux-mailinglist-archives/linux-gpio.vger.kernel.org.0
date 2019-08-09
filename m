Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F46E882F9
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 20:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406503AbfHISwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 14:52:33 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfHISwd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 14:52:33 -0400
Received: from penelope.horms.nl (unknown [66.60.152.14])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 425AB25AD78;
        Sat, 10 Aug 2019 04:52:31 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 361DBE21A9A; Fri,  9 Aug 2019 20:52:30 +0200 (CEST)
Date:   Fri, 9 Aug 2019 11:52:30 -0700
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linus.walleij@linaro.org, geert+renesas@glider.be,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: sh-pfc: remove incomplete flag
 "cfg->type"
Message-ID: <20190809185229.mcxph7qkb4xhuuu3@verge.net.au>
References: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1565245143-15018-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565245143-15018-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 08, 2019 at 03:19:02PM +0900, Yoshihiro Shimoda wrote:
> The old commit c58d9c1b26e3 ("sh-pfc: Implement generic pinconf
> support") broke the cfg->type flag to PINMUX_TYPE_FUNCTION because
> sh_pfc_pinconf_set() didn't call sh_pfc_reconfig_pin().
> Now if we fix the cfg->type condition, it gets worse because:
>  - Some drivers might be deferred so that .set_mux() will be called
>    multiple times.
>  - In such the case, the sh-pfc driver returns -EBUSY even if
>    the group is the same, and then that driver fails to probe.
> 
> Since the pinctrl subsystem already has such conditions according
> to @set_mux and @gpio_request_enable, this patch just remove
> the incomplete flag from sh-pfc/pinctrl.c.
> 
> Fixes: c58d9c1b26e3 ("sh-pfc: Implement generic pinconf support")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

