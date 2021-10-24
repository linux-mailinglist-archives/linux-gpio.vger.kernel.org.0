Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D54438A91
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 18:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhJXQLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 12:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhJXQLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 12:11:05 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA2FC061745;
        Sun, 24 Oct 2021 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=ZwGeXEhZpgzR04B8ODuZ4tEIJgI7D6I5NhzqitoZvmo=; b=V19EQvVfMEEgwhw/yPNAOWOJnU
        UteIp4BRUK3iDJQJprBQyPSN3RU2Rc2Ix092MpeoJVvBpuFgkpqNhEmdYemrQR9pwhvesth5rZjvR
        o4HAVBsgMLKrg0E5eodk2JOzkFd52PpkIpVrbSI7fXt9G0ewEUYWDWYExBNEuaYx6zZR/c1HkD/2q
        U44XEq9BWOzKQ6aG1vdn1qUlwFyS9CubUaWVccUIFE3QQfRSJkNv+xn38X7dUZEe3ANIOkyXAtdfx
        F28UVYiYY324GFvnjP75xTx6XJrsPRcyPfHBAyKQXjKxfVhyHTDwbwY68HKxlqvoLDDK+L43CfSVj
        EEkOuNZQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1meg37-00EKAb-Vh; Sun, 24 Oct 2021 16:08:42 +0000
Subject: Re: [PATCH 07/13] clk: imx: Add initial support for i.MXRT clock
 driver
To:     Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <72428614-6ad3-5023-8e03-25ac440e82fd@infradead.org>
Date:   Sun, 24 Oct 2021 09:08:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024154027.1479261-8-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/24/21 8:40 AM, Jesse Taube wrote:
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index 47d9ec3abd2f..19adce25167d 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -98,3 +98,6 @@ config CLK_IMX8QXP
>   	select MXC_CLK_SCU
>   	help
>   	  Build the driver for IMX8QXP SCU based clocks.
> +config CLK_IMXRT
> +	def_bool SOC_IMXRT
> +	select MXC_CLK

Hi,
Please keep one blank line between config entries,
the way that the rest of that file is.
(and pretty much all other Kconfig files)

thanks.
-- 
~Randy
