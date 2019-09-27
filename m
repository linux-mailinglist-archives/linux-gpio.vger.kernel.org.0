Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF09C08FE
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 17:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbfI0P4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 11:56:03 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:55424 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbfI0P4D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 11:56:03 -0400
X-AuditID: ac1060b2-7a7ff700000017bd-67-5d8e310ed195
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id D0.07.06077.E013E8D5; Fri, 27 Sep 2019 11:55:58 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Sep 2019 11:56:01 -0400
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
Subject: [v2, 2/2] gpio: dts: aspeed: Add SGPIO driver
Date:   Fri, 27 Sep 2019 11:55:48 -0400
Message-ID: <1569599748-31181-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
References: <1569439337-10482-3-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsWyRiBhgi6fYV+sQfcOE4s569ewWey6zGHx
        /8NuRovv+2exWvyddIzdounQKTaLL3NPsVjMP3KO1eL3+b/MFlP+LGey2PT4GqtF8+pzzBab
        5/9htLi8aw6bxaGpexktll6/yGTx/lMnk0Xr3iPsFjemNLBZ7L33mdFBxONq+y52jzXz1jB6
        XL52kdnj969JjB7vb7Sye1z8eIzZY9OqTjaPO9f2sHmcmPGbxWPCogOMHpuX1Hucn7GQ0eNv
        41d2jxPTv7N4fN4kF8AfxWWTkpqTWZZapG+XwJXx8YNzwQrmir0fP7I1MJ5i6mLk5JAQMJE4
        fKWFGcQWEtjFJPG2waGLkQvIPswo8ax7ERtIgk1ATWLv5jlMIAkRgX5Gies7mthAHGaBrawS
        2w80sYJUCQuYSSydMY29i5GDg0VAVeLGznCQMK+Ag0RT63c2iG1yEjfPdYJt4xRwlNjWsJMJ
        YrODxLtHLawQ9YISJ2c+YQGxmQUkJA6+eAF1nazErUOPoa5WkHje95hlAqPALCQts5C0LGBk
        WsUolFiSk5uYmZNebqiXmJupl5yfu4kREqmbdjC2XDQ/xMjEwXiIUYKDWUmE1zeyJ1aINyWx
        siq1KD++qDQntfgQozQHi5I478o132KEBNITS1KzU1MLUotgskwcnFINjCs/Buk+L37G2a/y
        ZvfFi6uVZnSJd3IVin/leb1R6JVMmqL4Is/UmgfObbbfsuN/qZ3e/bu8z23dnbI1zZt91RyV
        zTr1g6W1WEpeZIh2uN/pMow84L2YN9jWTUquIPRUzh2jyxrnBPedfFecmCbFF8y/RKD6l0Fx
        y7TiNzoB9ivecGxu0lugxFKckWioxVxUnAgAf+/1tsICAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Linus,

> 
> I sent a separate patch to fix this up the way I want it with the file named gpio-aspeed-sgpio.c and 
> CONFIG_GPIO_ASPEED_SGPIO.
> 
> I don't want to mix up the namespaces of something Aspeed-generic with the namespace of the GPIO 
> subsystem. SGPIO is the name of a specific Aspeed component.
> 
> Yours,
> Linus Walleij

I agree and gpio-aspeed-sgpio.c is better.

Regards,
--Hongwei
