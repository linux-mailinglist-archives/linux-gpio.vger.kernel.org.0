Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F0DED6D5
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 02:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbfKDBRR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 20:17:17 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:5253 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728102AbfKDBRQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 3 Nov 2019 20:17:16 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id AEC5BAC7CFCEE8B8AB48;
        Mon,  4 Nov 2019 09:17:12 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 09:17:11 +0800
Subject: Re: [PATCH -next 01/30] pinctrl: pxa25x: use
 devm_platform_ioremap_resource() to simplify code
To:     Linus Walleij <linus.walleij@linaro.org>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-2-yuehaibing@huawei.com>
 <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
CC:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        "Ludovic Desroches" <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@axis.com>, <linux-oxnas@groups.io>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, "Vladimir Zapolskiy" <vz@mleia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <c8b14d9b-253b-47a1-641f-e89d2cc79686@huawei.com>
Date:   Mon, 4 Nov 2019 09:17:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019/11/4 8:18, Linus Walleij wrote:
> On Thu, Oct 17, 2019 at 2:48 PM YueHaibing <yuehaibing@huawei.com> wrote:
> 
>> Use devm_platform_ioremap_resource() to simplify the code a bit.
>> This is detected by coccinelle.
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> These are too many patches changing too little.
> One patch should be one technical step.
> 
> I'd say squash them all into one big patch and resend.
> 
> You can collect the ACKs you received, but don't put
> too many people on CC, they will be annoyed.

Ok, will do that, thanks!

> 
> Yours,
> Linus Walleij
> 
> .
> 

