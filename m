Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61AE33E4DAD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 22:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhHIUPw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 16:15:52 -0400
Received: from mail-bn7nam10on2050.outbound.protection.outlook.com ([40.107.92.50]:12261
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231127AbhHIUPw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Aug 2021 16:15:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atVVmLxpQtME6L7fddT/u7G3wKKctaeanu5n5g/PpB7/VapUBZBRVFwIvwqA+n8jYARXW/22v0t9iEmHuHZ1oPGxIU+8NES7jqdfubcfolh/KZSBsNc2awR1NkCVBCdWyi2FLcXxHTs2AJgc+W6c8waxlJ75y0yIqAGDi+9snHe0DJ3aFL7kku/YQp3vNItUJz0uxJCbUuGIqbQ06ydX5ppR91cFmqK/8bHn950joGgDEtmkiF3HwLMzH7UzpM/EB9Hmsy+3Fe11qjMqZEAkRoTP2oekEL0E8JXZzzGqW930qAyadg/i97lT4nFmRenJjs8Oaxv3FFVmbrckKPYV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl+2fhG/bRH2ArXFhel/A8dD9wEXzEd+tRy20ExMRPM=;
 b=KJD7R2a3yDKF+SbZYV7xfLqTZQzoC4tomsrGgVXAQeJbIYCxmnHUt4sbVdUgCSwsddkFpD9c6AVz1SWoW+oBbcfPS0lj17lNPtlSauX1Cf1G0uff+Gk30TqgybIr90dp859LMXpol6SrwsCPX5kfW8zEI+TRDsU7cfhlToSOBECeIxmuMiNdURYgHpB5ptWyXkUjtCJulK7pgm4IDi4ZQtYW75ObIcBuAJsSQurWrRYFxr8FLz+NPh0/IoqhTGKWR8s9myno/dZJpH6MEBWxmaIGAC5dtigNWW349TCx5jiuWkrD4cPVCtuMS6/dyVNqEb+LShXxpXZs8DQqyMweXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl+2fhG/bRH2ArXFhel/A8dD9wEXzEd+tRy20ExMRPM=;
 b=DerSC6StxaY8zJJ8dzJHMF2xGm+wX14ZYcWRJLHQBUJTzI4jpI5evPYSSzscuUANzxnpInyvn2KuFb7GwFFgOOje0DyDWmJ4LToCANppAI1WkzWnMSkduwJP2niHSEJBhQXAyBK7V3vfr0ttdoRkPe3zoaVKqoHlWZMWFZD+1JM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Mon, 9 Aug
 2021 20:15:30 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::e8ae:ebd6:7f5d:4b36]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::e8ae:ebd6:7f5d:4b36%7]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 20:15:30 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Raul E Rangel <rrangel@chromium.org>
Cc:     linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list),
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        nix.or.die@googlemail.com
Subject: [PATCH] pinctrl: amd: Fix an issue with shutdown when system set to s0ix
Date:   Mon,  9 Aug 2021 15:15:13 -0500
Message-Id: <20210809201513.12367-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN6PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:404:11::21) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.84.11) by BN6PR13CA0059.namprd13.prod.outlook.com (2603:10b6:404:11::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.4 via Frontend Transport; Mon, 9 Aug 2021 20:15:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f6ae3d4-22f2-4923-d66c-08d95b726f39
X-MS-TrafficTypeDiagnostic: SA0PR12MB4510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45100E4A540667C80CC34274E2F69@SA0PR12MB4510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qrxJwDpurnDxwBGH+n8jzp0ojrh5cLgAkG7DIA4NhXvPsP8PFDAOk6Rpe5lJGd+JELDjRhZ2dzurHZP0ty+5w0sv67QznSMrsnR6+1okisFQj7NOCqJ23jFuParETE6drT5QVXKysJq/ZM4HwExyzPtsIQpDjtA1R0L5wBcFxmjK7a5YVvgEUz3rzlkWXBiJDT58RG4mZEV5GZCl0v1AQUcFv7nlwfb8hrq7GBhjppJ2g9piV5W0SgrONyMqXk83/L1yhlRpIo7YlJra91pf8rssafaQJN/HRln982xYSzUudDTvB0wNOzJWcdUqkfDc5vUOgcWfbKKp9vURdBSYTgolxNnVAllq3lOyRQIV0o/8pKJ+lm4lzXzaDPHhHBSNtO417bzH1ZlhtTowbiAaSzjetsDt0Q1yjTFhvj3LYpjQ0UQMenf4DEfHjiXQuzResqfqthMEvmXjLL57TeFBQiVQ5LKMNFdispmHHV0VrtBmXlHsx/icX0bA99g6+rex80HoQkxWARhtvzNnCT9UJ57Jz6dlSSqV0CZ0kLKbmxjQarzYvKQUGHnon+bH2QEVoElzY6kMUQxCmt+FI2K+llAP8TINtoUN2DsKw5ntCUb4+Dbxb4H56m5OHwsBEaNWLx2woSijjTZ+5+ibIYksj6u/w4epTW51hCjiu6r86pPv9fjmbSeyKpmSS6JHhViAoiN2V0o5p5gFzSW+7uAzFjr++Icz7K0j42bcXmBl3IjUUhGUkw4pRUaKiIfcWXU7/4J+ulhWLtVLqugq8MiLnArjJ7DQHKD0DUQRlP+fJLUGU0X6taRVdHJsMsCpnVq5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(2906002)(110136005)(6486002)(66946007)(66556008)(36756003)(4326008)(26005)(44832011)(83380400001)(5660300002)(54906003)(186003)(1076003)(8676002)(7696005)(52116002)(2616005)(956004)(86362001)(966005)(316002)(508600001)(38100700002)(38350700002)(8936002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CD1GJX+K8pJmcs/cgTpYzyHkQ7Ok7UiDAQ2ulJizeTnC9cM06fLlzRruFASP?=
 =?us-ascii?Q?PPvFmrOOfFi5XznQrmGmhU/0LCaIK1aJjkhrkvzBZKJ4MbH+rpN768Wmo3bW?=
 =?us-ascii?Q?Pw59nC+xq0Mizkd2vvSyen85c07FQY9SLvLtHIpxH/q9kQ9HhcHdt3QyAm+f?=
 =?us-ascii?Q?BzZ4L2jMSoE0pOMglpGoNSHB54HTV6VXlzjn+K38p4qHfFJGD9Ff70gvXv3h?=
 =?us-ascii?Q?sSvciwFzXONUQIbC0NuU3Se+2SdvtMIu9B7KB6LG2pT9Cs0B+xpQZoADywno?=
 =?us-ascii?Q?Q3IJikQTZDv6HnsOsqBkoc6rAdd7/nwXj58wDotKlQiPB2pM74BPyt8fQ/E+?=
 =?us-ascii?Q?P3CF9sAo9/0jIjwbdzcInvEh5LeYzf8iNwADYjiRFp74wOQKK02bAw28j57b?=
 =?us-ascii?Q?d+ejqsjVhEV9x9jCkSDszAF7B2EKzv8Yc4HOU9v7YWtuj5x+YR53PnntFYTz?=
 =?us-ascii?Q?KiEClqp0qn2nAllofEouTYgjyg76m9BMaoJekZyv0sxNNbAB9fM3xvSrzl7O?=
 =?us-ascii?Q?H6Di8YdFX8nPwZU8jqh4qz+YkteZF4xoqs3AE+zXRBVKGlnyAQ5dczdqrXmw?=
 =?us-ascii?Q?WX+pevdBw4ldruG/9kyao+ocsa46vG9vOJaOepsl2xf9Jr21ecq9z2bHItzh?=
 =?us-ascii?Q?teRee0zraXjfD5Kcr4sjBYMM9YjaBEmhgu+pxwKA6h26i8w0uf3x+qoqE5kF?=
 =?us-ascii?Q?dQHIC893jj3LkNZZdlPoqDVGDH7fdnel7Vd2PSIWCyAMZOlt7CXvzj/+tD7A?=
 =?us-ascii?Q?gGWFN3YdK/FbLFYKj91KFLNgQxnL+DlNpxB4ZFwQFNt2RmZ/d/7hmxonjfN1?=
 =?us-ascii?Q?UVH+Nkggq8p/BqGQwXTk9xUc1O4cVMDIxDt4Y4EEmlg5q1zwoMoD5gZRSdA0?=
 =?us-ascii?Q?ntfxFnf4NUCQvkUjuy8HC3Gmh+XnnBi0W3pXkgw6KT+VSDd7Zc36zzb2f9/c?=
 =?us-ascii?Q?C6x/odHrAGSHiskiV8rKcEGbOpyjxvipUyQ9j6LSOouyDSF+6+c+zraLY+Ya?=
 =?us-ascii?Q?+J0Y+GhLu8sgOF4mhK2bKJiLdtbIwyBsHLbtyPqzmG9wkAsYAs79FowkfBfT?=
 =?us-ascii?Q?8SLXRwQMoxoImGUYyGYL3IyK7fX4urNIO9W2r5KxNPariz+9tA5qsjz2AF6R?=
 =?us-ascii?Q?vkZbyX0UiMjCnRICQ4Whcn4oNPe2322/10diOmX52T1f0t7lHNo9FX5UtmGU?=
 =?us-ascii?Q?juJO5SD/3uIc9CE1t6Ac+YEALRDBJECYs67AzMU7h8HGDTvoiyVCCWicssYP?=
 =?us-ascii?Q?LC1YJ+h1CjAogcnCXF/ldIdwIA4Uwm8Pb2YUIRqRhncWg0vhHJ2KUDSjWGwj?=
 =?us-ascii?Q?1/DZgxHsxx3lWMvMgK6P2QuE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6ae3d4-22f2-4923-d66c-08d95b726f39
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 20:15:30.2545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ja9WQBagpc38bNuYAnH0zouEWcQivxJ2O1L7AohqXKg+0gzMtWZgwE2q5Q6bglZgIRZ8maG38JLhZLBtXrtBWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

IRQs are getting armed on shutdown causing the system to immediately
wake back up.

Link: https://lkml.org/lkml/2021/8/2/1114
Reported-by: nix.or.die@googlemail.com
CC: Raul E Rangel <rrangel@chromium.org>
Fixes: d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index a76be6cc26ee..5b764740b829 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -444,8 +444,7 @@ static int amd_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
-	u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
-			BIT(WAKE_CNTRL_OFF_S4);
+	u32 wake_mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
-- 
2.25.1

