Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224122AD806
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbgKJNwH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:52:07 -0500
Received: from gecko.sbs.de ([194.138.37.40]:48691 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgKJNwG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 08:52:06 -0500
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AADpuQ6009455
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 14:51:56 +0100
Received: from [167.87.33.169] ([167.87.33.169])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AADptJ8022405;
        Tue, 10 Nov 2020 14:51:55 +0100
Subject: Re: [PATCH v3 6/7] gpio: exar: switch to using regmap
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20201110123406.3261-1-brgl@bgdev.pl>
 <20201110123406.3261-7-brgl@bgdev.pl>
 <7f890933-71a7-28d5-75ae-8d80d6a67ff5@siemens.com>
 <CAMpxmJXiuuRu0A=GPaqBg=YbW=nQX4WrBm9e-3SOkFuaT0rEFw@mail.gmail.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <aacaecb9-c493-ed72-58d1-09cfc561e55a@siemens.com>
Date:   Tue, 10 Nov 2020 14:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJXiuuRu0A=GPaqBg=YbW=nQX4WrBm9e-3SOkFuaT0rEFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 10.11.20 14:29, Bartosz Golaszewski wrote:
> On Tue, Nov 10, 2020 at 2:23 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>>
>> Unfortunately, this one still crashes:
>>
> 
> Just to confirm: does patch 5/7 alone work?
> 

Yes, I've bisected.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
