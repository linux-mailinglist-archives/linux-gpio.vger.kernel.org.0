Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E11196B6FC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 08:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfGQGzF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 02:55:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:41826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbfGQGzE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jul 2019 02:55:04 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 032C121743;
        Wed, 17 Jul 2019 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563346504;
        bh=3Xt4tfBlIS/KrhkQpP7kW1uAGP7uRrEmTBLu4gx2nbY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PyMn41bYicm6bSdM1vgHd0VolUj1AD5wNiOa2GUoJ00QYsS3cFisakqUsC10GUcaZ
         GDQFJ6DIGSbEo5+GPEVpdG/sgLRhC1q1YDjKGZdfquwyHpd0SZAPUIpYRfSrDg6VIc
         n5TbotMhMW+k5GYa3aDH2rWVCsAbs3dS0l84WK+Y=
Date:   Wed, 17 Jul 2019 14:54:42 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson.Huang@nxp.com
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, stefan@agner.ch,
        kernel@pengutronix.de, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        catalin.marinas@arm.com, will.deacon@arm.com,
        maxime.ripard@bootlin.com, olof@lixom.net,
        horms+renesas@verge.net.au, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, leonard.crestez@nxp.com,
        dinguyen@kernel.org, enric.balletbo@collabora.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V2 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MN by
 default
Message-ID: <20190717065441.GD3738@dragon>
References: <20190611122535.23583-1-Anson.Huang@nxp.com>
 <20190611122535.23583-3-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611122535.23583-3-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 11, 2019 at 08:25:35PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Enable CONFIG_PINCTRL_IMX8MN by default to support i.MX8MN
> pinctrl driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
