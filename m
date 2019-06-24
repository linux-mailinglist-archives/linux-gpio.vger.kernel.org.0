Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A04851A69
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 20:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732776AbfFXSXR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 14:23:17 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:44361 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFXSXR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 14:23:17 -0400
Received: from [192.168.1.110] ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M9Wqa-1hc9gp1oDk-005WqO; Mon, 24 Jun 2019 20:22:47 +0200
Subject: Re: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before
 devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
 <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
 <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
Date:   Mon, 24 Jun 2019 20:22:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZgmkRGHs7Dk+by07gKqk33wnZnw8jFOEY7Mzgtc3URhPyCvBCsp
 L7tXD4MeY3Xax46GIB0/blF9/NGjT6pAdIcNuaiXYy+qpAvnxV38nbKkqLmxD5l1e0ffUxg
 cGc1gvVDpkaV2vKyS+EHGXs00cgG7Bp6N5otI5l/92GnSozO9QX52qTDnFOzOAHaLVbEztt
 yimvgXuW6f0pYDq6sgQvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JQHY8EkLn+M=:lJVSEKZy2Nz4CNNSOqZUni
 EqeYGj7M4IwCCw1HCbCW3SUiu7ZTdr7RPEedoSpwkDfh13u5+kQSble5vLGiCAiK0teAIkOI7
 llvxXVKhZXASP0VcRyPao9P21+vNMyOKoub8/JrM1YhDERUMe3pXNpi96YwHB9abnjK2EnrLW
 zuTEPB2A7QLq9RSeDh2mTbGps1v9B3bGdpC8W7b1cwmI3NhHD6JWH0OY8czisXQt/GKrTz64/
 MYfi/0mKuzwT9FaITglKSHfH1YakogstwdpPj6OAElm3PW6DaVdBl0vF6C4jWPZeczqsNc+2d
 Guk1BCLf5Skdl1PdW/sk1oszu8DcEawwqZS52osidlchQNxeHJBrIyVIXidlK46tRF+JGNRKV
 vaxHjrPds05TGoQa7NiKIhp19eldmo6o+77fVnHrFhWQ70ccJrd6TZXnTOoxhCxVz+Z18hqQc
 Ox/OKf6XnAWhze2iTRyV04Of3IroXksK/VazvPdCl4CgFIQsNzE4jQLufL0nvnF/kpcNS5aza
 t5bTvRbUSYmKtXwaEyGgWCeP4+vlqAts+/BZhQLXmrc08sNUKCDggXa+fi7RiB/M83shvNzHR
 aqQ/V8vqkSAcDXWu1FlZ9dHqG9DkcLuk7ib4qZf15xbvXNHP4E4A0qgLRVl0DxXVMw+G1zRkU
 IFRtpyPnNmRoVgYpyr/eFvTCZ+RyExHBlbh3HUL5h5EnX/GNb7dntJskgj4ZTMPatHHlUinJ8
 mqHEgn3KBHEbmn7MvQWhWAaS9oly8yjDi9T/7ZpzNpTaniJUupJ71kFvkuU=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24.06.19 12:46, Bartosz Golaszewski wrote:

>> The patch seems pretty trivial and doesn't change any actual code, so
>> I don't see hard resons for rejecting it.
>>
> 
> In its current form it makes the code even less readable. The #ifdef
> should actually be one line lower and touch the comment instead of the
> EXPORT_SYMBOL() related to a different function.

Okay, that missing newline should be fixed (as well as the extra one
after the #ifdef). Besides that, I don't see any further problems.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
