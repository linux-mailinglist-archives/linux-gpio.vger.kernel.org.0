Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D63FC1792DF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 15:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgCDO6Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 09:58:16 -0500
Received: from mail-eopbgr70112.outbound.protection.outlook.com ([40.107.7.112]:38109
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726694AbgCDO6P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Mar 2020 09:58:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3BJe8k1gOF89dJSwZ+vAG2JZZeVrnnWrLvj3CmW85Pnkbv15dLyIwm+4ltb7EAXjTGCa77tVE6gxm4xNPpW/F3xDjbokRz++A7dQq1ZMLc9eatDe4b3DE6NIWdfqo8t1Rf7XI3I9unR/nCWLSdz/6gr7R3AFL8QCfYc6XTh2CSqkFpZjri5QYZ1WiGklHip8R55fa6NofQuw/AAGx7hy7cty1XA9cxaS7ukrP/1as/Pyk2m5qvRgnb+QILpaimYo1OuHCoOSDdjuMYQuRYOYpiPjk8teM9nxAGmxfnrBH6nEKswnu+z4i4jvtZ49I3W3pyiiULUFntJx5kprRSy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No9WP0bE9ec/md+eXreVRF8/y23XVjft6OT6EvwpX+I=;
 b=HxbY+sYD3JkwcLpkI7nyMTOt6E1UMlT72/2G/R6ir6zAw2VcctU/mKz8jcUXsI2cf86BTPFUxMGzIsOjNbI7iB5tuXYYsjOUbUe34ak2V4apkegeTxXjHIkwRWRU0kqoyvV7F2ZabzY3PvbEPqoTQ+wT2w97jt7IUqNnEeBAvvJ0GMaPVIOe+9cHwd0c+zSubo9dJoGlidh1r0MZm0jPIuDzo5gKAK9ztorcPX0+gPyRobpu5VzxGbX+iObouRjrnVQgvxRNAh6K3GupKUeuAjUoeUd+/2BZu/2As6XR/xKlmYWu6BL99/s/hzuAr3CkXQ82ZHieBj9qeXq+K7GBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=No9WP0bE9ec/md+eXreVRF8/y23XVjft6OT6EvwpX+I=;
 b=vytfGcg24zsbLP/8kGNvoZncPibkgW4O1dVv9tGzePjyigtoWIep4HRH28+mBEJVZjv5UwRG9XN1lHLpCKimhXhO92LW8qWmqakYo5bf3QE4kuhow5Qy5QNORyjDVtqeXNTxARE6Rvt0YDqhDrCuZNUmwQbOrtvfUcg1V6/KYpY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB5582.eurprd07.prod.outlook.com (20.178.14.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.9; Wed, 4 Mar 2020 14:58:10 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd%7]) with mapi id 15.20.2793.011; Wed, 4 Mar 2020
 14:58:10 +0000
Subject: Re: [PATCH] gpio: pl061: Warn when IRQ line has not been configured
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20200303092828.4463-1-alexander.sverdlin@nokia.com>
 <CAMpxmJU+_ZtcfTXcwBh1DCWj4Usuwz_ymkgeZT64F24TOdvMXg@mail.gmail.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <1d0a9528-8434-1087-d127-e5fd3d0c32d6@nokia.com>
Date:   Wed, 4 Mar 2020 15:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <CAMpxmJU+_ZtcfTXcwBh1DCWj4Usuwz_ymkgeZT64F24TOdvMXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:3:76::23) To VI1PR07MB5040.eurprd07.prod.outlook.com
 (2603:10a6:803:9c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.166) by HE1PR0301CA0013.eurprd03.prod.outlook.com (2603:10a6:3:76::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18 via Frontend Transport; Wed, 4 Mar 2020 14:58:09 +0000
X-Originating-IP: [131.228.32.166]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ff831ed-6416-493d-3b02-08d7c04c74ac
X-MS-TrafficTypeDiagnostic: VI1PR07MB5582:
X-Microsoft-Antispam-PRVS: <VI1PR07MB558250959D92EAAF9D3BEF8F88E50@VI1PR07MB5582.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0332AACBC3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(189003)(199004)(26005)(6506007)(6512007)(66556008)(956004)(186003)(66946007)(44832011)(16526019)(86362001)(2616005)(478600001)(4326008)(66476007)(6916009)(6486002)(81166006)(81156014)(31686004)(8676002)(31696002)(6666004)(2906002)(316002)(8936002)(52116002)(36756003)(53546011)(54906003)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR07MB5582;H:VI1PR07MB5040.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2khQ7c0uE63uRK7z1+Znn1NONU+9hp1PECowGKfltpBvvDNqS97pnihYxoM2DXRPZ2uX9Yl6R2QLrkdyzeHE5e+SJSXgcTFbk7sKpiblsNxYO0vnN9YYN2z2mkC0Q+5U4gAyhv1PlSdPusgJOjXyJqJssiTnfKlu3Wya573nEPLOnCH7ZWMasZKNxnqAZvBQ3xRta1Oa9gfeSlQ7lw6oBJNKf6objf7wcuCNCCDJiRdSqjBmLYtvm3UIF21CfbAbAcgswBQKROWHTxEBU3A8nZ1hCCUokLtm6WccYh41VgZkqyHNb8mx15bUn/KMhFt22cr5IQmo3WC8lrAe10aYc9YBq6mAIr1Pn7x01pH5hUvs775j/UBwP+i7pXhIqBX5GIJ6LX59GCr7loF8ZUOJDB9vmeKkEz/FqREoufVhSnboZQtYpvZJDP6xAodv1YSG
X-MS-Exchange-AntiSpam-MessageData: 7zdb5KlFWXeZDVbGVMxdhl04ENhyz1Rh/ioIKFqOnNTpBgzrMmkvzXneOApjAv4jeEJhMsKh5CWg4lShJN5BfvpAb3mp+xElrfZrEcRZoH/Ln7ik1Xp7qu1r65IWehgFOLtlldCYnW12SIQjUS+OUQ==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff831ed-6416-493d-3b02-08d7c04c74ac
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2020 14:58:10.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlXwlER9Iu/fFYZKfS9IlSiX9RnzK1ZbaxJ2efd3/Wx/xwQUGBat8/eV9tWzmwqDkQLtBMtUW10wNOLhkxWEFbEAfL2V5ttJnli54wPRIUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5582
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On 04/03/2020 15:21, Bartosz Golaszewski wrote:
> wt., 3 mar 2020 o 10:29 Alexander A Sverdlin
> <alexander.sverdlin@nokia.com> napisał(a):
>> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>>
>> Existing (irq < 0) condition is always false because adev->irq has unsigned
>> type and contains 0 in case of failed irq_of_parse_and_map(). Up to now all
>> the mapping errors were silently ignored.
>>
>> Seems that repairing this check would be backwards-incompatible and might
>> break the probe() for the implementations without IRQ support. Therefore
>> warn the user instead.
>>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>> ---
>>  drivers/gpio/gpio-pl061.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
>> index 5df7782..3439120 100644
>> --- a/drivers/gpio/gpio-pl061.c
>> +++ b/drivers/gpio/gpio-pl061.c
>> @@ -326,10 +326,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>>
>>         writeb(0, pl061->base + GPIOIE); /* disable irqs */
>>         irq = adev->irq[0];
>> -       if (irq < 0) {
>> -               dev_err(&adev->dev, "invalid IRQ\n");
>> -               return -ENODEV;
>> -       }
>> +       if (!irq)
>> +               dev_warn(&adev->dev, "IRQ support disabled\n");
>>         pl061->parent_irq = irq;
>>
>>         girq = &pl061->gc.irq;
>> --
>> 2.4.6
>>
> What happens later on if irq == 0? Does irq_set_irq_wake() fail?

Yes, would fail if IRQs would be requested from PL061:

int irq_set_irq_wake(unsigned int irq, unsigned int on)                                                                                                                                                            
{                                                                                                                                                                                                                  
        unsigned long flags;                                                                                                                                                                                       
        struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);                                                                                                                      
        int ret = 0;                                                                                                                                                                                               
                                                                                                                                                                                                                   
        if (!desc)                                                                                                                                                                                                 
                return -EINVAL;                                                                                                                                                                                    


-- 
Best regards,
Alexander Sverdlin.
