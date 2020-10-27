Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0104C29B6CF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 16:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759214AbgJ0P0x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 11:26:53 -0400
Received: from gecko.sbs.de ([194.138.37.40]:48338 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1797244AbgJ0PWZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Oct 2020 11:22:25 -0400
X-Greylist: delayed 570 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Oct 2020 11:22:25 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RFCk7M000972
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Oct 2020 16:12:46 +0100
Received: from [139.25.68.37] ([139.25.68.37])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RFCkiQ015696;
        Tue, 27 Oct 2020 16:12:46 +0100
Subject: Re: [PATCH 0/7] gpio: exar: refactor the driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201026141839.28536-1-brgl@bgdev.pl>
 <CAHp75Vf07dsUXZ8Dr-KY-NFQv+C2QQVEOH_se7vYMT6hdm-U3Q@mail.gmail.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1fd4d69b-4d64-05e5-45a3-b2182fb2d207@siemens.com>
Date:   Tue, 27 Oct 2020 16:12:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf07dsUXZ8Dr-KY-NFQv+C2QQVEOH_se7vYMT6hdm-U3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26.10.20 15:46, Andy Shevchenko wrote:
> On Mon, Oct 26, 2020 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> I just wanted to convert the driver to using simpler IDA API but ended up
>> quickly converting it to using regmap. Unfortunately I don't have the HW
>> to test it so marking the patches that introduce functional change as RFT
>> and Cc'ing the original author.
> 
> +Cc: Jan, AFAIR their devices are using Exar UART.
> 

Thanks for CC'ing. I cannot promise testing this soon, but I will try my
best.

Jan

>> Bartosz Golaszewski (7):
>>   gpio: exar: add a newline after the copyright notice
>>   gpio: exar: include idr.h
>>   gpio: exar: switch to a simpler IDA interface
>>   gpio: exar: use a helper variable for &pdev->dev
>>   gpio: exar: unduplicate address and offset computation
>>   gpio: exar: switch to using regmap
>>   gpio: exar: use devm action for freeing the IDA and drop remove()
>>
>>  drivers/gpio/Kconfig     |   1 +
>>  drivers/gpio/gpio-exar.c | 155 +++++++++++++++++++--------------------
>>  2 files changed, 77 insertions(+), 79 deletions(-)
>>
>> --
>> 2.29.1
>>
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
