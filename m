Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8384449C5C3
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jan 2022 10:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238747AbiAZJEn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jan 2022 04:04:43 -0500
Received: from esa1.hc776-43.c3s2.iphmx.com ([216.71.156.243]:60940 "EHLO
        esa1.hc776-43.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231404AbiAZJEn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jan 2022 04:04:43 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jan 2022 04:04:42 EST
IronPort-SDR: md0+rMFT1hm/wro6sM9XPLuK3HJj/jLelORJUHn/FNC4vb7LATkYqxMvqEhrYvcr1Ek0oBr1fw
 8eVwMD7ysOuLFwz0DHoPAkl+TTeH40s5y+udYfuOeHg8PUzUDcapQ2nyqYq7mAdsCvjO6GocOP
 iQThc6lm7ckx1ofuTdfgm4tOp8g7LjhFYfkEp9mmGBJawr1LtEPuDPQ/On2ittmMzw0jrW2aAF
 106onLcQDwYv3V120QPSjfwfJCQ70qVAqBuYTliXjBVOekZoMWbFSa6CAmGTcDAWSstcZZ6kOG
 kaSZNagaNgkWtrAWA7TZceFw
Received: from mail-vi1eur05lp2176.outbound.protection.outlook.com (HELO EUR05-VI1-obe.outbound.protection.outlook.com) ([104.47.17.176])
  by esa1.hc776-43.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2022 09:57:32 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2yomYG25QFXf4I/zhR1acSWgv+VIJRhxe1/a7jnXDni6uUt4IluNPzh+Pj15HeFWGlZkvCcodvrUPLOqmAkST4vOsMKhTp2i6a4OfYnEREtuuqsgD4EVvjgxFAxcyhGsIByeeAfIhiBbropYGsCHlUtgLomYNmw/F5JUFaAnF8U2PiuqLMBBXBbFon3xeqpqlsjnakjzvmB9XfNcd9tJAkXhJ++cwRCQve/HeJ5UvRSNMkmTLHrtidWIcbtwTaVhQZd01/Suub+RFa59kPVqDhvxZRew0FV8ORUSX7OMMlKoQRcu0g1zCEw06N9M1g6hIqzLPdabmZCEOVT/ROx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzrKlu96erdtfmPfZeuUGjM5TR557M9olWd64FDa6WA=;
 b=cd+bgg9UscdzmTaQ7sQNkh7Ex3lzNaNhFYxqrVVENN3cewoMXtwnpnHiEz7tanIZ+B0P0HzolEI+5SvMbsLD44L41iy5FQdi5XjO9c7IZ/GmuBSk4OBrJmPAKP2GN069iJveDPsLe9HQ2eD10qLVcSY9kjnUPWDUl0T4yx5J/2AmUq2tjFpKh2YYemlqXEx6dxYFlyZgX+rOj6SGZfb4dEV92aSnEUejO7Ns4lgqIdVEm2UYkFYxR2TtRUpU16EDfkHoDnHQ50BcM6Oufyq+1Jd+wg1PttYrIU39s3b+WkBvMkRYDzTzXdCoyAxo0JhxteJcurSnvSW5BYeHT1fewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datarespons.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzrKlu96erdtfmPfZeuUGjM5TR557M9olWd64FDa6WA=;
 b=cZmY6fyy76LOHnsQb92xHlffEiReMkbpVN04fYdbEGuiJcpHQA0vD5RMUyTl9ebgPDQ2WBBOcp9B+4OW2xJMlBH458dngvIjPe2iU3jUkYtjmnTZc3T3SvBZCFSMB5Jgdyk9dcs71VFbipJO7Lpn/5pXqggW/9r4/PC1Hv5RA1g=
Received: from AM9PR03MB7607.eurprd03.prod.outlook.com (2603:10a6:20b:41c::17)
 by DBBPR03MB6988.eurprd03.prod.outlook.com (2603:10a6:10:1f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 08:57:30 +0000
Received: from AM9PR03MB7607.eurprd03.prod.outlook.com
 ([fe80::d0e3:fb3c:35b9:ea1c]) by AM9PR03MB7607.eurprd03.prod.outlook.com
 ([fe80::d0e3:fb3c:35b9:ea1c%5]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 08:57:30 +0000
From:   =?iso-8859-1?Q?Mikko_Salom=E4ki?= <ms@datarespons.se>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: gpio: aggregator: Using chips with can_sleep
Thread-Topic: gpio: aggregator: Using chips with can_sleep
Thread-Index: AdgSkHY8uQD+bwgsQIWTp8UcFte50A==
Date:   Wed, 26 Jan 2022 08:57:30 +0000
Message-ID: <AM9PR03MB76077A7FB926CAE37E1D8565AA209@AM9PR03MB7607.eurprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=datarespons.se;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3aafde4-a1d9-4ef7-e69e-08d9e0a9e27e
x-ms-traffictypediagnostic: DBBPR03MB6988:EE_
x-microsoft-antispam-prvs: <DBBPR03MB6988148357317F9BC56F0EE7AA209@DBBPR03MB6988.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hP58RAEOzecGPKJSYDm8wijy/QpQT1QjD+hXHNrt5d3/PFYnLjZsfxb6JtowvgVVmT4qzK8nYADjCyKh+skzj0S+o0o1fR4jbeeMfxvvogxlBUkj+0F1lDf+e6CYcjJhZLuil4x5XXSqHRLQ566wJBa0BO62P5nq4hTtj1V8bscfkRmO1Nr3eJeHBv9HX6Wi2eS9qir/ke98hqxuy/BqbJfQ6JCASAE2WRA9ctxMDB0wfPWb/mxvbQdpiDUOoMt2dwNCpXzze/ianH9PNQcEJSgcfW9p4SHzLMtlJgp5Rr9bPIwoq8Wix+UXAdALrPUiQlMQ/jAzkD2xFQ75g6Pcs0hAO94Nt7GErKoAlx/xpn3POPQxRmoMOfwIxrkcPODDyJ5OfCufFIDlzF4vJRq0d8Ie1FX4vd1pLMJAAMkWgsmSvfy+urv0wNw58tQpER2FCjlDTL6bRKGwnEx63zfVLULhbtakn/bPkIPZ+GWMF1QxYPzCExPhUTD4vAtEX48pia+5+hZ8n4EPLxE5F9Qu+NFVqWxpLBXvK65pncEJNaUf4KG7H2TzSICNeSo4hS35qPTxIzaM2SOej7n+NVx7ZhM/xbvSvgroFkiS+TecaiNYPMxYzlAaZegXr2MQCfHsYnPnNaIr53kJQJ+tl72OCToKKF2x0L0AymjVnji1j4aJ2dDYozopWt9ohGPn7TupptwPNaJIVXzgwN5AoN/cZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7607.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(376002)(39840400004)(136003)(396003)(346002)(122000001)(4744005)(71200400001)(38070700005)(38100700002)(5660300002)(8936002)(66556008)(76116006)(66476007)(66446008)(66946007)(7696005)(6916009)(316002)(64756008)(8676002)(55016003)(52536014)(6506007)(83380400001)(2906002)(9686003)(508600001)(33656002)(86362001)(26005)(186003)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?J3oXt62THfSvawEB8qe89VFHSye7TF+ozDtRMAYC9x4+oRm7iwlIu1yP4l?=
 =?iso-8859-1?Q?WkmSVwB9szKNE828WzfuObgRE6FGE2ffq8UVKLA48AOWrilPUg97PwvH/R?=
 =?iso-8859-1?Q?n7eVbDb8XIS20/3hSwEw+HP60fatcUVrg7XaGIpVh4gD3FNbgh6t0lYkWv?=
 =?iso-8859-1?Q?zQBPZYigCZLMuW1Lixcms0uoWmFVEYX7Kfm++rAbHfkoAnSwvvWEVJMNIP?=
 =?iso-8859-1?Q?mzC5hpfdUpbaJ4E8ymXakuIlZ/qb60/v2WWPFajFvTpb2MghUT6093FX3H?=
 =?iso-8859-1?Q?sING8qS6eO2jMcLjz3pjhNzTwJf3CyS8dB0QDMadoFykZQf8g7mbMGvbSG?=
 =?iso-8859-1?Q?n1aJHioRg66zSjX/Yd+lhOhZqcnJhDHEDGFJVMjXMMNR2CeEyUPbZfdG4j?=
 =?iso-8859-1?Q?6Aah+ftfKw93QlD+P0kTYalFRieoF9BBGlqm1obF8IkMNTq7jjysapp+xb?=
 =?iso-8859-1?Q?RBwl69ut78iNCfFs3w6KUphihcs6fvuys/gfWRBxFqOxi6eFhCHRmU9oaX?=
 =?iso-8859-1?Q?vd+/zjS0dsf/QMhvZUvLQlMpHl6xMim4f3dBce0yvm8GADjdC9SRc4fVCm?=
 =?iso-8859-1?Q?LD+ARoN1I5n+HVd3oVqxR3FFt7xL6kvHsTuQ78DZFXpDeaykFq/w91MECH?=
 =?iso-8859-1?Q?Jin6JmFnVR1/ZrtjueV7d6Hc5/Wz5cw2FaBZ11h7jFdrPvzWGEckEhJEnp?=
 =?iso-8859-1?Q?D7eSywK5romLTS/qXfeFVWWOgcNSapJxb76+ZLzAl3klB6Z9xMjqoAn91K?=
 =?iso-8859-1?Q?yVVwczJO6pNzkQl/SDtB87LFkafCzPOUrdwP5d1qZi4Ol+6ZMoAjqcjXqd?=
 =?iso-8859-1?Q?2aHltroQ5z8BTseZCCINI/FjAx0avi0yK0Qdeyt36vnPxwHumeb7WfsfAe?=
 =?iso-8859-1?Q?tB5FeQmns0VITUX2jvN1fVBs6jWzIYc11SX8rQXWdnePg606WMi2Pt4pOA?=
 =?iso-8859-1?Q?0Z7O5xJzelFLuR8b7uFQijH+YqkZ/71Fmx/OEq7mGf60kcGom1K5CZK7Tf?=
 =?iso-8859-1?Q?1S5o9Ci6DgpUQ3lVq69PRliRVy0U9dn7GVBruUhRQxQeprDj6cmkSvBcoG?=
 =?iso-8859-1?Q?wA18HPk//bEc+U6yarPdy5WTOY2yTi+86taObVUUoyH3FmXw0w2oL5Fp/0?=
 =?iso-8859-1?Q?joSYn+RhNVbY4pCODrBkSkfLYczdDxt5uSGzo5G/H+5n//TZU9FsV1YiAl?=
 =?iso-8859-1?Q?id720AoywCv0mKVKIOSEiLWNXyG4XeQIU602t2qpBypogL5Q+wsG3jqxgk?=
 =?iso-8859-1?Q?4UPd1nuqnCnGt5wymLG+yxviBWP8MhGVLqJ4zStPZWI5bEnalB5OKNipzC?=
 =?iso-8859-1?Q?jZ2q8RpWqyq+D7WVC3q8MsrZGVSUGx1ZiGJBAI8KxJchuKgUfxYpLB4E5E?=
 =?iso-8859-1?Q?PU6jnillAWr1KJMlb3s805eDSYRNOzh3/qR5JJVniykvCMK+5rjKOHBJgW?=
 =?iso-8859-1?Q?JQeGBYDlS0BR3fzt8AjTeR+WIvFxXX5/L35A1WadZ5DcSZgMPiBwCdjDwd?=
 =?iso-8859-1?Q?vNlbONdDZv5Vvhx+DRrCSFqpJB4gpErhD85znLqS30wlOargLzZN+OWKIR?=
 =?iso-8859-1?Q?91+t58rHuf0c1QxiB4kAiaOvLWeMEbtSY3PsFhvfJutayzXjMsfHj2FwpU?=
 =?iso-8859-1?Q?gzZMiqiECOIU9Jd8Gps20/41frjabfsNnJmrbj22SMqFTaj5GEvjuLGVVq?=
 =?iso-8859-1?Q?SdM+YsLWEweKFkHSLgY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: datarespons.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7607.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3aafde4-a1d9-4ef7-e69e-08d9e0a9e27e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 08:57:30.2916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2c6b4bf-37db-40c2-ae4f-9fd06f3f8b9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: civW9oAdMHQ5IFOdFNL2exw6LQ/SZWuO1nyUgUFRrThavlWLtcm/tdTK8nZ25IU1DnBxUwlV6/6KcyNUCyg7NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6988
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Trying to map gpio from i2c connected chips triggered kernel warnings from =
libgpiod when setting or getting values. By my understanding the get and se=
t calls need to change to their _cansleep counterparts for chips with chip-=
>can_sleep.

For example:
gpiod_get_value() -> gpiod_get_value_cansleep()

Is this an actual bug or my misunderstanding?

Regards,
Mikko

