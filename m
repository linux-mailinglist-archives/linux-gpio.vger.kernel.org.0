Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE04427E557
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgI3Jjz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:39:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14789 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725779AbgI3Jjz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 05:39:55 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 54EA5A4AE3B61CDE5BB6;
        Wed, 30 Sep 2020 17:39:52 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 30 Sep 2020 17:39:47 +0800
Subject: Re: [PATCH -next] pinctrl: mediatek: simplify the return expression
 of mtk_pinconf_bias_disable_set_rev1()
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200921131056.92848-1-miaoqinglang@huawei.com>
 <CACRpkdZxgw7zmmWyVpxQ5N60Yxzj+u_LPAkRGN0qS3A4DqKNgw@mail.gmail.com>
From:   miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <5a88741a-15b8-e81a-0161-89442a7a1d82@huawei.com>
Date:   Wed, 30 Sep 2020 17:39:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZxgw7zmmWyVpxQ5N60Yxzj+u_LPAkRGN0qS3A4DqKNgw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



在 2020/9/30 16:53, Linus Walleij 写道:
> On Mon, Sep 21, 2020 at 3:10 PM Qinglang Miao <miaoqinglang@huawei.com> wrote:
> 
>> Simplify the return expression.
>>
>> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> 
> This patch does not apply to the pinctrl "devel" branch, please
> rebase and resend, include Sean's ACK.
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
> 
> Yours,
> Linus Walleij
> .
> 
Hi Linus,

I tried to rebase this patch to the pinctrl "devel" branch but there's 
no conflict. Could you please try again or show me some details?

Thanks.
