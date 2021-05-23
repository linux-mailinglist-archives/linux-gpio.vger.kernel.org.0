Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D48538D927
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 07:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhEWFnt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 01:43:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229895AbhEWFnt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 23 May 2021 01:43:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA8F4611CB;
        Sun, 23 May 2021 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621748543;
        bh=addO/W7zGFpJqIz6D31aDifsIcltUXG1VfcyZkyOm+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r+rmQfz72kNXSLghJNf7MAQPeF3TaS+2jQ30gsLipXFz3p89mWtI9bap40GlEQFgq
         VSYunLmLiGWd8w1bLXPJglKWUOosIdmR9C2PqqY/lDWOLgaIWc52W8Mtft/xhTIOGI
         2ea3Yg0Odor5bcn/4+9iP+cR81ctOqc/NtSGPszy5WOdj1ked1O476BNFD5tDTbmfT
         U9X4nMbc9Gh6/AUcAwFTxfTxRMA2iNIQiOU49afii+mdTzS5CR0nDxMtiNe4Pgt3Wi
         zmaoAAjdu0ctYUkOuSHw+OwovdbG8JZ656I8jlp6fYdtZyfHNNQjOrdCl8byvS9Hw2
         Gj9u93XLySftg==
Date:   Sun, 23 May 2021 13:42:17 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] ARM: dts: imx: emcon-avari: Fix nxp,pca8574
 #gpio-cells
Message-ID: <20210523054217.GB8194@dragon>
References: <cover.1621583562.git.geert+renesas@glider.be>
 <6cd916fc8c0a133cd216eee06cac86716b66eff4.1621583562.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cd916fc8c0a133cd216eee06cac86716b66eff4.1621583562.git.geert+renesas@glider.be>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 09:54:07AM +0200, Geert Uytterhoeven wrote:
> According to the DT bindings, #gpio-cells must be two.
> 
> Fixes: 63e71fedc07c4ece ("ARM: dts: Add support for emtrion emCON-MX6 series")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.
