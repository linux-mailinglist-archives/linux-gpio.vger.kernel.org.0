Return-Path: <linux-gpio+bounces-29981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3823ACE6F73
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 15:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 532293024103
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 14:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E5C23F294;
	Mon, 29 Dec 2025 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQP5wSNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhGlgtu7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212341E9B3D
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767016874; cv=none; b=klxmWduTRTXijr6BbWd2uYQlPrAFawNP/arQFUN3rbFNRQfx3ninqUEaE64/Xz11t8DHnCXfBVQrEZXPDsGbTBV/vDfszQFzMrX6hRVKw0cFv9mUlgMv+yY9Z/9J6maQ3/dT55ySFbjxVeC8lpLZjYYXPgEA71kynn6UfQQmtH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767016874; c=relaxed/simple;
	bh=moIs5yhJGYag1SE3qmG3Z9NDu1ymxrG26XkVYXo8sjA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oo/QnQavBMbgFaDNvj2i3l4YMWx4jdS7tf9zXRr9+8Gpl8pkUENzSJUZF1JfliPfmo6MhrBYMoQ0C4Mdvoc4H6H8U6JsEqGdIpkWlCpXEg6wSNs5Aq9SidvpAdlLW/kPa9qEMRfTAQ3JC0QQQB07cmooG2gPfJT3ItgpaVETuIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQP5wSNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhGlgtu7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAJZhk3328419
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 14:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Od0/SErtV9VFVVwix3GswnD7lzsudw0N2UFnUuYdHA=; b=gQP5wSNsyF3MswkX
	EsIuW8BZGFUOpj9P8cSmmZM2zUmQV45Z4N9zj047SKuZuRfQXmkA+PR11UE5rzhX
	drgXHELf9hYMwBQNKBMSCpbDMNA1a8o+su7aICf164KH23qRXOB59Fd7N/aSGWXz
	aYlFsiY+/FHaY3726i+t5Zw7VLCi7BvFiqm3bwMh5l6bzfFzAUZkOBkW6Gpyt1bM
	OT6/nqauFkAifED6CcO4FmWsp0DvLf4Ltjlv8vQX38PMyTb2laym3yGgct3abYhq
	tgdS65q5pB97gB9UIlvVO8htq5cOh2XxNIFtxwuqaI2SUTEzX5A6Z9yPWNCb2DDW
	FT+CfQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6cdaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 14:01:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9208e1976so17272226b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2025 06:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767016871; x=1767621671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Od0/SErtV9VFVVwix3GswnD7lzsudw0N2UFnUuYdHA=;
        b=BhGlgtu7WTpn2nkJiAkMRLH0sYzl+x6oqJuhfyOhZkSqAp5J0EqwEnnr9EYh64W6Pi
         0GCxd4E7cQUu2rJYEJkzHEBhxWwRFuQG+SuTLSAkzwyo+dxdOuNgf7G5YNVgX9WSrmHv
         QlID/GjPtcj59gVYaS2c4t6pP08x6wQMis25UV1fu9XO37E4co6SDBPNl13jXlfZmKBM
         dpBFdOLZcbz8KmyZZsM5AYnc6okvBq5t9JpEXdlc/lr17wDiDJfEmmE3DBvf0FWotnYL
         72O/YDO0lQavH9zpknlEdUC4x05rLGK3vZCBJ5YIN1HWf+as2wNzfx0M8yHZvAQNG7ao
         Qm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767016871; x=1767621671;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Od0/SErtV9VFVVwix3GswnD7lzsudw0N2UFnUuYdHA=;
        b=OzZmgP9trLsu/p2tWLSsEarsLeE2+jlQBKF6iunm1WR72T5PXYijS2OZ2MuDqXqPId
         U0qJGXj/sumlyiRoGXKo+EYqo9mtzIRm3soeeTzbIBpv2ztK/JCfe2ObRi7zwK6uOHJL
         eoyaPJuMVTisanITI7HXuXscXUI1XTBesOc434LC7f3Tb5BSISIdiGSZi2E/QqJCRODy
         ojFB+0zyhCnBOVi0dl67YlIsHDmxfU0gPTvbPYmCwxZ6FesojyRd3VjCGbPmUExpEbDp
         lAq0zZx1RsCrNohk8k6HwfxDDgFpFheLx2uncZpZ1776zOdbadcMMDz7bRJaHEDRQvg3
         aVYA==
X-Forwarded-Encrypted: i=1; AJvYcCWJs3riYyvukJ2HQ+UwLAsGvUsCs10cfFtTFNJCA89wKgn7SGU9WmUinMmFWqtoOxlzMgMmp1/bQQEt@vger.kernel.org
X-Gm-Message-State: AOJu0YxTdJ10m/iZ5GC6rngOfUoVLsOjJobB3MaNoanr4HigPvf2bAvC
	ff6iXktKZJ0cUFEt+HG7jwWfFp1mktmfyWCgPBN+RIwIRCSEH4FgH10hM3pe8h2JOYHvuZ9Pxtr
	e0J8N9q2cvfmP2BsPNrQm2ZuJgOCoG3by/rqgGOYWni9jkvLyDoDvQH6ejbdKM1aA
X-Gm-Gg: AY/fxX7TOvFYfXh07WWFdjBDPvWPxUAjLLX5SuGkiBZCz/UMutRTSY9cBrSKG8kbAvu
	ch4MoFGzl8QYW5rha12GFAVmXmtJrlc1SX37EVmFyhFcxvp2q8455kzvyVZdxAxDLUkFUUhr55P
	ZVgtFzhhJf1BD/F3Yw4+pskSyM5efveYS9DZIwblxjyl/ArH01pQtDZKsvQMJhunGqtzPIrQd4N
	FSaoSbLOkuuuCBjysnfCYhi9kWpKDR3k74zjC5aXlL4L+mj7BpAdDsMnZI2XcTKtieA/mliVI1A
	iDGqXErlDEs93t8JMVQJwfk/TA6Cd391zwdbkXOMgwO0+9E0j0acvhW+c8yJtrScxqovpyYeMJS
	iXdFMEUxVA3/c9HDJzHP7pmcf104g8hHfmRjr9Cuiyknr
X-Received: by 2002:a05:6a00:3499:b0:7e8:4398:b371 with SMTP id d2e1a72fcca58-7ff66d5f563mr27466284b3a.68.1767016870641;
        Mon, 29 Dec 2025 06:01:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxsbVXnf60d0czcxuwUXVPDulUWBU71WeXH4v4tcb9/BiYzswIZxFOOwzKk5JGpO+Qk0NyYg==
X-Received: by 2002:a05:6a00:3499:b0:7e8:4398:b371 with SMTP id d2e1a72fcca58-7ff66d5f563mr27466232b3a.68.1767016869863;
        Mon, 29 Dec 2025 06:01:09 -0800 (PST)
Received: from [192.168.29.63] ([49.43.224.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a0595sm29487238b3a.44.2025.12.29.06.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 06:01:09 -0800 (PST)
Message-ID: <60523dfa-d276-4789-ac35-d7adb5d1789f@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 19:31:02 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] PCI: Add support for PCIe WAKE# interrupt
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@kernel.org>, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, sherry.sun@nxp.com,
        Len Brown <lenb@kernel.org>
References: <20251127-wakeirq_support-v6-0-60f581f94205@oss.qualcomm.com>
 <20251127-wakeirq_support-v6-2-60f581f94205@oss.qualcomm.com>
 <925c7431-823c-45e7-b446-ac1ed98eadd5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <925c7431-823c-45e7-b446-ac1ed98eadd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=695289a8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=hVJDfGYHv7yi9BX1uq7Blg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=KKAkSRfTAAAA:8 a=Y6RBOmK8faYRJMyDQ3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6HBXyHDf8Y4DE2u-1DZlZQ0EZm1GA9j1
X-Proofpoint-GUID: 6HBXyHDf8Y4DE2u-1DZlZQ0EZm1GA9j1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEzMCBTYWx0ZWRfX+FIRepTv0WzI
 WNtHXfknejD8JiKlr0LJ0zQyw0XokECPy2xyEP9jFjFvEt2tos1QkrEr5y9qVuSMSAZjxtjPqZk
 8ZMZNUcoZsrrwPigaYZ/+dW7TtaSOrPfPoqfI8YScSDqoXMzHddnY7NnWai+LgEVHk2PvEf45W3
 0gwNTUHtBRxI4h5j3x942K3my+DYwhuGFdepQTG6RBD8N6meuWAe1eccfhPElb0p8YL0j3AvWuS
 MO3Ki1ueI2DiOsLr/tPxnZUtocoMJmHyKOV5OrEAcHcREry8i5UmFkKjLmrvbMzW3P7SNQ8cujK
 HlED9kWkcWhOH6VlT7NdPSxk89ERYGYxKzktbAkzqsCrNjvZbj0VNMFwyMf/MjGGKnHrybV0J6L
 Bh98txpaaZG7nB49ZVoP9ZJlp6lSIvshkXIUJnMwF+m35Om/S7L9Lh+n7JERhrJNxY9fVs+44Z1
 pcrDRqhF1Sl0QWuD7ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290130

A Gentle remainder.

- Krishna Chaitanya.

On 12/11/2025 6:12 AM, Krishna Chaitanya Chundru wrote:
> Hi Bjorn,
>
> Can you review this patch?
>
> - Krishna Chaitanya.
> On 11/27/2025 6:15 PM, Krishna Chaitanya Chundru wrote:
>> According to the PCIe specification 6, sec 5.3.3.2, there are two 
>> defined
>> wakeup mechanisms: Beacon and WAKE# for the Link wakeup mechanisms to
>> provide a means of signaling the platform to re-establish power and
>> reference clocks to the components within its domain. Beacon is a 
>> hardware
>> mechanism invisible to software (PCIe r7.0, sec 4.2.7.8.1). Adding WAKE#
>> support in PCI framework.
>>
>> According to the PCIe specification, multiple WAKE# signals can exist in
>> a system. In configurations involving a PCIe switch, each downstream 
>> port
>> (DSP) of the switch may be connected to a separate WAKE# line, allowing
>> each endpoint to signal WAKE# independently. From figure 5.4, WAKE# can
>> also be terminated at the switch itself. To support this, the WAKE#
>> should be described in the device tree node of the endpint/bridge. If 
>> all
>> endpoints share a single WAKE# line, then WAKE# should be defined in the
>> each node.
>>
>> To support legacy devicetree in direct attach case, driver will search
>> in root port node for WAKE# if the driver doesn't find in the endpoint
>> node.
>>
>> In pci_device_add(), PCI framework will search for the WAKE# in its 
>> node,
>> If not found, it searches in its upstream port only if upstream port is
>> root port to support legacy bindings. Once found, register for the 
>> wake IRQ
>> in shared mode, as the WAKE# may be shared among multiple endpoints.
>>
>> When the IRQ is asserted, the handle_threaded_wake_irq() handler 
>> triggers
>> a pm_runtime_resume(). The PM framework ensures that the parent 
>> device is
>> resumed before the child i.e controller driver which can bring back 
>> device
>> state to D0.
>>
>> WAKE# is added in dts schema and merged based on below links.
>>
>> Link: 
>> https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
>> Link: https://github.com/devicetree-org/dt-schema/pull/170
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru 
>> <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/of.c     | 58 
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/pci/pci.h    |  6 ++++++
>>   drivers/pci/probe.c  |  2 ++
>>   drivers/pci/remove.c |  1 +
>>   include/linux/pci.h  |  2 ++
>>   5 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 
>> 3579265f119845637e163d9051437c89662762f8..fc33405a7b1f001e171277434663cc9dfe57c69b 
>> 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -7,6 +7,7 @@
>>   #define pr_fmt(fmt)    "PCI: OF: " fmt
>>     #include <linux/cleanup.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/irqdomain.h>
>>   #include <linux/kernel.h>
>>   #include <linux/pci.h>
>> @@ -15,6 +16,7 @@
>>   #include <linux/of_address.h>
>>   #include <linux/of_pci.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_wakeirq.h>
>>   #include "pci.h"
>>     #ifdef CONFIG_PCI
>> @@ -586,6 +588,62 @@ int of_irq_parse_and_map_pci(const struct 
>> pci_dev *dev, u8 slot, u8 pin)
>>       return irq_create_of_mapping(&oirq);
>>   }
>>   EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
>> +
>> +static void pci_configure_wake_irq(struct pci_dev *pdev, struct 
>> gpio_desc *wake)
>> +{
>> +    int ret, wake_irq;
>> +
>> +    if (!wake)
>> +        return;
>> +
>> +    wake_irq = gpiod_to_irq(wake);
>> +    if (wake_irq < 0) {
>> +        dev_err(&pdev->dev, "Failed to get wake irq: %d\n", wake_irq);
>> +        return;
>> +    }
>> +
>> +    device_init_wakeup(&pdev->dev, true);
>> +
>> +    ret = dev_pm_set_dedicated_shared_wake_irq(&pdev->dev, wake_irq,
>> +                           IRQ_TYPE_EDGE_FALLING);
>> +    if (ret < 0) {
>> +        dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
>> +        device_init_wakeup(&pdev->dev, false);
>> +    }
>> +}
>> +
>> +void pci_configure_of_wake_gpio(struct pci_dev *dev)
>> +{
>> +    struct device_node *dn = pci_device_to_OF_node(dev);
>> +    struct gpio_desc *gpio;
>> +    struct pci_dev *root;
>> +
>> +    if (!dn)
>> +        return;
>> +
>> +    gpio = fwnode_gpiod_get_index(of_fwnode_handle(dn),
>> +                      "wake", 0, GPIOD_IN | 
>> GPIOD_FLAGS_BIT_NONEXCLUSIVE, NULL);
>> +    if (IS_ERR(gpio)) {
>> +        /*
>> +         * To support legacy devicetree, search in root port for WAKE#
>> +         * in direct attach case.
>> +         */
>> +        root = pci_upstream_bridge(dev);
>> +        if (pci_is_root_bus(root->bus))
>> +            pci_configure_wake_irq(dev, root->wake);
>> +    } else {
>> +        dev->wake = gpio;
>> +        pci_configure_wake_irq(dev, gpio);
>> +    }
>> +}
>> +
>> +void pci_remove_of_wake_gpio(struct pci_dev *dev)
>> +{
>> +    dev_pm_clear_wake_irq(&dev->dev);
>> +    device_init_wakeup(&dev->dev, false);
>> +    gpiod_put(dev->wake);
>> +    dev->wake = NULL;
>> +}
>>   #endif    /* CONFIG_OF_IRQ */
>>     static int pci_parse_request_of_pci_ranges(struct device *dev,
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 
>> 4492b809094b5794bd94dfbc20102cb208c3fa2f..05cb240ecdb59f9833ca6dae2357fdbd012195d6 
>> 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -1056,6 +1056,9 @@ void pci_release_of_node(struct pci_dev *dev);
>>   void pci_set_bus_of_node(struct pci_bus *bus);
>>   void pci_release_bus_of_node(struct pci_bus *bus);
>>   +void pci_configure_of_wake_gpio(struct pci_dev *dev);
>> +void pci_remove_of_wake_gpio(struct pci_dev *dev);
>> +
>>   int devm_of_pci_bridge_init(struct device *dev, struct 
>> pci_host_bridge *bridge);
>>   bool of_pci_supply_present(struct device_node *np);
>>   int of_pci_get_equalization_presets(struct device *dev,
>> @@ -1101,6 +1104,9 @@ static inline int 
>> devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>>       return 0;
>>   }
>>   +static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) 
>> { }
>> +static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
>> +
>>   static inline bool of_pci_supply_present(struct device_node *np)
>>   {
>>       return false;
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index 
>> 0ce98e18b5a876afe72af35a9f4a44d598e8d500..f9b879c8e3f72a9845f60577335019aa2002dc23 
>> 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -2762,6 +2762,8 @@ void pci_device_add(struct pci_dev *dev, struct 
>> pci_bus *bus)
>>       ret = device_add(&dev->dev);
>>       WARN_ON(ret < 0);
>>   +    pci_configure_of_wake_gpio(dev);
>> +
>>       pci_npem_create(dev);
>>         pci_doe_sysfs_init(dev);
>> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
>> index 
>> ce5c25adef5518e5aec30c41de37ea66d682f3b0..26e9c1df51c76344a1d7f5cc7edd433780e73474 
>> 100644
>> --- a/drivers/pci/remove.c
>> +++ b/drivers/pci/remove.c
>> @@ -54,6 +54,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
>>       if (pci_dev_test_and_set_removed(dev))
>>           return;
>>   +    pci_remove_of_wake_gpio(dev);
>>       pci_doe_sysfs_teardown(dev);
>>       pci_npem_remove(dev);
>>   diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 
>> d1fdf81fbe1e427aecbc951fa3fdf65c20450b05..cd7b5eb82a430ead2f64d903a24a5b06a1b7b17e 
>> 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -555,6 +555,8 @@ struct pci_dev {
>>       /* These methods index pci_reset_fn_methods[] */
>>       u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
>>   +    struct gpio_desc *wake; /* Holds WAKE# gpio */
>> +
>>   #ifdef CONFIG_PCIE_TPH
>>       u16        tph_cap;    /* TPH capability offset */
>>       u8        tph_mode;    /* TPH mode */
>>
>


