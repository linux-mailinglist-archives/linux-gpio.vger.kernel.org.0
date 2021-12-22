Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41B947D419
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 16:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343651AbhLVPGQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 10:06:16 -0500
Received: from 12.mo584.mail-out.ovh.net ([178.33.104.253]:53497 "EHLO
        12.mo584.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237278AbhLVPGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 10:06:16 -0500
X-Greylist: delayed 4201 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Dec 2021 10:06:15 EST
Received: from player697.ha.ovh.net (unknown [10.109.138.131])
        by mo584.mail-out.ovh.net (Postfix) with ESMTP id 1FC9123F87
        for <linux-gpio@vger.kernel.org>; Wed, 22 Dec 2021 10:19:33 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player697.ha.ovh.net (Postfix) with ESMTPSA id 1566C259FCBD8;
        Wed, 22 Dec 2021 10:19:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-95G001a689c156-e058-42a6-b166-e0767804b57e,
                    4D88ED99DEC4E8A5F70677C20256D8F202EDB5AA) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <c17724bc-2d5a-7c70-4aea-899ff3665b73@milecki.pl>
Date:   Wed, 22 Dec 2021 11:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20211215204753.5956-1-zajec5@gmail.com>
 <20211215204753.5956-2-zajec5@gmail.com>
 <CAHp75Vcu2JLE2w8LkGO9i1kL6-stL6nXsG6Ghnk0af4amY---A@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <CAHp75Vcu2JLE2w8LkGO9i1kL6-stL6nXsG6Ghnk0af4amY---A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18137121601872112474
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtiedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeetledugeejtdevheetieduhefgtedvgefftddvfedvieevjeegleffleegtdeunecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16.12.2021 20:55, Andy Shevchenko wrote:
>> +/*
>> + * Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl>
>> + */
> 
> One line?

I don't think there's a rule for that. Not in coding-style.rst as much
as I'm aware of. checkpatch.pl also doesn't complain.


>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/pinctrl/pinctrl.h>
>> +#include <linux/pinctrl/pinmux.h>
> 
> Can you move this group...
> 
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
> 
> ...here?

Any reason for that? For most of the time I keep my includes sorted
alphabetically. Now I checked coding-style.rst is actually seems to
recomment "clang-format" for the same reason: sorting includes.


>> +#define TEST_PORT_BLOCK_EN_LSB                 0x00
>> +#define TEST_PORT_BLOCK_DATA_MSB               0x04
>> +#define TEST_PORT_BLOCK_DATA_LSB               0x08
>> +#define  TEST_PORT_LSB_PINMUX_DATA_SHIFT       12
>> +#define TEST_PORT_COMMAND                      0x0c
>> +#define  TEST_PORT_CMD_LOAD_MUX_REG            0x00000021
> 
> The prefix of all above doesn't match the module name.

Those are register names as in Broadcom's documentation. I don't think
those names can conflict with any included header defines but I can
change it.


>> +struct bcm4908_pinctrl_grp {
>> +       const char *name;
>> +       const struct bcm4908_pinctrl_pin_setup *pins;
>> +       const unsigned int num_pins;
>> +};
> 
> Why not to (re)use struct group_desc?

It's because "struct group_desc" has @pins that I can't fill statically
as I need struct instead of int.

I also need struct field for "const struct bcm4908_pinctrl_pin_setup"
and "void *data" doesn't fit that purpsose 100% because:
1. It's a void
2. It's not static


>> +       /* Set pinctrl properties */
>> +
> 
> Here and everywhere else, please drop redundant blank line.

No clear kernel rule for that.

I use blank line to indicate / suggest that comment applies to more than
just a single line that follows.


>> +static struct platform_driver bcm4908_pinctrl_driver = {
>> +       .probe = bcm4908_pinctrl_probe,
>> +       .driver = {
>> +               .name = "bcm4908-pinctrl",
>> +               .of_match_table = bcm4908_pinctrl_of_match_table,
>> +       },
>> +};
> 
>> +
> 
> No need.
> 
>> +module_platform_driver(bcm4908_pinctrl_driver);

You have 1344 other source files with empty line above
module_platform_driver(). coding-style.rst says to "separate functions
with one blank line". Are we supposed to argue now whether a macro can
be considered a functio nor not?

grep -B 1 -r "module_platform_driver" drivers/* | egrep -c "\.c-$"
1344
