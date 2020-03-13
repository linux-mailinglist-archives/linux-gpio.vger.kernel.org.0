Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD72184ACA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 16:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCMPcM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 11:32:12 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:45068 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726446AbgCMPcM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Mar 2020 11:32:12 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02DFK55R015678;
        Fri, 13 Mar 2020 08:32:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pfpt0818; bh=udmZpi1C1nGqn4+q7sy3ttPlG22RzjpngONAdnY0xaY=;
 b=J8ELpBbTFG4+8Qcj21QRXhdjhx5PHqQl62j3oeh2d6ZDIaLwwNdwUxvRROgrnn6YflHQ
 wPdMQwWuT3YywXkFsxeJdA7FXsrA1FoP1gj6UeNCtc+mt6YMbRJgbnjFsLyWHBf+wXW8
 YBjEHYJMJMI9HgNwAysSFQyTAG1pu4dmFyIbllvLKsc8qdgTkooV5Cg9QH0ty+YbRsuV
 wJDfAAxTwF768/pwxxId0wC+puM5/NjhmqSWenWGy3BgcHGpx0xfPA/M3wPBa80JErjG
 vCt9LAF393JmeNtpq0cCYNAps8m+KS9DO63ZMkElMhXm/snA+C0DA2JMBybbO0eUvKrA yA== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
        by mx0b-0016f401.pphosted.com with ESMTP id 2yqt7f4egv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 13 Mar 2020 08:32:08 -0700
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 08:32:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.56) by
 SC-EXCH02.marvell.com (10.93.176.82) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 13 Mar 2020 08:32:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHWMAOXD4tVIvfor1ADoOIkfT1/IvKb4wJ1QZ53rL1ZxB9hzyTEE0nZ/lBMaewcHN80tEr/HcnkSJxRktqISIwh3tXD8ByF+T0QVwYeX5jGW8ziEO7xTrJcX+c8aRCemuxNSPNQ3f51fEG1lReNCBFzDw/tCKBJTZ+yBP+ReKZ4bHbW23tWHzMINAiVWUGTiYQ7REFb9JnHkUlQDYdUSM8vaUAXhK0WeKmOJXbkooqgV/ypbKg9cUpqPAvSqL+jip2rLQ1krwt3nEPw7ahYZDsmn9XdtSBl12+lCuBBIoxkfmet+mHElguJ/NU6KFnlWvB+/CcfTcKpO5paRHJ/SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udmZpi1C1nGqn4+q7sy3ttPlG22RzjpngONAdnY0xaY=;
 b=XcdUbdeAFUBFNFrS4HJTkHmNInHWGbysJnoy4pVupCRqtalbzUxiYVzV7k3F1poykuplajeV0SpoUeJKT3p3skBitvFFwwHWH6kZ3XaZSSEc/k72nPbegiD2PFCFLcT6RXwn6D70YT9613oHyZj5hEF6r+0gSF17ghiwyWfRInpqwbZ9NQPXg9d34++3WSUKV4H1nux6GfYaE8yGvCyNmYPaYfDArG5U3Hhb6kNiP/Zvw/cKz70VeySGUSNTUgVhCN4PygyjECBFbkCob07AIqQFbhCrFqNYQnBZcAubK7StJuDxXNkzz+WaG3lFAuQCYtgjIzvenByebGndVneSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udmZpi1C1nGqn4+q7sy3ttPlG22RzjpngONAdnY0xaY=;
 b=VG20MWQTJ4Furs/HNxXB61+c71iy2pLiqJJz5Yg1tqDfRcKNHfJwR8ZkuimWG4HN4DyQy40es7MZw2/GSHiokFuBw4Y3HKH/UzADhcAtrXjHamgaHJ6MxfxSk+Bnvri9PE2HN2HpSoGmvf16r+k9VkQHFktp3F3q7N4fELHU4bA=
Received: from MN2PR18MB3408.namprd18.prod.outlook.com (2603:10b6:208:165::10)
 by MN2PR18MB3640.namprd18.prod.outlook.com (2603:10b6:208:265::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Fri, 13 Mar
 2020 15:32:05 +0000
Received: from MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff]) by MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff%7]) with mapi id 15.20.2814.018; Fri, 13 Mar 2020
 15:32:05 +0000
Date:   Fri, 13 Mar 2020 16:31:52 +0100
From:   Robert Richter <rrichter@marvell.com>
To:     Tim Harvey <tharvey@gateworks.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: thunderx: fix irq_request_resources
Message-ID: <20200313153151.e5nmsbr6yrzchdxi@rric.localdomain>
References: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: HE1PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::34) To MN2PR18MB3408.namprd18.prod.outlook.com
 (2603:10b6:208:165::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (31.208.96.227) by HE1PR0502CA0024.eurprd05.prod.outlook.com (2603:10a6:3:e3::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend Transport; Fri, 13 Mar 2020 15:32:04 +0000
X-Originating-IP: [31.208.96.227]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2732214-2acd-4e39-7783-08d7c763af6a
X-MS-TrafficTypeDiagnostic: MN2PR18MB3640:
X-Microsoft-Antispam-PRVS: <MN2PR18MB364023519FCD419BBCC384C7D9FA0@MN2PR18MB3640.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(199004)(7696005)(52116002)(26005)(66946007)(316002)(53546011)(86362001)(8936002)(186003)(16526019)(66556008)(66476007)(81166006)(81156014)(8676002)(6666004)(956004)(6916009)(6506007)(5660300002)(4326008)(2906002)(55016002)(9686003)(478600001)(54906003)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR18MB3640;H:MN2PR18MB3408.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D6r3TLRDUgHN4WJL5wA4VVpcaW8ZR9LXdH43Z03KoQ/k4NxxaxIsYTpRV5OdH/RYlbbSrzYd4VEBqAWRSHSYrgSGEqlM1iQ8jNTjIyr0yw+ZvfjpKwI3MggCS+/rpNKHQBh4o0FvDORyp34WTkGlkbI8awQGQlrHL8Wjy22Hd6OHJMrHDWSCJNfdJ9qfpT6A332tJMGujUiG2OrW1mYO2pDc3YYKZ44KGEyqItCoCaNaVBXf75LumR+XI8dKb9eBaYHHp90mv3mua1TCWOt/KMeNDQRnOMPJltoYDHSAvI9Juoh1Gn+6a3qXi0bghmV4PyeiTaUxkpJ6YlWMB0//wiQ99FCHii1fUPA2pYXeSWrmhTtaz7/O+aWu6VY5mnEdqyuKVDG2ojvPkgU17SwCnUvlwzPBXY4AjmEntuh3uAbo8rZaBiSAw7vd7ms80gBQ
X-MS-Exchange-AntiSpam-MessageData: avT6EIrMmqYRP/2RyP5gH+nxZK87sCbMoDNsDuQ7wp5OCd7kkDcr3rUIGH4aEr6LOImgsNpc97Y2qabiCA6oN45FkEaKT4qqS90DoT3M3MCF23zWfDFaCfSFR3VQgLsQr5zmyqNGs9wrK+ajSLPGkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2732214-2acd-4e39-7783-08d7c763af6a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 15:32:05.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxeQtluK95asE/S9G2qWvq0zESL7mbUJ5guw8ZEQNqNqVpZC5fxzU8mVfsXYLFqzJYnPlnZRZnNMCXPV8E6taA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3640
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-13_06:2020-03-12,2020-03-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.03.20 08:43:53, Tim Harvey wrote:
> If there are no parent resources do not call irq_chip_request_resources_parent
> at all as this will return an error.
> 
> This resolves a regression where devices using a thunderx gpio as an interrupt
> would fail probing.
> 
> Fixes: 0d04d0c ("gpio: thunderx: Use the default parent apis for {request,release}_resources")
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  drivers/gpio/gpio-thunderx.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
> index 4627704..f84b9b1 100644
> --- a/drivers/gpio/gpio-thunderx.c
> +++ b/drivers/gpio/gpio-thunderx.c
> @@ -366,15 +366,18 @@ static int thunderx_gpio_irq_request_resources(struct irq_data *data)
>  {
>  	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
>  	struct thunderx_gpio *txgpio = txline->txgpio;
> +	struct irq_data *parent_data = data->parent_data;
>  	int r;
>  
>  	r = gpiochip_lock_as_irq(&txgpio->chip, txline->line);
>  	if (r)
>  		return r;
>  
> -	r = irq_chip_request_resources_parent(data);
> -	if (r)
> -		gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
> +	if (parent_data && parent_data->chip->irq_request_resources) {
> +		r = irq_chip_request_resources_parent(data);
> +		if (r)
> +			gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
> +	}

There is no unlocking for the else case. I would assume the
parent_data should be checked before grabbing the lock, or is this
intended?

-Robert

>  
>  	return r;
>  }
> -- 
> 2.7.4
> 
