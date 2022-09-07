Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9E55B0729
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 16:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiIGOlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 10:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiIGOk6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 10:40:58 -0400
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D86870AB;
        Wed,  7 Sep 2022 07:40:56 -0700 (PDT)
Received: from mail02.huawei.com (unknown [172.30.67.143])
        by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4MN4dR6KPVz6S2Vk;
        Wed,  7 Sep 2022 22:39:07 +0800 (CST)
Received: from [10.174.178.165] (unknown [10.174.178.165])
        by APP2 (Coremail) with SMTP id Syh0CgB3Emx0rRhjdwAFAg--.4481S2;
        Wed, 07 Sep 2022 22:40:54 +0800 (CST)
Subject: Re: [PATCH -next 1/5] misc: microchip: pci1xxxx: fix error handling
 in gp_aux_bus_probe()
To:     Kumaravel.Thiagarajan@microchip.com, arnd@arndb.de,
        gregkh@linuxfoundation.org
Cc:     weiyongjun1@huawei.com, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
 <BN8PR11MB3668DC710EB452EE85E37F95E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
From:   Wei Yongjun <weiyongjun@huaweicloud.com>
Message-ID: <63f9546f-356b-0dc2-a8ce-ced29c77f709@huaweicloud.com>
Date:   Wed, 7 Sep 2022 22:40:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <BN8PR11MB3668DC710EB452EE85E37F95E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgB3Emx0rRhjdwAFAg--.4481S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1UtF17WF17ArW8Wry7GFg_yoW8ZrW7pF
        Z3AF17u3W8Ww1Sk3WrAa1UCF1Fqw4Fka4YgrZFy345ZF98t3ZrKryv9wnFvr1DGFWkt3WS
        vr1j9FyDC3W5ZrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
        6cxKx2IYs7xG6r106r1rM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
        vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
        xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
        0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
        x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
        0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
        wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
        80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
        I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
        k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=
X-CM-SenderInfo: 5zhl50pqjm3046kxt4xhlfz01xgou0bp/
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2022/9/7 19:56, Kumaravel.Thiagarajan@microchip.com wrote:
>> -----Original Message-----
>> From: Wei Yongjun <weiyongjun@huaweicloud.com>
>> Sent: Wednesday, September 7, 2022 2:05 PM
>> To: Kumaravel Thiagarajan - I21417
>> <Kumaravel.Thiagarajan@microchip.com>; Arnd Bergmann
>> <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-gpio@vger.kernel.org;
>> kernel-janitors@vger.kernel.org
>> Subject: [PATCH -next 1/5] misc: microchip: pci1xxxx: fix error handling in
>> gp_aux_bus_probe()
>>
>>
>> From: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> In some error handling path, resoures alloced may not released.
>> This patch fix them.
> Thanks for your patch. But I have a minor correction below. Please review.
> Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")?

Will add it.

>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
>> b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
>> index bfc03028b34d..11f79f239006 100644
>> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
>> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
>> @@ -87,12 +87,13 @@ static int gp_aux_bus_probe(struct pci_dev *pdev,
>> const struct pci_device_id *id
>>         retval = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
>>
>>         if (retval < 0)
>> -               return retval;
>> +               goto err_ida_alloc_1;
> By the time the execution reaches here, second ida_alloc (ida_alloc_1) is successful.
> It must go to err_aux_dev_init_1 too.

Yes, you are right. will fix in next version.

Thanks,
Wei Yongjun


>
> Thank You.
>
> Regards,
> Kumaravel

