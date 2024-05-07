Return-Path: <linux-gpio+bounces-6189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3F8BE1B7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 14:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C41A1C22A26
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 12:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640E1156F23;
	Tue,  7 May 2024 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e8SXGGRz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640E3156864;
	Tue,  7 May 2024 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715083766; cv=none; b=renagJpxLr7L9bewwyO0Pb8IH1NN63EFjtWzqzs3PXWx14YUMKDzYIXQCH/gvKaT+NpekTNMOTOIjMFzGBCauViYVVE4kXfHChGSvwL7o9YLKGVB5msAVaYVfh7zFGx3snrjJC1M/l6gHxqpX6y47+OZs2IBL0vtDDwbY+mScGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715083766; c=relaxed/simple;
	bh=HCGP99NE1vvsYrUaRK7HqkFYcs6GoeKj0GjrrT1XHb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JKbzmGBxN9uocX9vW2ZUGX4TrFKr7dbdnx1Ph99L+zrxs8MpdPcRgLvSIucAD8fYsDU+IBYcyeN0x/zzWwRUAegQFH7VngfdmGU9qz/XjHS+Duw6ZJukaqQVIvCkemoRvKdF9Uuu3YcDfcJB+hwTc2vQB29/Gs+kohuSHh+rr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e8SXGGRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447A0DFE002421;
	Tue, 7 May 2024 12:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=A0KNG1OheSY4eJfBQ8FWYAD/Op94koyC048SY3Hxa/Y=; b=e8
	SXGGRz6qTidybEyn6Gr3rzOCG16jJbFpGFuxQmTfr4KWIJJJzaIzzgnykJWFp+BU
	ogM19KFbqMu0ezJudMjBArFWWlD/oFEhTxDdlGGJJPun7GWJrHzrNenlDtOOvPP6
	FESf3KL3bvIRnbDmx+PrpU7tq5E45Xklv8V5rY6GKPyeNwoJ0Qp5oy7fK7QwD0b3
	bmZd4Y85NtLCiYzd/cIxo1Uu1iZBVz6QVEvqOgPsrbfeRp0XK28ciSS208vay+RP
	/8Cr29u8P4cQbpZ7Hu8P2miy9OII47kiRC2bl4aoewSXFBxzXb7PAYnKkW4FCNJ/
	BfYa38WcJkR5i0FLGSmw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyj5h88jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 12:09:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447C9IBw023774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 12:09:18 GMT
Received: from [10.239.133.66] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 05:09:17 -0700
Message-ID: <730734c0-59a6-4612-90ee-9715ab832515@quicinc.com>
Date: Tue, 7 May 2024 20:09:14 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpiolib: cdev: Fix use after free in
 lineinfo_changed_notify
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: <warthog618@gmail.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240505141156.2944912-1-quic_zhonhan@quicinc.com>
 <CAMRc=MdmOg6pJ7hvKSpkoTKjQny8xL5BFT2HNzgKgnjsCuwhwQ@mail.gmail.com>
Content-Language: en-US
From: Zhongqiu Han <quic_zhonhan@quicinc.com>
In-Reply-To: <CAMRc=MdmOg6pJ7hvKSpkoTKjQny8xL5BFT2HNzgKgnjsCuwhwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OLzAz5dztDVf4SftD1VkI2hRKDynivdd
X-Proofpoint-GUID: OLzAz5dztDVf4SftD1VkI2hRKDynivdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_06,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070082

On 5/7/2024 4:00 PM, Bartosz Golaszewski wrote:
> On Sun, May 5, 2024 at 4:12 PM Zhongqiu Han <quic_zhonhan@quicinc.com> wrote:
>>
>> The use-after-free issue occurs as follows: when the GPIO chip device file
>> is being closed by invoking gpio_chrdev_release(), watched_lines is freed
>> by bitmap_free(), but the unregistration of lineinfo_changed_nb notifier
>> chain failed due to waiting write rwsem. Additionally, one of the GPIO
>> chip's lines is also in the release process and holds the notifier chain's
>> read rwsem. Consequently, a race condition leads to the use-after-free of
>> watched_lines.
>>
>> Here is the typical stack when issue happened:
>>
>> [free]
>> gpio_chrdev_release()
>>    --> bitmap_free(cdev->watched_lines)                  <-- freed
>>    --> blocking_notifier_chain_unregister()
>>      --> down_write(&nh->rwsem)                          <-- waiting rwsem
>>            --> __down_write_common()
>>              --> rwsem_down_write_slowpath()
>>                    --> schedule_preempt_disabled()
>>                      --> schedule()
>>
> 
> The rwsem has been removed in v6.9-rc1. I assume you're targeting
> stable branches with this change? Or does it still occur with the
> recent SRCU rework? This is important to know before I send it
> upstream.
> 
> Bart
> 

Hi Bart,

Thanks a lot for the review.

I guess the "rwsem -> srcu switch" you mentioned is this commit
d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device
with SRCU")? Currently the use-after-free issue of watched_lines is
related to notifier chain rwsem instead of the rwsem which is as one
struct member of gpio_device.

int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
         struct notifier_block *n)
{
     int ret;

     /*
      * This code gets used during boot-up, when task switching is
      * not yet working and interrupts must remain disabled.  At
      * such times we must not call down_write().
      */
     if (unlikely(system_state == SYSTEM_BOOTING))
         return notifier_chain_unregister(&nh->head, n);

     down_write(&nh->rwsem);------------------->waiting rwsem here
     ret = notifier_chain_unregister(&nh->head, n);
     up_write(&nh->rwsem);
     return ret;
}

struct blocking_notifier_head {
     struct rw_semaphore rwsem;
     struct notifier_block __rcu *head;
};

Please forgive me for not explaining rwsem on the commit message and
kindly let me know if there is any misunderstanding. Thank you~

>> [use]
>> st54spi_gpio_dev_release()
>>    --> gpio_free()
>>      --> gpiod_free()
>>        --> gpiod_free_commit()
>>          --> gpiod_line_state_notify()
>>            --> blocking_notifier_call_chain()
>>              --> down_read(&nh->rwsem);                  <-- held rwsem
>>              --> notifier_call_chain()
>>                --> lineinfo_changed_notify()
>>                  --> test_bit(xxxx, cdev->watched_lines) <-- use after free
>>
>> The side effect of the use-after-free issue is that a GPIO line event is
>> being generated for userspace where it shouldn't. However, since the chrdev
>> is being closed, userspace won't have the chance to read that event anyway.
>>
>> To fix the issue, call the bitmap_free() function after the unregistration
>> of lineinfo_changed_nb notifier chain.
>>
>> Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes in line info")
>> Signed-off-by: Zhongqiu Han <quic_zhonhan@quicinc.com>
>> ---
>> v1 -> v2:
>> - Drop the excessive stack log from commit message to make it more readable.
>> - Add a note regarding the side effects of the use-after-free on commit message.
>> - Link to v1: https://lore.kernel.org/lkml/20240501022612.1787143-1-quic_zhonhan@quicinc.com/
>>
>>   drivers/gpio/gpiolib-cdev.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
>> index d09c7d728365..6b3a43e3ba47 100644
>> --- a/drivers/gpio/gpiolib-cdev.c
>> +++ b/drivers/gpio/gpiolib-cdev.c
>> @@ -2799,11 +2799,11 @@ static int gpio_chrdev_release(struct inode *inode, struct file *file)
>>          struct gpio_chardev_data *cdev = file->private_data;
>>          struct gpio_device *gdev = cdev->gdev;
>>
>> -       bitmap_free(cdev->watched_lines);
>>          blocking_notifier_chain_unregister(&gdev->device_notifier,
>>                                             &cdev->device_unregistered_nb);
>>          blocking_notifier_chain_unregister(&gdev->line_state_notifier,
>>                                             &cdev->lineinfo_changed_nb);
>> +       bitmap_free(cdev->watched_lines);
>>          gpio_device_put(gdev);
>>          kfree(cdev);
>>
>> --
>> 2.25.1
>>

-- 
Thx and BRs,
Zhongqiu Han


