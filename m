Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358444271AC
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 21:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241939AbhJHT7Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 15:59:25 -0400
Received: from mail-bn8nam11on2047.outbound.protection.outlook.com ([40.107.236.47]:60001
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231589AbhJHT7Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Oct 2021 15:59:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGkMN4fLYUHqUKeh92ox0pR9MFTX8/0fU3xr30L/MD8B0HRHhoomCA941dN/ddciYXs1JoOTECIpu5gQQC1qRok3xPzskuHJ2Aqk22AjtkigMRtZYYXQlPXj09y9hQBihmg/lMiWj1N+Z883LrSu8vsg22M6VT6rdmb+qx/o09KxQV7X2i1Hn3YOZz4IpITiIdzuFr/GHtiXkABOXuFudNa/h08lQSeitMe/4Mn0gg2riZXgPYmvTc7z5/GBw4G85wIPa/OsxJegJHltdnp+E1pWev1Gwp40jMhF8CeJoi4S3mSwLYjgeEG6enySZB/qBWMEfp0h/BYF5BATf9Dd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtD4yeVxORps79WBpKA6F8idr/rtUXrchc6zspTP3KM=;
 b=hLO1NsvGJi7pvWnvSaLkA3GxzBLCtjd1Ujsqh/ymZqfBPDdnxagMNP9SEB9TqqpUH0K9CLtWHaBVTsiwXmH53T83hmbQ4sHNy4UeuEUTakGYLZgxMYai7WA/ELVCZGCw2kPlOB+rg5c5q9g1DV/SOH1FoAmmrgLCEXtAVNS6+uqjV31oNultmU9PCtxgoguOa5CXLjjj50sIoTMPULoow457MHV6QzHLJxRkTU4ggBQEfb+gjiTVbmFvLP85lTylCTvr2AVsM6j7NUnszKC0qeAWFVgehpMVW08TB+86t/mc3UMdAIaZoCNR0zJrRG+UHbPOvVxrVdhsr5aEn8UTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtD4yeVxORps79WBpKA6F8idr/rtUXrchc6zspTP3KM=;
 b=GQ3X3WYn/Ya04BZtDx9kRefhMsiP3dag/JM/b4zsLXIpFJyTdfw6nYVDMM15e3QFsceTrBZwPm1dsVQ3PG6tZrCNRftsx4teewNXfoWduYyLxyr31zoCGOWLjRFB7FiNZpDQ/lpLlHY68ImH1CWHYAX7uANULHxJnVsDtrIkHok=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5357.namprd12.prod.outlook.com (2603:10b6:5:39b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 19:57:27 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b%8]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 19:57:27 +0000
Subject: Re: [PATCH 1/1] pinctrl: amd: disable and mask interrupts on probe
To:     Sachi King <nakato@nakato.io>, linux-gpio@vger.kernel.org,
        basavaraj.natikar@amd.com
Cc:     linux-kernel@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <20211001161714.2053597-1-nakato@nakato.io>
 <20211001161714.2053597-2-nakato@nakato.io>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <5d683882-257d-87b2-20aa-0871e2902090@amd.com>
Date:   Sat, 9 Oct 2021 01:27:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211001161714.2053597-2-nakato@nakato.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
Received: from [IPv6:2405:201:d002:588b:e88c:d154:d7cb:86f4] (2405:201:d002:588b:e88c:d154:d7cb:86f4) by MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend Transport; Fri, 8 Oct 2021 19:57:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c7a983-4bef-4c63-243d-08d98a95dad7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5357FB74A3B368687FF1A2AEE6B29@DM4PR12MB5357.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8FqZibiNfIAQNSu7NiYzOSrQVSvmQje+TaL9EVwn+3ZSdhwvu44wt+zO3WU6yhH621oEDXC3+FtaBisWqGTSZEPavsaUuhMP36e9A/cZAQTcGkdcvk6D+11QV27iX/+mvalyEg3FKFy3u1mvF5w3oYx7EUQDLv2e937Xh+EJqtQjNtL8Izc/YRZ0kt8Lda4tvrqYwYC5qvPOJGeELOAW2zudjya5PdYLquXoyj3SsuEs/kcobxD76lNobAGEYAc0PXhXc6fIT4ADbZqLmICwEfxM0FSLSbfU7ek9OfeZIlpics/CUkM4AOHgp9RUFB/+uPKMQcWk6+CsR3lAWtu9NDZvgMq6gpDubodC6J8Rv00/xsqc/MKqG3KCz/PstCtbUlByD7JD7Qfa8hy/ELKaaa3hFMxyMj4Tmjz1qWjH9OOrYdCPxRoMWJ7ZZqqOTT68p7xLx8BTw4nflEgzDcqVb3XbR78o/Q3BEHf/JlFQjn7d4LYMNAxDx4IX6FVaMZxtQn5FhwUlt6iBTLaBSxUMgnezMQyjMuFtPLkShyvW2BPrFQis5M44oSv+Pv2ppMF6f9grtX4qjOlmp3tJdhf/ahFSNiJ54cnPSWX5To4PdDdS2fhMw92itsDVs0l+yVqZwFRs/Qak/3o9b/f1OMma47GcuS1Cgg/WqWK+09+VXpeVYxapRbJIv7qyk58+t7MQZpwfX3GKLzygNFenzEMqsiLbBWWfR1cXYvLz4wEzV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(83380400001)(8936002)(2906002)(8676002)(6636002)(53546011)(38100700002)(54906003)(66556008)(66476007)(4326008)(316002)(45080400002)(66946007)(31686004)(6486002)(186003)(36756003)(31696002)(2616005)(6666004)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTBhY0NlQkw1aFFnSkdKNW1qTlBQbEJRejBkelphbkJhV2VlODZFTitWVzRs?=
 =?utf-8?B?RXZOeEV2QWQ1ckp1VGE2WU5NQjBRaFprajJKVzNuWXg2UXIwZEJldG9BUGJw?=
 =?utf-8?B?L3ZvSWNsRmFEa2k3eGdYVnBhcGl1SjZ6YnliaTljTnQ2aUVjV3cwNCs3Mmpl?=
 =?utf-8?B?TWZ2NUVZYmZLYW5aR3JqYmx4NlRDalIrZ2tEU0VuVTFoQUhaNXVjdVZKTCs1?=
 =?utf-8?B?R3VzK1psMVA3MjZsQjg3bjZPcDFQVnhUU3hGQWtib1VDYWt0YmlBaHdqdUhm?=
 =?utf-8?B?R3hYdUd2ZUMvSGc3cmhmZE4valBCTGN4bHVvbi8xVER2S2M3TW9uMC9WMXJK?=
 =?utf-8?B?NmZEbkt5UVBYVDcrS3ZkcFB6dUpkQTdvNUFiZnhDR1lncHlBdTlXbmt0TC8r?=
 =?utf-8?B?QXoxR3ZKTTJXSWpMUlRaVVpQYU5ZcmpXc2lwU3F5MHBWb0dkNUwxZzRqaWtG?=
 =?utf-8?B?Vnk0K2trZFRNOW1CbHpwT2RDdyttaWo0NlZFNVdSS0l2dFNiQW9XZmpnODBQ?=
 =?utf-8?B?R1g1S3dmUUsxQjdqZGtUVWM1ZzFqVHYxblo1WkRyZWd1YUtTNVBGMTRCVHpz?=
 =?utf-8?B?OWpxdjNOdmNnSTVIZGV3RjN2dmNwYVp2VWJGaHlpRHpvNFhFbHhkTUM3c2g2?=
 =?utf-8?B?SktqUFpBUXhhRGN0NGIzZ1pCaUU1R0ZvaGNZQXpjUlBQWUJldkxOTUFhMXp6?=
 =?utf-8?B?QXFDQ1pieTFFVWpSZjRvRmlWK1JEYndxZk5hU3hRY3c3SFBZdlBUV2tJNVVa?=
 =?utf-8?B?dEphdnNqWjF4eFgrcjhMWFBFSWxaQlR5TFg2MkFPdk5aaHdoY1RZRmlhbGZD?=
 =?utf-8?B?VW83U3l4eGcwaldDa1duN2h2RGlSWUFYcHZPVEtiMkhwT29oVW9kV0tSaE4y?=
 =?utf-8?B?WlROdGFBNFFtK1Vkd052ZVZDMGJyNUYxV1ZJU1lwWGlRQVVqR3lEVHJaOS9Y?=
 =?utf-8?B?dDJFTmVIZEw5MmtVSStWTGhRaVpJRzFmQ3RKOWVUL2RVN1dReDROaWh0NW1J?=
 =?utf-8?B?QWpQaHlRWExsbTlRYmdiWmx0ZjR3cnBKUkVXWjk0bG1SNTFUN3Byb2lKclBF?=
 =?utf-8?B?aTNRTE02QjJaY1lNbE9acXdmVW93SUY1S3JkMjlLTXVSWVZSejFZRk5SVzhx?=
 =?utf-8?B?YmNpWTVzeFpsMDh4OVh0MGZvOHI0WWVuZ3J6aWhlcU9pNDYyZXFqeThobFBo?=
 =?utf-8?B?Q3FVWEovUldGclQwMjQzeHovL0xLU1hjcFErd0tMeWVMb0sxdlBvNTNiVWl4?=
 =?utf-8?B?WTFrMTR5TjBlUTRNbjhVRHBVd3plbkUwc1VkeUpzVXZsam82VmNyaUlDVUpi?=
 =?utf-8?B?aGF3M2gzSDJWc0FVY0tRV2sxZllNOTNCT0ZvVWkwV0F1M3kyaTJQdFVXSjZF?=
 =?utf-8?B?SDQ3ME5VYUFZcEZycDQxaWloK3IyNW1Dc3d4cVNJQmRydXdWQTFrTG94b243?=
 =?utf-8?B?cGpqN0VOWTZVK212Z0JwRkNKM2V5VXFWVnZjRjBEbWRrd1NGQzJ0NThnbm1h?=
 =?utf-8?B?VFJ2cTlWalQ5ZndxTk1oUzVIcUo2SXYzNGswTmNiMWVyZmNpMERhTVZyWTBC?=
 =?utf-8?B?bWwvbVIySkl6TjBiaTJ4blFsODlPclNkeThHbEg5K0hkVmFrWDRrQWVaNjBs?=
 =?utf-8?B?NldadjZEOFlDZTFMUUtucHFpRHVyb1c2cWgvMHRNYjBKd29DMHdqOGNHSDNi?=
 =?utf-8?B?amg1RlpSNkpNU3pBN0IyMXFYTUszYlF6Sy9mT1VlcWNFZlBvZ2NxSkdqclVL?=
 =?utf-8?B?RHlkdUZ1M2E4Rm5GTS83N0lOWnhJTElWNVBjRTBoOGJ5em9GOUV3SmdEdTBW?=
 =?utf-8?B?d1liaDRQVU5QdjNMNE4wbjNaMGhrblc2UTJlYmFXZ253dHNOQjkwZVFIeGMz?=
 =?utf-8?Q?V7bg9k5K914RL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c7a983-4bef-4c63-243d-08d98a95dad7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 19:57:27.7242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NfpNjUjjl13CgYp0jtyAJz1vH1VzpDL1mEkr2p0VLEBo7V8R81+PbqSsnSObyHWiuU/GjqFdCfiSdQ0ndklUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5357
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 10/1/2021 9:47 PM, Sachi King wrote:
> [CAUTION: External Email]
>
> Some systems such as the Microsoft Surface Laptop 4 leave interrupts
> enabled and configured for use in sleep states on boot, which cause
> unexpected behaviour such as spurious wakes and failed resumes in
> s2idle states.
>
> As interrupts should not be enabled until they are claimed and
> explicitly enabled, disabling any interrupts mistakenly left enabled by
> firmware should be safe.
>
> Signed-off-by: Sachi King <nakato@nakato.io>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index c001f2ed20f8..aa4136cd312d 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -830,6 +830,32 @@ static const struct pinconf_ops amd_pinconf_ops = {
>         .pin_config_group_set = amd_pinconf_group_set,
>  };
>
> +static void amd_gpio_irq_init(struct amd_gpio *gpio_dev) {
> +       struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
> +       unsigned long flags;
> +       u32 pin_reg, mask;
> +       int i;
> +
> +       mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3)
> +               | BIT(INTERRUPT_MASK_OFF) | BIT(INTERRUPT_ENABLE_OFF)
> +               | BIT(INTERRUPT_MASK_OFF) | BIT(WAKE_CNTRL_OFF_S4);

Could you please correct INTERRUPT_MASK_OFF , added twice.

Thanks,
Basavaraj 

> +
> +       for (i = 0; i < desc->npins; i++) {
> +               int pin = desc->pins[i].number;
> +               const struct pin_desc *pd = pin_desc_get(gpio_dev->pctrl, pin);
> +               if (!pd)
> +                       continue;
> +
> +               raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> +
> +               pin_reg = readl(gpio_dev->base + i * 4);
> +               pin_reg &= ~mask;
> +               writel(pin_reg, gpio_dev->base + i * 4);
> +
> +               raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> +       }
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
>  {
> @@ -967,6 +993,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
>                 return PTR_ERR(gpio_dev->pctrl);
>         }
>
> +       /* Disable and mask interrupts */
> +       amd_gpio_irq_init(gpio_dev);
> +
>         girq = &gpio_dev->gc.irq;
>         girq->chip = &amd_gpio_irqchip;
>         /* This will let us handle the parent IRQ in the driver */
> --
> 2.33.0
>

