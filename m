Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128C734BD83
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Mar 2021 19:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhC1RSq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Mar 2021 13:18:46 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:35543 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhC1RS3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Mar 2021 13:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1616951909; x=1648487909;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=c6s3GdekY5sl0ZyRTNIljGAgU0mzTPIY4Jit7VBh0ac=;
  b=NeRIDyADmkkjns/4JlRViYSZQSM36LvtSsyCnYVGaN5tmuljb88VEQR0
   boXeCwQOA0CzGFC5PCI6UqA/c6/SjxDmh8gxWO0BR45EzuYJPe6TwZP8c
   ystIgImJCln2ycLRR6ShXrWPhkYzzeaW1ktDPIHe+eIPMb2fHai41Qgbu
   XM+znJCkOx/Uplhl4OkDO7e8Jlh/Dg9hD0p3ZMfFi36wWiHWAyuxpgBYW
   zcSidiLN6htyBRWVcXVkUGWl/+ZzcgTnJyOVj2ys6bAxPVJ33ZjHF5YGu
   HosK1hd3pPbpAJ7HxIhlVvrFbboe1KY4k0wU8wtIS1iuM0z4R4jNe+RkN
   A==;
IronPort-SDR: jvdrK6woNdbWT+lZeNTe8wqJBQxtDAOMTnrMdC8b/Bp37ttsfCqUyH5eD3krrM9gl10QJm3pT8
 YcnxJPinm4UE5Tkd1C6sX8owmZ1nDDJlRyBmTWZ7vPg+fEaTst/uMt9rR2CJv6lJVBf76Z85ar
 ssulyFgxc30ABwIv94sU1G3eEgqewTvsUnry9pB/OEOzgP+FrEX5aq6oUG+/kHahHzE2PFyGw1
 OKcNWQbVNfLa7yX+5R+u9eVdulqQJUXn/TwU/UqfKE+ZWZn9uuoZsSJ0p2HCj5e01qAFwktytL
 dzY=
X-IronPort-AV: E=Sophos;i="5.81,285,1610434800"; 
   d="scan'208";a="120796370"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Mar 2021 10:18:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 28 Mar 2021 10:18:28 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Sun, 28 Mar 2021 10:18:25 -0700
References: <20210323131002.2418896-1-arnd@kernel.org> <CACRpkdZjh+z66XAxg4-Cj_Mz7iVkgpyY65nNTvUdOXV6yTknEQ@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Arnd Bergmann <arnd@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] pinctrl: microchip: fix array overflow
In-Reply-To: <CACRpkdZjh+z66XAxg4-Cj_Mz7iVkgpyY65nNTvUdOXV6yTknEQ@mail.gmail.com>
Date:   Sun, 28 Mar 2021 19:18:24 +0200
Message-ID: <87h7kv5h9b.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> On Tue, Mar 23, 2021 at 2:10 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Building with 'make W=1' shows an array overflow:
>>
>> drivers/pinctrl/pinctrl-microchip-sgpio.c: In function 'microchip_sgpio_irq_settype':
>> drivers/pinctrl/pinctrl-microchip-sgpio.c:154:39: error: array subscript 10 is above array bounds of 'const u8[10]' {aka 'const unsigned char[10]'} [-Werror=array-bounds]
>>   154 |  u32 regoff = priv->properties->regoff[rno] + off;
>>       |               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/pinctrl/pinctrl-microchip-sgpio.c:55:5: note: while referencing 'regoff'
>>    55 |  u8 regoff[MAXREG];
>>       |     ^~~~~~
>>
>> It's not clear to me what was meant here, my best guess is that the
>> offset should have been applied to the third argument instead of the
>> second.
>>
>> Fixes: be2dc859abd4 ("pinctrl: pinctrl-microchip-sgpio: Add irq support (for sparx5)")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Patch applied.
>
> Yours,
> Linus Walleij

I don't understand - I submitted a fix for this already in February
(reported by Gustavo). It took some time for you to get it ack'ed - but
you did (Feb 1st).

Did it end up getting dropped?

---Lars


--
Lars Povlsen,
Microchip
