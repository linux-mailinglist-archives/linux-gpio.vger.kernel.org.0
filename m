Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7809B347446
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 10:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbhCXJOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 05:14:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234605AbhCXJNr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 05:13:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90ED06157F;
        Wed, 24 Mar 2021 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616577227;
        bh=w8CRVnJFyS/XR+Mj1hn0bNzvz+r35MHD7pK0TCVHjD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uo2mt6FtAPAq/f6vQn46VxbR2DRGY30BApaODqpGYP2p0eskhkEKbE+6NUzIy9+Mb
         CqoaAFK4QSC2+gVl5gUS41iuTAxCz4f/4hCOL3gPdEU914dfbdCc5YO8YKCgDN2ksx
         Gkt/9S6Pw4Y4qwl3JIo32a9eSTw35cKyzKc51DfI=
Date:   Wed, 24 Mar 2021 10:13:44 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        git@xilinx.com, saikrishna12468@gmail.com
Subject: Re: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Message-ID: <YFsCyGO1cLcM7IG0@kroah.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <YFnwN6mqXml5xdR3@kroah.com>
 <e0a2c5b6-ff05-644c-8c88-b614a37b4929@xilinx.com>
 <YFr9GqNmYuEG2OvZ@kroah.com>
 <dabcfe43-568a-66c1-642e-eef065f9b5ab@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dabcfe43-568a-66c1-642e-eef065f9b5ab@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 10:02:53AM +0100, Michal Simek wrote:
> 
> 
> On 3/24/21 9:49 AM, Greg Kroah-Hartman wrote:
> > On Wed, Mar 24, 2021 at 09:29:12AM +0100, Michal Simek wrote:
> >> On 3/23/21 2:42 PM, Greg Kroah-Hartman wrote:
> >>> On Wed, Mar 17, 2021 at 01:55:16PM +0530, Sai Krishna Potthuri wrote:
> >>>> Adding pinctrl driver for Xilinx ZynqMP platform.
> >>>> This driver queries pin information from firmware and registers
> >>>> pin control accordingly.
> >>>>
> >>>> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> >>>> ---
> >>>>  drivers/pinctrl/Kconfig          |   13 +
> >>>>  drivers/pinctrl/Makefile         |    1 +
> >>>>  drivers/pinctrl/pinctrl-zynqmp.c | 1030 ++++++++++++++++++++++++++++++
> >>>>  3 files changed, 1044 insertions(+)
> >>>>  create mode 100644 drivers/pinctrl/pinctrl-zynqmp.c
> >>>>
> >>>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> >>>> index 815095326e2d..25d3c7208975 100644
> >>>> --- a/drivers/pinctrl/Kconfig
> >>>> +++ b/drivers/pinctrl/Kconfig
> >>>> @@ -341,6 +341,19 @@ config PINCTRL_ZYNQ
> >>>>  	help
> >>>>  	  This selects the pinctrl driver for Xilinx Zynq.
> >>>>  
> >>>> +config PINCTRL_ZYNQMP
> >>>> +	bool "Pinctrl driver for Xilinx ZynqMP"
> >>>
> >>> Please make this work as a module.
> >>
> >> The most of pinctrl drivers are builtin modules now which is not excuse
> >> it is just fact.
> >> $ git grep module_pla drivers/pinctrl/ | wc -l
> >> 40
> >> $ git grep  builtin_pla drivers/pinctrl/ | wc -l
> >> 64
> > 
> > For new ones, we can do better, don't make us have to go back and fix
> > this up later.
> 
> As I said not a big deal. If this is the way to go then I these rules
> should be followed which is not what it is happening based on 3 latest
> pinctrl drivers below.

I do not disagree, but I point out issues when I see them, you got
unlucky :)
