Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53499471394
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Dec 2021 12:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhLKLXp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Dec 2021 06:23:45 -0500
Received: from 10.mo576.mail-out.ovh.net ([46.105.73.241]:39547 "EHLO
        10.mo576.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhLKLXo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Dec 2021 06:23:44 -0500
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 Dec 2021 06:23:44 EST
Received: from player728.ha.ovh.net (unknown [10.109.146.82])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id B9C1C232E6
        for <linux-gpio@vger.kernel.org>; Sat, 11 Dec 2021 11:16:38 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player728.ha.ovh.net (Postfix) with ESMTPSA id AFDED252FE6FB;
        Sat, 11 Dec 2021 11:16:26 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-106R006ee68d690-281d-46cf-ab24-dc9207cedc87,
                    9D51A9F3B5077230D84BA813E842FC785A50A294) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <cadb38fd-a193-2706-b20e-2a1e5e64f9ca@milecki.pl>
Date:   Sat, 11 Dec 2021 12:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: support specifying pins,
 groups & functions
To:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <20211210114222.26581-1-zajec5@gmail.com>
 <20211210114222.26581-2-zajec5@gmail.com>
 <CACRpkdbsb63EN5hmGws1eLaARg2VRXXhz+5AM_x7OhaS_ceGow@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <CACRpkdbsb63EN5hmGws1eLaARg2VRXXhz+5AM_x7OhaS_ceGow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9842054038587550554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeeggddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeekieetveettefftdefjeffffefgfefveelffevvdevffelleeiteejieeghfekjeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjedvkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rob: please kindly comment on this idea of storing pins/groups/functions
in DT.

For a sample Linux implementation you can check (incomplete):
[PATCH V2 4/6] pinctrl: support reading pins, groups & functions from DT
https://patchwork.ozlabs.org/project/linux-gpio/patch/20211124230439.17531-5-zajec5@gmail.com/

For a real life DT usage you can check:
[PATCH V2 6/6] ARM: dts: BCM5301X: add pinctrl pins, groups & functions
https://patchwork.ozlabs.org/project/linux-gpio/patch/20211124230439.17531-7-zajec5@gmail.com/

Also see below inline comments.


On 11.12.2021 00:26, Linus Walleij wrote:
> On Fri, Dec 10, 2021 at 12:42 PM Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> This binding change is meant to introduce a generic way of describing
>> pinctrl blocks details. Every pinmux block is expected to have:
>> 1. Named pins
>> 2. Named groups containing one or more pins
>> 3. Named functions referencing one or more groups
>>
>> It doesn't describe how hw should be programmed. That remains binding
>> and driver specific.
> 
> So what this does is to take a large chunk of data that we known to be
> associated with the compatible string (names of pins, groups and functions,
> etc) and put it into the device tree instead of the alternative, which is
> what most drivers do, and that is to compile in the data into the
> operating system and just look it up by using a compatible
> string.

Correct. It changes the place of storing platform specific data.


> The DT maintainers have already indicated that this is not desirable
> and I don't see it getting merged before it has a Reviewed-by
> tag from one of the DT binding maintainers.

Tony pointed out that it was back in 2011. It's worth reconsidering.
https://patchwork.ozlabs.org/comment/2786915/

Rob said it depends on whether "data be static (complete) and correct"
https://patchwork.ozlabs.org/comment/2786688/

I find it absolutely required to get Rob's Reviewed-by before we merge
it. I hope we can get Rob's opinion on this.


> I think we need to know what the USP (unique selling point) is?
> 
> Would it be something like not having to duplicate work across some
> boot loaders and operating systems? (Well they all need to parse this
> type of description but that can be put into a library.)
> 
> Or something else?

There are two reasons for me to work on this binding:


1. I think it's cleaner to keep pinctrl details in DT

DT seems more natural (than C code) for:
a) Translating info from datasheets
b) Storing pin/group/function custom values
c) Defining relations (phandles)
d) Handling chip differences (adding new pins in newer revisions)

Last time I learnt that pins don't always/usually have numbers (in
datasheets) but are rather named. Still in the "pinctrl_pin_desc" we
have "unsigned number" just to enumerate them and reference in groups.

Adding or removing pins/groups/functions in DT is as simple as
adding/deleting nodes. That also means less logic in C code.


2. It avoids data duplication

It allows me to keep pins/groups/functions data in one place (DT) and
use it in both: Linux and U-Boot. No duplication & easier maintenance.
