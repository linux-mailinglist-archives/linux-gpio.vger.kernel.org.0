Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C22413D2EB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 04:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbgAPDwD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 22:52:03 -0500
Received: from regular1.263xmail.com ([211.150.70.204]:51374 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgAPDwD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 22:52:03 -0500
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jan 2020 22:52:02 EST
Received: from localhost (unknown [192.168.167.223])
        by regular1.263xmail.com (Postfix) with ESMTP id B32AB25B;
        Thu, 16 Jan 2020 11:44:46 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.9] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P614T140606315673344S1579146284883989_;
        Thu, 16 Jan 2020 11:44:45 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c5786d4e514634879cef127dc9caa3a5>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH v2] pinctrl/rockchip: splite soc data to separated driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc:     David Wu <david.wu@rock-chips.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Peter Robinson <pbrobinson@gmail.com>,
        Vagrant Cascadian <vagrant@debian.org>, afaerber@suse.de,
        Tao Huang <huangtao@rock-chips.com>
References: <20200109094001.24343-1-jay.xu@rock-chips.com>
 <20200113011616.19791-1-jay.xu@rock-chips.com>
 <CACRpkdY_EHQbF4rRyGwoxEk8LeWfmRzmCd=8=SY95LPXMHYOmw@mail.gmail.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <c4ec95a7-aaf1-2331-352f-2def319a1c7d@rock-chips.com>
Date:   Thu, 16 Jan 2020 11:44:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdY_EHQbF4rRyGwoxEk8LeWfmRzmCd=8=SY95LPXMHYOmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/1/15 下午8:51, Linus Walleij wrote:
> On Mon, Jan 13, 2020 at 2:16 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
>> * Decrease codes of pinctrl-rockchip.c from 4,000 lines to 2000 by
>> separating soc data to a new file.
>>
>> * Move rockchip pinctrl related struct definations to a head file.
>>
>> * Keep legency pinctrl-rockchip.c under driver/pinctrl but not to
>> compile it, conveniently for reviewers.
>>
>> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> This patch looks good, two things are missing:
>
> - Review from Heiko
>
> - A change to MAINTAINERS so that the file pattern still
>    matches
>
> Should someone from Rockchip also sign up as comaintainer
> for this driver by the way? (Though the people at Rockchip
> posting patches for this seem to change a bit.)


The kernel Image size is keep growing, this patch can help reduce the 
size of

kernel image for one SoC, and this is what we have done in U-Boot mainline.

And for distribution kernel who need to cover all the SoCs with one 
kernel image,

need to update the defconfig.

The patch looks good to me,

Reviewed-by: Kever Yang <kever.yang@rock-chips.com>

Thanks,
- Kever


>
> Yours,
> Linus Walleij
>
>


