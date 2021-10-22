Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554294375DB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbhJVLLk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 07:11:40 -0400
Received: from mail-bn8nam11on2066.outbound.protection.outlook.com ([40.107.236.66]:56033
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232560AbhJVLLj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Oct 2021 07:11:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKHxPtz8xjWtO70j+PMeXXUG4ho/eSJmu4SJUukD5R3jt7k15GlrrFe2waHRZ645MjKmvmH4lz/gXfJNFQgsnhkcLMYTcO5VfiOtEwtgLhsfdNgx2o0zUFh+MMn1fNvVHwZauKje6FIhI6YndIwrUtc024SXIrYm0ZlqQDGVwvnc1ULqkuh4HwkK+a+oNIF3jY0eP6bMlZfWf9UCei7eNLYdFvV/fT/cyfuAkH6mF/29SzIi02GBaBQH7239YKv49VgcMqYURof7qC23WJOVKQuUE+sbEp/ZtdF1u/u5VRluqveQqOEbFe8f0eBj4ODGoHZDMoYwHhuOgyLXTeRf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSGm55uxqJwk/HR/mUISPQOgqoAfwA+ALT83UoLLxYY=;
 b=aqfIgyKUMNTWUW3m6dkIX1XCbucpoNUgXpoGg5kJEfFZBmvvl0m3ep92Zc6BzD7OgqQcup3DaQ30T0YsJ700mnxKtVnMYiKl2BGCcvDcFHSFppJmu1y1BYr3aq/oC5dQdKtcN+SgUHVdWwZbB7SUvwULaoxhyxxff6+uvNkChXq1OQyIylyhaIhxbBidNYYr8E42R+MoQwC8/ZFXo1L8ZFXDlC3hGB2aBdEj6OHM10gAh3LtwBm6BBK73SkHlypwJedTazbxBtmQ5PS8ANOZexg7mhTfzcSXXS8O6zIV3oDPer33NrwOxQW85n7LO3XGuiHoxx2cQV1ThuPDrcYonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSGm55uxqJwk/HR/mUISPQOgqoAfwA+ALT83UoLLxYY=;
 b=zQJFnCCCyRh2AsYmLN9jB/WZLB/KoHOldCZViimFX1o4sGEkTQMyp3tic3zxH4QXhGQnZD80CIYQL7/YOFyLkE4+QX2y272f5s6486y5+hPZhjoA+Ilfy2USIskUGnlAE2WMBRMSj1Is/V1gl2kF9ElgmEE6xEKULgBknvw0ifk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM8PR12MB5478.namprd12.prod.outlook.com (2603:10b6:8:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Fri, 22 Oct
 2021 11:09:21 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 11:09:21 +0000
Subject: Re: [PATCH v3 2/2] pinctrl: amd: Fix wakeups when IRQ is shared with
 SCI
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Joerie de Gram <j.de.gram@gmail.com>
References: <20211019160401.8296-1-mario.limonciello@amd.com>
 <20211019160401.8296-2-mario.limonciello@amd.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <7e2b79c8-2c49-468b-73f6-258b22ea8945@amd.com>
Date:   Fri, 22 Oct 2021 16:39:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211019160401.8296-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN2PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::25) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
Received: from [172.31.155.167] (165.204.158.249) by PN2PR01CA0050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend Transport; Fri, 22 Oct 2021 11:09:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c604b49d-a970-4b13-711a-08d9954c65ce
X-MS-TrafficTypeDiagnostic: DM8PR12MB5478:
X-Microsoft-Antispam-PRVS: <DM8PR12MB54783349CF860404A8A629C7E6809@DM8PR12MB5478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0uGgj/PpD/UIh7oDCRBuIsZb9Y7hSUriwfLG8IxyoATFGJZmC+Ke4EvMnbLqOKFUk8UxYu3YG83xUTpmQbFp0qrEDzygsLyuTwm+DVzOaKJtsD4Vk5LWv78PPvxG9gw8a0NkGo++NgEFI33pDEEyAuos0VekoKYiHzZ+9NqcP3jHnmASQjdsF/UXqHPHR1P/vZwTVeXrGk9VvFzENkjk/pdm7p8f3vELb35J0J7lB0Go5S6EmCTGKwQA3oVfwMP/ZFlavxDYbDcBR0Spt/KLnyfrkJTjOhm7d2XPsLwTsubJVhfZ/JZgiyv17oJFXVlWScCWuSDxG8NgHAHCNLHG4/t47weZLEk5TTIpIJU/RnUoA5lKkYJWt6IOt/pFmzzaT55/SJEsuUgkpBaGheDoBBSQSfnvMaa7MEr0U59/RveLyXSEJjvA3gkUKA7riimjiJh+KuOrrlD4JvqVeM30rScqiUjzS1bqHU06Qlc1pp+4gxGVoRrBjAh6lsPqKT4P+a1089HZ9CYf1vDXpTUVevAGlHB4fLET08AkYkswyqn+2d9YNDDdQnWVxKnBBD6F9bbiSg+0gByd2l5qMZd+sB3hxbyEbGEpusnNvj3QzTRRqZn/qDPr/Km3Tn3lZv9AKBn1KU+qyQRM0cFieTcVfB4qZpjwH90LQplYvFD5ey1oWgK8hHQtXI/PMPYOSIVYbJc19fEyvkSy2sdJuBDakKBU2h95G6i331FD1PrVLfZpieflPr4LhGSSaVyZIFk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(16576012)(316002)(110136005)(54906003)(8936002)(2616005)(38100700002)(31696002)(6636002)(36756003)(5660300002)(966005)(508600001)(186003)(956004)(2906002)(66556008)(53546011)(6666004)(66946007)(6486002)(66476007)(83380400001)(31686004)(4326008)(8676002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhZOTYzMDNPVmpWeHE1ME9SU2dUU0lmT3ExcDhQaWlSL0IrMWltWmlIbk1a?=
 =?utf-8?B?R0dGU3JMMU1xZU5lcG1BaE1Mb3ROUmlreFNjZHc1OEJCQTBNQ2VlTG5TSHd4?=
 =?utf-8?B?UjdnalBCR3JFakNHMWFWRVBFK3ZUa2toTkR1Ni9jQzVIZm8xZWpVWEM3WkFI?=
 =?utf-8?B?OGVITGRpdWpIOVB5QmRMSHUybnNTNWRibmgvOERlbzZSa3NMQ3gzTnZSZy9h?=
 =?utf-8?B?Tk00NEh6UnV2NU9VUHZ1WFZEMkpHVWpqWDZIUW9ERnVOYlNqaGtjdkZqY2FT?=
 =?utf-8?B?NC9GUnVkb2ZJdkJhdk9tWjExSm9kaGxONzVwUXhjOHFpalhLRUNFTUlhdXVt?=
 =?utf-8?B?cGR3bVJ5ZWhJTmFCQy9uUTBGSGJqTnNITHkrWHpMSFRPUFpwdno1NTIxa01a?=
 =?utf-8?B?SXE1SUdtemtLdmtlODV3eWRYam9xbVQ3bU0ydVBvT2t3NjkwbjNNMUtYbzdC?=
 =?utf-8?B?SFQrVGNUU3RFQ21NdDVMc3NTVzdGYlp1anFuUlNQd3lFbkJBbjc1amRCNVIr?=
 =?utf-8?B?K1dNVm9hKzBqUkN0eFVGV3V1R09HZEpXSk1YdVBmUkxVa2lhR3pKR0dJY1FI?=
 =?utf-8?B?YkIzaGJlZUJTTWFSMjVYdUxiV2FrTFY4WHo0T3E5N3FrWDBUNW0zc0NoTlUr?=
 =?utf-8?B?a05GWk5LZlJmNnZjazVEdkVTazZxNGlXNldjZ042UTVBRWlXVVM5Y3hWaVdT?=
 =?utf-8?B?aHdNUVMvbjVWOVFML1F5QmtXSDRmVXk3SlBTL3pGa0dFZ21EOGFSZlNqbmhH?=
 =?utf-8?B?aHdmZ09MRXR4RGZKNEhmRkZzc2ZYTENJamhLRVlack1FU3Y2TGVPN0FrZmRj?=
 =?utf-8?B?L1ZFbFpFRUt2N1R0anBqN0RqYVREUkxIWVpTZDZlTkhTVjNyRWxZWnU4Vktr?=
 =?utf-8?B?NnRzbTE0UWk1R3RBTjYvUVE4eVhKblR3NC9oeTR6dGsxZis2RnN2d1dEQW16?=
 =?utf-8?B?S3lONHN1L3RPV05Jb0xzNmM1MVV0c09wV0lMYURqR2tVNklTWHM3SFBoQksz?=
 =?utf-8?B?azV4Z0tmMHFwejNWcGhuZFJSTEVVWHRvWXNIeGxscTFISkk2L2ZON2p4UHlS?=
 =?utf-8?B?bVZjVE5xSEZOS1FKRUh1NjRDYlA4V0k5U0Q2Q0JLZXF1V0crR0RqWnNFUy9y?=
 =?utf-8?B?bklDMmRzYkgwNVZhalR5ZU9LdW9aanJDQ3FMV1NaNFNMSnJGcHhTRjZZN2Fj?=
 =?utf-8?B?N055WXBMZCtUV2NHN2NpajZJZE9rNnZKbU1Qcmx6eUgvcWh5Z0FYN1g4QXUx?=
 =?utf-8?B?c2s5ZEtYQ3BHTCtkc2E0YWpWVTIva1RyQm5GRm93ODE5WUNDTElEZ3J1MURp?=
 =?utf-8?B?cGo4SVBtRHRrY1BHby9aeENmaVBtSmw0QkFGU1BTT3RSaHVOd1h2MWhib200?=
 =?utf-8?B?UHdFeW5jTXU0Ri9mOEtuUEdKWCtFd2VIZUUySWN0WkhMbDd2WFNaa1c2c05F?=
 =?utf-8?B?cWJ6V0hBRE94OXU3U2l0UHlKUTVVZFE3ZlFhMkhtQ1BCZGxBczhRMFZ2UFRy?=
 =?utf-8?B?OVV1elRKeUl1MlF5bzVsdWNVZVQzUjlzR1NLNGpPb2ZEMWRWMzFxWWFSeXYv?=
 =?utf-8?B?UC95bmEvOFkwZnh3U0xiakJJZ1JKRzNONlVBbTU2S0t1SEh6ZmozN3d6azZu?=
 =?utf-8?B?ODBXK293NktNdm5qMlNaZ1pQVnFRZ09QditDdXNFdkg4NnV2L0JkZDd5c3R1?=
 =?utf-8?B?QkxhbENDUTJ2aThVRXlvdVc1bnQ0OEoyOXpndHZRaXV6MGQ4NDVQUGtRcGRX?=
 =?utf-8?B?OGZHZTBJLzlLZFd6UFRER3FpVlQzaEM3Z2RKK1lRNjNhdFBjM1NoSi80Z1hi?=
 =?utf-8?B?d2ZhU21qdEFxdlV5MnJGWjJWUjMydG5mdHZKam1sTXVvRlhjcFIxM3RpRWRi?=
 =?utf-8?B?a3lsblMrY2JyNFBZbUNyaGhVVHgxc1FnOVozZXdmVFg3ZC91TlVPR0VaQm00?=
 =?utf-8?Q?Me+74YHpGDU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c604b49d-a970-4b13-711a-08d9954c65ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 11:09:20.8842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnatikar@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5478
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 10/19/2021 9:34 PM, Mario Limonciello wrote:
> On some Lenovo AMD Gen2 platforms the IRQ for the SCI and pinctrl drivers
> are shared.  Due to how the s2idle loop handling works, this case needs
> an extra explicit check whether the interrupt was caused by SCI or by
> the GPIO controller.
>
> To fix this rework the existing IRQ handler function to function as a
> checker and an IRQ handler depending on the calling arguments.
>
> BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1738
> Reported-by: Joerie de Gram <j.de.gram@gmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> Note:
>  This is *possibly* a fix from fdde0ff8590b, 56b991849009 or other
>  changes in the acpi_s2idle_wake handling, but AMD didn't support
>  s2idle across the kernel widely until 5.14 or later. This is the
>  reason for lack of a fixes tag.
> Changes from v2->v3:
>  * Add new precursor patch for fixing missing ACPI function stubs
>  * Add __maybe_unused for unused function when set with COMPILE_TEST
> Changes from v1->v2:
>  * drop Kconfig changes to drop COMPILE_TEST, instead #ifdef CONFIG_ACPI
>  * fix a logic error during wakeup
>  * Use IRQ_RETVAL()
>  drivers/pinctrl/pinctrl-amd.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index d19974aceb2e..1272ecd8791f 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -598,16 +598,16 @@ static struct irq_chip amd_gpio_irqchip = {
>  
>  #define PIN_IRQ_PENDING	(BIT(INTERRUPT_STS_OFF) | BIT(WAKE_STS_OFF))
>  
> -static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
> +static bool _amd_gpio_irq_handler(int irq, void *dev_id)
>  {
>  	struct amd_gpio *gpio_dev = dev_id;
>  	struct gpio_chip *gc = &gpio_dev->gc;
> -	irqreturn_t ret = IRQ_NONE;
>  	unsigned int i, irqnr;
>  	unsigned long flags;
>  	u32 __iomem *regs;
>  	u32  regval;
>  	u64 status, mask;
> +	bool ret = false;

Just a minor nit. Can you do it reverse Xmas?
With that change 

Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>


Thanks,
Basavaraj

>  
>  	/* Read the wake status */
>  	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> @@ -627,6 +627,12 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
>  		/* Each status bit covers four pins */
>  		for (i = 0; i < 4; i++) {
>  			regval = readl(regs + i);
> +			/* called from resume context on a shared IRQ, just
> +			 * checking wake source.
> +			 */
> +			if (irq < 0 && (regval & BIT(WAKE_STS_OFF)))
> +				return true;
> +
>  			if (!(regval & PIN_IRQ_PENDING) ||
>  			    !(regval & BIT(INTERRUPT_MASK_OFF)))
>  				continue;
> @@ -652,9 +658,12 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
>  			}
>  			writel(regval, regs + i);
>  			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> -			ret = IRQ_HANDLED;
> +			ret = true;
>  		}
>  	}
> +	/* called from resume context on shared IRQ but didn't cause wake */
> +	if (irq < 0)
> +		return false;
>  
>  	/* Signal EOI to the GPIO unit */
>  	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> @@ -666,6 +675,16 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
>  	return ret;
>  }
>  
> +static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
> +{
> +	return IRQ_RETVAL(_amd_gpio_irq_handler(irq, dev_id));
> +}
> +
> +static bool __maybe_unused amd_gpio_check_wake(void *dev_id)
> +{
> +	return _amd_gpio_irq_handler(-1, dev_id);
> +}
> +
>  static int amd_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
> @@ -1004,6 +1023,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
>  		goto out2;
>  
>  	platform_set_drvdata(pdev, gpio_dev);
> +	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
>  
>  	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
>  	return ret;
> @@ -1021,6 +1041,7 @@ static int amd_gpio_remove(struct platform_device *pdev)
>  	gpio_dev = platform_get_drvdata(pdev);
>  
>  	gpiochip_remove(&gpio_dev->gc);
> +	acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
>  
>  	return 0;
>  }

