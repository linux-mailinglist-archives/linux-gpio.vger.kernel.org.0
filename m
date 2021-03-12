Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422A8338D77
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 13:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhCLMtM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 07:49:12 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:39327 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbhCLMtD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 07:49:03 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lKhDx-0004cD-6x; Fri, 12 Mar 2021 12:49:01 +0000
Subject: Re: pinctrl: core: Handling pinmux and pinconf separately
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d66e78e3-2000-611b-cd74-8a61461153e8@canonical.com>
 <5c08bd61-688f-e95b-5fa3-584f190ed4bf@xilinx.com>
 <bf508c29-4a51-5f97-8459-06c1fe74b60f@canonical.com>
 <CAHp75VcEU=Axi7k41rUxps4LehEzbG12z410VVBbwPtMCbJHrQ@mail.gmail.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <fb1cc121-9333-f42d-5d9c-c4cae1851017@canonical.com>
Date:   Fri, 12 Mar 2021 12:49:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcEU=Axi7k41rUxps4LehEzbG12z410VVBbwPtMCbJHrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/03/2021 12:45, Andy Shevchenko wrote:
> On Thu, Mar 11, 2021 at 1:26 PM Colin Ian King <colin.king@canonical.com> wrote:
>> On 11/03/2021 11:16, Michal Simek wrote:
>>> On 3/11/21 11:57 AM, Colin Ian King wrote:
> 
>>>> For the PIN_MAP_TYPE_CONFIGS_PIN and PIN_MAP_TYPE_CONFIGS_GROUP
>>>> setting->type cases the loop can break out with ret not being set. Since
>>>> ret has not been initialized it the ret < 0 check is checking against an
>>>> uninitialized value.
>>>>
>>>> I was not sure if the PIN_MAP_TYPE_CONFIGS_PIN and
>>>> PIN_MAP_TYPE_CONFIGS_GROUP cases should be setting ret and if so, what
>>>> the value of ret should be set to (is it an error condition or not?). Or
>>>> should ret be initialized to 0 or a default error value at the start of
>>>> the function.
>>>>
>>>> Hence I'm reporting this issue.
>>>
>>> What about this? Is this passing static analysis?
>>
>> It will take me 2 hours to re-run the analysis, but from eyeballing the
>> code I think the assignments will fix this.
> 
> It surprises me that tools in the 21st century can't run on a subset
> of the data.
> 
> Had you filed a bug to the Coverity team that they will provide a way
> to rerun analysis on a subset of the data?

It can. However I need to keep copies of the entire build to do this and
I build many different kernels (hence lots of storage required) and
rarely do minor change + rebuilds, so I don't cater for this in my test
build environment.

> 
> 

