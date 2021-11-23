Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC7B459F1E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 10:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbhKWJVz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 04:21:55 -0500
Received: from 5.mo576.mail-out.ovh.net ([46.105.43.105]:52471 "EHLO
        5.mo576.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhKWJVz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 04:21:55 -0500
X-Greylist: delayed 2402 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Nov 2021 04:21:55 EST
Received: from player760.ha.ovh.net (unknown [10.108.1.59])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id AFB5123398
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 08:01:36 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player760.ha.ovh.net (Postfix) with ESMTPSA id 833D4248E80D8;
        Tue, 23 Nov 2021 08:01:24 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-103G0056ece0eb7-f07f-494d-a27b-c882197c72b1,
                    D706F7BD768C0F9F2DF2043A8A15F237211B9500) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <bebaf4b1-5ee7-70a7-6eab-fae68beb6f4e@milecki.pl>
Date:   Tue, 23 Nov 2021 09:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <20211118132152.15722-1-zajec5@gmail.com>
 <20211118132152.15722-3-zajec5@gmail.com> <YZyahbYwMFz7baTu@atomide.com>
 <2fb0593a-208f-a732-843b-b6723633e208@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <2fb0593a-208f-a732-843b-b6723633e208@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11520207848665754458
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeehgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeetledugeejtdevheetieduhefgtedvgefftddvfedvieevjeegleffleegtdeunecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeeitddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23.11.2021 08:56, Rafał Miłecki wrote:
> On 23.11.2021 08:38, Tony Lindgren wrote:
>> The main problem using an index is that you need to keep it in sync
>> between the dts and device driver. And if a new SoC variant adds an entry
>> between the registers, you end up having to renumber the index.
> 
> I don't understand that part. That index ("reg" value in above example)
> is actual PIN number. It's expected to match hw datasheets. Order
> doesn't matter there.
> 
> If new hw revision adds PIN 2, I could just add pin@2 { ... };

Actually if you check
[PATCH 5/5] ARM: dts: BCM5301X: add pinctrl pins, groups & functions

you can see that first Northstar SoCs (BCM4708, BCM47081) didn't have
PINs 6, 7, 16, 17, 22 and 23 exposed. I define them only for
later-released Northstar SoC BCM4709 (bcm4709.dtsi).

That works just fine on my hw here.
