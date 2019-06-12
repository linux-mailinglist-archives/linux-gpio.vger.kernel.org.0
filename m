Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A973427C2
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 15:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730638AbfFLNhs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 09:37:48 -0400
Received: from anchovy3.45ru.net.au ([203.30.46.155]:58369 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfFLNhr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 09:37:47 -0400
Received: (qmail 22797 invoked by uid 5089); 12 Jun 2019 13:37:45 -0000
Received: by simscan 1.2.0 ppid: 22733, pid: 22734, t: 0.0504s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?10.1.1.129?) (preid@electromag.com.au@118.209.181.81)
  by anchovy2.45ru.net.au with ESMTPA; 12 Jun 2019 13:37:45 -0000
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio
 configuration
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <09bd2a7d-3da5-3158-0fae-d80c4d3e9998@electromag.com.au>
 <9a9a7fc5-022d-340b-1bc1-c3e050f05b7e@metux.net>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <f3ade200-8a0f-ee61-bdce-551c2cb8779d@electromag.com.au>
Date:   Wed, 12 Jun 2019 21:37:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9a9a7fc5-022d-340b-1bc1-c3e050f05b7e@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/06/2019 20:32, Enrico Weigelt, metux IT consult wrote:
>>> +#include <linux/gpio.h>
>> This is a legacy header.
>> You probably want to include <linux/gpio/driver.h>
> Just counted 754 cases of such includes, 289 in arch, 345 in drivers.
> 
> Shall them be replaced ? Or is the new include only meant for gpio
> *drivers*  ?
> 
G'day Enrico,

Yes they should all be replaced at some stage. from the header in question:

  * <linux/gpio.h>
  *
  * This is the LEGACY GPIO bulk include file, including legacy APIs. It is
  * used for GPIO drivers still referencing the global GPIO numberspace,
  * and should not be included in new code.
  *
  * If you're implementing a GPIO driver, only include <linux/gpio/driver.h>
  * If you're implementing a GPIO consumer, only include <linux/gpio/consumer.h>

-- 
Regards
Phil Reid
