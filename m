Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F9E311438
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 23:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhBEWCA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 17:02:00 -0500
Received: from atlmailgw1.ami.com ([63.147.10.40]:59858 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbhBEO5g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 09:57:36 -0500
X-AuditID: ac1060b2-427ff70000001a01-01-601d73ccbbc9
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id 09.CB.06657.CC37D106; Fri,  5 Feb 2021 11:35:24 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Fri, 5 Feb 2021 11:35:23 -0500
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>
CC:     Hongwei Zhang <hongweiz@ami.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
Subject: [PATCH, v1 1/1] gpio: aspeed: Add gpio base address reading
Date:   Fri, 5 Feb 2021 11:34:51 -0500
Message-ID: <20210113223808.31626-2-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113223808.31626-1-hongweiz@ami.com>
References: <20210113223808.31626-1-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWyRiBhgu6ZYtkEgx8v9C12Xeaw+DL3FIvF
        7/N/mS2m/FnOZLHp8TVWi+bV55gtNs//w2hxedccNotTLS9YHDg9rrbvYvd4f6OV3ePix2PM
        Hneu7WHz2Lyk3uP8jIWMHp83yQWwR3HZpKTmZJalFunbJXBl/D/3i6mgg73iV/8JxgbGQ6xd
        jJwcEgImEnu6G5m7GLk4hAR2MUncb17KAuHsZJT4+KGbBaSKTUBNYu/mOUwgtoiAisTu3rfs
        IEXMAieZJJY/PQ82SljARWL1r/dsIDYLUFHn2u+MIDavgKlEw/RdLBDr5CVWbzjADGJzCphJ
        vGq4BlYjBFSzoX0WO0S9oMTJmU/A6pkFJCQOvnjBDFEjK3Hr0GMmiDmKEg9+fWedwCgwC0nL
        LCQtCxiZVjEKJZbk5CZm5qSXG+ol5mbqJefnbmKEhPumHYwtF80PMTJxMB5ilOBgVhLhTWyT
        ShDiTUmsrEotyo8vKs1JLT7EKM3BoiTOu8r9aLyQQHpiSWp2ampBahFMlomDU6qB8VLB9VLP
        DT4XNx6uF+SUuSN53Gw3q6GpRbjvn8P2gtu22Rp9NLG56FzteHrC1r3Vjr0PukwqHNQ/TWho
        +SjU3fS7Su/oxpLTotfZP6tt3zG9L5cllN33eL6ZzetDorXHZ2sZr6z4vIrpfmdqqmBW3Bfp
        DjY9p30hnTONkiTDA0518t4LklutxFKckWioxVxUnAgAHqXWC2UCAAA=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> Hello,
> 
> On Thu, 14 Jan 2021, at 09:08, Hongwei Zhang wrote:
> > Add gpio base address reading in the driver; in old code, it just 
> > returns -1 to gpio->chip.base.
> 
> Why do you want to do this? It feels hacky. The base address only affects the legacy sysfs number-space, 
> and even then if you're using the sysfs interface you can discover the base address for a specific gpiochip 
> via the associated attribute. For example:
> 
> # cat /sys/bus/platform/devices/1e780000.gpio/gpio/gpiochip*/base
> 816
> 
> I feel that you should instead be changing your userspace not to assume a fixed value.
> 
> Finally, the base value is a linux-specific thing and doesn't belong in the devicetree, and if it did, you 
> would also need to update the devicetree binding in Documentation/.
> 
> Cheers,
> 
> Andrew

Hi Andrew,

Thanks for your review and advice.

--Hongwei

