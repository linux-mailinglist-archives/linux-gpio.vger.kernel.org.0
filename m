Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADF85BC2D6
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 08:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiISGcO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 02:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiISGcM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 02:32:12 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E3B17A88;
        Sun, 18 Sep 2022 23:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoEmdgg0c0FSoU9GndF87JZfJ6QDnb0KGTF6vLBHbDjZCpxjoAlmRMVuxteyXP9WdVE7sKjL2yhv4XTndHbEzuiDqKTlJaOZzK2L5btTWiThGF6SCLaD7nmyg8wBZrBrOBfZFLg5GhhQudYz/zIrGkVnG3anrGzkxX4Y+u10b6Rec0K9E7fzZdhg2s/lWKDBOnfbaYDrSTQrNz5otpStJflwzHKGJYH6ZGzI4rV+/9qO0l62H/cjrEwBUeOIs99yduSunYsYUqel7WxZU+WJrW29jW8sITfOMfBGdrEZFhVaudE6R8anA4gFrUcjD6mUQP7FzuSh0La4RwyLfqn8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXYLWX5ukGtaVGGKpVqxX+TPKEqxK6ZeJPxMKv8TRQE=;
 b=aUddNftjhbHP0Q7bHSj10e8rtIwCuklUEbuOFYimJVSvieqayuIQuXzokdRDApqNcyR9QgJLfGs0eRoMl8ETtKWlzwL/UWI1p3x51Prc4YKXvdThysXwt/0BFzPD8K+t/n8IxxgV+X7xzgjVCPqnpQq1H9F+JUyR+0Q7HQDlr+4J8ZKpe+JEuyOYXU5zUnIE8GYoQYaNVIRBNODQJPPDOmvaieWsA506CoNJk9BgERmn8hRf/DnqGIPvkX1f0ayBDasODTPvKJUJEw8o/i7DX9HoEqAT12754Rq19/66qa8fLlRYJKcD06Ta/HcpYuEN0Xdj35B/B+pnIUxdIw4zaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXYLWX5ukGtaVGGKpVqxX+TPKEqxK6ZeJPxMKv8TRQE=;
 b=kl9FLIWCopj+CKPJE4PTXbpNDEO41hPp2BDt9ykkkrWXdB02H3qNd5QMNgA8ozGi0Y2RgTJFJwswKLiD7CdFZNzDcp2GYZFlhVYdtZn9AULZm2+NGGhJTHa+JyLu5RXBPwXWZ6hXOrjvc+lTd747WeGETLsJLUJcYEmZryGaZ6g=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by MN0PR12MB5811.namprd12.prod.outlook.com (2603:10b6:208:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Mon, 19 Sep
 2022 06:32:09 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::2ddc:85fc:e44e:93e2]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::2ddc:85fc:e44e:93e2%5]) with mapi id 15.20.5632.018; Mon, 19 Sep 2022
 06:32:09 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Sungbo Eo <mans0n@gorani.run>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: RE: [PATCH v2 2/2] gpio: pca9570: add slg7xl45106 support
Thread-Topic: [PATCH v2 2/2] gpio: pca9570: add slg7xl45106 support
Thread-Index: AQHYyPkNfMTbmLxmnU2wEPRX5VPZz63jqcsAgAKmujA=
Date:   Mon, 19 Sep 2022 06:32:08 +0000
Message-ID: <BY5PR12MB49027576A8D06800293630FE814D9@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
 <20220915114803.26185-3-shubhrajyoti.datta@amd.com>
 <d756107b-5cc5-53ba-b420-d4664e3a9bb7@gorani.run>
In-Reply-To: <d756107b-5cc5-53ba-b420-d4664e3a9bb7@gorani.run>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-19T06:32:05Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=86ac737e-1959-42e5-a827-57498e5370fc;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4902:EE_|MN0PR12MB5811:EE_
x-ms-office365-filtering-correlation-id: 2ae03a94-7788-4cb9-afdf-08da9a08ada3
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4AgPWjtKRkZ9/pVOtCZ+/Pf3GMq88KJknd/HePn7WFJQM7UbZ6YJbdVGsQVbYMfBLgQkmNm3tBKGPerETMEs4Co7ukCY1tN4Rr2CKGLFEV+0expE4ZxMFs7ZY1IY72U7QjaLNuHmFkLytNSenKdIT7t2bBRUUFOpRDQ88M1Z/kXYkuR3RokbTxl17lfUNXQ5Q6qPVxXmHgqLo5q//BwBZutfBNjMR8DfgwUuuFPGCoxKgQOobmdQY8qZuYKTsb9SrWr2apvBweAm68PP7cz24YoboWlULQEV39xpmZCgcYvqHguuZHexKgeRqW83UW2e5ehrPFF3wJ47ZaIbMNZzoo09Yc4Giq4rGlYv3bJtX6j9HUqu4YGjMUfgwkAo/b8+x7OutQqLnrzt3rLORH66CKiod2PsaZI9UbUeAXBzG+4LeMHziHzpRQFT/WV2NXp1etKp9myJTuaPqCegH/RDIiiXwVjxNOvSsKh5LjFM4olXrzFw6ZONwefjRffvGkPZ4lS422JF/YmTDecR2Nrx31M1Tuwi2oEvmzxqo7p1BZYHarcogOpV2vSCnw2u/uAZxAB81+LSYxxlt1z8BfdkumKthQNdbqc9V/8RAfvigIP+uFQkmxkE71+GKg+wm0F72w6/VPuFzojCQylTAVVQuXEN6YEb+NNB4sa2/WCv9xJS97JUnoRAj9zmNgvXCWacM+kRbZgWWw2HAqy6eJQy1M+s1tPlW5WVzZzeknEdJ8J0Cb6Cll4em4j6vC3R06hogqUmxHFmLlKi8WpDfB8Z8o4SH/KtFmhJP+7kaZJKi9w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(6916009)(316002)(8676002)(4326008)(38070700005)(8936002)(55016003)(38100700002)(52536014)(66556008)(76116006)(122000001)(86362001)(2906002)(64756008)(66476007)(66446008)(66946007)(478600001)(41300700001)(9686003)(186003)(966005)(71200400001)(5660300002)(6506007)(26005)(53546011)(33656002)(54906003)(7696005)(83380400001)(45080400002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gX7xDpb0K8WA8dPfyNbwpm6MoXDV+jQ7qroQPeVNSCRrc25b0rIhgPVRRyW1?=
 =?us-ascii?Q?dzmz+x5ztmgNutQUcbK1jtMvd3ifkm5LFWii9HhorK4gtUBK9cY5XvVniom7?=
 =?us-ascii?Q?2EZlNsQfeF5H2UcG8VC7rRij1zOBJVBaUG7bvHS0iYEdRf+fflf+orfi6Mt6?=
 =?us-ascii?Q?PBehlFw4Q3CmP1SQ7aAjTVY+NRTAt5RUbg0U0Mlc4Qw4K5NYMVcpByQglnYi?=
 =?us-ascii?Q?dh5f3fpXCHwypIM5/MjfKhMYGE2IhXKUTpNDnXrXMXNR2sP6PqT/keEMZcKU?=
 =?us-ascii?Q?P0P0+Od+lAqSz2o0EDnGVybDU6YVe3eBsjTJKwRt+dS7VdQfL4TauPceYSTE?=
 =?us-ascii?Q?09YOp1moUd8S2AWkEoVW/UJYqZS8qNZqLWX67j7xgBvXW7Rnb01OrdOZteiQ?=
 =?us-ascii?Q?zZty9eTqlmisieYZeuFVSpUP8a3ZEl9dGeJrSGGGFH27vdb9VXjRdhpCX4Nl?=
 =?us-ascii?Q?6fpyWOd4Jwx90rpUNvRXXj/08ST+/Igi5RhMJIW+CO3XY49jfe8+RahRkXSz?=
 =?us-ascii?Q?7aUF23JlZbwlGT44FHAIpk7heH+XkRn9gBzYX/SPD+teyOGtaBbztH+LsUYe?=
 =?us-ascii?Q?AHa/d/YoVitGHhL15n/vEE/NoFa/FTWKj39m756t5dO4qx+ukhGxUj5nehye?=
 =?us-ascii?Q?rbCy7DR5yAijf1jVXtmOjz/kZLLGuPtC872lb7UEAfY4gB0TLZ1iFOJiD43D?=
 =?us-ascii?Q?VKuS3b6yefb1RylxjgP+K31dCAEZxZqMxTUAjaJ4RsUEfFsfTLv2rJvqHg/0?=
 =?us-ascii?Q?t4KObfk5WGujzuSB1Eg3L+L5fafAGmsLNzE4oRkzFqme4obcyB3nBh14Z5sV?=
 =?us-ascii?Q?itYkWSb6xE7ZChKzrO98ft79HBylw+nCim1uIwMUaRSPuyusP1aoNHSjHZQp?=
 =?us-ascii?Q?4NsD66gAepzrnzADE4stuIxZl7NRiqPqeWlygMZxjG5A9XB3niXzSTmbgrvc?=
 =?us-ascii?Q?Bgob+T5Iw8dTcrt+GTyoeeL3kg0RifBuJVhWotwJS83sy+jgCG08fRWxJmHO?=
 =?us-ascii?Q?c3MWmYouh9DBlIsAczFkj42fwl+5qc/TfmSOdzELoypN7+CAJ+aIHpCW4I7P?=
 =?us-ascii?Q?K60bZlEwdiiOf10dHViPsiVZIxNgVkfCih48e8Yn6RY3NG6rG5lEgvKbmMuI?=
 =?us-ascii?Q?Y/gVML8gkBxnHSNWOO/atEZWCG0iQdMc0q1KaE0zWHbfkA0+RY05H/GEwFqO?=
 =?us-ascii?Q?M0AUxWZwP7i9UBBHKJQIZHoEBOhZxlHWpICLWuUy4wATA3UgY/KVVdbRujsO?=
 =?us-ascii?Q?bEtzE/Y7a4/CN3sUuN4o+uTM134LV+N4TaPLLtClsD+cepw+EgmmrkKNIZ05?=
 =?us-ascii?Q?oGFsDve8caRWUBZZFyvI4xkEhBseGCiCzNc3XuZQEnjofEOQ+wcpX94xbSG6?=
 =?us-ascii?Q?79yMOWz5zOZdK3/qxyKMsGrC91YybcyoTUtuI1CCQUkojDc/VNR5EYCXyo9i?=
 =?us-ascii?Q?uygTnsoAVwTLzqsKC6KjO6isFjJXd0ZS3s59jyDxLNxlKyh9uIkAsW/0aHgS?=
 =?us-ascii?Q?R8uBtlwR28TEg6TAdD4SzQgbkGWwGewYZwNUNH6w9LeR6RmGwDGnME1xj8Np?=
 =?us-ascii?Q?gd1OZO11y/R6XuEO9Ow=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae03a94-7788-4cb9-afdf-08da9a08ada3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 06:32:08.9479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cxxT2wPwNTd0urj5tNX899MW7aqVftp/ABC1rUBsr92zlGPpuFdOk7kxNCefe4bOvfDGEsFPjsRfpvy9qJO45w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5811
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[AMD Official Use Only - General]

Hi Sunbo,

> -----Original Message-----
> From: Sungbo Eo <mans0n@gorani.run>
> Sent: Saturday, September 17, 2022 7:31 PM
> To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> Cc: linux-gpio@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>;
> devicetree@vger.kernel.org; krzysztof.kozlowski+dt@linaro.org;
> robh+dt@kernel.org; brgl@bgdev.pl; linus.walleij@linaro.org; Andy
> Shevchenko <andy.shevchenko@gmail.com>
> Subject: Re: [PATCH v2 2/2] gpio: pca9570: add slg7xl45106 support
>=20
> Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>=20
>=20
> Hi,
>=20
> Thanks for the update.
> I was thinking I should reply to your patch in the last month, but I was =
a little
> busy at the time and I forgot to do so...
>=20
> On 2022-09-15 20:48, Shubhrajyoti Datta wrote:
> > slg7xl45106 is a I2C GPO expander.
> > Add a compatible string for the same. Also update the driver to write
> > and read from it.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > ---
> > v2:
> > Use platform data insted of compatible
>=20
> Moving the command property into the new platform structure is nice.
> And please add more description about the device in the commit message.
> We don't even know the full name of the vendor from your patch.
> I like the older version of your patch in that perspective.
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.
> kernel.org%2Fall%2F1656426829-1008-3-git-send-email-
> shubhrajyoti.datta%40xilinx.com%2F&amp;data=3D05%7C01%7Cshubhrajyoti.d
> atta%40amd.com%7C9758241b75fc461113b608da98b50869%7C3dd8961fe488
> 4e608e11a82d994e183d%7C0%7C0%7C637990201003357055%7CUnknown%7
> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi
> LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dx0RHFhr9X0L3VBzTRyRy
> VfLhm74gx7jBqUs2NEFhKcI%3D&amp;reserved=3D0
> And a link to the device datasheet would be also nice (if possible).
>=20

Will update the description.

> >
> >  drivers/gpio/gpio-pca9570.c | 39
> > +++++++++++++++++++++++++++++++++----
> >  1 file changed, 35 insertions(+), 4 deletions(-)
>=20
> And I was also thinking that tpic2810 driver might be more appropriate th=
en
> this pca9570 driver for a device with one command byte.
> Actually I had forked tpic2810 to create pca9570 to support a device with=
out
> any command byte.
> Come to think of it, the two drivers may even be consolidated into a sing=
le
> generic one... What do you think?

I agree.
It looks to me that the current driver should work for the tpic2810 also by=
 adding the compatible.
Do you agree?


>=20
> Thanks,
> Sungbo
