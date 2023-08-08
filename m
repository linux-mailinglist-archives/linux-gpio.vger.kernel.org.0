Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A055773EDA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Aug 2023 18:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbjHHQhq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Aug 2023 12:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbjHHQhD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 12:37:03 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 90A8D47DB
        for <linux-gpio@vger.kernel.org>; Tue,  8 Aug 2023 08:53:15 -0700 (PDT)
Received: from dggpemm100019.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKsV11gHxzrSMn;
        Tue,  8 Aug 2023 20:11:05 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100019.china.huawei.com (7.185.36.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 20:12:15 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 20:12:15 +0800
Subject: Re: [PATCH -next] misc: microchip: pci1xxxx: fix return value in
 pci1xxxx_otp_eeprom_probe()
To:     <Kumaravel.Thiagarajan@microchip.com>, <linux-gpio@vger.kernel.org>
CC:     <VaibhaavRam.TL@microchip.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>,
        <Tharunkumar.Pasumarthi@microchip.com>, <yangyingliang@huawei.com>
References: <20230808081024.2339862-1-yangyingliang@huawei.com>
 <BN8PR11MB3668E54E417030C8761F610EE90DA@BN8PR11MB3668.namprd11.prod.outlook.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <fed11d2d-95e2-74e3-6c76-c12de8640d97@huawei.com>
Date:   Tue, 8 Aug 2023 20:12:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BN8PR11MB3668E54E417030C8761F610EE90DA@BN8PR11MB3668.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 2023/8/8 19:27, Kumaravel.Thiagarajan@microchip.com wrote:
>> -----Original Message-----
>> From: Yang Yingliang <yangyingliang@huawei.com>
>> Sent: Tuesday, August 8, 2023 1:40 PM
>> To: linux-gpio@vger.kernel.org
>>
>> devm_nvmem_register() never returns NULL pointer, it will return
>> ERR_PTR() when it fails, so replace the check with IS_ERR() and use PTR_ERR()
>> as return code.
> Is it even better to use PTR_ERR_OR_ZERO like below?
> priv->nvmem_eeprom = devm_nvmem_register(&aux_dev->dev,
>                                                           &priv->nvmem_config_eeprom);
> return PTR_ERR_OR_ZERO(priv->nvmem_eeprom);
It can not return directly here, there is another code after this 
calling in the probe function.
But the check after 'priv->nvmem_otp = devm_nvmem_register()' is at end 
of the probe function.
It can be simplify like this way. I will send a v2.

Thanks,
Yang
>
>> Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and
>> write into PCI1XXXX EEPROM via NVMEM sysfs")
>> Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and
>> write into PCI1XXXX OTP via NVMEM sysfs")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
>> b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
>> index 3d3d1578119a..16695cb5e69c 100644
>> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
>> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
>> @@ -379,8 +379,8 @@ static int pci1xxxx_otp_eeprom_probe(struct
>> auxiliary_device *aux_dev,
>>
>>                  priv->nvmem_eeprom = devm_nvmem_register(&aux_dev->dev,
>>                                                           &priv->nvmem_config_eeprom);
>> -               if (!priv->nvmem_eeprom)
>> -                       return -ENOMEM;
>> +               if (IS_ERR(priv->nvmem_eeprom))
>> +                       return PTR_ERR(priv->nvmem_eeprom);
>>          }
>>
>>          release_sys_lock(priv);
>> @@ -398,8 +398,8 @@ static int pci1xxxx_otp_eeprom_probe(struct
>> auxiliary_device *aux_dev,
>>
>>          priv->nvmem_otp = devm_nvmem_register(&aux_dev->dev,
>>                                                &priv->nvmem_config_otp);
>> -       if (!priv->nvmem_otp)
>> -               return -ENOMEM;
>> +       if (IS_ERR(priv->nvmem_otp))
>> +               return PTR_ERR(priv->nvmem_otp);
>>
>>          return ret;
>>   }
>> --
>> 2.25.1
> Thank You.
>
> Regards,
> Kumar
>
> .
