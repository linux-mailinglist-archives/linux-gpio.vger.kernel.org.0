Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D171E184F2A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 20:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgCMTM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 15:12:56 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:59744 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726526AbgCMTMz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Mar 2020 15:12:55 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02DIrNHx010167;
        Fri, 13 Mar 2020 12:12:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pfpt0818; bh=/SDSJc0ogavFqoUKUPkDk8cyzNRleQar+Qv9oug8sDA=;
 b=R3V1xbAzKNMLLWAHTn0V9bfOLxBGExUaUaN/pvnbGEdY56Jm1JxXPldW/LcDu4UoFRpD
 604Wza93AApAbALAAWOYVpO1+V8y8PO6X0QbRAd6mgOiQUXc7J3aNeIZE91KDbS9D4sC
 VrEeY36Xj7vodrtj1ictCbTYZAbw4NNrISsS3ImCP48WaJ54OwYuenO+rP6bnudvRcv5
 Xaq8wshJdagYGZZE60neKFphf/EiZKVlwvWAkIDd2x8ocIO/iAKtXzVhZgNcEfC08AVS
 T1JX4TLV4/+axsgj8SvdtRpZuS+bhYZrtQLl5uxxoE+be4KhpnLS/Qgp6SKpqNCAQfw+ og== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
        by mx0a-0016f401.pphosted.com with ESMTP id 2yqt7t58j9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 13 Mar 2020 12:12:50 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 12:12:49 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 12:12:48 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.57) by
 SC-EXCH04.marvell.com (10.93.176.84) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 13 Mar 2020 12:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6BJiytZHehjz3Jjd+r3gR2MK4ZCb8hXkHv7fhauOKto0Lw7TrlFQ8RoGkC3a7FHmimKlszk0CnJ998tzxtilWkGFYsYL1PHrnYk8ZoIRPrQQz2w5QvR1q5FDht/tesJlc3bXDD2fu45r9HD9uxFz7r2FN+UpmhxZ8mvxqlFi/1Vdg6UhszqomXRCk5KH2uIAoNw4z8IjM4zgsyYQMrj4wde1UQEC8I9vohVvdxqDkGrm0HOt3AHZ1LAE+pFEs1u2CIyUhzjX0n4EIsQYC3ClNPAMP+qL8MD+0tCF2gGUbkL/iYLi73Hl4GVQRwpiIow87E3nVfrRkBOsCSjzJVLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SDSJc0ogavFqoUKUPkDk8cyzNRleQar+Qv9oug8sDA=;
 b=UlDFxLJPJOQgbNf0xWoH0fO0DB1qePmfw+GUXTc02l3sr90qx3FkPxBUihHxDKViMUA1geDQ3+l32aM+UkvXeJHXB91Dj+8g8OQQG5Jnoh5+tAs2dT6RJ26cIe4HeZ4J9DOEGqksa+JJKqYF+2Lq0CCP41iHgW5S2CkdRJXN9Ch6PJGVeea4w4tBJRer+FLeo04C4WAyAhKRLbqhWITCo15beiDzFLaS6KgJcByvtNBmXGiOjPPtzdijA8PJx5DrIXFRi3aSkgAslZ5xVaLNLA7VmlGIr4UOmIjipj+LnlNcjZ2DX120mxVGsTZDpOgrO1QANALuyYeuHzXUfurIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SDSJc0ogavFqoUKUPkDk8cyzNRleQar+Qv9oug8sDA=;
 b=Nskm3AqsRNMmfHO7KzYuO7jfIQpzq1OLy+1FKzz75TshcV3d1G5nIMde695EpjjkTX9XRZSaWhK8s4HTKMeGUxMmXbI4RW8pYFUXRS4w8E7m+bfGDnzOPgRv4E2vKUyBc1YSN595kI9M7g1OPVccsj0fQbS9x7B+acMXhG7jAOk=
Received: from MN2PR18MB3408.namprd18.prod.outlook.com (2603:10b6:208:165::10)
 by MN2PR18MB2480.namprd18.prod.outlook.com (2603:10b6:208:100::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Fri, 13 Mar
 2020 19:12:47 +0000
Received: from MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff]) by MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff%7]) with mapi id 15.20.2814.018; Fri, 13 Mar 2020
 19:12:47 +0000
Date:   Fri, 13 Mar 2020 20:12:31 +0100
From:   Robert Richter <rrichter@marvell.com>
To:     Tim Harvey <tharvey@gateworks.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: thunderx: fix irq_request_resources
Message-ID: <20200313191230.qrrlo7ht24fhfhvj@rric.localdomain>
References: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
 <20200313153151.e5nmsbr6yrzchdxi@rric.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313153151.e5nmsbr6yrzchdxi@rric.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: HE1PR05CA0341.eurprd05.prod.outlook.com
 (2603:10a6:7:92::36) To MN2PR18MB3408.namprd18.prod.outlook.com
 (2603:10b6:208:165::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (31.208.96.227) by HE1PR05CA0341.eurprd05.prod.outlook.com (2603:10a6:7:92::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18 via Frontend Transport; Fri, 13 Mar 2020 19:12:46 +0000
X-Originating-IP: [31.208.96.227]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7ce582e-ddb4-471a-3c03-08d7c78283ec
X-MS-TrafficTypeDiagnostic: MN2PR18MB2480:
X-Microsoft-Antispam-PRVS: <MN2PR18MB2480BF8EBB84A9ECFB0B47FCD9FA0@MN2PR18MB2480.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(199004)(16526019)(316002)(6916009)(4326008)(478600001)(53546011)(26005)(186003)(6666004)(2906002)(55016002)(9686003)(7696005)(52116002)(66556008)(66476007)(8936002)(66946007)(5660300002)(1076003)(6506007)(81166006)(8676002)(81156014)(54906003)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR18MB2480;H:MN2PR18MB3408.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvKztxqr0ii2HGDoep0tih4RJF1bDWPIAHWtRABQo65FCc0O/8RM0LwQCk0dKOnllHDA+GiF8aAlZ2PfuRD16MaSDi8n0h8UkcraegoP1xu+HsIIhOb/fpBG/Ktk2O6sSQ/tTKaOOaGWhaIBwNfpVWoGnPmLzP3t+VvtGNvYFK+a73GGHfwFF9pGXTEPiVhgOGQzR3NnQLyg7O8jqdwZUvnbmmL4y431AaD8I0OUWSPXF9YNV9FuNGscjyxzhS3ogeJCf1SmknD96uQtJU043p+gdO/1C8mXyAEttyzJmE6MlbsOgncluFe5XPdK8G0v0rp38IZfQ4jqtJDlxdflrV31FwWBUgw+stf+Q65mvr5WCWY4oz6tQEQnmEP1vzbLyoCh6BHDy3xX2JCwi6X2KBm2xYwW5p+smyZA+OqAbgiiq51Qww9n1QsZzD1kaB4J
X-MS-Exchange-AntiSpam-MessageData: p5sgIyGdJNt6CMuUPgKll/7OPijp+6Tj7hZyiK3tMXr0MLQj7dEw7DGzzZgGVmU7UzLMjV4MoKgoDLJ9m2PNkxhWUi/9qRu6um2PfbDA30wmbKhclyFsju9xDBwj2Ax4KTGZXhFU/Du5Uh6iI/Qs1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ce582e-ddb4-471a-3c03-08d7c78283ec
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 19:12:47.1006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E03eMd8rlNsf4xvUfhoMyMnX8WMSEfT5A4sscGLwSj4DspDHdZalNFO8nW4MZ0ARdm3y1q7HEHj2bOTdqKd8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2480
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-13_07:2020-03-12,2020-03-13 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13.03.20 16:31:51, Robert Richter wrote:
> On 11.03.20 08:43:53, Tim Harvey wrote:
> > If there are no parent resources do not call irq_chip_request_resources_parent
> > at all as this will return an error.
> > 
> > This resolves a regression where devices using a thunderx gpio as an interrupt
> > would fail probing.
> > 
> > Fixes: 0d04d0c ("gpio: thunderx: Use the default parent apis for {request,release}_resources")
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > ---
> >  drivers/gpio/gpio-thunderx.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
> > index 4627704..f84b9b1 100644
> > --- a/drivers/gpio/gpio-thunderx.c
> > +++ b/drivers/gpio/gpio-thunderx.c
> > @@ -366,15 +366,18 @@ static int thunderx_gpio_irq_request_resources(struct irq_data *data)
> >  {
> >  	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
> >  	struct thunderx_gpio *txgpio = txline->txgpio;
> > +	struct irq_data *parent_data = data->parent_data;
> >  	int r;
> >  
> >  	r = gpiochip_lock_as_irq(&txgpio->chip, txline->line);
> >  	if (r)
> >  		return r;
> >  
> > -	r = irq_chip_request_resources_parent(data);
> > -	if (r)
> > -		gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
> > +	if (parent_data && parent_data->chip->irq_request_resources) {
> > +		r = irq_chip_request_resources_parent(data);
> > +		if (r)
> > +			gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
> > +	}
> 
> There is no unlocking for the else case. I would assume the
> parent_data should be checked before grabbing the lock, or is this
> intended?

Looking at the original code, the parent resources are requested only
if existing. So the change is ok.

On the other hand, the overall change using irq_chip_{request,
release}_resources_parent() became pointless now. It is unreadable and
more complex now. Thus, commit 0d04d0c should just be reverted.

The function interface is limited. Instead of letting the child device
deal with the parent, parent requests should be handled directly in
irq_request_resources(). Another aspect is that the code for this
driver has been already removed upstream and ti_sci_inta_msi.c is the
last remaining user of it. This speaks also for a removal by a revert.

Thanks,

-Robert

> >  
> >  	return r;
> >  }
> > -- 
> > 2.7.4
> > 
