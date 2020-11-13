Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5872B16A6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 08:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgKMHpc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 02:45:32 -0500
Received: from mail-dm6nam12on2067.outbound.protection.outlook.com ([40.107.243.67]:27968
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726104AbgKMHpc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Nov 2020 02:45:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIZXXbAW8v/Q1JscYc93qtV4pATjnzONSgLDkoC0aSBHH3bysHO5VmaH+fZWp/9g08VjopKsqGgSCgL7hSwZIg89GNAfPMs4co2KbLumZX1k1z6+JdZM/5HPWrLB307yKKrvMa9y9snltF+7/WFK5nBLdmtMaaHWXGyc5uzRnHqWujp1VvgbRjngKqzIafc2Tpa74yLQcXFlPjtSB/F30fibq9zD+Q+zDpa4e0JGewF8xlmlsAeMdEETDId75KcFi7kFe2Zje6QrTvOg20uOHZ5Ae3sXpUsmzv00bz5L2i16fpu100JohPhb7dClxifci3okquQYSOK/zodexARy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTj0Tv8aM2TCsHa4PV6W+BsdQS5sZJkf4zGLIyg+93k=;
 b=I7S7bXA2xmcWsPGRzqozP0dRCTHKoQCvRjq747if4LbFUXWLcSZH2ykc51Ombmw2KefT2aM0MMy8NRZ4ioTriy30zBQCKwh668zHgzZaGEG79hErBTl0fWF2jSMuJvU8V3ZE0b6Cw9FQqfN88OmhqqbaxcvNQ/03Q+Zn00+tgbZV2E83MKGfsastxseblLa3jlLmeWaraRt3ZjXdoemPqquuXzQ1DRHrZLzZpIsiSJPy9FtAuhAASxCKHTD88yUI2Ojt1tKr2EjCSORSBgqaum8N8XWsxFlHPNuVfwn24GEezHAJYOPMe09jCD7h1iwljNhWc7x4ly82vYgRqD/Hyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTj0Tv8aM2TCsHa4PV6W+BsdQS5sZJkf4zGLIyg+93k=;
 b=J6CZ7Ju3M0lOrLFinelpCyX5NFX4GpRP8US1BvvS1Kww/NHVwdo8rKKL7yZoZgm7a9fAB6bF7K/fkcL+qLr1JaUNMc0NdHbccl3bXZMMN/Mqm5Gy2onF9JR0dC4XwW+IrEAJ27Z4nOgarhGOi+3HMcqAyGA8OcdXnsP7WirbA/c=
Received: from BL1PR13CA0103.namprd13.prod.outlook.com (2603:10b6:208:2b9::18)
 by SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 07:45:28 +0000
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2b9:cafe::37) by BL1PR13CA0103.outlook.office365.com
 (2603:10b6:208:2b9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend
 Transport; Fri, 13 Nov 2020 07:45:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 07:45:28 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 23:44:54 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 23:44:54 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 hancock@sedsystems.ca,
 bgolaszewski@baylibre.com,
 linus.walleij@linaro.org
Received: from [172.30.17.110] (port=49428)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kdTlN-0004Mg-5g; Thu, 12 Nov 2020 23:44:53 -0800
Subject: Re: [LINUX PATCH V3 0/9] gpio-xilinx: Update on xilinx gpio driver
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sgoud@xilinx.com>, <hancock@sedsystems.ca>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <fe56a9b8-9170-2723-82d3-7c14a816b266@xilinx.com>
Date:   Fri, 13 Nov 2020 08:44:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b51ae6e-1a28-4515-ab56-08d887a8173d
X-MS-TrafficTypeDiagnostic: SN6PR02MB4205:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4205473F5A2104383CB43CACC6E60@SN6PR02MB4205.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kygWcfiMczpe2L5pPkIEIqkH8ne2TUfNg9sRsKtX44mR2jihFK8Ds0L6/ccBeIAWbh+0C/zGeIbKNkQND4rVPPhD2c8FNLmEiQ4zouW6XjPpdvmCf8VCmkDiWLhGEFXOtuP5TNlFqYeBa29OM5kAuZyr03kX7FPrrX2bYkkdZNQV/MVGwUUkJpWaXW2/NDZ158C/6ZQOi9mhO9Inq0BPVTUqXIrP5i74IgA2gBxssmOdfDMdA7bjRXj6cgCNeas1djvoVbIePdKgWeHQHnem3+O5DAqHGEXjCL9v3LBLrCEGr/y52+gfwVtfIdcifFHssiuPtuo7ou1N30krHlgEeU4s2fRYijRDMqpdvcl54FV6RCWTT53VHnedttROR8rNgO66YryiR+3n81Jcq8nbIdsGBhVwPX51TE+vl1RJAPzksKQof0YrJXCMdnYl0hfNnLDBBqJOdWOgiU6oFY5yyw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966005)(82310400003)(5660300002)(83380400001)(4326008)(31696002)(336012)(9786002)(6666004)(70206006)(44832011)(36906005)(70586007)(2906002)(8936002)(110136005)(316002)(26005)(8676002)(478600001)(47076004)(426003)(36756003)(7636003)(2616005)(107886003)(15650500001)(31686004)(82740400003)(356005)(186003)(54906003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 07:45:28.5674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b51ae6e-1a28-4515-ab56-08d887a8173d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4205
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 12. 11. 20 18:12, Srinivas Neeli wrote:
> This patch series does the following:
> -Add clock support
> -Add interrupt support
> -Add support for suspend and resume
> -Add remove support
> -Add MAINTAINERS fragment
> ---
> Changes in V3:
> -Created separate patch to arrange headers in sorting order.
> -Updated dt-bindings.
> -Created separate patch for Clock changes and runtime resume.
>  and suspend.
> -Created separate patch for spinlock changes.
> -Created separate patch for remove support.
> -Fixed coverity errors.
> -Updated minor review comments.
> 
> Changes in V2:
> -Added check for return value of platform_get_irq() API.
> -Updated code to support rising edge and falling edge.
> -Added xgpio_xlate() API to support switch.
> -Added MAINTAINERS fragment.
> 
> Tested Below scenarios:
> -Tested Loop Back.(channel 1.0 connected to channel 2.0)
> -Tested External switch(Used DIP switch)
> -Tested Cascade scenario(Here gpio controller acting as
>  an interrupt controller).
> ---
> 
> Srinivas Neeli (9):
>   gpio: gpio-xilinx: Arrange headers in sorting order
>   dt-bindings: gpio: gpio-xilinx: Add clk support to xilinx soft gpio IP
>   gpio: gpio-xilinx: Add clock support
>   gpio: gpio-xilinx: Reduce spinlock array to single
>   gpio: gpio-xilinx: Add interrupt support
>   gpio: gpio-xilinx: Add remove function
>   gpio: gpio-xilinx: Add support for suspend and resume
>   gpio: gpio-xilinx: Check return value of of_property_read_u32
>   MAINTAINERS: add fragment for xilinx GPIO drivers
> 
>  .../devicetree/bindings/gpio/gpio-xilinx.txt       |   2 +
>  MAINTAINERS                                        |  10 +
>  drivers/gpio/Kconfig                               |   2 +
>  drivers/gpio/gpio-xilinx.c                         | 398 +++++++++++++++++++--
>  4 files changed, 390 insertions(+), 22 deletions(-)
> 

For the whole series.
Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
