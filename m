Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A2036C5F8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 14:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236009AbhD0MVL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 08:21:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33830 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235638AbhD0MVK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 08:21:10 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lbMhW-0004Z2-Ll; Tue, 27 Apr 2021 12:20:26 +0000
Subject: Re: [PATCH][next][V2] gpio: sim: Fix dereference of free'd pointer
 config
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210427114950.12739-1-colin.king@canonical.com>
 <CAHp75VeFmgOM_APt=pStkU03mP02VgCw0q31bpY7dFnJhKLn8w@mail.gmail.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <b80db02b-c940-bc6b-a795-82cd9ff43a6b@canonical.com>
Date:   Tue, 27 Apr 2021 13:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeFmgOM_APt=pStkU03mP02VgCw0q31bpY7dFnJhKLn8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/04/2021 13:11, Andy Shevchenko wrote:
> On Tue, Apr 27, 2021 at 2:49 PM Colin King <colin.king@canonical.com> wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The error return of config->id dereferences the kfree'd object config.
>> Fix this by using a temporary variable for the id to avoid this issue.
> 
> Thanks!
> I'm wondering how I missed this... Nevertheless
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
>> Addresses-Coverity: ("Read from pointer aftyer free")
> 
> after
> 

Can that be fixed before applying rather me sending a V3?

>> Fixes: a49d14276ac4 ("gpio: sim: allocate IDA numbers earlier")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>> V2: Don't make id local to the if statement to improve coding style.
>>     Thanks to Bartosz Golaszewski for this improvement suggestion.
>> ---
>>  drivers/gpio/gpio-sim.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
>> index 2e2e6399e453..b21541c0b700 100644
>> --- a/drivers/gpio/gpio-sim.c
>> +++ b/drivers/gpio/gpio-sim.c
>> @@ -744,20 +744,22 @@ static struct config_item *
>>  gpio_sim_config_make_item(struct config_group *group, const char *name)
>>  {
>>         struct gpio_sim_chip_config *config;
>> +       int id;
>>
>>         config = kzalloc(sizeof(*config), GFP_KERNEL);
>>         if (!config)
>>                 return ERR_PTR(-ENOMEM);
>>
>> -       config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
>> -       if (config->id < 0) {
>> +       id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
>> +       if (id < 0) {
>>                 kfree(config);
>> -               return ERR_PTR(config->id);
>> +               return ERR_PTR(id);
>>         }
>>
>>         config_item_init_type_name(&config->item, name,
>>                                    &gpio_sim_chip_config_type);
>>         config->num_lines = 1;
>> +       config->id = id;
>>         mutex_init(&config->lock);
>>
>>         return &config->item;
>> --
>> 2.30.2
>>
> 
> 

