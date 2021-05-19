Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7B6388C14
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 12:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237018AbhESKwy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 06:52:54 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4750 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbhESKwy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 06:52:54 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FlV2V4vGxzpfZc;
        Wed, 19 May 2021 18:48:02 +0800 (CST)
Received: from dggeme756-chm.china.huawei.com (10.3.19.102) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 18:51:25 +0800
Received: from [127.0.0.1] (10.40.193.166) by dggeme756-chm.china.huawei.com
 (10.3.19.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 19
 May 2021 18:51:25 +0800
Subject: Re: [PATCH] ACPICA: fix a memleak issue related to ACPI/GPIO
To:     "Kaneda, Erik" <erik.kaneda@intel.com>,
        "Moore, Robert" <robert.moore@intel.com>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        "hoan@os.amperecomputing.com" <hoan@os.amperecomputing.com>,
        "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>
References: <1620790207-128605-1-git-send-email-chenxiang66@hisilicon.com>
 <MWHPR11MB159982431E024C6212960C0CF02D9@MWHPR11MB1599.namprd11.prod.outlook.com>
 <5a8fcc49-5559-0e99-4dd9-1821b7ade1ea@hisilicon.com>
 <MWHPR11MB1599FBA0B63433B58DC955F4F02C9@MWHPR11MB1599.namprd11.prod.outlook.com>
CC:     "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linuxarm@huawei.com" <linuxarm@huawei.com>
From:   "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <dc3d2eef-be90-42d5-b352-98ba7b517be0@hisilicon.com>
Date:   Wed, 19 May 2021 18:51:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1599FBA0B63433B58DC955F4F02C9@MWHPR11MB1599.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Erik,


在 2021/5/19 5:35, Kaneda, Erik 写道:
>
>> -----Original Message-----
>> From: chenxiang (M) <chenxiang66@hisilicon.com>
>> Sent: Monday, May 17, 2021 7:02 PM
>> To: Kaneda, Erik <erik.kaneda@intel.com>; Moore, Robert
>> <robert.moore@intel.com>; Wysocki, Rafael J <rafael.j.wysocki@intel.com>;
>> hoan@os.amperecomputing.com; fancer.lancer@gmail.com
>> Cc: linux-acpi@vger.kernel.org; linux-gpio@vger.kernel.org;
>> linuxarm@huawei.com
>> Subject: Re: [PATCH] ACPICA: fix a memleak issue related to ACPI/GPIO
>>
>> Hi Erik,
>>
>>
>> 在 2021/5/18 2:54, Kaneda, Erik 写道:
>>>> -----Original Message-----
>>>> From: chenxiang <chenxiang66@hisilicon.com>
>>>> Sent: Tuesday, May 11, 2021 8:30 PM
>>>> To: Moore, Robert <robert.moore@intel.com>; Kaneda, Erik
>>>> <erik.kaneda@intel.com>; Wysocki, Rafael J
>> <rafael.j.wysocki@intel.com>;
>>>> hoan@os.amperecomputing.com; fancer.lancer@gmail.com
>>>> Cc: linux-acpi@vger.kernel.org; linux-gpio@vger.kernel.org;
>>>> linuxarm@huawei.com; Xiang Chen <chenxiang66@hisilicon.com>
>>>> Subject: [PATCH] ACPICA: fix a memleak issue related to ACPI/GPIO
>>>>
>>>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>>>
>>>> There is a memleak reported as follows:
>>>>
>>>> unreferenced object 0xffff00208ff85a00 (size 128):
>>>>     comm "swapper/0", pid 1, jiffies 4294892588 (age 887.572s)
>>>>     hex dump (first 32 bytes):
>>>>       00 00 00 00 02 00 00 00 08 5a f8 8f 20 00 ff ff  .........Z.. ...
>>>>       08 5a f8 8f 20 00 ff ff 00 00 00 00 00 00 00 00  .Z.. ...........
>>>> backtrace:
>>>>       [<00000000bc25bad8>] slab_post_alloc_hook+0x80/0x2e0
>>>>       [<000000008d547074>] kmem_cache_alloc+0x194/0x2c0
>>>>       [<00000000b08da9ad>] acpi_os_create_semaphore+0x3c/0x78
>>>>       [<0000000024816c0a>] acpi_ev_install_space_handler+0x214/0x274
>>>>       [<00000000d93a5ac2>] acpi_install_address_space_handler+0x64/0xb0
>>>>       [<0000000098c37a45>] acpi_gpiochip_add+0x130/0x348
>>>>       [<00000000c1cf4b42>] gpiochip_add_data_with_key+0x79c/0xdd0
>>>>       [<000000005ce539e9>]
>> devm_gpiochip_add_data_with_key+0x30/0x90
>>>>       [<00000000a3038b8d>] dwapb_gpio_probe+0x3e4/0x7e8
>>>>       [<0000000047a03eba>] platform_probe+0x68/0xe0
>>>>       [<00000000dc15c501>] really_probe+0x17c/0x4a0
>>>>       [<00000000aa1f123d>] driver_probe_device+0x68/0xd0
>>>>       [<00000000d97646e0>] device_driver_attach+0x74/0x80
>>>>       [<0000000073d5b3e5>] __driver_attach+0x8c/0xe0
>>>>       [<00000000ff60d118>] bus_for_each_dev+0x7c/0xd8
>>>>       [<00000000b018393d>] driver_attach+0x24/0x30
>>>>
>>>> It requires to delete the handler object in function
>>>> acpi_remove_address_space_handler() but it just up the sem with
>> function
>>>> acpi_os_release_mutex(), so use acpi_os_delete_mutex() instead of
>>>> acpi_os_release_mutex() in function
>>>> acpi_remove_address_space_handler().
>>>>
>>>> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
>>>> ---
>>>>    drivers/acpi/acpica/evxfregn.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/acpi/acpica/evxfregn.c
>> b/drivers/acpi/acpica/evxfregn.c
>>>> index b1ff0a8..4db0bec 100644
>>>> --- a/drivers/acpi/acpica/evxfregn.c
>>>> +++ b/drivers/acpi/acpica/evxfregn.c
>>>> @@ -201,7 +201,7 @@
>> acpi_remove_address_space_handler(acpi_handle
>>>> device,
>>>>
>>>>    			/* Now we can delete the handler object */
>>>>
>>> Hi Xiang,
>>>
>>>> -			acpi_os_release_mutex(handler_obj-
>>>>> address_space.
>>>> +			acpi_os_delete_mutex(handler_obj->address_space.
>>>>    					      context_mutex);
>>> Thanks for this suggestion! Instead of acpi_os_delete_mutex, could you try
>> using acpi_ut_remove_reference instead?
>>> I believe this will is a safer option. Please test this and see if it fixes the
>> memory leak.
>>
> Hi,
>
>> But there is already acpi_ut_remove_reference(handler_obj) behind it.
> The delete mutex could result in unexpected behavior because it's not always the case that acpi_ut_remove_reference will clean up the object. This function cleans up the object if the reference count is 0 so we should add the delete mutex during the deletion instead.
>
> Could you try this code to see if it fixes the leak?

I have tested the change, and it fixes the leak, and so please feel free 
to add:
Tested-by: Xiang Chen <chenxiang66@hisilicon.com>

>
> diff --git a/drivers/acpi/acpica/utdelete.c b/drivers/acpi/acpica/utdelete.c
> index 624a26794d55..e5ba9795ec69 100644
> --- a/drivers/acpi/acpica/utdelete.c
> +++ b/drivers/acpi/acpica/utdelete.c
> @@ -285,6 +285,14 @@ static void acpi_ut_delete_internal_obj(union acpi_operand_object *object)
>                  }
>                  break;
>
> +       case ACPI_TYPE_LOCAL_ADDRESS_HANDLER:
> +
> +               ACPI_DEBUG_PRINT((ACPI_DB_ALLOCATIONS,
> +                                 "***** Address handler %p\n", object));
> +
> +               acpi_os_delete_mutex(object->address_space.context_mutex);
> +               break;
> +
>          default:
>
>                  break;
>
>>> Thanks,
>>> Erik
>>>
>>>>    			acpi_ut_remove_reference(handler_obj);
>>>>    			goto unlock_and_exit;
>>>> --
>>>> 2.8.1
>>> .
>>>


