Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D74F1A2255
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2020 14:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgDHMut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 08:50:49 -0400
Received: from mail-eopbgr00057.outbound.protection.outlook.com ([40.107.0.57]:41346
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727077AbgDHMus (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Apr 2020 08:50:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYj19CoShzpduY7xd1845aqBF+vA10+5CaxaXxJQflCxlznO2X74WgtqFtnTOnW/ItggsdZ5Oqp0YmR2+/76iXbIPEBTO5avqKjfYl4uNCX5YO6lBgVwCTRvAWAkhGDDvpMtFWeKwhRX+IpRtMcwepH0MRc/JIyVIBLOU0u0ZDIHrJfMXfXdnqY5Kc8rKagwiIGUqwNzYLKWjsdjNRrANevQoaVAsknCWibjq1Y970Y8Hd8UyR1E6r3S3/3Tk/cRuFvPGKjTY17Sk1whpFogpzBgMIHAcYVqtwh1xhah6OC1MY5YyzvbTaPK2DJGXTxFFIouBmcR4mKNeyQv8CBR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtCNVqovgg5+cnHfv2nqrMzaK+dMZK3ddl21NW9CvKE=;
 b=d6qdTg5a0JMTJ4bnw9Kkar0DNkSfKozS7F5ksmrqX2daaFXxC+C3OvUg2yg9SZlX/+0ICuYqXXAxHXJfgCsJ/KZYlOk90ND7ZhAOQQemiaeWEW0HkpEtQ+yGma9fh9Dc0xTRp3q2z+VC+rKWww9KTYpLWTh7+3oSgV29RgfFJ7rfiPsHV0oc8gPiEAtO2MRWh9y+kI630nHArbfj01oM4khsQ3kysknQJd+AB74x5NJ8+Gz9KnhF43jNyXDYKVVNoEhglY+zfXdP3qhQNxUjpE0n6jt2v53cVVRFyX2N9Rq3pL/0bHghs3eJavT/V1zSGurOvFjUG90BtJQnoHwUsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtCNVqovgg5+cnHfv2nqrMzaK+dMZK3ddl21NW9CvKE=;
 b=RhsuyEUbMG+HOemfA1fD0MAD7vrA4ZGcJJbRRxlw1zSePkWgKBYbv80U0rir61nqM476T8Mx0kMPagtWi00V8jF1PysTkPfSsjkIYXHjH5Vdg2pxWDJ/DTR3EIWuBMjp/3i8et94TCdhkV2xrr2QxYzmbBT61FI+K/03mn4Awng=
Received: from AM4PR0501MB2705.eurprd05.prod.outlook.com
 (2603:10a6:200:5a::14) by AM4PR0501MB2707.eurprd05.prod.outlook.com
 (2603:10a6:200:5c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 12:50:45 +0000
Received: from AM4PR0501MB2705.eurprd05.prod.outlook.com
 ([fe80::1049:7e69:b177:10ff]) by AM4PR0501MB2705.eurprd05.prod.outlook.com
 ([fe80::1049:7e69:b177:10ff%9]) with mapi id 15.20.2878.018; Wed, 8 Apr 2020
 12:50:44 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     YueHaibing <yuehaibing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH -next] gpio: remove unused including <linux/version.h>
Thread-Topic: [PATCH -next] gpio: remove unused including <linux/version.h>
Thread-Index: AQHWDXQ3/ucmFUSSak+g59WXZG2jHahvLaFw
Date:   Wed, 8 Apr 2020 12:50:44 +0000
Message-ID: <AM4PR0501MB2705406363FC5D9DBB60F517DAC00@AM4PR0501MB2705.eurprd05.prod.outlook.com>
References: <20200408070832.137037-1-yuehaibing@huawei.com>
In-Reply-To: <20200408070832.137037-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [65.96.160.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56c65637-6d06-4984-a6d3-08d7dbbb741e
x-ms-traffictypediagnostic: AM4PR0501MB2707:
x-microsoft-antispam-prvs: <AM4PR0501MB2707FF2ADFFC8BF0B806E9F8DAC00@AM4PR0501MB2707.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:173;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR0501MB2705.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(53546011)(81156014)(6506007)(7696005)(186003)(4744005)(52536014)(55016002)(26005)(5660300002)(9686003)(66476007)(8936002)(66446008)(64756008)(66946007)(8676002)(478600001)(33656002)(71200400001)(81166007)(4326008)(54906003)(86362001)(2906002)(316002)(66556008)(76116006)(110136005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SJQGw2FOHr4nG5g6hBzT2SUOMSQCu5ASj50PXDESAjU9A21M0YFRZ0VvPRJbmrNlSzMy5VaOnsahBqWVLVurELBkB55WSAt68jrojs0AY8ZCpmYOtjPXu2C/Kos5vTt/KbFQaRmsD5DR4WuG2dApp6AXJKdjXKlnjT9oE3BVX/wu7BT9WgwH7C21QC07AsiLm6UWvOT1DkNBUWj3RXm8cOb6ah6V6+QJ1k8DYJOO7GMn2PD5KHR8WRLqCtZelI3CNzALrCkkDGSy7/5Od48MZas1CcMprS05L6t8Vl6p5H9ztX/pmZJCzKfeS6d0ifqR/TdPL3zCezQ9JaYS+ybIJab3KQnRGs3a31tEYKq1ZeyvKAqALc8NA2hJXLqJv+UHe93IFUVfL+32wRXUvK3BPvVETRZ+Uzcqa12uwSHl3MI/ds/9ML13qGG2L67nndQK
x-ms-exchange-antispam-messagedata: XYVH7i4MEGfK0g97AJypEQJOyCWKEPR6QgP7FgHfXd3Ba11ERylXkvEGm0dL/AXD0XQp/PzZm65jY3TP4plcQ9l07sBkOuM9GL2htF2dKur0PKDm4R1I8R6fcYPaF5pQU7UkjPzC3b/cILirBofDiQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c65637-6d06-4984-a6d3-08d7dbbb741e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 12:50:44.8228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gFn4PNJczbQImPOQjq8V2WB92qR2Dj7uxPB6ZgVGgfZ0gDWsdrWNwm9Yr+d3VwNxlhgv8zNal0ZYdWX0xbliEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0501MB2707
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Acked-by: asmaa@mellanox.com

-----Original Message-----
From: YueHaibing <yuehaibing@huawei.com>=20
Sent: Wednesday, April 8, 2020 3:09 AM
To: Linus Walleij <linus.walleij@linaro.org>; Asmaa Mnebhi <Asmaa@mellanox.=
com>; Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: YueHaibing <yuehaibing@huawei.com>; linux-gpio@vger.kernel.org; kernel-=
janitors@vger.kernel.org
Subject: [PATCH -next] gpio: remove unused including <linux/version.h>

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-mlxbf2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c index =
7b7085050219..240b488609ac 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -14,7 +14,6 @@
 #include <linux/resource.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <linux/version.h>
=20
 /*
  * There are 3 YU GPIO blocks:



