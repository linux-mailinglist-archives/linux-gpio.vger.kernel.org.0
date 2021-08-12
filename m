Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A893E9C81
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 04:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbhHLCZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 22:25:54 -0400
Received: from mail-mw2nam12on2052.outbound.protection.outlook.com ([40.107.244.52]:5984
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229729AbhHLCZy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 22:25:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDq7mElF7EViy09uYdO087Rm/0+Vu6wkZfzDNh81xy2/dS57MmVPwwyGROpOxZxzt2OHXDaq+lU4Jb9zgGM76h2T1a06/JZjN2a5HisxcOyhBRieuuSH0aZeMp8X4+d+L8KWUhGKeMkR/G3PV652U3GcbRiO0IRDQ/cxzzVZc5IrI30YZUO5WqqDMnMd40iwXiTj7rdhNap1d2KN2gRAf+hnPxBHhzd/zH6e+O7mSqITN80nVxbPAZed6EfIMCvx41TZFGiMV1kssXbLbkz1O5S26UM+SXVbw2Qw0b+tGk2reKEew5pav1ebxSab1aj8KHUU17JDRkJb4iQ15eu+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaVuodWuxhwBmzVk70c0SnHt0HShHQvXimHj12e9e8E=;
 b=K75+uh525SIWuSY7Sg7pauDUF0JlHj+M+Re1gXL5Sr0vdKxZj9hf4LSKEx5eaJnswDZQJLoO7K1ydyPJJ8yd4agbVQPemaC41bzKh5KqryfBVZ6lW4kKZdseTItfWYMsxtlubkoZZe63HZvqB2fxVKCDnqtLU8h3SeAbxJ8GDFYpSqxyrcrakB0JD4egUpY+779x17uKyVU4cm1eY23EvI7Wyomvg80snnKMGDenVj/GZHBtH5bjiSZb6EEktAPQQ5EbI5nAtqH1xxskprbXcWUPndVs1tYZ0bznXrwiQ+fYEL1EvFzGyclM/nNAcr0EbwAwqniY8nPIDxql1gAI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaVuodWuxhwBmzVk70c0SnHt0HShHQvXimHj12e9e8E=;
 b=mE9J4et4Ptahg8zu/nzUe0kfaNutU/xLppWZVyMNd4h+1852pZdWRqTqsSJSTorZUymZ4CVwe3j1iRBrLtc3F/YtYvyI1eD0M/yxyLU7SX6uoG4kVJFbzMrGS9geFfz3H1YklGwMbDveOatFWJqWG9E3zNeLOCPvZSeE5PLCsjg=
Authentication-Results: googlemail.com; dkim=none (message not signed)
 header.d=none;googlemail.com; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5302.namprd12.prod.outlook.com (2603:10b6:208:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Thu, 12 Aug
 2021 02:25:27 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c426:126:d21:61db]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c426:126:d21:61db%9]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 02:25:27 +0000
Subject: Re: [PATCH] pinctrl: amd: Fix an issue with shutdown when system set
 to s0ix
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Raul E Rangel <rrangel@chromium.org>
Cc:     "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        nix.or.die@googlemail.com
References: <20210809201513.12367-1-mario.limonciello@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <1db61aac-f903-5a2c-62dd-f6b628b00a2f@amd.com>
Date:   Thu, 12 Aug 2021 07:55:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210809201513.12367-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::25) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.11] (122.171.6.18) by MAXPR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Thu, 12 Aug 2021 02:25:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74c4d38a-f3a1-4a02-1f83-08d95d3872d7
X-MS-TrafficTypeDiagnostic: BL1PR12MB5302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53029BF3C9E34E4956B10A7F9AF99@BL1PR12MB5302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0eJKtHEkNx+CvB1JWLRPDYKxlrOx3fybSA/RbEVxbWgjwKrsFgxis+SVgKhCevQLdMVK+yn5RfYwKzvuEfiCD1FlPyo9fm/I8LjFeycvfLMp0bfHo7wfetx2YcoYtHexXpQCunKRqXvnXkDLmEw1PMsZkwOf74GqKJJBFz/kfduaAsONU0kohWmgDzF9fMjR+b9g3BqRDySMlkQtFDIHgdE/fjCexGtpyfTxttOCHxFJdWUocU0JU5hdPFs/ehiJfWAPQyOCiZEIDUyys4hwlznG0Q3Y60gEg4+cPLgJXRnFs+YLoVcMAQ0jwGmNBaHL0JNeh9uwtUKkd7cl48HMFqi4G5oLOm/8b7D9+BnbDoOaO2y9XKzIWUB54BlcgAEkLeHhEizKddoYChSLgYGozvqZRovjgwxL+fzM5NQ5HpLA/kboden2qCvMLu8/udSaiOPmtSHZ/wPc2Fgh6do6S+6ahLusdmwCJQYpZxiLQm6RhJD6wBRhdo3Uv/DMPazAr+yBpUltgD+ouJJTGgyR74HVFcdDYdBj73QVNyr+i7yifKuGLNJbP7CeItW66GstNaCtakEOCI5d6IJc1scR9XiA8o0i6xlHknxcaEWfY8NljJkiA0wuBs6ien4MCbRE72K94j6ngG9tPr9sFHgmIl96ihbwksE6SNX82rWU/AIUXeG9bIzaAWlLGLAlF4jbqjmsZztbbIPbddGNAnSWor6v+hLdpFfiTHvPGrDSMhED7xGFNDiftIgmHRRGZI5aid6ZmagcdcZ6cDPBtkkpEEPbEeyEoyRnDVLjRZH73U/6NU4BzmLYYrwgetWrR5EWRYJB/x/LPDdOybzcMLY6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(956004)(2616005)(83380400001)(86362001)(6486002)(31686004)(186003)(66476007)(966005)(31696002)(5660300002)(2906002)(8676002)(478600001)(66946007)(4326008)(8936002)(316002)(36756003)(54906003)(66556008)(6666004)(16576012)(26005)(38100700002)(110136005)(53546011)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d09TM2VYYXNMQXJjSVlHT1NtKzN0alNEVXZIMlRmc2lxV09ZaE4wdThtUDlI?=
 =?utf-8?B?U0ZIc2ZsTUVzVDJzM055UjVpc3I4U2k4dFlKUEw1eVZKalpwdW1GTHh6dFFu?=
 =?utf-8?B?aWVKRzZ2UytTWDdqU2dxN1VUVHBuWGl2TG9SUWkxcHl6ZzZ2MU5ReFUrVVZY?=
 =?utf-8?B?YzlDazBYZjdBUUJxNnljSGFSeVM5WXdLMDd4OVdtYkE1Vm53UW5NVDR4MGpH?=
 =?utf-8?B?Nms1TUR3RWtNSXUvM0s5emlFT0oxWlU0SzBaTVpxQzVMNzVndG4wOGRDREk4?=
 =?utf-8?B?ZzRDOE0wc2RzVTR6ejVzN3V2RVVFdlNJRThINmpGMGZ1ZENCNDhWWXgrZGx5?=
 =?utf-8?B?UXdYako0RGo2Ym9qTXYvVGZtS3VRem5nTnhGZFZJVlMxN1U1L0lib25qUE1h?=
 =?utf-8?B?NC9idUdPMVFQd3M0UnZ5dzRaMFBISE1EZXJhM2pMTWNCL1hyUHk4V05wT3A3?=
 =?utf-8?B?cWxVaHBnUnZYalFwZTlkUzlBa0JCQ1VSL3RuOC83d0pjQ1kzTnh2SXlLR2U3?=
 =?utf-8?B?bFdnZWZrMDhXaXVrMXZxZlcwWVNjQUlINVJLK0JUVmdLNlFsNkpZVmtsNXgv?=
 =?utf-8?B?N2NiZFg0anQ4N0tKeFdEZS8vMWJRenp2ZDlOcU5yRE5iZ3oxZjBaa0NBN3V4?=
 =?utf-8?B?OEJNTE84akV1SWt1ekdCWXBnWnhzbXljVjJqKytQcmIzdThEOC9vdGxGZXJO?=
 =?utf-8?B?ZW5vZGUreEROTVdQZmFhUFF1dUFGK3R6SC8zYmNWcVVOdE0vcFJoNnQ3UEt0?=
 =?utf-8?B?MzVacUNpcWphYTh0bzJCdUYxRTE1MEI2dlRsVnRMajZxclFLRURaRE5PZkVO?=
 =?utf-8?B?NWNXN0JqbldUcmdUUnBSU0V3THdQRHp2UlJ4OEw2WGdGNkVEY0M1ZGsxNU40?=
 =?utf-8?B?dCtVY3pIQjZ5cTR6bnFiaHNyY1gzOWV4L1hYa3k3dUk1NlpjblRIY3doTFpT?=
 =?utf-8?B?T3hBTnlwbzU2S096VDlLRkIrUjlXdW9nMXJvME9ZTGZrWGM3SWNBTXpGZEp1?=
 =?utf-8?B?a1FRYk0zS2JsOXhuWHgwU1JJa0kzcHgwUkIwSnJHSHZmRkdSM1lHZnNmbHQv?=
 =?utf-8?B?MmxUWGkrN1pJVXJzdjBhcmRpcTgxbysxUzF0T3Vxb25MZTRHL0VnNVpCbTBF?=
 =?utf-8?B?dXN5QmMwZnc5eHpnQ25oSWNpNHFuK3FvaUF3c1ZRUFF0YytQNEhmdXRxeXh0?=
 =?utf-8?B?enk0dnpHZzVsNkthYmQ3SWQ4Y0l1aXlrMVVFUlRJY1FHZktULzZxdWE5WGN3?=
 =?utf-8?B?UVVXRDdmaEhPS0RwVnhuTVJ3SE9MSytDeW12ODFRdTZ0SjNmeDg2MEJLVVp1?=
 =?utf-8?B?MnNSdHh2YVdUWmFFL0tmeU9YN3RMakdjSVQxdW9CbWh4enR0Q2w0NVY3bUtT?=
 =?utf-8?B?Rmk3UmdSZ1BoN2ZIUGR2Y1VqYk9oTEdxdUZ6dG16ZktGZlJ3ankrOC9OdFRR?=
 =?utf-8?B?OXE2cW1kbUZNd3l3L2NIbG5GeVdGRmw3K0MxanNxVndxS1EzMEdBb1ZrNmsx?=
 =?utf-8?B?VVdHUTBsbkJ1WTFob2loOGpka2tuYWtWS2EyemkyTFdGN1N1R3dDUmNrbWV3?=
 =?utf-8?B?bFVja2NlL0NEVVR4czlwSHBqUS9LMXhleWlLSmUrdWR4cVlpcWZicVprdTRM?=
 =?utf-8?B?dklHc0JvY3pHNktYOVphYUxKbjJFZHNCSUFOYVJOa083UzZQOE1xSHk3OXJw?=
 =?utf-8?B?VE12anZEWUw3MXlVK1hUTlBXODNoMDFiK0ovOHpmSUF1YWRBVmdQd2Rjb1dC?=
 =?utf-8?Q?v+GIKPDfL0QbjQFKP50uSEWzBrFYrXOPb4r8mDI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c4d38a-f3a1-4a02-1f83-08d95d3872d7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 02:25:27.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: du904O/6nRsIfG7gu6y90W4N6WHsEK4yGCi7EYoFpUzKMVCZEfZeBJfxnXHld5j8SJGt15SJadx+ro3KQUCfjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5302
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 8/10/2021 1:45 AM, Mario Limonciello wrote:
> IRQs are getting armed on shutdown causing the system to immediately
> wake back up.
> 
> Link: https://lkml.org/lkml/2021/8/2/1114
> Reported-by: nix.or.die@googlemail.com
> CC: Raul E Rangel <rrangel@chromium.org>
> Fixes: d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index a76be6cc26ee..5b764740b829 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -444,8 +444,7 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
>  	unsigned long flags;
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
> -	u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
> -			BIT(WAKE_CNTRL_OFF_S4);
> +	u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
>  
>  	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
>  	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
> 

Looks good to me.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
