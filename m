Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37557BD248
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2019 21:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436827AbfIXTC0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Sep 2019 15:02:26 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:45895 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436864AbfIXTC0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Sep 2019 15:02:26 -0400
X-AuditID: ac1060b2-791ff700000017bd-ff-5d8a68404e3e
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id 08.08.06077.0486A8D5; Tue, 24 Sep 2019 15:02:24 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 24 Sep 2019 15:02:24 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
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
Date:   Tue, 24 Sep 2019 15:02:19 -0400
Message-ID: <1569351740-6285-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA01RbUgTYRznubvdztHsuoQeVoosjCjSVqGPJKVEcB/F+lSJHnm50XzpfCnr
        g8sy3coaZmhruiUbkY2sDXHMhjbFlshsrcxe7G1BoyBbapKbvbgR+O33yv8HfwpnDISMUpVX
        80I5p5aTEsJGF+u35Sp1hdubLRAZe20kcgUo9Of7AEALgwYRWmodFaMGzxiJ5jrHCGQa8YlQ
        ZGIJR23RWxiyBydF6NwdH44cpihAAZeRRJ5rboCsL/wYmvmhxVCje0SMpto0JHK/nQW5Sezz
        JpeYtXXZABuY9ONsZLEVsDNTjWLWHx7FWXuPlmTfTD4gWW9HhGD13UOAdVjq2YmOm4BdOjsv
        Zr3tCwQ7a0/JX31IklPCq1W1vJCxp1iitFraQGULeSrQ+AvXgNeEDiRQkN4Fr3Z/+YclFEO7
        MBjubMHiZBjAi94QuZwi6U3Q7TDGjCT6CoBmY2eM4HSfCPYPNYiWU2vpLGgKBmKYoNPg/L3R
        GJbSe6Gzz0vG76XAlz4tHtfXwMfXP8V24DSED0OhmM7QyfCVJ4jF86nw8+UgoQeJhhUVw4qK
        GWA9gOGq1WWcSl16UpHOlanSj1aU2UH8f3YnOO/P8gCMAh4AKVyeJDVs0BUy0hKu7jQvVBQJ
        NWq+ygPWU4R8nfS27ecRhi7lqvnjPF/JC/9djEqQacDwxoxexpk8cUx4ZzloLowmfG0/PJix
        g8scNhE3dHefmMc/fNT7Cuqd2vL8tCZZbZQKrrogO3NpwDVtPZCdkmidy1lUhkBX2Dq+uWUq
        /H48kr4vdXd2c10IZNa0Wi9mPRM08Gnl2KOtuvt5I+4T7umdClfRt/0Kx+/2vIL+WTlRpeQU
        W3ChivsLN7AWs60CAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This short series introduce the Kconfig, Makefile, and dts for the 
Aspeed AST2500 SGPIO controller. This is the last patch set.
Please review.

[v1]: Initial commit

The related SGPIO driver has been accepted and merged into v5.4:
_http://patchwork.ozlabs.org/patch/1150357/

The related SGPM pinmux dt-binding document, dts, and pinctrl driver
updates have been accepted and merged:
_http://patchwork.ozlabs.org/patch/1110210/

Thanks!
Hongwei Zhang (1):
  gpio: dts: aspeed: Add SGPIO driver

 arch/arm/Kconfig                 |  2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi | 16 +++++++++++++++-
 drivers/gpio/Kconfig             |  8 ++++++++
 drivers/gpio/Makefile            |  1 +
 4 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.7.4

