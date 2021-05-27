Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993D2392502
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 04:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbhE0Cq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 22:46:59 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:49378 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbhE0Cq6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 22:46:58 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14R2Ui7a077457;
        Thu, 27 May 2021 10:30:44 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 10:43:47 +0800
Date:   Thu, 27 May 2021 10:43:41 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Andrew Jeffery <andrew@aj.id.au>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v2 0/4] ASPEED sgpio driver enhancement.
Message-ID: <20210527024341.GB9971@aspeedtech.com>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <4d995f6e-b582-4f45-b87c-2cd795de8d14@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4d995f6e-b582-4f45-b87c-2cd795de8d14@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14R2Ui7a077457
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 05/27/2021 09:41, Andrew Jeffery wrote:
> Hi Steven,
> 
> On Thu, 27 May 2021, at 10:24, Steven Lee wrote:
> > AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> > with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> > supports up to 80 pins.
> > In the current driver design, the max number of sgpio pins is hardcoded
> > in macro MAX_NR_HW_SGPIO and the value is 80.
> > 
> > For supporting sgpio master interfaces of AST2600 SoC, the patch series
> > contains the following enhancement:
> > - Convert txt dt-bindings to yaml.
> > - Update aspeed dtsi to support the enhanced sgpio.
> > - Get the max number of sgpio that SoC supported from dts.
> > - Support muiltiple SGPIO master interfaces.
> > - Support up to 128 pins.
> > 
> > Changes from v1:
> > * Fix yaml format issues.
> > * Fix issues reported by kernel test robot.
> > 
> > Please help to review.
> 
> I think it's worth leaving a little more time between sending series.
> 
> I've just sent a bunch of reviews on v1.
> 

I am worried about the patch series may be drop by reviewers due to
the report of kernel test robot.

Regardless, thanks for the comment in v1 patch series.

Steven

> Cheers,
> 
> Andrew
