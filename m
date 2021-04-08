Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E8D358973
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 18:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhDHQRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 12:17:14 -0400
Received: from mail-dm6nam12on2067.outbound.protection.outlook.com ([40.107.243.67]:25568
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231655AbhDHQRN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 12:17:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQxUnkpqm1Vq+N9r6yHnrvRwDfaFTQpVNYlsy0GcVW5f8kznzJl1NPZCz8I5mDMTjngGkGeoQ5jIJ+AshZT+KP2bPcsQk1lIxdyd2LWQnaVGITJBDpu9HO2W5fEz2EtbX7YwuHiaUkM2cRfjJs6k5SiTk3myDI2VTZhYWbKXpEH7D+7wGFBKyEriQoRTvW3WyWISWRS7uZCuvuyNiSOhihMRygYTE3bK3p9xk7vYYkBiFSTeDWLRRdHM4IQ0UCLUUoxzq+yyGnmgXQ/oyJVpso2ElK2/PSEBud9xoNoTrCq8yQO62OG0CIyysZX8yIsU3cWr2fWgJYjxQNq3yjc5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e7gARQArOuzuYh7n0YhBtkwMqrOGRvsxGykYqolBZE=;
 b=BitU6lU0gRAClQWB27rY0KKs5NRmRbdpccbNZkdceBqSVj0cHvSqZ+qXnqGt3IRCHtV9okSe6lQxDmHu/sJrJ5uNHrC/+A+UbJvSdDGcDG0ho48/uezC/enSeZCNHmxP9DEvoXGidO1QNdl8M3GCWjMRvSg7vwK/m1CwLBiL/VP2jY8sPHzgZg1o8N2nsLvib1118YlpdONQ+1a75nBlxS0KINZPHB7kCi2NgI20AVvUZ4sJZ+nFcgCNNomj7yXkrkLmyqiKbffIhghK6MqHmuMqNdiBaW2cazEWRSjRShbuc8OEE1y4ftp+/c+B8i0RTuFz9EqZeNEvf2nmZG2clg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e7gARQArOuzuYh7n0YhBtkwMqrOGRvsxGykYqolBZE=;
 b=O1J/24Z4n8A0gzQNIl+8wcAJnJ4Zm0+Pm9nwCs89qYTzuuq2rp44SGo52OoQWtrR7Qnnvo1xMjvoIeLUC/8r7/qt3pIYA1XN4f6tJ//cW5SOCT5jEcPdf9WkPRQDVIqD94mmo0Ix0yDQUOR/YU4qY4GFmDo99ewZL0YjLiEYGDA=
Received: from BL0PR02CA0120.namprd02.prod.outlook.com (2603:10b6:208:35::25)
 by BY5PR02MB6275.namprd02.prod.outlook.com (2603:10b6:a03:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 16:17:00 +0000
Received: from BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:35:cafe::5d) by BL0PR02CA0120.outlook.office365.com
 (2603:10b6:208:35::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 16:17:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT020.mail.protection.outlook.com (10.152.77.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 16:17:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 09:16:58 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 09:16:58 -0700
Envelope-to: vilhelm.gray@gmail.com,
 syednwaris@gmail.com,
 linux@rasmusvillemoes.dk,
 yury.norov@gmail.com,
 bgolaszewski@baylibre.com,
 linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 andriy.shevchenko@linux.intel.com
Received: from [172.30.17.109] (port=39010)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lUXKz-0006UV-Rg; Thu, 08 Apr 2021 09:16:58 -0700
Subject: Re: [PATCH v1 2/5] gpio: xilinx: Correct kernel doc for xgpio_probe()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        <vilhelm.gray@gmail.com>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
 <20210408145601.68651-3-andriy.shevchenko@linux.intel.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <c40ae975-5e11-8873-6784-1fa4303591f9@xilinx.com>
Date:   Thu, 8 Apr 2021 18:16:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408145601.68651-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 984e7345-0de4-44fd-c6bc-08d8faa9bd1a
X-MS-TrafficTypeDiagnostic: BY5PR02MB6275:
X-Microsoft-Antispam-PRVS: <BY5PR02MB62755903A9F234CC489ECAC8C6749@BY5PR02MB6275.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yphdYeykGrr+1CBm7q0Mz1je4n7QMGyH4UH/w/cilsgJnuPU0iG7RF/RXKSrGOlC065aUuQLiLEnD5COlsEUwvH7iHvF99L0xb8TrtePX/XwZBFACYNQav19ZiVMmPM3u5pgGUT+Q2UK7J1MpQWdDZNy8tTcVR7dzyP+ncL6tRi6qtjOtX207l8h6f8/WvP2WIVTXfMaG9BaHbSapwXkTuIN3+CTRC0NMo+8pVLfArmSBLSay/K0lcvMXmHk5b658liPqCop2ydcwpvFCm8pJVi5kbYsLC2oGmTQUHzYLZX8ZPhZ2kBmEaVeHSeX7dJU6+B5OD15VigvaOWb0MyG7Kr3Pjvlu7DP4nhVVM0sahRBx2SGTpYTmIrnI/ds/zEPsos+k25yVg5pjV+1Uafi8QlS/xbO+KCnuZbdSx5ZDnSiKJ+SJaVp56CZZodgjmXBayN0insUZQK8NWIuQ437LueVe9RDVlvw2FBjlju2OPAs64cZPI/vjLDYhLt8zSiVSbK5x0xjIh1uDodaEoKIJVJMcgaMpBwyA0kS2YgJDIC0tF8IK/XGylMyNJkz7CY6UwibLrvaBrySm6c/dxcw/GUkC9hBqkX1HJmJQKPsvkwRIsam5ISqLy8JgBZ3gdj5UNJ2XzrSfJuf79JibUnD9P0HzD6oJ6mQPO0s3xV1xjrVBckDl2UpPKV85yRhCPlefJYePl8HwwduwHRi0KemZtg6ln59uiEsb337D8LhcXo=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(36840700001)(36906005)(7416002)(426003)(47076005)(336012)(4326008)(70586007)(478600001)(44832011)(36756003)(83380400001)(316002)(53546011)(31686004)(8676002)(9786002)(8936002)(110136005)(82310400003)(36860700001)(2616005)(82740400003)(26005)(356005)(186003)(31696002)(5660300002)(70206006)(6666004)(54906003)(7636003)(2906002)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 16:17:00.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 984e7345-0de4-44fd-c6bc-08d8faa9bd1a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6275
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 4/8/21 4:55 PM, Andy Shevchenko wrote:
> Kernel doc validator complains:
> 
> .../gpio-xilinx.c:556: warning: expecting prototype for xgpio_of_probe(). Prototype was for xgpio_probe() instead
> 
> Correct as suggested by changing the name of the function in the doc..
> 
> Fixes: 749564ffd52d ("gpio/xilinx: Convert the driver to platform device interface")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-xilinx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index b411d3156e0b..136557e7dd3c 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -542,7 +542,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
>  }
>  
>  /**
> - * xgpio_of_probe - Probe method for the GPIO device.
> + * xgpio_probe - Probe method for the GPIO device.
>   * @pdev: pointer to the platform device
>   *
>   * Return:
> 

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
