Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1978C56F84
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 19:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbfFZRbf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 13:31:35 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:54289 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfFZRbf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 13:31:35 -0400
Received: from [192.168.1.110] ([77.4.50.183]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MfZ9C-1iD3bn302q-00fxyE; Wed, 26 Jun 2019 19:31:31 +0200
Subject: Re: [PATCH 1/2] siox: add helper macro to simplify driver
 registration
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        t.scherer@eckelmann.de
References: <1561354834-22617-1-git-send-email-info@metux.net>
 <1561354834-22617-2-git-send-email-info@metux.net>
 <CACRpkdbZ68O41dx7uCccUF_jvmC3_YVvWEEo9igknMC95QEXhQ@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <c59bfd61-e6f2-2434-0085-f75e85b5deb0@metux.net>
Date:   Wed, 26 Jun 2019 19:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdbZ68O41dx7uCccUF_jvmC3_YVvWEEo9igknMC95QEXhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:D+qaod/gY3lxTsAGn7wxZA/4ZJMGxEPhRPb4cAtIK9dTVoHeULo
 9r5GA/tOo/N5TfjrQf2yuz5/PiWTnPYq+0ZlAHgw2kUCAtYDWtBbeYIck6ysZVjEl61lsXV
 57OGScr6eAQ3n8QoJVvXRKG4HxY4RXzjCJDXD2ulmJ/aOiDcQhsKfogVzDUF8wjODvQiGO+
 BVxg8bICsSaYNwMyQWalQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y/6NBZ6zpTI=:5kr/Jaw8pAeb09qLSQetrr
 Pt/y8jIU0DL4yEcXIZuhFyUIWdyq9jWqj/PHjjzcUfYQVUSNWi/zDAR9Kg8d6vr/bwlPeWMfW
 EEdNILCZPU6tA+IeD7O6nXkWWFMZ9c8PasoAK4rrtFSepHBjsYrazp39LlFOqNsidwiBqdc+V
 sBMYPonBh8HmZhcbgFhvqiX8PrY+uk1MTNYPH+g5m/JJopVOjOirxBeYk0GnnxcdIFzLkX9JU
 EINKP4nTBldzEDbnYwhYjPT1RXcNZvGStVXicIE/0Dd/PGIrA2dAN8Qf+Q5riL+pAOIBIhw92
 lHU5+/qAhvTifS2Vk/FTb4wCvdIgbfJ0bIsYiVmMfQAJTzpxz49Cr14R58M6YB6YG8iP6kx2F
 D08DWETEXk9YagkWyH3XXTS67m2Fqf3YtzOLxok18Fg5qEVNoz0M6oKMn5zh/Or3u2RElBMY/
 fBalxpNx8lHepaMaIZ3jhvlPZmPqMXXaQ84FD+B8LZpufXGnj1BXnndu6OZx7tF9Zyv97aagD
 uLeS2WMfy9KVqQJiLRhSzQeEaPwfL9zRWRiBrurxItjof4ejHUbuuFKeDG7IgoxyOxiaWHKOj
 r5mEigYO0FJLE1MOV0f+zWncB/54L35qvn0SQn3SVr1ma9scBQdFkSpfqG72sjIn4zGqg672W
 ORDthyTXTcqTcXH4BTvc/1iXi92DOba5OPjZMOb7kVeQnowFYbTCjUvpNFPTRWVwy1ahsNAy6
 tOVoFVRoOKMhXXgRQAAC9B8b4lawoy2AviP4/c/vwFj5W5Sg+hXdFlbXQJQ=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25.06.19 11:26, Linus Walleij wrote:
> On Mon, Jun 24, 2019 at 7:40 AM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
> 
>> From: Enrico Weigelt <info@metux.net>
>>
>> Add more helper macros for trivial driver init cases, similar to the
>> already existing module_platform_driver() or module_i2c_driver().
>>
>> This helps to reduce driver init boilerplate.
>>
>> Signed-off-by: Enrico Weigelt <info@metux.net>
> 
> Patch applied with Uwe's ACK.

thanks to both of you :)

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
