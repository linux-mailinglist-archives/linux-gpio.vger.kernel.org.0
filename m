Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AD13473ED
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbhCXItp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:49:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:48728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233665AbhCXIth (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 04:49:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36334619F3;
        Wed, 24 Mar 2021 08:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616575776;
        bh=2BfN8HjU6Yqu1jm8Q2KPZxQUG2HzfOk+giTYXadvfxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i68Wn4kRgN9HOH4r+Hu9KZ4lEeWOj/4xq/sEICeE+8Slo08DZslqXbDQSYl7Ws/6N
         9ok96yCg4UHx6go58CHP092FvzvwVYJzPKkqUnC7y5PP+KncLkFRJZEJ76rowpo8oV
         Yt62DpXuYcDXrUB9Im29qd3Zkpzb4chGE1FWE0GM=
Date:   Wed, 24 Mar 2021 09:49:30 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        git@xilinx.com, saikrishna12468@gmail.com
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Message-ID: <YFr9GqNmYuEG2OvZ@kroah.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YFnwN6mqXml5xdR3@kroah.com>
 <e0a2c5b6-ff05-644c-8c88-b614a37b4929@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0a2c5b6-ff05-644c-8c88-b614a37b4929@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 09:29:12AM +0100, Michal Simek wrote:
> On 3/23/21 2:42 PM, Greg Kroah-Hartman wrote:
> > On Wed, Mar 17, 2021 at 01:55:16PM +0530, Sai Krishna Potthuri wrote:
> >> Adding pinctrl driver for Xilinx ZynqMP platform.
> >> This driver queries pin information from firmware and registers
> >> pin control accordingly.
> >>
> >> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> >> ---
> >>  drivers/pinctrl/Kconfig          |   13 +
> >>  drivers/pinctrl/Makefile         |    1 +
> >>  drivers/pinctrl/pinctrl-zynqmp.c | 1030 ++++++++++++++++++++++++++++++
> >>  3 files changed, 1044 insertions(+)
> >>  create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
> >>
> >> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> >> index 815095326e2d..25d3c7208975 100644
> >> --- a/drivers/pinctrl/Kconfig
> >> +++ b/drivers/pinctrl/Kconfig
> >> @@ -341,6 +341,19 @@ config PINCTRL_ZYNQ
> >>  	help
> >>  	  This selects the pinctrl driver for Xilinx Zynq.
> >>  
> >> +config PINCTRL_ZYNQMP
> >> +	bool "Pinctrl driver for Xilinx ZynqMP"
> > 
> > Please make this work as a module.
> 
> The most of pinctrl drivers are builtin modules now which is not excuse
> it is just fact.
> $ git grep module_pla drivers/pinctrl/ | wc -l
> 40
> $ git grep  builtin_pla drivers/pinctrl/ | wc -l
> 64

For new ones, we can do better, don't make us have to go back and fix
this up later.

> Also at least last 3 pinctrl drivers which have been merged are not modules.
> d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> 7e5ea974e61c ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for
> Microsemi Serial GPIO")
> a68a7844264e ("pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl
> support")
> 
> None is saying that it can't be done but that cases where you use
> pinctrl as module are really very limited. When you start to use pinctrl
> and its functionality you need to have it as the part of the kernel to
> be to get console, mmc, ethernet, usb, etc.
> 
> That's why I would like to know what functionality and use case you have
> in mind that this driver should be made module.

The "functionality" of building a kernel image that works on all
hardware types.  Just like x86-64 has been for a very long time :)

thanks,

greg k-h
