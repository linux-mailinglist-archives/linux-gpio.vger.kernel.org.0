Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902D67B335
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 21:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfG3TZt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 15:25:49 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:47963 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfG3TZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 15:25:48 -0400
X-AuditID: ac1060b2-3fdff70000003a7d-40-5d4099bccabf
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id C0.6E.14973.CB9904D5; Tue, 30 Jul 2019 15:25:49 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 30 Jul 2019 15:25:47 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, Joel Stanley <joel@jms.id.au>,
        <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
Date:   Tue, 30 Jul 2019 15:25:37 -0400
Message-ID: <1564514737-4638-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563564291-9692-2-git-send-email-hongweiz@ami.com>
References: <1563564291-9692-2-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsWyRiBhgu7emQ6xBoe2s1vsusxh8WXuKRaL
        +UfOsVr8Pv+X2WLKn+VMFpseX2O1aF59jtli8/w/jBaXd81hs1h6/SKTReveI+wO3B5X23ex
        e6yZt4bR4/2NVnaPix+PMXtsWtXJ5nHn2h42j81L6j3Oz1jI6PF5k1wAZxSXTUpqTmZZapG+
        XQJXxpPbDxkLnvJUvJr5nKWBcT1XFyMnh4SAicSdr61sXYxcHEICu5gktq+ewg7hHGaUePRr
        KiNIFZuAmsTezXOYQGwRgTyJw+vfsoIUMQucYpKYsa+TFSQhLGAnsX72MWYQm0VAVWLT8s1g
        zbwC9hKHt6xgg1gnJ3HzXCdYDaeAg8Tzy11A2ziAttlLrG4ShygXlDg58wkLiM0sICFx8MUL
        sHIhAVmJW4ceM0GMUZB43veYZQKjwCwkLbOQtCxgZFrFKJRYkpObmJmTXm6ol5ibqZecn7uJ
        ERIVm3Ywtlw0P8TIxMF4iFGCg1lJhHexuH2sEG9KYmVValF+fFFpTmrxIUZpDhYlcd6Va77F
        CAmkJ5akZqemFqQWwWSZODilGhgT9ku+CJGXXdVbJtz580GtjNLRVUcruy2vNFusMj41ufj/
        nPL3O8T+NCVcSPvQxKtyXfvK2UiFS9un6vrtNDY+kRjevcamj1137rHgS2siZrJU17j53G57
        rrnp22K2N8bCXgESNyOlHT/f4wrgXbn1XlfCs9dt26xeps7peFXEtuVV6c81lppKLMUZiYZa
        zEXFiQBMtJWHeAIAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus and Andrew,

Thanks for your detailed comments, I just submitted v6 of our update:
_http://patchwork.ozlabs.org/cover/1139035/
_http://patchwork.ozlabs.org/patch/1139038/
_http://patchwork.ozlabs.org/patch/1139040/

please ignore my previous patches sent on 07/28, they does not have proper serial
title and one of the patch is missing.

--Hongwei

> From:	Linus Walleij <linus.walleij@linaro.org>
> Sent:	Monday, July 29, 2019 5:57 PM
> To:	Andrew Jeffery
> Cc:	Hongwei Zhang; open list:GPIO SUBSYSTEM; Joel Stanley; open list:OPEN FIRMWARE AND 
> FLATTENED DEVICE TREE BINDINGS; linux-aspeed; Bartosz Golaszewski; Rob Herring; Mark Rutland; 
> linux-kernel@vger.kernel.org; Linux ARM
> Subject:	Re: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
> 
> On Mon, Jul 29, 2019 at 2:19 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > The behaviour is to periodically emit the state of all enabled GPIOs 
> > (i.e. the ngpios value), one per bus clock cycle. There's no explicit 
> > addressing scheme, the protocol encodes the value for a given GPIO by 
> > its position in the data stream relative to a pulse on the "load data"
> > (LD) line, whose envelope covers the clock cycle for the last GPIO in 
> > the sequence. Similar to SPI the bus has both out and in lines, which 
> > cater to output/input GPIOs.
> >
> > A rough timing diagram for a 16-GPIO configuration looks like what 
> > I've pasted here:
> >
> > https://gist.github.com/amboar/c9543af1957854474b8c05ab357f0675
> 
> OK that is complex. I agree we need to keep this driver together.
> 
> Yours,
> Linus Walleij
