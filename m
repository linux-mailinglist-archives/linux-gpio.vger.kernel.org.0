Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC163AA651
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 23:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbhFPVxs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 17:53:48 -0400
Received: from mail-sn1anam02on2101.outbound.protection.outlook.com ([40.107.96.101]:51784
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232568AbhFPVxs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 17:53:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms8WMomBAe94lTOvYdACIV8e9xhdKMpu90X+wmogopdocNRFFsS4qs7PPw7GUL1Uw2rWIaVRJmWP6dySv+tMxXUu15a0bbnGmJjpgqhBI8/xM6B4ef8T6Ik96imLGr+ukvE0zK3Sk6rupCUZ1A0hzVb5cDIA//WEEJIdTCXiobEyjTiphQDUQIDsJn3rvp4/FnssoVL84kBa0hwnjyNh7grZDYJ1x2FGIK8KdJs+IUV2APrMIGmpzUOBnWaeZ6GWWKEOUO/tiqTlOrry29A0mSjgF5o+zFKbmdBdowgnUcpwQ3wM7QGx0PlLgUg4QCrt+fRKwDQZnbCSDKoja7i1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmPN5cBz1eA6nD66Keoz4gdYIfQTNGI8rJ32MAW7fic=;
 b=LpRwXu+KLou9MYrLXLROJ5euxnH4D5PjRzKZQ4cHCqVm75XTX90uTfb+gKokvJkkn1+Pdt1RS+dC/lPiQBMvKPLDZ2rTZAJCwDH+yV2qa9240xxDmndTlUpQbyTrCiU8xQRge+wVzd0okD7AkoEJ9c5Kvtcgp8G6ymMHwur28SJuKb7t1ncmdTvWZ0IkbmWz4ihW8BvNS+qjs3UCOzfLF9YmuRYMAvi6P1xGLBRLOePeYmzowYeY0N1TCclf4ee6JC6OVQL92Q7WITiuBRvcGh9/O8nxRZrPWhy9VHv9HM1QcHBlTvukSqgUwxgcBQdTgQHbWzp9bcyXJg6ilWpNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmPN5cBz1eA6nD66Keoz4gdYIfQTNGI8rJ32MAW7fic=;
 b=EHBSpOMexks+UQBFMOHzV+4W0K9CIrO+2W7TXU/eHo6Bujpy0jZPcF9cEZkjX8H+K8F2ZfLsdt25As7xwH7tRnpB96veVLf3qTfjlg1R2wXDqmHBWT+iw3ysG9YGJFLm1pKjS+i5QPd0O9m/gNIzhclfclD6v2kwSmH5RGHtFUQ=
Received: from SN4PR2101MB0734.namprd21.prod.outlook.com
 (2603:10b6:803:51::25) by SA0PR21MB1977.namprd21.prod.outlook.com
 (2603:10b6:806:e3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.3; Wed, 16 Jun
 2021 21:51:39 +0000
Received: from SN4PR2101MB0734.namprd21.prod.outlook.com
 ([fe80::d465:53d1:f8aa:8ae]) by SN4PR2101MB0734.namprd21.prod.outlook.com
 ([fe80::d465:53d1:f8aa:8ae%6]) with mapi id 15.20.4264.007; Wed, 16 Jun 2021
 21:51:39 +0000
From:   Gabriel Knezek <gabeknez@microsoft.com>
To:     Kent Gibson <warthog618@gmail.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH 1/1]  gpiolib: Zero structure which will be returned to
 usermode to avoid kernel info leak.
Thread-Topic: [PATCH 1/1]  gpiolib: Zero structure which will be returned to
 usermode to avoid kernel info leak.
Thread-Index: Addi+ZSZLNfNJFc7ShWnJ/TdMwZoOA==
Date:   Wed, 16 Jun 2021 21:51:39 +0000
Message-ID: <SN4PR2101MB07349B91FB076894841F7D82DA0F9@SN4PR2101MB0734.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7f1a07db-c891-4e35-9bbc-500e201def10;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-06-16T21:49:14Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fed3a363-44de-460a-a91a-08d93110ebec
x-ms-traffictypediagnostic: SA0PR21MB1977:
x-microsoft-antispam-prvs: <SA0PR21MB19776D479252074D5B89BE0EDA0F9@SA0PR21MB1977.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 45kxDFFYHooN9g7DQRKIuA+ZJHeRhz+Z06GjrWH/MKfT3gSCqjcftzBZzSH47eHrx1xCydjKIoRVqo35ov9BZmI10dtvz/5uNqyj06dv9MetE9fhtCx82YRvF9ZYC4a17OZrb9TiGyNxgO6TbC+U4G4oTRBlMFsM2huVSQ9xK8/5D/TYrNzWUYoU2XodReMiTzRBOOu8rsysCIlIXyz5FM3o1wa/ini7mRuu/Lic/k1EeCt0xO6HICOzuVK6fGO6CkOM7SotwLyOVqYEqrsyMYlh2MGMTqrbZk7fTrHy+15rDxjFsOz1ROQ4vIbDxmg7Lr+mFrb8TEWRaV6qP8mPJ33BIv3e6+2l3KeZOjizC4H/jMkVDBJTnfgt8ayzDkqF3+dgEd/ME7ARFXs4PeP5fqNcrOErFZe5DVT/kAzOUZJ2XbiN4qEKEGsVTNcSB7m83CTd5Dygw4xjWYKDBHX3wt2pVIyDy14URmpasyJ+QTjp63iP1VZ9Hn2E/YZ87u3lC20f3e7q+4+CZtVBy4aG4d5bwELNySLQZ758X8+EOs2rD2GqZAcAPKSQl7iYuc8Y6PcYcgQhtnToK55fxYSKuv8VL87oqWFPECRnwpYIYjkNZPFhIJFLYLQ0y0mTqYO94feOOE2uGOuhs+UpLHE2/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR2101MB0734.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(316002)(2906002)(52536014)(8936002)(478600001)(71200400001)(9686003)(55016002)(186003)(4744005)(54906003)(66946007)(122000001)(66476007)(66556008)(8990500004)(10290500003)(64756008)(6506007)(7696005)(8676002)(33656002)(76116006)(5660300002)(66446008)(38100700002)(82950400001)(4326008)(82960400001)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1C2Zb7/HAJhU9NW4R6izFiy4RrAxtzFV7yJge+vNV9LCwCnPuBXpeFzPFUiT?=
 =?us-ascii?Q?WCmnR2dmgxiMAE0zKckDUjLHmbaWB/kx9NQ+pCQukpvvfmbGoaWQdgrVg6G1?=
 =?us-ascii?Q?1dWxgoqbscY89ajgOFfzWwqI8d2NXV4UUGW9EuL6MMp9pLUYNjsf5Rlzt3iV?=
 =?us-ascii?Q?/pVrvvNlF0PP5hoqhcsImuIQFeS9EJ70qTLiREb29oSXy8FZTDv90hUqhLGo?=
 =?us-ascii?Q?+LmnAWhckrnUJe/8/wSSgRgXhrrHy04+Ekev9m0gngnS8cRPGEEJxbF6+uq0?=
 =?us-ascii?Q?XqiSdHkDhnX+fzBW82kbJsdd+lwiPGB5VaKqXtYm86RgwhTboFfohY3IMVxl?=
 =?us-ascii?Q?8xyO0S02oW/nEcQg1zYz7YxY3pcr+amrIKosL8fkRA2jVou9Kpzxi41zx3n3?=
 =?us-ascii?Q?KLJCVwys0ff+0+BY43/F8x1MH+kRnbz3LzHQA501GM64/CGIXRLDt5HkKus3?=
 =?us-ascii?Q?8p3OtSyruYS4AzeOW6O1H+MoyQeKLk0RMosvAc7Ycx6QxwMKvFXwS7khWj6j?=
 =?us-ascii?Q?elwtRgie9OkskuvD0kb/9XpNCvyNrQ7CRh/raL2v62aMnDvg9nyA+idldqt5?=
 =?us-ascii?Q?V7C0SEXie96gcBNrrJeE460C3zKASeUGJ0FhmTewfylTxXizMPxVKioT9kRX?=
 =?us-ascii?Q?VVF2X452qy1QNoAyWSn5jDK/GNf5GyfkKkHJUEWLhWzZVJ1no+in17UfnbLl?=
 =?us-ascii?Q?CCRc7Rp9SwJFPqfaVxWmM31aYZTVBnL0vHs7t/98tLXAP4HLXDSOncfDbCSR?=
 =?us-ascii?Q?AyRcCef2GI88kag4QrbVeATdpIAAEspildxgnS0JIaWxnvxHaZTT+acH8Sk6?=
 =?us-ascii?Q?oXvZ/jElcLPEVxd/LtAaDw/YMoc3PBXufIWCMpBbk3AqGwwe125vlzso5Ekk?=
 =?us-ascii?Q?90nVYkU4VTNCbBfJxLeYabX/rp1VJCvNRcOeyeHUgil2ugX6NCYagVwlVabz?=
 =?us-ascii?Q?L4j2C4SlgQDRkWjj6ew1ZBKYtl2srfJVQ78gxjBlpmCtPlBM8hCbsvyLTmCK?=
 =?us-ascii?Q?SBpu95F6toU0v6LqEADVHRNJm+jVttF99yhFrdR3IHIXhodjmMBo+/vppN2D?=
 =?us-ascii?Q?YBUKLQ6IaKYj0df81groEsXo2udQILGIy+axIU5lJGvcYEQX7YXjeI+8zoWi?=
 =?us-ascii?Q?y4m6/lwbi+zbCtyiltmtbwuQ+kFMMiXRwDE5Sg8VaDLRKg7SaoE5u1fJ7QYN?=
 =?us-ascii?Q?1KdRdEsyyqVGIna9qIt5Hepyxjd6+TferzSHfHFNqqxK3W4nzpldzaEUEnS+?=
 =?us-ascii?Q?bewHSB25MHAsrNbG903ruICwVDxyuuHnJcxJiLtXedl/ohHyF0F5id7ZXcJe?=
 =?us-ascii?Q?54Qa+znN8fot64YN/1NxDf/D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR2101MB0734.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed3a363-44de-460a-a91a-08d93110ebec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 21:51:39.5540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivZwHipqyJ/IZI1LaPkrWtf1L3ioNh8tdA80O4S62pl/bQxcEFfjnPiUPmR3t+njmbLtH+Z1RpXO46dH97UtwJtqgFw/V0cZ0CmmZ8XN3ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR21MB1977
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Apologies if I got this slightly wrong; this is actually my first time subm=
itting a patch to the kernel. (:

Thanks.
-Gabe

Fixes: aad95584 ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPI=
O_V2_GET_LINEINFO_WATCH_IOCTL")
Signed-off-by: Gabriel Knezek <gabeknez@microsoft.com>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index ee5903aac497..af68532835fe 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1865,6 +1865,7 @@ static void gpio_v2_line_info_changed_to_v1(
                struct gpio_v2_line_info_changed *lic_v2,
                struct gpioline_info_changed *lic_v1)
 {
+       memset(lic_v1, 0, sizeof(*lic_v1));
        gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
        lic_v1->timestamp =3D lic_v2->timestamp_ns;
        lic_v1->event_type =3D lic_v2->event_type;
--
2.25.1
