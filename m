Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14E645778B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 20:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236556AbhKSUCu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 15:02:50 -0500
Received: from mail-dm6nam10on2137.outbound.protection.outlook.com ([40.107.93.137]:31457
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236129AbhKSUCs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Nov 2021 15:02:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZD/tamrEfii7lsn90WvNUk64T0FJmuemEIZKgAsmRuOsywkz/YQwmX+OvuiEXK0QIcjIbj6jUB8aacgcu1vcukLu4xOv6Qaa8qSGZMganTswLtlS6xTVlKENwWuvGxhPL5qfqiuBk2j0d1h8WedfAXQDwLFKyAbki8xCS243Fm46jPchXB4pn3HD3qdxW0KHxvmvsVmXy9kcxonPn76L3ulXtrx6y1pZ3b2x7vePHHVkEp512Tcb90ON12OWNT+j12/pPuQ9QrJGjY3y4BqZJ635PYZ44uv1zxsCVMf9H7RMHolrZDNLtDFKHK3mYW9fZrs/KrZxi+3Thf4fUE0u6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8FZkDfqZ1W3J7NA1JEWfHLVBL2fJYpMPFMFDYHx/uM=;
 b=iC68Qds5XqFQJFC3Nmh5wpYlrcbctKEalZJU3N8x4LgYw1spSni1xvOGFBNoy8T8ObtwlAtxzuZDmhEIYvW+467J40Tw6xytuZ6hvR1WDzgGYTuz6yL/7zhxSJPHJpPyOgcF63v+XKZSvB+ZC58FTjbHz1HBXwAZ9ep5SONCi/MBqB7xSl4bGkykq7DtqYCMSGDiQ2vfKRn12hXNJj/qNyl2+X+xhRB182b+7owbjSQh1tkQrzLdtTkfp41QuOdrWzSufztRZ0BUn3IuxEhcBlqkYk9u/SVXtVbXjZj4hppruf7aJ0PpXAM4XcHfIq/ziqZtT4B5KSkpUUghyTHajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8FZkDfqZ1W3J7NA1JEWfHLVBL2fJYpMPFMFDYHx/uM=;
 b=V8iS7nNcixxNdqyzo/rrPXXOaaYhLHLcON1cn7bXtwa/E++q80CS//jXeVfYhbkoHijoM4wrCcdTVGmlMKDT7+Ypjroum+C1NP/chea57wn14cgkcMH0PYJQL8AUSbqYedMBfGR2KwRGKN9wJI1O6D9eqvV8IXOO3SSmJKTzJL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CO6PR10MB5651.namprd10.prod.outlook.com
 (2603:10b6:303:14e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 19:59:40 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f%5]) with mapi id 15.20.4713.019; Fri, 19 Nov 2021
 19:59:40 +0000
From:   Colin Foster <colin.foster@in-advantage.com>
To:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH v1 net-next 2/4] pinctrl: ocelot: update pinctrl to automatic base address
Date:   Fri, 19 Nov 2021 11:59:26 -0800
Message-Id: <20211119195928.2498441-3-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119195928.2498441-1-colin.foster@in-advantage.com>
References: <20211119195928.2498441-1-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR07CA0068.namprd07.prod.outlook.com (2603:10b6:100::36)
 To MWHPR1001MB2351.namprd10.prod.outlook.com (2603:10b6:301:35::37)
MIME-Version: 1.0
Received: from localhost.localdomain (67.185.175.147) by CO2PR07CA0068.namprd07.prod.outlook.com (2603:10b6:100::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 19:59:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b462b8d-3ea6-442c-751b-08d9ab971f18
X-MS-TrafficTypeDiagnostic: CO6PR10MB5651:
X-Microsoft-Antispam-PRVS: <CO6PR10MB56517B22491D9B723111CE6DA49C9@CO6PR10MB5651.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvmPG/GafFiyRTs2dyoQyRz/RhYfUDEx8muPBOmuIKZ7QWXQi0gRYSLa1ijtPNV4GOFhafduW94YTr3LUBf5WfT7/ntXgJ2ryVorv0C95MyLsR+9dcpyyPZJKRrnjXVXKFfqex1buuqRZwshNSRc2A0tgiFKTrprNUGa39K85iF2QG0FcIt9K63f69yMrn77NDBTQP7F9IHb7yygByDSm2IqVryPIhCQZq2ahXZvoI2G53Zd2YzRvHPNg9SVuOpJwMsPb1YloOKZrZypEYeGWSpsLr0XbKsaS2ASONFFzYRT1IzZx3KFp2vJUrm/edYQhUuG43kSnKVIKOwwD/N4rbwKQjjvRt/J43rTHR4ExIyMCsaN3CUktMC9ZmdiOnK99R7P6sCuMsTpXcjhlha6yn70keFZTT5l2d7iHowhm1VuuO3dTyJR1V2ZqD080avILPQb6vMX87uuHZQ890zfMHGJaiqAu6+K5mfSJtSmX+YuqRmSAe1l2Jg9DNbzZyY4UB9JZDpCS/cKNZgi7cKA6c8D4blvSZtt+2H6aMkLcsm15fjk4jAAwaQyzUXmgyDLumE67d98ZtOsowUIgsvj7ZEPJOMJfHH3awiVwdw/ABOgvU5j7z7bePQZjG7XzB2+4ORdbqaRi1wshXgIYe2lLdU/bApuxsYh9goUOZJGhOraA27cgTr2453SM7WaIJQsk0QYa+RmTGKzSQH9go0J+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39830400003)(396003)(136003)(376002)(8676002)(4744005)(26005)(54906003)(86362001)(36756003)(6666004)(6486002)(5660300002)(6512007)(66556008)(66476007)(186003)(66946007)(2906002)(956004)(38350700002)(52116002)(38100700002)(316002)(4326008)(8936002)(6506007)(66574015)(2616005)(1076003)(83380400001)(7416002)(508600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cytvUW1TWVVuQ2Uzc3NBWlRrTmNkL0xjNDQ1NlpRazdyK1N2WjVoNmpUcFZt?=
 =?utf-8?B?U2U3UlZZS3pldWNYdFB3WjhZUUtPUWtRU1hwaDM5T0QyS3lBRWFwWU9ZTDRw?=
 =?utf-8?B?SlBONlNOTGJZelJRRHJrUHBwK0F4SGd1ZkpEUVljcFJCL1drMkthbkoxVDBL?=
 =?utf-8?B?Qk5zYjVxRGVJamFjbVJoVzYzQTBpNTl2aGNuc3BsOUJFVzVTK3JVdXA5V0pQ?=
 =?utf-8?B?c3IvY084cGYrdWc1SGNTRjJHQ0dQaXRmNlpwdk9GQTRBRjByTDNMSURFeG5a?=
 =?utf-8?B?U2ZFTE1TUXZKUTF5Tjc1Sy9zcXRzTTRlTExSdEdtQTJGK2Z6WUVLcG9lbHZN?=
 =?utf-8?B?QUNLcGdxZ2Rhc2E4YU9ucjY0QUZaMUF4WEM2STQ0YXVKK3dmTGY4Sk4vUXpj?=
 =?utf-8?B?eFBaTmc1ZG93Nlk5aHloQ2EwRndQNFdZSzUvRG9xbk1WUzN0MW5VOTZ4Vnlm?=
 =?utf-8?B?Ti9sL2c5U1A3RjN0YVU2ZjJJODl1MlB6TEMrRldza0JkY2R0QUJ0cTVGQnRq?=
 =?utf-8?B?NFVEVVczNTlQbCtwUTVpQ3FlWFMyeThaZVpMQmlaM0s1WGcrZ3hnaFZFblJ1?=
 =?utf-8?B?RVJ4Ni92SHhIUHVJTVRHN29IbkhqUlV1Um8xQTJYTVMrbkNrUDFhc1RZOVVM?=
 =?utf-8?B?SmRvUW8xejAzNEdEYU5DQVFFLzB5WExPNUV4WlFGajNUN29OT0ljYk95TzFC?=
 =?utf-8?B?YmRVNHhzM2xBM1NOTkJtR2ZRRE1iNEtnYXE1K3hKYXh6UU95bS9iQVlQQThn?=
 =?utf-8?B?cVVjSjh4YnRHdnZtNkE0U3pYOVZYL0FCOVRWSTVhZzkvMW1ueWZKaFVBdnBo?=
 =?utf-8?B?MEdZOHJGWkp2YjhiMFQzbnZFck05NC9vZ2VtRVNmTG1oZHZaZ0hZeDhNSEdT?=
 =?utf-8?B?dWxLTjZBNWgwYjZ0ZXpQeFd4SUFWWWFzekk4RE92V1lrcXJraGJ5WWpSNmhE?=
 =?utf-8?B?bFhYWUVNbHZENFRMWkZqTmNPL204Z3lPUUJWR3RCQWQ0aVJzeURBT2ttd0RI?=
 =?utf-8?B?TXIrR1k3b094TGRXK0NCcjRDb3Jrakc2VUE0cEwrWDYvSnMrRmlIb2tNOU1n?=
 =?utf-8?B?bDVnWTVLU0RuWTJQRXpBd0NtNGVSczBDdGhrREwvUFFGbWFzWGJTVlhyZk9H?=
 =?utf-8?B?THA2cGNZVldCT1FraEtidy9EU2hxMGp5VUR6c1dFbTdpWTUvdDZONGJIZitQ?=
 =?utf-8?B?Qk5IdnlSUUljWTgzZXppbjdWT2NRcnZzWDR6Z3puTHdsQzF5SThic3N3a1kv?=
 =?utf-8?B?TUlyMzNVODI2SzBHSW9LdGoxeFpEU0JmY29iSFB3emxiTkx1NUpMOWR1U2NU?=
 =?utf-8?B?R05IQ2RpMndJR1hlRFBXcDJCVlNnemt3U20zM2ZrQzlzd0IxTVpWRkVnbVU3?=
 =?utf-8?B?NFRJK0E3ekhmMWVyYlplaHpDOTgyWTFNdEw5bDRRMnlueEtyTDhFcXZabS95?=
 =?utf-8?B?QlVyQlY2RU1LeUZiNS96VmhqU2xjRFRSRUY2NXNzOVZCaVlQQ3pXOEhSWVBB?=
 =?utf-8?B?N3JaNUs3Q0RGZTNVMTNPSmRyakFzWlg0b2F3elU3ei9SSmFxT1U0bWdaaXAv?=
 =?utf-8?B?YWJBWmFna3ZKYlhKdU1oTjdyMGQvdTR2R1NxRENpWXJuc3BESUhuZmVoNnBU?=
 =?utf-8?B?cy9Ecmg2VmlkUFRLSVh5eUhxY29FWDluR2lCbEQ4aFZtSTEzSDhHVEdraFho?=
 =?utf-8?B?NnN1OGR0eEFFaVdKcno1MXdSQmZMM1ZPWDZaVE1wNDJQRm9rbGxhL0VMVUJH?=
 =?utf-8?B?cTU0QzRJbTM2QTZDaUJSczQrQ2M1VE14cW5EZHlBNHFPSnFaL2xNcnBxOVJU?=
 =?utf-8?B?bnhnVWVtSkhpM2Y0OEllRUd2MWN6SDVKL0RNRFRkUjBqditPU0FMNGl0MWlX?=
 =?utf-8?B?WEE1VzkvKzkvRFJZZndXUmVyWG5sdjBWMWVjS2ZCTVZwVGk5U0F4dCtZK1lK?=
 =?utf-8?B?SVhGWkxlUW9tOFVSNVE0OS9ZYzhtbGgzb25WanY4QzBYeHU2Y3QwMFE3Slhm?=
 =?utf-8?B?WEZ6L1pBVndic2VsZDkwQ0dlYW5uazdsNjl6QnYyNXZiMytXMkIxd3Z0S3p1?=
 =?utf-8?B?U3lpQVNaRFFhTlFNbGFDTFFMbWFqcjdnWDlOeWxTQUg0Mk5yVmJIbGhDaUZt?=
 =?utf-8?B?UnZlek5uZ1NlNnVTT1J4ejROYmprVXIrcThDbFJWSlloTTVDMk1lYXRHS3dU?=
 =?utf-8?B?T1YrZnhyQ1RPNkkwVGUzaURpZEJUdnpvZGVWamYrY21haTQ5Y242SlVWWFc2?=
 =?utf-8?B?OGppT1R5MVJMak93VUNEYjI5YU9nPT0=?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b462b8d-3ea6-442c-751b-08d9ab971f18
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:59:40.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/N/MdwmArpI8bWxynBszLXut/UcUiYE1u5Z1snXnN3cuEzWqs1P+e1ezwsTPKSKPCiqPBeRKjwD7A1diWJnymPD4lCt2ySiDzb+moo3FTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5651
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

struct gpio_chip recommends passing -1 as base to gpiolib. Doing so avoids
conflicts when the chip is external and gpiochip0 already exists.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Tested-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 306293314069..6941c1b45b00 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1308,7 +1308,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 	gc = &info->gpio_chip;
 	gc->ngpio = info->desc->npins;
 	gc->parent = &pdev->dev;
-	gc->base = 0;
+	gc->base = -1;
 	gc->of_node = info->dev->of_node;
 	gc->label = "ocelot-gpio";
 
-- 
2.25.1

