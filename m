Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976735B056B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 15:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiIGNjN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 09:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiIGNiw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 09:38:52 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66917A1A63;
        Wed,  7 Sep 2022 06:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662557901; x=1694093901;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Tr8zaRj2bxQHL042IuDOu4LzUPX6iy4jN1KM/Is+FTA=;
  b=vt8LfF7t2UQz/KCW/9jg+DAgTOivuV0OTSNDDk4WtTbxyQtraRcJNCg4
   aY4dplV+LT4CBIjk9R9WvKSQDVYZtSvUVzOjykkTe0/5S7KSZUeq4fs2/
   IFanJHT3zWLVlRZd38/Klai/vMkjMwmlpmti7i8Ijqp0fttdccPcsSfkJ
   XhKrfqSknR08jd8gu4xDn4VsB9BWQqeHWrA8uHBRB3ck4rUZvLcxLQgiG
   wdHnTdM+q3q4LlAz1v27LRJWiSlx76ixvL+ceqKLr09baLk3mi5VWaHz5
   y0suwGVHAqeBJBf5QTc2kqwxB8O8jncH9VoRK4GSftmMVXWkbXjQGYS3X
   g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="189803005"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 06:38:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 06:38:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 06:38:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNZtDxiQ8ud+xjZejMGlPbzMclB+YSZsZsJ+dK1SGA1fN3UZtGKPLFSYzFClrhqguiikNb1QxEHcvwp35wIAm5QmAdz04jyAH7JQ4hKIDjr3w0MnvIde0BdKJsBEFAvaz79M2vqmt7S21Wd6eYdFWtULc8PgYB1Zvm43HkGWa/LKEaFg8PAn7QPUIcLNtpdV2Ot0F6SaXdKJ/k6awcZ7OBHog3SmZhYvjWA0iU/g9cZf4/92ALf0CeClT4SScqPZ0qd4FTJBHzy+GbS7INn80LFZAeo5rrrX0+R8EFzDufGR0zD2csOJz2OvUlZkHMH1IprZGjrMi7lnD1fPxTmeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr8zaRj2bxQHL042IuDOu4LzUPX6iy4jN1KM/Is+FTA=;
 b=WZFskyuXUBLZCWXVd0bXverVCjcsoNf//bb5bxbCKTTFxjUz5MTyw8PLODLEH/jfb1DB+ab3Fzyg0oixS/lBIDMk3hUfoFbx8b+eCRuNNB2GLI5sFNr5gIGfzDnRnmqZw7kS+4PCrg/AtYoncOuU6vFKaTh8C7l0VFXXlyod0jhxSJGd4PUMltt/Nd6I3LPu6XE2svYt5JtDuEzMEHc8+dQMLBL1Ue0xmLQbixubOTpBuklAh/HnEhB5TH26oe89/JbMOjMBj+OVO2UhjEBow3zoUCRfbK4Y7JAzB/pwyb/QDrrowBSt86DFdiB8Fa+9Ioze3XSATuAVZ89XUSX97w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr8zaRj2bxQHL042IuDOu4LzUPX6iy4jN1KM/Is+FTA=;
 b=G4520JQeave+VV3m5D8XrY5nOk1YCJMhIijlc6LlOiUocIWMq7hl5VDDrp40pMrHeLqQmdGaYyAj6egt7iFxDyS9wiT7asjKR7T4vaIXtRJD1yhi/Oy3QhjGSP8nTbHfTqOFpBIendTaKO0vhD9MREU8DXy51lvdG6klpEBXQdQ=
Received: from BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 by CH2PR11MB4424.namprd11.prod.outlook.com (2603:10b6:610:47::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 13:37:54 +0000
Received: from BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780]) by BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780%4]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 13:37:54 +0000
From:   <Kumaravel.Thiagarajan@microchip.com>
To:     <weiyongjun@huaweicloud.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC:     <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH -next 4/5] misc: microchip: pci1xxxx: Add missing
 MODULE_DEVICE_TABLE
Thread-Topic: [PATCH -next 4/5] misc: microchip: pci1xxxx: Add missing
 MODULE_DEVICE_TABLE
Thread-Index: AQHYwpJVToBq/EYj4EONj64uSckFCK3T9G6w
Date:   Wed, 7 Sep 2022 13:37:54 +0000
Message-ID: <BN8PR11MB36681A506DC6AEDB3DABBF44E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
References: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
 <20220907083435.1745393-4-weiyongjun@huaweicloud.com>
In-Reply-To: <20220907083435.1745393-4-weiyongjun@huaweicloud.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_|CH2PR11MB4424:EE_
x-ms-office365-filtering-correlation-id: dd1ac996-f308-4a5f-3c5b-08da90d62ac7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SyIOxB+MVm4BgcNU5Aq7VfwEmIADV7g45VuestCHU1S762XqaHFvBh23Tf/OtCAYNfvskoeih31oQfpGUl79CKSrVyESJAsGs3LyVLCtjQMN/5w7DwGE2wG8GubP4IoF5RXKYdjpdTm/33EqficXYJHhFq1LkoGjZ9TkFBdcIPx/z3lutmox2nvIy2vIz1k76Ao/pV+iKdSBspM0VNSiaIOEmdj2XzLjKcpd2urjJwD5lRs6QOoioGkrbj2ZjhKWWFMZG6mMyQIbZhkPm4vGvUOkL0wHhCkI+25PWMqIGvSG78oxPdDdnbxgLfFQKm/lIafHuATa9J7b/sqN6OsXlBA9sn2b4vw8ILZAAOQ2XzUQI+7XAttA3I4k4BFIz4drnSzuboWBCWCdyqeebQ9X5W27l0tqJT2iRF0PdXvrEpqMVyn31CZVVBaNlnpGIozgXHW/G1Aer3+7j91s5Nfe4HD48lu90NIQfNiT1gUzSG1vXzF2QxVucvAf55F9kf0rqJGbr8zLQMOAUeC2uFYf8UL6r7g8vMIPYfYg00T2EQbYpU/dgecgMscVwrw93SnQIZJxPV80ZxOIgXN5P3FC58hsFIrDOPYf2oJL28ZCmBVeCgXBiFDZayKX5RdD/leOYm+u10a8mhFFAfz8TYhWFaqmT+ti0nCyTy9BxUK3cTcVCteTHqbAZX997vDomcGuBIBVvrGxT/dYAif0gkB4P4xeQaqi2W+vfcTi9Zn4TbXhIc1GfB292qlNPWXljdCYJUjH4d3wCtxarVWEUqWrKEfX3Bx7aL8p6uJrY2ySMtwTQzwXCzZNkxUSey0an+kF+HQIk7fnnyWqwt8tyeYJSCOyM6OC9TLZiBXX8wdBLuc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3668.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(346002)(376002)(396003)(366004)(53546011)(7696005)(9686003)(6506007)(26005)(38070700005)(71200400001)(186003)(478600001)(83380400001)(41300700001)(66446008)(316002)(86362001)(33656002)(66946007)(55016003)(66476007)(5660300002)(66556008)(54906003)(4326008)(76116006)(64756008)(8676002)(110136005)(122000001)(38100700002)(8936002)(52536014)(2906002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NkrXSVl+lnC9atSGTi1hiJE6qDsMyK/P1i3nAg2HbBeORpv/I8ich/+ZfLon?=
 =?us-ascii?Q?ToqEiC5+Er90FtJK5jqLlV2kqeaQnOy1pz88TVL3WRQ59TwI7Tf6cZoQeP2o?=
 =?us-ascii?Q?DKxgVIqOewtWRfyA0/1OTztF4JMr8UONvLqku2+2/J15XKBuX8JEA6ZVzuY1?=
 =?us-ascii?Q?3kMQGDNd1Jp5V6Qvmrr0Bp4NL8gJSY1YI4c6+UAgsGr1Jgq/Zv/Vax+rxK7X?=
 =?us-ascii?Q?CKxaU397+V5WMD+z03rIn/GOwBmUBMpAV1i/Do88QKE5EuDIpkHL7u4O6QPb?=
 =?us-ascii?Q?IH0t4BxlixUUuCPecHyTh725jNG27e3u04UlYmxx1BeJyuCCQfGzGoOdZsEt?=
 =?us-ascii?Q?kXFrIQFAl1IBP4t6bfLxNX793p33BHBGClBM/2H5Aui1cGfFI8sseWiYFT23?=
 =?us-ascii?Q?tkyXOuxI15JkRHXQIgm4ACjUGTzWLKmT/c8p14DFqUZ0uy+2Q5RbGmpsYTPQ?=
 =?us-ascii?Q?571WHkeqyVtyQUK+4N8hfarrcRRT9XGyImH+TeqiDT9ur+IdAKypbJvduurI?=
 =?us-ascii?Q?V+eq2WgX5n+TfzDbGl1z3FdG8LT1vTsVOtDDww11zqN6pTbHIG7We+J2RwAI?=
 =?us-ascii?Q?J6Ych9ua7ZSs07xepdl0KQFxt57ujVP9ZBn6sGxfy3sFlBuxshriYsfxvgdn?=
 =?us-ascii?Q?cFGd0U80EGf0jSrk3388/B8PgPA3hepLet5I7EsHuihDkWafI9kmTyzZXDoE?=
 =?us-ascii?Q?ll97+94TbuGDI/dfsZZ5XJl9EQGC1ITpmxufxjEAR5x1WHRksiKj+O0id1Ed?=
 =?us-ascii?Q?rU97PWf5NDe6bTtxYwLzrSgLSqjTwDq+htvb5olFfV1Dgg7Kcwd3Wf9WDUBD?=
 =?us-ascii?Q?lsgpYvOr95WOdPltJopsjoKCvy91kGj+K/ZPTYWEBs3uJ2kV3rqpoR+MZG31?=
 =?us-ascii?Q?203JLS/MaV1d2cJA2s0aPesuGyBpGhm53gP+amjzkJpiHVdOTNCrodMZvlWL?=
 =?us-ascii?Q?DeowyU2haVb3+tN/GIRfIMGCA395VPng2FSyqEwaHOwTE2KwcjbjLSF8e8LJ?=
 =?us-ascii?Q?nNfxKecCvG9WyBw1XgHntjh+pBO+AzbVpylVhrQXMhiruvk9+MMIoynyao3Q?=
 =?us-ascii?Q?dg6dlvpJgHKfSsNQzEBBCIrTsJOaHPo3EOcLfJWAqeuetGn8ChXTJ00flgAp?=
 =?us-ascii?Q?h1De/kqlanPCatl/ZqpImbX3HOFrVhb5zVRJwDEjfpxipUv98DMaAHY7nDpO?=
 =?us-ascii?Q?ySJyYfC4ogLtxmHkyBl6ZCx1s/IfCgdQf2KEJk7zUA4ReWriytT4MKzUNLgq?=
 =?us-ascii?Q?yJ/LufPTBBIj1dP9meJZvEWygGNQGXvqtnfr+mNjKcQA7A2budD0l70mzD7U?=
 =?us-ascii?Q?DLM1mK8eZu1peuHOiuPgAfwQ2nUxzxWxVUBbL1Z3B8BnBeXcTZacK9LDMQHH?=
 =?us-ascii?Q?VNuijaIahHxjDBRxBLmhOHx9ANrXv/F+FOpQ/zx4kCHySHgJQIxmymH58dqa?=
 =?us-ascii?Q?svsMSD2nY1imX6h1G6U5mbUFuKoVUViuFxeaVz7LZZIXYRLxZGMGo1SFSqNZ?=
 =?us-ascii?Q?PrCG5g1/MR97caN4ArnHNJ/KTW6SfWosSubZ2koeARxN8h8B2UkStAxLjV1j?=
 =?us-ascii?Q?4MAJDAeKh+uot5TT1Tnfa3DusqOrGWLBrMTAvg5EY7aERWzKJw4S9c96VIg/?=
 =?us-ascii?Q?r/m3z8skgobvb4S1yD9+Ta4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3668.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1ac996-f308-4a5f-3c5b-08da90d62ac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 13:37:54.0979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fUwMsz8iv1nExny+2xnXwxYsM5f4AdyqFKASCpbM0f6pmoSKq79zFveDoZXhKH5pQZa/gJ9K5+dP9O+Mhr6cAeuwtlhHN0VvDGEa/H6B8Yxj+V3AHzupq4UfZl7gS6y3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4424
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Wei Yongjun <weiyongjun@huaweicloud.com>
> Sent: Wednesday, September 7, 2022 2:05 PM
> To: Kumaravel Thiagarajan - I21417
> <Kumaravel.Thiagarajan@microchip.com>; Arnd Bergmann
> <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-gpio@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH -next 4/5] misc: microchip: pci1xxxx: Add missing
> MODULE_DEVICE_TABLE
>=20
> =20
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built as=
 an
> external module.
I noticed during testing that my auxiliary device's drivers were not gettin=
g loaded
automatically whereas the auxiliary bus driver for the PIO function was get=
ting loaded
automatically. Neither did I expect it to load automatically nor did know t=
his was the cause :)
Thanks for your patch.
>=20
Add this tag -> Fixes: 7d3e4d807df2 ("misc: microchip: pci1xxxx: load gpio =
driver for the gpio controller auxiliary device enumerated by the auxiliary=
 bus driver.")?
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Thank You.

Regards,
Kumaravel
