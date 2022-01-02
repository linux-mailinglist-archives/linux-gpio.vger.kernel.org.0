Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F10C482ACB
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jan 2022 12:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbiABLC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jan 2022 06:02:29 -0500
Received: from mout.web.de ([217.72.192.78]:58757 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232252AbiABLC2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 2 Jan 2022 06:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1641121326;
        bh=o9/iGTIAAechCaXM9XMWgwj5X2jiZZNXqNsPXLVesSk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=nP/U86GMUfMy+XYZ200HRtMZMKzfh2lt+tyCd7UsMdtn5FCZko0Jv3194pK9uHLfd
         yD6Ie4lPU5Jpp46EuHIwOezsnVQlZgZkjar7gVZytuNTLnUTHIDEavYWzVCkVHHSkJ
         CQkOe4xHVIZahmng27gYIJ8FHUbP0Pdy5wY41NO0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Ml4B4-1mgmPa0Oom-00lIgi; Sun, 02
 Jan 2022 12:02:06 +0100
Message-ID: <ec8090b6-6c91-e9ae-fd02-955c8c10ee3e@web.de>
Date:   Sun, 2 Jan 2022 12:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] pinctrl: bcm2835: Change init order for gpio hogs
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-2-phil@raspberrypi.com>
 <CACRpkdZ95bCJVDo4tCXsMnsXax4+ZydoLS7AsM-yzMjXbONk=w@mail.gmail.com>
 <95851343-2887-1e04-9598-e8c8ae74a99a@i2se.com>
 <CACRpkdbnqq+hwXt1oUWZfyxFjdd4aSAz0MzhzYVWuqqVAe4Eig@mail.gmail.com>
From:   Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <CACRpkdbnqq+hwXt1oUWZfyxFjdd4aSAz0MzhzYVWuqqVAe4Eig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eIyfrdPQ516qo3n8IxIQtHdsNh7CqTTKKJ5FW7gv8VI4GiCPn7U
 xTxWX0LttcxmLsKg1BSCMlCz/bGis0/s8ZuXpNbpH1aDiDt680UYcjUS9rgJbS1l96kc8ZU
 LMZQ+BkQ1grTiIMu0QiyMC9oYpwANNzTrBXWPFZJ+9gtpvMdk/hVQY6Zj6gGAmT+rdgKmNf
 Cu+UdZ3YuTH+MK6RGn07g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:krQjnMibSNo=:Ycj4DldS4pgy0YZGEUVcaF
 cP2+vwwGptvnS/3WjVqNbfs5N1R7bP+bGloirCDwerczPrLHH4hta+ZzQ/b80o21fj/2ljZBL
 3SLurgRmWhjKYF1yvb5+pDz87it3cli0PXlJQiCagjmtum1ve1rGLVDAwrp6UseOzpNnWRDqH
 UeSm/feJ13FvLqlpRWJXM9Ok/GUZ+Tvf/Jcy+wtDqYne63HgPkHB4+/DS+P374T3qZVbqj4SC
 U4eJKggNOp8ao8SAIEOdg/sG4tSaoCNZwBJqQrETI5PxmO3mIGkjFCKo7qDzxPxgCQ1sDuh0W
 sTeWpIvc9slmXm4nZ2yb/sfnpiUzgSgyZZW7oiASr5ELn/s/6Q5rzA9MXho0SQqkzYNKf6x6S
 ctByuizm6Xq7slua2dmv+5QJWa05HEYxUs1PqcNWt4MxE0NnO7yPHAeBOfQPecwlxnuSEW8GE
 a1/AJBze3jLOxKAVHBbHeIpnyQcGM4GLkko1yzZ4jUKy1WYozAgLHEBOAe64OGC/A6YikcmDH
 Tmg4U/dtAM2PGbSIeSw6091D08bwZ/jHgJOuTAZrkuWGOY1nVgDUVnDKIEeaEvapWyUHJ8PMx
 2oycUDxreNVgl98o7wffXdGwodFqfQsdLCfmZR5wiriCmK7G01tlJXQ9E7L23jL16YO8iX01+
 vL2/2INEGQBik7syJ8rGZ/lSG4PVZRNRZCT+QcS8vpZn2rxuzYPcQ+aPKwVhqEixbGdRcmFqm
 NHMYz3RFi6xQggCY1WlIO9ToTsd1VPhKHc4Wc0YZTHg2NtHLJY2tVyvJWMGCRz/3Ns/iOEa0P
 lviwn+7SbmaDZPc0K8/rXuOQ1BkuERhuWPs6SBSsM2Rp8aAP7RybSj/Z2wZxNfshRFJ3kwyqt
 TPrqdLeiuzCQXhTbzg6266nsOnp/uuXOdjYJ6G7Y2FqK/K/b87UKkOz5mY6Kw6N0giT7UmyQp
 Pd1OiZnPLxx5kllxv+pCB68qHHsc83ibaOrcP4HQ6CEkMRYa3E3vm6V7KNENSR++x9xahyqTO
 3bu+Y+JV8/vy0c8IeSkRJEDlLE2GWpNdlD4VZLr2TfmsJbViW3oMc1+i7G81JKxu1tfrkxz4O
 GMrSoTmau5qz4Y=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02.01.22 07:54, Linus Walleij wrote:
> On Wed, Dec 29, 2021 at 8:07 PM Stefan Wahren <stefan.wahren@i2se.com> w=
rote:
>> Am 10.12.21 um 00:24 schrieb Linus Walleij:
>>> On Mon, Dec 6, 2021 at 10:22 AM Phil Elwell <phil@raspberrypi.com> wro=
te:
>>>
>>>> ...and gpio-ranges
>>>>
>>>> pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the gpio
>>>> side is registered first, but this breaks gpio hogs (which are
>>>> configured during gpiochip_add_data). Part of the hog initialisation
>>>> is a call to pinctrl_gpio_request, and since the pinctrl driver hasn'=
t
>>>> yet been registered this results in an -EPROBE_DEFER from which it ca=
n
>>>> never recover.
>>>>
>>>> Change the initialisation sequence to register the pinctrl driver
>>>> first.
>>>>
>>>> This also solves a similar problem with the gpio-ranges property, whi=
ch
>>>> is required in order for released pins to be returned to inputs.
>>>>
>>>> Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding gpi=
ochip")
>>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>> This patch (1/2) applied for fixes.
>>
>> Unfortunately this change breaks all GPIO LEDs at least on the Raspberr=
y
>> Pi 3 Plus (Linux 5.16-rc7, multi_v7_defconfig). The ACT LED for instanc=
e
>> stays in the last state instead of the configured heartbeat behavior.
>> Also there are no GPIO LEDs in /sys/class/leds/ directory.
>>
>> After reverting this change everything is back to normal.
>
> Oh what a mess. OK I reverted the fix.
>

I happened to debug this regression as well: The issue of the patch
seems to be that it initializes gpio_range.base with -1, because
gpio_chip.base is not yet set at this point. Maybe that can be achieved
differently, to please all cases.

Jan
