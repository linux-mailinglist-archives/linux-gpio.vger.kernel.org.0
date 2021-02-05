Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4773311435
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 23:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhBEWB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 17:01:57 -0500
Received: from atlmailgw2.ami.com ([63.147.10.42]:47870 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbhBEO5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 09:57:31 -0500
X-AuditID: ac10606f-247ff70000001934-f3-601d73c116e9
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id E5.4A.06452.1C37D106; Fri,  5 Feb 2021 11:35:13 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Fri, 5 Feb 2021 11:35:11 -0500
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Hongwei Zhang <hongweiz@ami.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
Subject: [PATCH, v1 1/1] gpio: aspeed: Add gpio base address reading
Date:   Fri, 5 Feb 2021 11:34:50 -0500
Message-ID: <20210113223808.31626-2-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113223808.31626-1-hongweiz@ami.com> 
References: <20210113223808.31626-1-hongweiz@ami.com> 
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWyRiBhgu7BYtkEg6un9C12Xeaw+DL3FIvF
        7/N/mS2m/FnOZLHp8TVWi+bV55gtNs//w2hxedccNotTLS9YHDg9rrbvYvd4f6OV3ePix2PM
        Hneu7WHz2Lyk3uP8jIWMHp83yQWwR3HZpKTmZJalFunbJXBlLPpqXPCNreLYvevMDYx7WLsY
        OTkkBEwk9mxfxNbFyMUhJLCLSeLt69usEM5ORomVOy8xg1SxCahJ7N08hwnEFhHQkeje9hOs
        iFngIJPE9Gl72EESwgIuEqt/vWcDsVkEVCRWf38A1sArYCrRMH0XC8Q6eYnVGw6ADeUUMJfY
        1vQcrF5IwEyi9dMjqHpBiZMzn4DVMwtISBx88YIZokZW4tahx0wQcxQlHvz6zjqBUWAWkpZZ
        SFoWMDKtYhRKLMnJTczMSS830kvMzdRLzs/dxAgJ9vwdjB8/mh9iZOJgPMQowcGsJMKb2CaV
        IMSbklhZlVqUH19UmpNafIhRmoNFSZx3lfvReCGB9MSS1OzU1ILUIpgsEwenVAPjofrHXB6Z
        H4tUdX8Grk/3MvG9aJU3KeSb3n4e5R6pjXNzbM91mqbcLHxX8J11H2PUzn0dG1YVusYevNR3
        9faXyMuvpqzl+3G9lGlFDe+mstcJbtuadrntzizZlPqy0zsv91zZpS8RSp720ldEKyJlnCyy
        T/y68/Dm37Zrtr0fVTiX+BV+O/RfiaU4I9FQi7moOBEAYb4BgWQCAAA=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> On Wed, Jan 13, 2021 at 11:38 PM Hongwei Zhang <hongweiz@ami.com> wrote:
> 
> > Add gpio base address reading in the driver; in old code, it just 
> > returns -1 to gpio->chip.base.
> >
> > Fixes: 7ee2d5b4d4340353 ("ARM: dts: nuvoton: Add Fii Kudo system")
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> 
> NAK, sorry.
> 
> We never allow the device tree to specify this.
> 
> First, it is a Linux-only base so it would have to be a "linux,..." property.
> 
> Even if it is a Linux-only property, it is a bad idea.
> 
> Only people using sysfs should have any need to specify global GPIO numbers. Don't use sysfs. Use the 
> GPIO character device instead. See further:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO
> 
> Yours,
> Linus Walleij

Hi Linus,

Thanks for your review and advice.

--Hongwei

