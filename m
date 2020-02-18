Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DABA5162D7F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 18:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgBRRxs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 12:53:48 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:42650 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgBRRxs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 12:53:48 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48MT4B1LRdz1qrLp;
        Tue, 18 Feb 2020 18:53:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48MT4B0VT8z1qqkc;
        Tue, 18 Feb 2020 18:53:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 7a4_xjb2W3Wt; Tue, 18 Feb 2020 18:53:44 +0100 (CET)
X-Auth-Info: +1fpDYi5PO7Wc+uaFk/H/AOq0cR/pIY5FLcDyTGbJJI=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 18 Feb 2020 18:53:44 +0100 (CET)
Subject: Re: [PATCH v2 2/2] pinctrl: stm32: Add level interrupt support to
 gpio irq chip
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <20200218131218.10789-3-alexandre.torgue@st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <139584ff-4452-b576-f22b-ce2b24869e46@denx.de>
Date:   Tue, 18 Feb 2020 18:51:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218131218.10789-3-alexandre.torgue@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/18/20 2:12 PM, Alexandre Torgue wrote:
> This patch adds level interrupt support to gpio irq chip.
> 
> GPIO hardware block is directly linked to EXTI block but EXTI handles
> external interrupts only on edge. To be able to handle GPIO interrupt on
> level a "hack" is done in gpio irq chip: parent interrupt (exti irq chip)
> is retriggered following interrupt type and gpio line value.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> Tested-by: Marek Vasut <marex@denx.de>

Reviewed-by: Marek Vasut <marex@denx.de>
(and I tested the previous version on STM32MP1)
