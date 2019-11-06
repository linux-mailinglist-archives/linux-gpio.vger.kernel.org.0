Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB2C5F1FDF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 21:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfKFU2W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 15:28:22 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38878 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbfKFU2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 15:28:21 -0500
Received: from [IPv6:2a00:5f00:102:0:5c62:8eff:fefa:67] (unknown [IPv6:2a00:5f00:102:0:5c62:8eff:fefa:67])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 624032902CE;
        Wed,  6 Nov 2019 20:28:19 +0000 (GMT)
Subject: Re: [PATCH] gpio: xgs-iproc: Fix section mismatch on device tree
 match table
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20191105124915.34100-1-broonie@kernel.org>
 <TYAPR01MB45442B7135422BA8D088E29CD8790@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <7057fc47ded887fb2780332739afba53e3c33e4a.camel@alliedtelesis.co.nz>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <0ebb6b2c-52d4-bb53-cb85-1a97adde9249@collabora.com>
Date:   Wed, 6 Nov 2019 20:28:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7057fc47ded887fb2780332739afba53e3c33e4a.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/11/2019 19:49, Chris Packham wrote:
> (adding Guillamume),
> 
> On Wed, 2019-11-06 at 07:08 +0000, Yoshihiro Shimoda wrote:
>> Hi Mark,
>>
>>> From: Mark Brown, Sent: Tuesday, November 5, 2019 9:49 PM
>>>
>>> The table of devicetree identifiers is annotated as __initconst
>>> indicating that it can be discarded after kernel boot but it is
>>> referenced from the driver struct which has no init annotation leading
>>> to a linker warning:
>>>
>>> WARNING: vmlinux.o(.data+0x82d58): Section mismatch in reference from the variable bcm_iproc_gpio_driver to the
>>> variable .init.rodata:bcm_iproc_gpio_of_match
>>> The variable bcm_iproc_gpio_driver references
>>> the variable __initconst bcm_iproc_gpio_of_match
>>>
>>> Since drivers can be probed after init the lack of annotation on the
>>> driver struct is correct so remove the annotation from the match table.
>>>
>>> Signed-off-by: Mark Brown <broonie@kernel.org>
>>
>> Thank you for the patch! Without this patch, I had encountered another
>> issue which my environment caused a panic when I tried to install a usb host
>> driver after booted [1]. But, I could resolved the issue after
>> I applied this patch. Also, I confirmed this patch could resolved the warning.
>>
>> So,
>> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>
>> Best regards,
>> Yoshihiro Shimoda
>>
>> ---
>> [1]
>> [  146.541188] Unable to handle kernel paging request at virtual address ffff800011f73540
>> [  146.549099] Mem abort info:
>> [  146.551885]   ESR = 0x96000007
>> [  146.554934]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [  146.560238]   SET = 0, FnV = 0
>> [  146.563284]   EA = 0, S1PTW = 0
>> [  146.566416] Data abort info:
>> [  146.569289]   ISV = 0, ISS = 0x00000007
>> [  146.573117]   CM = 0, WnR = 0
>> [  146.576078] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000049e4a000
>> [  146.582770] [ffff800011f73540] pgd=000000077ffff003, pud=000000077fffe003, pmd=000000077fffb003, pte=0000000000000000
>> [  146.593375] Internal error: Oops: 96000007 [#1] PREEMPT SMP
>> [  146.598944] CPU: 0 PID: 106 Comm: kworker/0:1 Not tainted 5.4.0-rc6-next-20191105 #87
>> [  146.606766] Hardware name: Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+ (DT)
>> [  146.615209] Workqueue: events deferred_probe_work_func
>> [  146.620341] pstate: a0000085 (NzCv daIf -PAN -UAO)
>> [  146.625132] pc : __of_match_node.part.4+0x3c/0x78
>> [  146.629830] lr : of_match_node+0x3c/0x70
>> ...
>> ---
>>
>>
>> So,
> 
> I guess that kernelci failure[1] wasn't bogus after all. Sorry again
> for the hassle. And Mark, Yoshihiro thanks for the fix and test.

Thanks for the follow-up, I'll re-enable bisections in
lab-theobroma-systems then.

It's actually pretty hard to get false positives from this
automated bisection thanks to some checks run on the commit
found, to verify it does cause a boot failure and also verify
that when reverted the problem goes away.  This was a good
example :)

Guillaume

> [1] - 
> https://lore.kernel.org/lkml/5dbb2acf.1c69fb81.54ce2.2f48@mx.google.com/
> 
>>
>>
>> Best regards,
>> Yoshihiro Shimoda
>>
>>
>>> ---
>>>  drivers/gpio/gpio-xgs-iproc.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
>>> index a3fdd95cc9e6..bb183f584d92 100644
>>> --- a/drivers/gpio/gpio-xgs-iproc.c
>>> +++ b/drivers/gpio/gpio-xgs-iproc.c
>>> @@ -299,7 +299,7 @@ static int __exit iproc_gpio_remove(struct platform_device *pdev)
>>>  	return 0;
>>>  }
>>>
>>> -static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst = {
>>> +static const struct of_device_id bcm_iproc_gpio_of_match[] = {
>>>  	{ .compatible = "brcm,iproc-gpio-cca" },
>>>  	{}
>>>  };
>>> --
>>> 2.20.1
>>
>>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

