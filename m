Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8650340454
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 12:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhCRLMx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 07:12:53 -0400
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com ([40.107.21.119]:52289
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230422AbhCRLMa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Mar 2021 07:12:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTbuQBmFiB+HxQWaED3OndV1ADnRdrCkg2NSyb27uSBUu1GlN+lPTlqhStzfzzE6colK9zgBtn/crk++Uc1Ek0TNYj91Pg6rYbJj8CZY4o9zDUDjAYvRnFXQ1vq7iRy5AeGhySYdpYXdicVOB3MKM5ZL/u2c8qVs0x8uegzALyvVLoalo4W3ZLY1Eoc4Ypl1/OftERrHq8lkKXVDw7REqllx3CyT1g38CxT1gVq+jsbowMuS80Or38WL37ddHuPhbez1X3w4vR1yDlfhZKtqcaGGpsXc3D4eZ7bPl5u8fY8zuWHr4KaX1KGJe1X3XglrGqEV2IqZ1ccViraT/FmGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98eNPIopha24FWwuifU2/LJALfADmqQrP14hVN6AJv8=;
 b=j4/eVrYAyfO+6WXBCySDZ44cdqzMgeCSNIF9zY+27TAoKLf6R8uVT4L6Na6RK4Ifr5PmIozDVX6fqIDxY6eApxzVin2CdN4QYKpsjm8x5IEjlUfw4v0o4eOLNMOXWFcn8xhPFHmZypFC6M5TGpwPmfmLAT+G0NmwOwxF5e9hQMSEHPbVosNa2r8rduQA2GniObhD/gOeRjJAmGgAfENVwbK2yv68J41WtIKSscrldzYQRiKW73vAXX+r+Z9dNMowdg9t1zPOwtrE+sW4wxORtuH8vbtRiv7lNOzf0tMxiwl/KGXg3KKj1VHJ2FvGzEfqlm4d8QzW2X32KpQ8XqhwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98eNPIopha24FWwuifU2/LJALfADmqQrP14hVN6AJv8=;
 b=EDQnZHC/Teg6sxZ40h0lgV9Z6U53LJIhzHENOBaa7qPZ5aEGk0kBHNl/DW6NC6sWhW+fAtwhKXCjp2Wz4PyRiYqDCi46aYRghdp8YqqcDQsmwEElXSZDCmseybyI8m7ukMaoSZUtmOs9YH7z7M3Vd8ErJWgM2LKEiq38BUVfVeE=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM8PR07MB7633.eurprd07.prod.outlook.com (2603:10a6:20b:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10; Thu, 18 Mar
 2021 11:12:28 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f%3]) with mapi id 15.20.3977.009; Thu, 18 Mar 2021
 11:12:28 +0000
Subject: Re: [PATCH] gpio: pl061: Warn when IRQ line has not been configured
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-3-alexander.sverdlin@nokia.com>
 <CAHp75Vd-iUzEyo5X5LtKJ+66512i5-tKC+kkpPYJwG7L2qrvdw@mail.gmail.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <23bb681e-1918-e84c-58e5-c4c711f87daa@nokia.com>
Date:   Thu, 18 Mar 2021 12:11:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAHp75Vd-iUzEyo5X5LtKJ+66512i5-tKC+kkpPYJwG7L2qrvdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [131.228.32.166]
X-ClientProxiedBy: AM9P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::10) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.166) by AM9P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 11:12:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fc91ebf2-0279-4a77-7d0d-08d8e9feb780
X-MS-TrafficTypeDiagnostic: AM8PR07MB7633:
X-Microsoft-Antispam-PRVS: <AM8PR07MB7633CC9D6146FF49CD0EADB888699@AM8PR07MB7633.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: msHzx9TAs7WbpmSKNmaioEASGvYeP88Z88axYW9DECjl7cS7IJJraXVmXmfbM5rWLseDzkKWzgnKov/gosHyWqfSRh+dIG8OpogmD1/SB20uC9rtC4akIqLJPPOF/4Gxa22o6eYbFyucEndSO+msFRUTvhU/3cE0hh4OBok78CBqGnr3+zwDTYqHrBeuv/LWhRWipZCSZVIdX02jeqRgNJ2qvnp12ARO1TM7ZtiO1XCGB80KBwNcfJ2As1w1BzDLKAtZCGUdu1QalrcnrpeI8fODNdh2M3n7230MeYrAqfk+j/YhTgyoWwhwWL3r2CM3HSYtCuthO05UH0w0JVWHj+5eFKQcNpyqTYs9935xnv1SQPA1JmqI+Lkp2RtWKSeXC68U/kdUNmND6LrL/BF1wf2afHkFDAbXasWn4TzK8k5ov3TyBYNREWhrOvEM4Y4ZvDPC/ym+uERcx5PmbK0mK0j6qBDOJrVu5kdtBR+tel9yEYP9ZQV9NsriKBPss8Pyp2su+nmHOvCMjoASHjcDFkUln3xIe9Lq7qDHq1akEvEZn+xfIxamKyHRDoFh6lNgxfnvRqrqnFJ7UgVzjDab4GfcSSQDhX98y5RelDvU4YXVIaFv8DJsvquc1lB3UCiuiRbmSNPbjN0/0O9c3BvXRbaxNrZgbzlhVqG/bPhOaKaxe5kCWVY3yycUHFAF9oUN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(8676002)(478600001)(2616005)(44832011)(66476007)(186003)(83380400001)(8936002)(66556008)(66946007)(956004)(38100700001)(16526019)(316002)(86362001)(53546011)(31696002)(52116002)(6486002)(26005)(6512007)(2906002)(36756003)(6506007)(5660300002)(54906003)(31686004)(4326008)(6666004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q2RVQkFXNHZiSHlzRWtVR3R3RnRTRFNTMlJTT0pqZEhvM2M1ODVWaUc0UWJy?=
 =?utf-8?B?YzcvL25WZkNpZm9hR2VtUkx2bXI1T1pWdHNYYndXMEs4dW1aVUJrdmRBUkYy?=
 =?utf-8?B?WnlKNmprcHI0Ri9ZVkxyVDg1MTUwTDRrNWVtUVl0UDkzL2pxYk16UWt2U1U4?=
 =?utf-8?B?TjIxRi9RSXdEKzE3WkhZWGFTSVFoTDU4N1BNYjU1aENFTkVuMVdBZ0NmUG1U?=
 =?utf-8?B?ZTduMUlXcmlqV2VqODFpNDcrUCsvc3V5ZXFyMFgyMzZBVU1xSTJWanJkSHhB?=
 =?utf-8?B?V0h5cGlHVmYwaFp5T2xsZWczYm9RWDNZd1pqZE5QYmY4SEYxS0twcTNHVVdz?=
 =?utf-8?B?QVBHOVdPeDlPNCthZWNNNnpFcS9nbVpOWGtNWnpYV2tnUkxjVWpZT2E5a3lN?=
 =?utf-8?B?OWRTdHJORGJ5TVJCOGNsTFNqYWc3Nk00cnRZY0wrYXplZjBWVllaZjBKbndx?=
 =?utf-8?B?eElSdkUrZHhEdkNHS050ZHdZYUVkZ1ZIOWZrQ25Nb2tpZXRsWkdXSnZPekZL?=
 =?utf-8?B?eTZ1anNmNFUrQ2NLWEtYaEozZnRTMnNhVUV2ckQ2MmZBMStDaytnYmtLd2x2?=
 =?utf-8?B?MDB1VXhDZG10b1JQMi83L3NxYXQyTm9uVkJPNFd1eGtrbndLTU5BWC9icHg1?=
 =?utf-8?B?UnA0Z2dtbzBZMXpZY2h6TVJPQVl6ekljRmpqUnBQUkIxcUhONDBlZ1R0cjQz?=
 =?utf-8?B?UjF3V3Bzc1ZqMEg0NHdIdnVzbnEvbWIyeUVPV0UxUDdiTTdEalkvbHgrNlkv?=
 =?utf-8?B?VjdmNExDNXZLelJpSmpLdnk4azlkaDZiTitHckZLcUJyaXJPblVtR0p4Snp5?=
 =?utf-8?B?aWNxc0dIUGhBb3Q1QVBFYm50Mmo2dVNQbWs3cWhlbS9YMDlGbUxzdjg4dk9U?=
 =?utf-8?B?am4weGxtUllFRlphYklKbjZvemNKeXpCbXNpbWpxV0VqTXM1QTcwaHhKU1Nt?=
 =?utf-8?B?V1oxTnNEUFVFdnRLZzhCSnNPUkpBNmh4azhuM1pNMG55Q0pKc3lmS3VnOC9T?=
 =?utf-8?B?VTJucE9zenhrTFVwc01QcXg3MUl4Z2hTV1dlL3JRZm1hWTlFNWlwMFM0R3l0?=
 =?utf-8?B?dFFMWlBQeVd3UDZMM0tsZUtjekVqTTZLc2hCQ1ZkUy9CMkRQWEpnbElhRHJ5?=
 =?utf-8?B?bVdEczFaVkorLzZoaWF5dE1xTDd1bDQzUUZLYWZBcXBBVXkwaHp6MUMxSTQ2?=
 =?utf-8?B?eVg5akJhcXBmdnRia3Q5ekVrQkExbWxqK3FlclNVdUtTaTU5aVYvUy9nTVVB?=
 =?utf-8?B?eHoxSzJ5Wk1HUVYreENJVHAvSG5DMmZvV3RFVEhNWk1uUGlXVVUxM3Q1NnFS?=
 =?utf-8?B?bXRmMVc2UC9oQmMvZ0Q3MHBnT043YlMycTJFTEZ1R2FGcHE4SjB5Tmhicnoy?=
 =?utf-8?B?YnFJUFJDQi84WHBZSXBJU2sxdFc0VCtISVpBQ293S3FEL1BnYTdSNTlKQ05N?=
 =?utf-8?B?OVNocDd0WjBIZ0U4QkJqOVBUOTRsNnVWcEpEUzdFclR2R1Z4KytMZkl3S2RM?=
 =?utf-8?B?SjZMejdvZ2l4blBucjUxaXBtdXE0YzBYYkZKV1dWOGdtUFlsY0R0dlVpbGNq?=
 =?utf-8?B?bndpbnZvN0o1QldLRjg5RGFtZjBoOW54WEtDZGIvUC9LZWZ2R01veFV5bUpO?=
 =?utf-8?B?U1QwTThHTURJN1l6YjlCQWYzd09UelpjaVhnV2cwcEUwZ3dwVDVldG90Yks1?=
 =?utf-8?B?MkkrZW5QNUIzaEI5Yitvck12d3FOcWE4MEx4RDFabVZiOUFmUDhjVlJZL3Fr?=
 =?utf-8?Q?63vxLcejouulMwTXLKhocd6lNY0hdiLMfJ+yoa+?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc91ebf2-0279-4a77-7d0d-08d8e9feb780
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 11:12:28.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hpPzgGMWON+Ijj/VNCLo5Eyd7YWhE8o6MJsp3Cv0Gz3tTNaDMpCJIPfFhhsqSkGNhuSLSahXcvBgDGlGbJwjsdd+pLIHycaFSVUbkXWaPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7633
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

On 18/03/2021 11:51, Andy Shevchenko wrote:
> 
> 
> On Wednesday, March 17, 2021, Alexander A Sverdlin <alexander.sverdlin@nokia.com <mailto:alexander.sverdlin@nokia.com>> wrote:
> 
>     From: Alexander Sverdlin <alexander.sverdlin@nokia.com <mailto:alexander.sverdlin@nokia.com>>
> 
>     Existing (irq < 0) condition is always false because adev->irq has unsigned
>     type and contains 0 in case of failed irq_of_parse_and_map(). Up to now all
>     the mapping errors were silently ignored.
> 
>     Seems that repairing this check would be backwards-incompatible and might
>     break the probe() for the implementations without IRQ support. Therefore
>     warn the user instead.
> 
>     Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com <mailto:alexander.sverdlin@nokia.com>>
>     ---
>      drivers/gpio/gpio-pl061.c | 6 ++----
>      1 file changed, 2 insertions(+), 4 deletions(-)
> 
>     diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
>     index 5df7782..3439120 100644
>     --- a/drivers/gpio/gpio-pl061.c
>     +++ b/drivers/gpio/gpio-pl061.c
>     @@ -326,10 +326,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
> 
>             writeb(0, pl061->base + GPIOIE); /* disable irqs */
>             irq = adev->irq[0];
>     -       if (irq < 0) {
>     -               dev_err(&adev->dev, "invalid IRQ\n");
>     -               return -ENODEV;
>     -       }
>     +       if (!irq)
>     +               dev_warn(&adev->dev, "IRQ support disabled\n");
> 
> 
> 
> I guess you need to preserve bailing out. Seems nobody hit this error path.

Do you mean preserve "return -ENODEV;"?
This never ever happened, because the "if" is "always false", irqs coming from irq[] cannot be
negative.
And there is another use-case actually: there are legal PL061 configurations without IRQs at all,
which simply work even trying to instantiate irq chip, but as devm_gpiochip_add_data() doesn't
fail with irq==0, this goes completely unnoticed and such a gpio bank works fine.

The proper way would be not even try to instantiate any irq chip in such case.
Let me know if I shall rework the patch this way.

-- 
Best regards,
Alexander Sverdlin.
