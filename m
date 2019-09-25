Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A01D1BE585
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 21:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408642AbfIYTUw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 15:20:52 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:65041 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfIYTUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 15:20:52 -0400
X-AuditID: ac1060b2-791ff700000017bd-b6-5d8bbe11adce
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id 03.CA.06077.11EBB8D5; Wed, 25 Sep 2019 15:20:50 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 25 Sep 2019 15:20:50 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>, <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>
CC:     Hongwei Zhang <hongweiz@ami.com>, <devicetree@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Doug Anderson <armlinux@m.disordat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [v1, 0/1] gpio: dts: aspeed: Add SGPIO driver
Date:   Wed, 25 Sep 2019 15:20:48 -0400
Message-ID: <1569439248-10430-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
References: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsWyRiBhgq7Qvu5YgxkrmS3mrF/DZrHrMofF
        /w+7GS2+75/FavF30jF2i6ZDp9gsvsw9xWIx/8g5Vovf5/8yW0z5s5zJYtPja6wWzavPMVts
        nv+H0eLyrjlsFoem7mW0WHr9IpPF+0+dTBate4+wW9yY0sBmsffeZ0YHEY+r7bvYPdbMW8Po
        cfnaRWaP378mMXq8v9HK7nHx4zFmj02rOtk87lzbw+ZxYsZvFo8Jiw4wemxeUu9xfsZCRo+/
        jV/ZPU5M/87i8XmTXAB/FJdNSmpOZllqkb5dAldGb08rU8EL1orpswsaGM+wdDFyckgImEjs
        uXedqYuRi0NIYBeTxKkN0xkhnMOMEqc+fmUFqWITUJPYu3kOWJWIQD+jxPUdTWwgDrPAVlaJ
        7QeawKqEBcwkOqfOBbNZBFQlLrXfZQSxeQUcJG5dbmaE2CcncfNcJzOIzQkUv7z4A9gdQgL2
        EqsXnISqF5Q4OfMJWJxZQELi4IsXzBA1shK3Dj1mgpijIPG87zHLBEaBWUhaZiFpWcDItIpR
        KLEkJzcxMye93FAvMTdTLzk/dxMjJFo37WBsuWh+iJGJg/EQowQHs5II7yyZrlgh3pTEyqrU
        ovz4otKc1OJDjNIcLErivCvXfIsREkhPLEnNTk0tSC2CyTJxcEo1MC59Wrj1TlnSxR5PR4H0
        jeeUD7zzczCc/kL2xue9d7R7f7pOyVwYqm9ey7tkh4rj86+yooqnb8Z8ioxWaJF7bLugZ+Xh
        v1vPBx1qXLn81RLrsrVN9W+uN5exZZw/9OSA1hc/uxmMr94sfbFQ5ew2f93uCpXSro3Grz3Z
        ms9/vW73wuz4b2frVdeVWIozEg21mIuKEwFFarKcxAIAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> 
> > The related SGPIO driver has been accepted and merged into v5.4:
> > _http://patchwork.ozlabs.org/patch/1150357/
> 
> Oh what a mess, it didn't add the necessary code into Kconfig and Makefile, also names it sgpio-gpio.c 
> when everything else is named gpio-sgpio.c.
> 
> I guess I have to fix it up. My fault for missing.
> 
> Linus Walleij

Thanks Linus,

It's not your fault, I misunderstood a earlier comment from another 
reviewer and thought I should wait until the driver is accecpted, 
and then submit the patch to include / enable it.

As Bart suggested, I splitte the patches. 

Regarding the driver name, following the gpio-SoC_name.o convention 
in the Makefile, we choose sgpio-aspeed.o .

--Hongwei
