Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEE8162D7C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 18:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgBRRxp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 12:53:45 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:35707 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgBRRxp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 12:53:45 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48MT4745rYz1tkV3;
        Tue, 18 Feb 2020 18:53:43 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48MT473JkQz1qqkc;
        Tue, 18 Feb 2020 18:53:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id zGwf49Nk38y1; Tue, 18 Feb 2020 18:53:42 +0100 (CET)
X-Auth-Info: kI5+ZVBQrKn1XDWzCWtpIyppsFJcjKvR4tUcuV6jlt4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 18 Feb 2020 18:53:42 +0100 (CET)
Subject: Re: [PATCH v2 1/2] irqchip/stm32: Add irq retrigger support
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <20200218131218.10789-2-alexandre.torgue@st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <e4d2f2b5-088e-a6aa-c9b5-75443b02896f@denx.de>
Date:   Tue, 18 Feb 2020 18:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218131218.10789-2-alexandre.torgue@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/18/20 2:12 PM, Alexandre Torgue wrote:
> This commit introduces retrigger support for stm32_ext_h chip.
> It consists to rise the GIC interrupt mapped to an EXTI line.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Reviewed-by: Marek Vasut <marex@denx.de>
(and I tested the previous version on STM32MP1)
