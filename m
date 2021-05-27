Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FD1392415
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 03:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhE0BFP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 21:05:15 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:27685 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbhE0BFP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 21:05:15 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14R0o5pH068092;
        Thu, 27 May 2021 08:50:05 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 09:03:07 +0800
Date:   Thu, 27 May 2021 09:03:01 +0800
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
Subject: Re: [PATCH v1 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210527010301.GA727@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-2-steven_lee@aspeedtech.com>
 <5c0670b1-269c-4aae-8639-c0866ac90dc9@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5c0670b1-269c-4aae-8639-c0866ac90dc9@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14R0o5pH068092
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 05/27/2021 08:57, Andrew Jeffery wrote:
> Hi Steven,
> 
> On Wed, 26 May 2021, at 19:16, Steven Lee wrote:
> > SGPIO bindings should be converted as yaml format.
> > In addition to the file conversion, a new property max-ngpios is
> > added in the yaml file as well.
> > The new property is required by the enhanced sgpio driver for
> > making the configuration of the max number of gpio pins more flexible.
> 
> Please add the new property in a separate patch to the YAML conversion. 
> Having changes to the properties in addition to switching to dt schema 
> makes it harder to catch errors, and it seems Rob's bot has already 
> picked up some.
> 
> Reviewing the changes as separate patches means its easier to give you 
> a Reviewed-by tag on that patches I'm happy with.
> 

Thanks for your suggestion, I will add the new property in a
separate patch in v3 patch series.

> Andrew
