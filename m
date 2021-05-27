Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098E5392506
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 04:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbhE0Cr1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 22:47:27 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:49394 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE0Cr1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 22:47:27 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14R2WFR1077525;
        Thu, 27 May 2021 10:32:15 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 10:45:18 +0800
Date:   Thu, 27 May 2021 10:45:17 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Rob Herring <robh@kernel.org>
CC:     Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "Hongweiz@ami.com" <Hongweiz@ami.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210527024516.GC9971@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-2-steven_lee@aspeedtech.com>
 <1622033763.789353.2377038.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1622033763.789353.2377038.nullmailer@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14R2WFR1077525
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 05/26/2021 20:56, Rob Herring wrote:
> On Wed, 26 May 2021 17:46:05 +0800, Steven Lee wrote:
> > SGPIO bindings should be converted as yaml format.
> > In addition to the file conversion, a new property max-ngpios is
> > added in the yaml file as well.
> > The new property is required by the enhanced sgpio driver for
> > making the configuration of the max number of gpio pins more flexible.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  .../bindings/gpio/aspeed,sgpio.yaml           | 91 +++++++++++++++++++
> >  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ----------
> >  2 files changed, 91 insertions(+), 46 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
> 
> See https://patchwork.ozlabs.org/patch/1483966
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Thanks, I will modify it.

