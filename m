Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94E61B5C1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 14:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbfEMMWL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 08:22:11 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58010 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728833AbfEMMWK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 08:22:10 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 35AFD25AD63;
        Mon, 13 May 2019 22:22:09 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 29B6DE22B88; Mon, 13 May 2019 14:22:07 +0200 (CEST)
Date:   Mon, 13 May 2019 14:22:07 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7778: Use common
 PORT_GP_CFG_27() macro
Message-ID: <20190513122206.plxlc3nygipmvn5i@verge.net.au>
References: <20190510121023.6397-1-geert+renesas@glider.be>
 <20190510121023.6397-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510121023.6397-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 02:10:23PM +0200, Geert Uytterhoeven wrote:
> Get rid of the custom PORT_GP_PUP_27() macro by using the common
> PORT_GP_CFG_27() macro instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

