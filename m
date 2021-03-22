Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346AE344982
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 16:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhCVPnn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 22 Mar 2021 11:43:43 -0400
Received: from mail-mw2nam10on2093.outbound.protection.outlook.com ([40.107.94.93]:52384
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231134AbhCVPnP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 11:43:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXkQRMc956w7y2pR+vw5AmL7TxGS1cFeo/EeKK/74KeL3wWcrZV7QYsRmUHhgC9a3twcqqVJVQ2PXjekhAIvdo9OFRiOtl3frywtSXTrLVhpX2EJ1yybOWvYWASpW29JwFqsUz0/zRPxN8Qk+OEzljNXeyUVvNJg9UdMrSJWTv9QU9vgmiQr8raMi9e3edC1qswrC0LAyZdrwietlk1/dYq8kK0Th/O26jqRHd/4mfYcxYuT6/Xx/h+fB5hHhKFwUBJyvk59Vt8ybCuyov3o7bHwdl+GmOrmAOViTJSemP5DuUAqYnq6HX3UlO2ryKMYayMCu3+DRhfk/IsexNQSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG0FZOTET5zmNdRx2Y0dneTUdoB/AzBQvp3MdZmxOKA=;
 b=QdTRTQjaBMSmev3WY1aQY+geOc1Jtu14AO1sNaIK83wVsz+DQRkRYuPm1Mn6SB70beFfo+x35VYZWLIbflIdLuZImIFhXdxq471VEdhjbFIsJHJEVO0YMRHRWTe6/c3AgAlCYjjws+J6WQIpFwLB2w3b+KBoqrtD4u4l7WY4pxjz1g3oqociVUXLdNRHKBQNHvVHITVa33qwFsaqBcYQT6k5yf0Dx9gx+HdkorqnTXTmRXxN5y4hbzOzaCwh4z/riD664Mq4Dg0zkJq6bTOHmEWfyvg/dZcXtwa71xYTimrWfwdgYijyknpwbjSa7Ox1jmgQfGjyKGUnnF8fCuAO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=visionengravers.com; dmarc=pass action=none
 header.from=visionengravers.com; dkim=pass header.d=visionengravers.com;
 arc=none
Received: from BYAPR01MB5621.prod.exchangelabs.com (2603:10b6:a03:118::32) by
 SJ0PR01MB6416.prod.exchangelabs.com (2603:10b6:a03:295::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24; Mon, 22 Mar 2021 15:43:08 +0000
Received: from BYAPR01MB5621.prod.exchangelabs.com
 ([fe80::6c8c:7d48:231c:e27a]) by BYAPR01MB5621.prod.exchangelabs.com
 ([fe80::6c8c:7d48:231c:e27a%7]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 15:43:08 +0000
From:   Hartley Sweeten <HartleyS@visionengravers.com>
To:     "nikita.shubin@maquefel.me" <nikita.shubin@maquefel.me>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: RE: RFC Need advice on reworking gpio-ep93xx.c to DT support
Thread-Topic: RFC Need advice on reworking gpio-ep93xx.c to DT support
Thread-Index: AQHXHxWhtt+cb7e+nk+MxCDZ5vAYj6qQHiHA
Date:   Mon, 22 Mar 2021 15:43:08 +0000
Message-ID: <BYAPR01MB5621E8956FDBF8F194ABB598D0659@BYAPR01MB5621.prod.exchangelabs.com>
References: <1042421616413081@mail.yandex.ru>
In-Reply-To: <1042421616413081@mail.yandex.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: maquefel.me; dkim=none (message not signed)
 header.d=none;maquefel.me; dmarc=none action=none
 header.from=visionengravers.com;
x-originating-ip: [63.230.248.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c69de9d-77ee-4900-adea-08d8ed493134
x-ms-traffictypediagnostic: SJ0PR01MB6416:
x-microsoft-antispam-prvs: <SJ0PR01MB6416C646158688E2A0063352D0659@SJ0PR01MB6416.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7AbeOFIY+oJ9EVHXBHtpnFGFdktp7r+YwFuvfnIlX0O6c9ReLxeQC+r94S9thQ9LLCGIz36lMrWaAEO2WEJIJvBH3Z2Xvth/1sKlj8ED58SHQPQi2ldD/FnKvB60sZ0Mp5MhJSyIs4X2RX94VDMa6H3qKPNsYMjx2Ke83eWI1RdSQEJAFoVf/Ywzatp2jiNYH5V5PE9PLtG0DWSZmWWh5McHARKF93zrW9Ah5iZ8KShyaP2a3E+cd6ZUD3nfqxDoPMYVgNlytBprw1fDN7dLmQaN2YWikIiw+LurlWnQhyXjFr0FgoB9+JtTLXOj54sIri/BecLUx/zZ/3C5AmUf0OaMLzKb0ekF//CcMT80ZPwHQV5rh5cPpudfx2uLesXb7YiGkhqNtO6vpBDSQ9GqCE52nxcZ0iTIwclALH1mWercEOEXEmYlb52hTAW8pbp3i8eEYFQzJkqcY9kAlDqhv9ONfdeiqXqdj7OgRVLa5REHyITK9FVh/NONxWEI5yyrQCZG+jWeplLX4HsILqfrApKIOomD8Op9Er6HdNLLclUjGo/3X4o9BeyDqDOM/BkPmB15UssiFKyLl7/C2gPFx4R5hkX/5z6SxPsChj+/+r1pg18GueJt8lBz+L7noEFeVF3xeZcb7SbRLoiHlFXOww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR01MB5621.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39830400003)(346002)(366004)(396003)(6506007)(38100700001)(71200400001)(53546011)(5660300002)(7696005)(110136005)(83380400001)(8936002)(26005)(86362001)(316002)(33656002)(186003)(9686003)(55016002)(478600001)(8676002)(66476007)(66446008)(52536014)(66556008)(64756008)(2906002)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kD1bT5szMKxH0bOmeegyD0HJxdE+pDm0vg3XpLQiGEl4Pq73Trlco8RWqlBI?=
 =?us-ascii?Q?m2+Qjp2T2iqnrwSGbkAal2zlZWVV/uoomL6qnRofFUjTA10OXa/C7L5gOWGl?=
 =?us-ascii?Q?ejz59nMThbQ66VG1whgqMXJuwCp9XoyiShWjTj4vXwxwUy4zzfcfyowCUwmt?=
 =?us-ascii?Q?ANISdJ9+lOMYvHduvZwF7IXbE69Ln5YwxGIZ4vYZT5w2jLfRHG24lrQ1JRwT?=
 =?us-ascii?Q?QDRCw50o8M0Hlgc0EGfV1jBVBG0z2zM8xiBHH1dknnYGNbT6sO/0IkfU81GN?=
 =?us-ascii?Q?NfB2CNt3SNxJb6q8/DbgHQDSfX9kjLZFrE4d4CoPXBYneJqFJ4lkRjQZmxsC?=
 =?us-ascii?Q?yWotEBApFiRd9OV0Rg4lOyMrvwL18MJB6A3isnjoSl+2lb9dCaK7n8X8rqK3?=
 =?us-ascii?Q?Wolp/gnTH6xFGq13kMKZKrUSd+n/sXn2LWkTVResPNwc8GkR4dlg4dUUEAC4?=
 =?us-ascii?Q?u+LFs1bdl/GrUaCGNB4r28bbEoacm3l78cb7oMPlDEwye1dOsHSsaWSBnPyH?=
 =?us-ascii?Q?pAwDK6zNH539suEd1x9xmHHUzmv6xrwoBKI0uuBK8H3bw4byzVw8N5vMJNod?=
 =?us-ascii?Q?9VMeDS0WwPvrgxTccFTl/s+WxArmop6v1Lmza95R5MN/ytw+uaeorTIcfqur?=
 =?us-ascii?Q?Ar0CyzuHk/yhnrgcKixPombwiyme++dRvPtm196U4yIB9CTU2qDuctmE4CYw?=
 =?us-ascii?Q?EIko9/S+jfQXT9CvakbuadFPfolxzZNSjOo2+qH4cwZZtjyLYcLWhxMYTub2?=
 =?us-ascii?Q?NGi97NanRdAsiM5tY+sZKX6VxGlfW+glZL64yh9kyuqoDpMzUKCkMHJIezJZ?=
 =?us-ascii?Q?mn3VGgSS03F+vZgXRMNy9B2FODwYHwvjlwrcN1YPkdNOWIlxKFB2DWyRUMzm?=
 =?us-ascii?Q?pwkCOjf8hMuEB20B5OkgYoPczKg3YgdhBQb6tySyWCCdgoGDeT1UXDSCXkAp?=
 =?us-ascii?Q?fcdqprJ240J0elRgvDTTT7FJbOlG2wfL0OXFseSuf8WGY6EWEVnHxTbEzZwH?=
 =?us-ascii?Q?r08xfG01AB+fTSG2+iDOVjumZY6wxY80DBo/jnSEytcrID1mobQ7Q1XB53Hj?=
 =?us-ascii?Q?zr6cmkt4g09gyOYDwygVpN96lMCMPvkrDDHp4indQSOcoVZoTsp6griF5gll?=
 =?us-ascii?Q?izyp5g/QsodgyaFSylVjpQcH1rzjURrxlFzLRPUUfX0u2FtfpgP+zW9teetJ?=
 =?us-ascii?Q?e6sdXCk59TZP/A53bnQsNWA/o4R15zzkkRX+xXKtkAX8AwUkB5tzJFUwCRQt?=
 =?us-ascii?Q?okwhePDcq5w73ttRth+vY2WRZs5gerMc5/HyYIgaQAfaTf+WjZUVGVJ+KUXL?=
 =?us-ascii?Q?xAE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: visionengravers.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB5621.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c69de9d-77ee-4900-adea-08d8ed493134
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 15:43:08.5017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d698601f-af92-4269-8099-fd6f11636477
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvFA7YHpJICcjfXDM8vxdtSeiWckiCws9Fc+1IclhEEAA7xR5drnHTkoaMSydoGdAyYL/h0HV5XQL0KSOeFOkPSxMmor13E5ds9ds6GOZ1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6416
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Monday, March 22, 2021 5:20 AM, <nikita.shubin@maquefel.me> wrote:

> Showing only ports A, F and no interrupt capable C:

Are you just going to drop the other GPIO ports?

The EP93xx has eight 8-bit ports total (Ports A-H). Only 3 port support interrupts: A B and F. Posts A and B share a single interrupt and port F has an interrupt for each pin.

Depending on the chip type  (01, 02, 07, 12, or 15) not all the GPIOs are pinned out due to the chip pin count. But the registers exist so the current GPIO support always registers all the ports.

Note that the GPIO banks are registered a bit goofy, Ports C and F are not in order. They have been that way since the original Cirrus "crater" code base. If I remember correctly this was somewhere back in the 2.6.x kernel. Please make sure the GPIO numbers stay the same so that any userspace code does not break.

Port A - GPIO[0-7]	<- interrupt capable
Port B - GPIO[8-15]	<- interrupt capable
Port F - GPIO[16-23]	<- interrupt capable
Port D - GPIO[24-31]
Port E - GPIO[32-39]
Port C - GPIO[40-47]
Port G - GPIO[48-55]
Port H - GPIO[56-63]

I look forward to seeing patches.

Hartley
