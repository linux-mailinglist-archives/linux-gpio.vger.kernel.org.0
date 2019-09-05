Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 601B2A9DC3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 11:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731772AbfIEJGq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 05:06:46 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60156 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731737AbfIEJGq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 05:06:46 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 003B725B753;
        Thu,  5 Sep 2019 19:06:43 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 01767940AC6; Thu,  5 Sep 2019 11:06:41 +0200 (CEST)
Date:   Thu, 5 Sep 2019 11:06:41 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1
 bit31 when using SIM0_D"
Message-ID: <20190905090641.imlqqq2clct5tofm@verge.net.au>
References: <20190904121658.2617-1-geert+renesas@glider.be>
 <20190904121658.2617-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904121658.2617-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 04, 2019 at 02:16:58PM +0200, Geert Uytterhoeven wrote:
> This reverts commit e167d723e1a472d252e5c4baf823b77ce5543b05.
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of Aug
> 24, 2018, the SEL_SIMCARD_{0,1} definition was to be deleted.  However,
> this errata merely fixed an accidental double definition in the Hardware
> User's Manual Rev. 1.00.  The real definition is still present in later
> revisions of the manual (Rev. 1.50 and Rev. 2.00).
> 
> Hence revert the commit to recover the definition.
> 
> Based on a patch in the BSP by Takeshi Kihara
> <takeshi.kihara.df@renesas.com>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

