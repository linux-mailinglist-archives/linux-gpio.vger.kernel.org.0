Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081671B5E33
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2020 16:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbgDWOq4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Apr 2020 10:46:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:51680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgDWOqz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Apr 2020 10:46:55 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C78E42074F;
        Thu, 23 Apr 2020 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587653215;
        bh=dKwZcTA1rgXNzu8RlWdM83F/mPA130mSalvzMrCfR5c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WGRv7srctdJKAMqmK8eL+KLDl94Qq12AGW4/+u5N+2s/PfFr4W8aju2QTPOM1c8yO
         nNXGiVKCmSSYXkJi/a5D98loXkbFfpq6K3zLK627HHMMr/UHwkHxkcE3ap0YL4oqbD
         fAy2Sj+j+mGN/Ly5MRfly27bv+M+sEkunwv54s0E=
Date:   Thu, 23 Apr 2020 22:46:44 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        aisheng.dong@nxp.com, festevam@gmail.com, stefan@agner.ch,
        kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux@roeck-us.net,
        gregkh@linuxfoundation.org, peng.fan@nxp.com, fugang.duan@nxp.com,
        krzk@kernel.org, bjorn.andersson@linaro.org, leoyang.li@nxp.com,
        olof@lixom.net, dinguyen@kernel.org, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable CONFIG_PINCTRL_IMX8DXL by
 default
Message-ID: <20200423144642.GE9391@dragon>
References: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com>
 <1585306559-13973-3-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585306559-13973-3-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 27, 2020 at 06:55:59PM +0800, Anson Huang wrote:
> Enable CONFIG_PINCTRL_IMX8DXL by default to support i.MX8DXL
> pinctrl driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
