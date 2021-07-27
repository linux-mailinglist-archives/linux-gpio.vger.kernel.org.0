Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFA73D7188
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 10:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235915AbhG0Iut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 04:50:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35152 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235885AbhG0Ius (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Jul 2021 04:50:48 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16R8mfnj019008;
        Tue, 27 Jul 2021 08:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=q1qKyTsq/dztQRKHEcgWSZF1GMQJskBuioMXmqLPZdE=;
 b=dpMFOxM9Q8hAXEwWWPBhahwQn6T87O5813mIKc1KhJaDTgLSGDqmYYGoQ9nr5zwuQ1Se
 zoFK+/d+DqkAckxYgOPr0RL1e701IFWfQb0t/B24A5xY4mjFQzcSvIO581i/8Q5QGev+
 NA7BScBflJz492C896U4UnADaqzZkqhi9NILjungf6eydTHVbniZOqoQNjRw8ANYpUqw
 A+sdZ5AwKQ44ey+s+7Trr87PPQlLjM/X0x+BO8BBU4k4f1feJKOzPNDUFhc/ZVz3wGdY
 e/KcQaa1uY3QxKAn/Cq6LxwwdyXfoZBcQ6as/z9VThplxuUQHKlJ/RSDqWaJYjlQrrOZ Ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=q1qKyTsq/dztQRKHEcgWSZF1GMQJskBuioMXmqLPZdE=;
 b=zxP48hxEEKz20WawvzXT37cFT0PLR1AGRJtS/CxJdzkdI82Q/5wxXq0eLYEM20iB2CCZ
 Q+Bi9gqZshPauMOlW3KP7SL32wmXR/OwVH2V4C0UW9/qaSQyosuMBSgOLYBIqebEZi0S
 UWVdt4JghP1uAhuamUZzsuCDVbqAtg19ybbZ/+WXANhhM0IiFyI+Q7BLq2nI9M8NhOAD
 DaciVpI+pgI1h95JBmoQw7/XjUBcZ+N9jodxybl62HcjvXjcvDE3uzOfWS7APU2j5Ug7
 AZ1g2/qzNjMlV6Q5Hte8hkr0xRLsu769iCevwT7DtZfCSU2kwZeU2ux+O3EUUiWg94Vi YA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a234n15ww-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 08:50:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16R8jUdU108562;
        Tue, 27 Jul 2021 08:50:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        by aserp3020.oracle.com with ESMTP id 3a2347ssk9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 08:50:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2FS3S6y+yxypAF1MihuqOuDc5+i/SFs5NWmqweSDtMxFR7WO6YGrtLSJkn9TwsnwSgKhj0MZGBORoZINCQzbMPya05qLAriCetK0x6d4ryiWC8gCoqbe4PwRv49RWKdjXPkTxBRDj75YmUDcmwOBcTHghYMJM0mt6tOD95iLp+XpxFbTdqIfOO1AoN9W3MqecpV2Ah5O5x07KtoL3NtqV8ASB3z491ItO/wR/5e/PUC3yEZ8f5cqzU3jsTfV8T/ylFTLG9UrO8ZC+k1FXjjGKuAGX5Mcuzan6sqjqo8StRkTTAt3kUgfKqGbQc2IogWsGFWYZKeYzG2BlgAT8QWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1qKyTsq/dztQRKHEcgWSZF1GMQJskBuioMXmqLPZdE=;
 b=eo8lLH6kYKbCXLt4nUnn2ioTby0hKvQtgpPtnO5xLRIUZgtjlL9lHlx0SkAAhAL5H0iFJmylAjEk5uAX+m5X2JB6o8xgPLjMQSI1uu2uzEaYJy6ND6x5+Lgt98JS7Q7lRYv8C0n0BaeIAm1SbL2j4YKA/gIos5qzk61jUEU8oW2b/bWHhQlzMAv967cjK8WHfEbxQT31iNQXLBwE7sZMLkS4RoTbXhWYWsrjhEkrkuvK49kKyJKOjVRRvHSRFJfcthox61QZ8Ix0y8A3LBLGxwAgodQCCoXsZPEj8ooXWM1ftBUShuPDxuId9Lb3Tx6RTeXJZzd4NqnJd/7bPCAb5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1qKyTsq/dztQRKHEcgWSZF1GMQJskBuioMXmqLPZdE=;
 b=f2JMtac67nG28jVO3uQ1M9qOUpc2DhmFDto0+9DabQYrW6B0kTovrWFBv/btOsrDws209tcyoLRVIaSC5vhHe0gj1BPpDAuahFYjMVOLLuhth5aKUGhJ9eSp2O48zImRr+ImLKuBZ6LYdiPS4y9ESS2C59zuSTmsYLan4MUulgs=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1296.namprd10.prod.outlook.com
 (2603:10b6:300:1f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Tue, 27 Jul
 2021 08:50:43 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 08:50:43 +0000
Date:   Tue, 27 Jul 2021 11:50:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     thomas.petazzoni@bootlin.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] mmc: sdhci: use WP GPIO in sdhci_check_ro()
Message-ID: <20210727085032.GA21268@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 08:50:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ed606a-8478-43fe-7883-08d950db9e4a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB12966A630C3D62A522CA027E8EE99@MWHPR10MB1296.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Av7bPMSOpQB9UOQ2qzY1gyTGK9nbAXViRBdcGEj6LMefxtrrzj3Cp3M0pqiVeeqh0xCbig0ap4NIxJBl3wVlmnj/i6ltYNzvumUB/HwLNG2B2RRo3FUtiXBuIhE3zf6hzh1FXGVzzmp/U0cyN06WZNNEcyfJS2gmoHjfk3O/a3aFcYBXDD/GA3uptoH+qYq4cXOp6k9DPC2FSWLAFM9v/km/SxojF0s/QkOvmBMFJLCawXj8DiyH4PJ+pXgBU+1bJLv+hwVayxxCueUm+ma3MfHGiQ3naC+zYk5yei7CNcN17bs4BMWaI0SEifJklu35V9kWRqoPPlrGDnfjXWjbwjnvm5jD+fwXPXoiYRG3A0aq51W9Lt2v0lTWwpVTvOmzy+4OWAvTTYZRHOlAz6SSWl8fbVKOrY1fx+ELULnPrwsllyiXzsb2KhfngKVLGpuHKEAg83ADaxKUoprFACZ0aYYEXmh7vU3q2tqT0BgnOpTnJBZg1TKG3wCQkWE3uZUmsL+WlRmhr82PP0+Ro36V0ix2zO/DQ9RJ6g7GcRVGJHgUGgO0BkJbeN0Bw1aHEnAEjubMXTQIsDc8eMqvn8qSlhQToWqJmk7I3fzuZJQ6qCid+RyFjzhyOEfDBBAAMRnuFKPRU79CFo7Ucxj8yYOGJzQS+iXsqI5z8OI6uzJ0M+yO4PTTKsVCiqpg6MEi9CbojzxrktLEtwstvsDgrxXruQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(376002)(366004)(396003)(346002)(5660300002)(55016002)(8936002)(316002)(83380400001)(26005)(6666004)(38100700002)(38350700002)(4326008)(44832011)(2906002)(956004)(1076003)(86362001)(52116002)(6496006)(9576002)(66946007)(66476007)(66556008)(33656002)(186003)(6916009)(9686003)(478600001)(8676002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XpnOTvXARCMhV6X7nc65Li3q3eyp4IEUFirTqUdF1o6SB8RKWEseR7lksGeC?=
 =?us-ascii?Q?QOrN38mCnGIyTrDwlBDKy6tERfDHS5wCUohVYs6KqrVbaZBXZqi7dYzrZsN5?=
 =?us-ascii?Q?v9KCf4iiSvUnmXf2H54M0kBOmkQs5zlh1j/xFKSVA76uuB++dyoJkL8jR8FK?=
 =?us-ascii?Q?Z9mPsqaOVt+TdN2DAcxXrY0SsZ6pzFJhIPARvAC4sf6MTkLDvJ0ynvlvWETv?=
 =?us-ascii?Q?wrrc5ItUhEft/mP6wGzip3CYcLC73V4wXz/QHorm6I+UqauDCYaZOkDrvKE4?=
 =?us-ascii?Q?LqVvly9nYpvogL2GWlGnmtsJC+ny+CGOu6r2DjmuqF6Byx+zc4hnSUuMa8On?=
 =?us-ascii?Q?a42D7rnlAvfaBOdjGvfNt+eLXU3v7nBZEISE6SJzxtNC3WB2LTrGwQzRp9v/?=
 =?us-ascii?Q?Uz/FkjrMhFaWjrjRs5xSvQ7j/hLttP3wFA3jM9OOoGjF63clAiGXHvtDXmr4?=
 =?us-ascii?Q?csRMVa72JIAjZGrasTBZXszoLsT6nbMA7+T2OjB7E9Blp2mvUwv18WWxR+/u?=
 =?us-ascii?Q?ObbhZIQCwaVIvLdtXSF0/n0YMnuLMwyMzIw8v734cFTKW804xwT4sVKaySdV?=
 =?us-ascii?Q?3TCkWCOTA4MQzC18o8GtKWxPdWLrbelnW3mLROxTIy4nITqovbKZROAoPtsd?=
 =?us-ascii?Q?0UB7E3zM52Zwc3WEusGUwMISLJzJhaExx2Do+kmZzHr/D5pBbhxSdjtk54cq?=
 =?us-ascii?Q?D67prFHCwjoqHFV2Gc/r0l3ok2rewn91/f2Vt2cWPOJ/NQ0GdHNXyjJKQm7T?=
 =?us-ascii?Q?vuwpeAE93MsCHPTsPesQem60KS5NMLpFjgMryWtBamEhJpTgfaMpc/uA/7nT?=
 =?us-ascii?Q?gskRGCgSySFg8iY7Uorzbwx+kYW2RhG5UiDZ3Ip4iK19YXym1kTiNLI1bnGd?=
 =?us-ascii?Q?l0YesNTf1cwgAwKpF7CDWRXlZqSNP2BioC2zIVSRS/MBa9m/WuXTYSECUuyx?=
 =?us-ascii?Q?utGNPwPCvI/D6qeggomNOO36m9/7dn/LILDHZNevMx1QrOZJ6s+CCP49G/di?=
 =?us-ascii?Q?CITprPDmzBellITc7UixAtq9w5InkV6zH1l8Mc09nKW7PXYbNqZVDqLOMnD5?=
 =?us-ascii?Q?3siqpuJuPhQiSXyGUbBmWmkh50NWmoqokKCBFXa0Dwh6qRK/0YjMbfaX+z92?=
 =?us-ascii?Q?EYbfWeqhFGearmUtyhEDPWdGpRBG7e5dBFw1DdIqC6XsbKTCedly4jAAPctT?=
 =?us-ascii?Q?iiHr3BISzxfZ9LTygaJbctWtJuM4x8FzWJazhmC0kF46h6BkPxF4bXBa1kNO?=
 =?us-ascii?Q?KakUFN8mZf3iQhGC7KPjj35y7VsINeSer3iYEkdcsNi5hGx2Q/Ou6tUKhuGV?=
 =?us-ascii?Q?rwaOLzZI+OR891K5VhCog8jf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ed606a-8478-43fe-7883-08d950db9e4a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 08:50:43.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRzBA1K2jR5lx6Epu3IU50DH1iGLkclRTcq+RR7L9M79gJ2OqmIeZFc7/Gox+tvrhnrb+vrzSjUIyzuKA9+SxMMNtFgCuAQ92npVNRCxlP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1296
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=831 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107270050
X-Proofpoint-ORIG-GUID: QRdOm0etmDbWY8zE1bXQNTtsPqDJT5Ny
X-Proofpoint-GUID: QRdOm0etmDbWY8zE1bXQNTtsPqDJT5Ny
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Thomas Petazzoni,

The patch 6d5cd068ee59: "mmc: sdhci: use WP GPIO in sdhci_check_ro()"
from Feb 12, 2019, leads to the following static checker warning:

	drivers/gpio/gpiolib.c:3287 gpiod_get_value_cansleep()
	warn: sleeping in atomic context

drivers/mmc/host/sdhci.c
  2424  static int sdhci_check_ro(struct sdhci_host *host)
  2425  {
  2426          unsigned long flags;
  2427          int is_readonly;
  2428  
  2429          spin_lock_irqsave(&host->lock, flags);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We're holding a spin lock.

  2430  
  2431          if (host->flags & SDHCI_DEVICE_DEAD)
  2432                  is_readonly = 0;
  2433          else if (host->ops->get_ro)
  2434                  is_readonly = host->ops->get_ro(host);
  2435          else if (mmc_can_gpio_ro(host->mmc))
  2436                  is_readonly = mmc_gpio_get_ro(host->mmc);
                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^
The mmc_gpio_get_ro() function calls gpiod_get_value_cansleep() which,
as the name suggests, can sleep.

  2437          else
  2438                  is_readonly = !(sdhci_readl(host, SDHCI_PRESENT_STATE)
  2439                                  & SDHCI_WRITE_PROTECT);
  2440  
  2441          spin_unlock_irqrestore(&host->lock, flags);
  2442  
  2443          /* This quirk needs to be replaced by a callback-function later */
  2444          return host->quirks & SDHCI_QUIRK_INVERTED_WRITE_PROTECT ?
  2445                  !is_readonly : is_readonly;
  2446  }

regards,
dan carpenter
