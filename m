Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306712C949D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 02:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgLABXq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 20:23:46 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:8890 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbgLABXq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 20:23:46 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ClPV70wFkz768H;
        Tue,  1 Dec 2020 09:22:39 +0800 (CST)
Received: from [10.174.177.149] (10.174.177.149) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 09:23:00 +0800
Subject: Re: [PATCH] gpio: zynq: fix reference leak in zynq_gpio functions
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20201127094445.121232-1-miaoqinglang@huawei.com>
 <CAMpxmJXxibU_i__GnCOktxPct9drrLKvf4Oo6jpXrhiJWt7QZA@mail.gmail.com>
From:   Qinglang Miao <miaoqinglang@huawei.com>
Message-ID: <c540ead8-0d05-86d8-681c-9003600355ce@huawei.com>
Date:   Tue, 1 Dec 2020 09:23:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJXxibU_i__GnCOktxPct9drrLKvf4Oo6jpXrhiJWt7QZA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.149]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



在 2020/12/1 0:44, Bartosz Golaszewski 写道:
> On Fri, Nov 27, 2020 at 10:40 AM Qinglang Miao <miaoqinglang@huawei.com> wrote:
>>
>> pm_runtime_get_sync will increment pm usage counter even it
>> failed. Forgetting to putting operation will result in a
>> reference leak here.
>>
>> A new function pm_runtime_resume_and_get is introduced in
>> [0] to keep usage counter balanced. So We fix the reference
>> leak by replacing it with new funtion.
>>
>> [0] dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get to deal with usage counter")
> 
> Is this upstream yet?
> 
> Bartosz
> .
Yep, it's introduced in v5.10-rc5
> 
