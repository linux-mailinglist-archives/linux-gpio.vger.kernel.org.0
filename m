Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C5F9A9A9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 10:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbfHWIH1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 04:07:27 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:38351 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731543AbfHWIH0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 04:07:26 -0400
Received: from [192.168.178.51] ([109.104.55.215]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MIcux-1i46zY2yQ9-00Ecz4; Fri, 23 Aug 2019 10:07:17 +0200
Subject: Re: [PATCH] pinctrl: bcm2835: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
References: <20190812062729.1892-1-linus.walleij@linaro.org>
 <CACRpkdbBaiVQ+BUNZEYNv6dGZjAbS=eA54dLTQ99Ngvbk7YQ9Q@mail.gmail.com>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <a82230ae-4f3a-2600-0bea-85c432c56d05@i2se.com>
Date:   Fri, 23 Aug 2019 10:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbBaiVQ+BUNZEYNv6dGZjAbS=eA54dLTQ99Ngvbk7YQ9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:IlhfUP/v0cOGMC6DwMmISufd6A6l/OuO/ButIksOAjQsEglQqeN
 nzBEwmq8q78WE0GLWfvC5hoIrnvKGRiACT3k8XQqOp6U9lZK9dAkjIMSig8uXdnxWOj8BgX
 nrDPqJX+rZDIMFcV5EHIMhGwZSgFZHS1ihahG6ZfiKHN+iO3RnY1ymzTIOC2aPxJSgXCz9v
 twcUQJBhn88VXy+5q/3oA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/QTGmZmkJyM=:/P+4LPBrpHIVA0h6Np+dMo
 QYOmt7mtJtATb3rAw1A8QsWS6EWpNU6V4H2uYkOngp4b+B4kHZAl4tVbmLVIzSfQLhXxgLkaZ
 5mqpAwNoBKcmZFv64BlGFOq8FszMphL2YMv2OCkFnKym1TP3gxCkaVBqVbMCSQU00DQ+Jrwsu
 CEojpIZ9W3Tfkbi2dBxmau0Fu5KZgehEcoqTAQBdgTFpEykaEHz80NOjzpkwhTfktGhRAXbZm
 6xTs6WVmEXJtHBnkWdQlBf7GCXQNKAGFlSrfMIYMadtyprLdTk6ywOgCpuWuiGcqglyKIrtOa
 yWF1zGJMewLCjcSUvdR4EL290cHwNNM+rjYxnS64wKKYpGNtJr0x7+nZO6aN5+aUMUzZVu6pY
 8DbLQgBf7LsB1yAPR00/pxeudAw+ACMlXXt84tmTs7mdVgK67hmtlo2run+tO14iNZA69wVlC
 OmdyctHAWBXxFQgHg2oy6Uy+mL8VVT3zymzXOqYa7GQ3z0qJxUtYtSWLkA9VOpVbA+FAREeVB
 0FvAWxWw8v0szKKTpbTfIC53cT2ygpxAE/MIxoAjTtFr6p5xQtX8/Fz3ucVQ3elTeTc8z3BDm
 +5qUpF3olyCUv5HI2fQ+9DyOgc0GWCQ9aK98sxx9/0forPC8MRSt29j3D22eZdepB3GOcBCPz
 5CjvVRTsNlIfUNRtjCYCP5r80jZLJymCq2Lb6FFs9I5HIh9GKsGuOdJJHO9SELb/PU4Ks31ND
 RRiAbhQC0S5jXSdt7O6XNYnsS/oBxr7aF5PiZCkAX5vZ1GcWA2D8JoUlTM4=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

[removed Simon from CC to stop annoy him]

On 23.08.19 09:46, Linus Walleij wrote:
> On Mon, Aug 12, 2019 at 8:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> We need to convert all old gpio irqchips to pass the irqchip
>> setup along when adding the gpio_chip. For more info see
>> drivers/gpio/TODO.
>>
>> For chained irqchips this is a pretty straight-forward
>> conversion. The BCM2835 has multiple parents so let's
>> exploit the new facility in the GPIO_IRQCHIP to actually
>> deal with multiple parents.
>>
>> Cc: Simon Arlott <simon@arlott.org>
>> Cc: Eric Anholt <eric@anholt.net>
>> Cc: Stefan Wahren <stefan.wahren@i2se.com>
>> Cc: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> This patch is a bit scary because I haven't tried converting multiple
> parents before. Any chance one of you RPi people could give it
> a test run, so you don't have to experience testing it in linux-next?

it's on my TODO list, but i didn't had the time to test it yet.

Can you give me some test ideas?

>
> Yours,
> Linus Walleij
