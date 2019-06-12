Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDE2426D7
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 15:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436598AbfFLM7z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 08:59:55 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39975 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbfFLM7z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 08:59:55 -0400
Received: from [192.168.1.110] ([95.115.5.111]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mv2tE-1iRdVO1xvE-00r0Gw; Wed, 12 Jun 2019 14:59:42 +0200
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio
 configuration
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
To:     Phil Reid <preid@electromag.com.au>,
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
Organization: metux IT consult
Message-ID: <185aefe0-689e-d6e7-b6c2-9ca0c7ff0714@metux.net>
Date:   Wed, 12 Jun 2019 14:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <9a9a7fc5-022d-340b-1bc1-c3e050f05b7e@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:VYmMtCKQJlpFtQQP3bmySgOLUjKq0I7feKu+SBIvIozu5MqZYE7
 cTvNV2NdDxBSrtB0MWJaXXSK8OQ0X25Nc1boGdnbmx9W1sonjxJcYn4Up7yIJLF6esGzoJ8
 1SYQ71DcAr2yMYo0etLUZn7yJrs+011PsznynW83lsz6SCkrXyJuv1qvgd2HuTZ24UkkKc9
 HyCr8mLZeXCzWVAKHrfbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tg5SDUpLhek=:rgHm1zQ3rjReLZFj0ectp9
 rhf1bnAId8HUujyVWSg+vZODSrl2HLH5bNf4DS+NcK1VoGHRnNKFGJpdxuWGHg6rre5EWlpFZ
 oyJ5lid6KhizZaom7+5qp//lFYYTwAgWvS7q+M5wUs2s0R0w4ikiR2uxk4g4tmzldbEGqyEqY
 XuYunrznQJrl2TbzVsA3gNTYgUq4D5ZnAYGdqB6QsXj2FqZbeFVX6yPii8wQ935Kg7VKMed7c
 TVki1WL5G+YWnW4x5ivpT0rB6mcW481qn0xvSgStFG8P9DIGN1fHF9VfMcxjZd0o3Rv1X6ZIH
 bGfR0wdIBf00h1XBBeBjg5Zn8SSiWcYaVkxjKqcjJQEj8sLJZHc5iAOC4uw/3d44VE5KLdgNA
 GIWWDJkrhQXywh9ngXSJ/b6sRbHDFY1Vum/ZbEYevOGwqkfUJ7NkGoMxylslBWOLQQ75u7gTU
 VJ+5qD8KURT+Ro2JnRb6F0xg2FpO3UY/ckYghs7obylg2HSCvOxeU9xYKBA60jtQ8xqt9a+7C
 7eyQP6nV4XybTAEFW/loeTPEfLLKQK0eNH/V5GcGZLnAEYmynblpoUss6KQPEYtm2WUCGrYWq
 L7F20Jnj3IjD0EjsUoHDsoOAfZ2gX2/8rxn1BrbZKGXXIHNjZfDXEuA53nYl9RV4HBWQM6cbK
 NnZVBm0FYQe3wY5TzdoMpvlHewvMFMTZHz/+JCzHiMKsFVOdeyzDv1uIAyz0yxGDDnDvZq+V9
 1+pnn5RHT1mjAqIG2IXGRLWzmfJfRY+GfZJKpa+z6aPGaR8aKvwYLwqS6uk=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12.06.19 14:32, Enrico Weigelt, metux IT consult wrote:
> 
> IMHO, we should introduce a macro for that, similar to
> module_i2c_driver()+friends.

ups, we already have one for this case:

module_platform_driver() - defined in include/linux/platform_device.h

The logic is: just leave off the gpio_inverter_init() and
gpio_inverter_exit() functions and instead call the macro:

module_platform_driver(gpio_inverter_driver);

This macro call automatically defines the init/exit boilerplate,
so you don't need to write it on your own anymore.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
