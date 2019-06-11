Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 167F03CEFB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389709AbfFKOj1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:39:27 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50123 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389484AbfFKOj1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 10:39:27 -0400
Received: from [192.168.1.110] ([95.118.191.213]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MvbO4-1giBtv3yKM-00sbZc; Tue, 11 Jun 2019 16:39:14 +0200
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
To:     Federico Vaga <federico.vaga@cern.ch>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pat Riehecky <riehecky@fnal.gov>,
        Alessandro Rubini <rubini@gnudd.com>
References: <20190603230604.30938-1-linus.walleij@linaro.org>
 <22282873.PltXLBtAh5@pcbe13614>
 <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
 <1726027.xYMg8yrU2x@harkonnen>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <9705d2dd-106c-553e-e76c-c35e338f6bce@metux.net>
Date:   Tue, 11 Jun 2019 16:39:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1726027.xYMg8yrU2x@harkonnen>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:2Hz4GKeWUIqMxbftAnmECeOx2sE+FLNzD62MA3MQi0XNvbYDgWf
 gamYzEGU6Rm+2H/HP2lr0vSzaMHWJpLnW74773hYYSKS7gcoe7CH8ZgHNryDcTwJa3Dujtb
 lASkmR3m4rMLBBSc7PQHxNIGhXQrA0mpf1PBua+uSNBnvlM+OAhA3i76kTS6d9+K6OpolA8
 p/P6tXxtP6FP8KJoWWoqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:80ROkAbu7lE=:0gxWrGLgYRLZgYb8q9LMSH
 2ycKQ/T3A6tcuaK0ecidXpjVWL913OW23EtzMTZoSKkCByWLbOruL9oSUC7bGxEbWUDep6tIP
 oYtrg6JjwXjLYgOKIsFUs9Q6P0Q/Yh4Nnd4fV5wM2Mxg4uSMwV9/ag0gs8ELEqUc1aw5cBWhm
 LVma3+fdz8s4BZcdUxp99vkJHpssk0lnRCDHLZlTc4Fg1yMKldqRUPjh3eh4Ef59Ha8nMwgMv
 e9I2O0VK8a4YGiHNSkQOEARgXJ6P8w6NlItHuW7AvnzXT+AH2pIP3y8w+X+mmar6sP1Xkt3O4
 VJEUX+vHi1I6VgKfs9BrwoFTx8ecIqExw36ssgkuz/VjKldiesL8OiG3rAAJLg1kLi7nyJaO+
 khFrBNAzVB0B/Y/CiOwGRZ3s9ga7XZQml/TP4P8B6RhW5I1CYHnwGT8sHBd8/uHs1eRoOpwtL
 U254VGp5THNqNrmPcaZQ6BM2FA7SyTp1/zIuytyQL2Yi26HM3BzEEcf9EaoImysbTMQZfbLRZ
 BtdWdgWDuO93UZfz/YgF9CyI9cUj/UTjKgag4ct2TczrjqSXRRgIyyu+tqygYdxe4Y67jLWmu
 ZRE6s8n3LDS1QonNANir9DZtlF8pFt7rqTC/HO8HGdb7ypjkuOhY/npgnspDeAvcaHRCgj0e0
 A1cSjMwlu/8CPOrXW3w0CMl0pyzZbSy3P0PdItrvqZKKm06QyyrmeC3W24o0G37s79UUuFHr8
 FCChdBa4kC/JCY0w9Xzw/hqDgxuOyS771P4Ua80Z/WdFT4FtZYKJj0c6m10=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.06.19 17:00, Federico Vaga wrote:

Hi,

>> Hm, it looks from your proposal like the FMC device core
>> is using its own hacks for i2c mastering, FPGA management
>> and irqchips. Does it also have its own GPIO implementation
>> not using struct gpio_chip from <linux/gpio/driver.h>?
> 
> The FMC subsystem has its own API for all those things.

Any plans to change that in the forseeable future ?

Is userland relying on that own implementation, or could it just
use standard gpio subsystem ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
