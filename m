Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B67B2C9036
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 22:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgK3Vqm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 16:46:42 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:63625 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgK3Vqm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 16:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606772800; x=1638308800;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=zCxzLDj96wMsaKjdizCCGCmgiMtvG99jBQBbouplU3I=;
  b=cOGBVp9Px81SSk6Av8CZfnllNjXb8ATcQ30pFzhicA4jv5V74EniiZRO
   AJ8GubhsWuSzZUQuWY3GHmhTj1JQUJEhjsIuLfJDHeozanoJDJ1aytIS6
   CnHeFSWBjiny+yvvMXEO4HoB0Ln7QJsn4oqr+bnZn1+qEzx1mqkZaS7w8
   NfLV3QtRBjiw1jrQyOpGJRFsFKcjFZIerfTYScXymZm15mZxXktXt4Q2G
   48386tn7YTHGxd4YCtdDwKLY05j95ycws+OR42J3bq9/zVNmMlWGVyCTC
   hwBisyLS2CKOKnRQaak+VHiQY6gwdKiFOYCBrV9QYqGcsPPMDqABPQLr2
   A==;
IronPort-SDR: ZZSVFDRmpsO5FBVirDb1J2bxtFefYqPZB3lUB5tmvAlizrUAteb/e44OXgBPsf86dSkc/vQ8Zb
 E5Dy5AIooBvNd0Pq3o1OU/oxqAFj7VjIT6DN/ws25bZ00SsSWF5TXNVIGW0dC8IOibjae6z/MG
 KjK6H80x68++pmGxH3DgyAOGqfwB8H7S0x7cbC1ArLxeCgI/eZzHLVNcmCJ40UEwUlTDycqeXl
 4znarDdv+yznIw1pNUuZvQzB7j3PCf+XMyYOOuyXR/ORTU8RChiaa3EPPIpOuTY+6nxQU/vrJX
 2SY=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="158318024"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 05:45:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6z42mKQTnvrVlhmDTs9G55j3DvU3750lZ5D4bIbiR16pxkd8GHEEExJN0GjaPLA232GA2POWahZo1ZHxbpLvA82/PtUmbiveFMTcoz87oniT6dlH3zyD2nIva9lhMSz5I0hHjm+svVKyAoqJd+xRXmOIzNQS0CNHH4+vtyG3GsVsU7XJCNvy6SWuJsXhOXveEQd3LDEMoPYWtFQqEOT6KS8MY//U7wH5vDCwAjDaLTO2IaK4YRRxb/s/y2mLInhyjZWyhez4kpWasRMwJkJEX7JIur5b1AS6jUX0QXCE2R0olAGXQy4G8MXcrCOBFH9BNiqHvRVjzpxIc0vpoH4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWjcJtdJ4Y7Eysl9toUC/VGELNBly+OgkTOCaND+paE=;
 b=M3GODI0KZtYRZgCB4fz5QXK3JWkmZtk+OJnC4u+PcWblzoA+MVEhM78Ul5Q9dYbobkganl/cvtF4n73+Q/8vHQSgV6lNK51et+M57MLgm3mVS3S9YYmCeQ5v5XdxUcNJiXKf4zSIHQgEo1PJcTwneyPz6hucSkNSBjl8juZMNHqh61YbtQiAJyRZPdzqGgnY9bUnYqPEFKXq6eXqsL+8GV9HK5KKPG7y9hbnT9OX/nyQG5El8Q7XU8fTDo/ZgNXbpnjqgOLASaIFgZt9qhC7rCPY7Zhyvv2rECACY0Q6Y3t1TP98ah4uQrMWv0YtoCjaqN0Tj3nljCjFpybyldAxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWjcJtdJ4Y7Eysl9toUC/VGELNBly+OgkTOCaND+paE=;
 b=q1f84cAzNRXWgHkKA/21/84YwVw/FqduFQntPDs7l9YLnwXwq5xOKNydrlQPDg2hGXvOtXyOXc7zk9UP36JLf30E3KQRml8kOobmQIyrv0R7+8tjO7aR2YKgfcdPB+U+yQL1bHua3VPFPwWKbmhTKsws1lZdfji8DSr5+3hTPHU=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6903.namprd04.prod.outlook.com (2603:10b6:610:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 21:45:33 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Mon, 30 Nov 2020
 21:45:33 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] of: Fix property supplier parsing
Thread-Topic: [PATCH v2 1/2] of: Fix property supplier parsing
Thread-Index: AQHWvjqJIvzXqRm0WESMRT49uj4HQQ==
Date:   Mon, 30 Nov 2020 21:45:32 +0000
Message-ID: <CH2PR04MB6522F9DE3CC39BBDA1C56690E7F50@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201119060921.311747-1-damien.lemoal@wdc.com>
 <20201119060921.311747-2-damien.lemoal@wdc.com>
 <20201125210629.27al2cjp5jjuj354@mobilestation>
 <CAL_JsqK3VDb4Jv2H+0Rh7V3ZA+PmKt=+fbn+_a4eHHh8zQmQ9Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d87ab491-121c-4e1b-aec1-08d895794390
x-ms-traffictypediagnostic: CH2PR04MB6903:
x-microsoft-antispam-prvs: <CH2PR04MB6903618DFBBB61E321D89E8AE7F50@CH2PR04MB6903.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pfxZjG6gLAsSxEn1IcpEPcGOcdSi3yQ0oF+CTf8T7zISvSM4RbJlzeA0r6nV8wcZEcgrYNsj15rCUoSGOjeF09HImLQ9/OGRtP77JfU6KKwa7YJTYo1+BCd7JElCZKwLfusjoFvGeMbf8Ud7pyHxQBPen7Y9ygPHY/1dKa9CLWYfvGcsygIbc4bgMj3Y8w1ESxMQMOrVHtIuELkjcnhpZqhoVPzO4zUaIdXlkYKb9tMFnsf+9yMTnqwT9Wz0aBm2Jgx/qAQXknimImYShN9ivJWTqafYt4MUqLuHPZWhSBcZNbcvlN5YJgZSSTYUR1Lm5XXL47H4BOTcI0gdltxhug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(86362001)(33656002)(7696005)(55016002)(71200400001)(9686003)(478600001)(4326008)(54906003)(5660300002)(8676002)(2906002)(26005)(91956017)(64756008)(8936002)(186003)(110136005)(52536014)(83380400001)(53546011)(76116006)(66446008)(316002)(66946007)(66556008)(6506007)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iQuc35aMDNabmSYWyrwAl1grQdY7SBHvuoMEEuOPt4n57Cr5/DfR3hJrunc9?=
 =?us-ascii?Q?iWbRPQsmgzqmTLPCF7k+zB1MrFR6L9DWGfoQ9SaZb6sYDMXzMTIARnb0l0dQ?=
 =?us-ascii?Q?1EGMM95leoQVGEy2GK1gz2pDvupg5dW6DyPvL1bDcKmxNFlwEIfetwtZUXk4?=
 =?us-ascii?Q?XZLbYTvDED0jjvqWOueHnuc589bTHsJYh4J7IMSNP7X72Fxqb3OOSGUjtDzX?=
 =?us-ascii?Q?32y4jYdecinK8xfZiBY+d+19yi0aOVVkwL57ougD0gC77exhE12so+HHBCk4?=
 =?us-ascii?Q?K5Kvs31V0NGq+FcgwzuiMHjfHOdogFzCPZdQqS5kBSIaqijq0cO0BMuYMVkW?=
 =?us-ascii?Q?iH2Nb+Alorqa7O+POn4TCF89ykUp0hreGt7YIc6C89traOrzarcLtHCt3iPs?=
 =?us-ascii?Q?dddUqnY2ypcNpQYBHpkSdMt8+7q2pLjFQOnDY7QiIaeMZT0bCXXCQ2ZTMrJk?=
 =?us-ascii?Q?mZ2ONpocZKrm2Zn6RE4f94QZ6CEpvRK3IY5sBA+QEfg2+99mijXNVy0GCpD0?=
 =?us-ascii?Q?A8yXHuNNEH6dnx0xRQ/cAywLSx9iTrpR7L2dDymzyaBzXBI3OCKU3YNuj4kB?=
 =?us-ascii?Q?rnkxdWuxIWCbu1GgUgnBmxuobgpwBrwO8W+kTM+EDqusnrzYQRCFmGntH3+q?=
 =?us-ascii?Q?6vZyl6i5gllnqLi7mVJ7OeVO/+iioa4WjuyofW4agE9ja8EuMkK5bpwRJ6Qt?=
 =?us-ascii?Q?eeiK+X+X3qA/xRNJdIjraAO+S3y0XeHbGrJnsJCwvaYwS2Rdvbq4nwnusMwz?=
 =?us-ascii?Q?MZEmQupRkX9c/QqquSgjWaJPP9qw6ybraLgZJAfqBdZEv2h4aErqjMiEL9um?=
 =?us-ascii?Q?lTtKhrljUo9c5RVWLeU7PjpeEEzB1SL1alUVAp3KQe8qKN2ZuYVFfQNunJ5k?=
 =?us-ascii?Q?vXkggOGi7jdSQ4gG+s0LXzVqI8F+Ccb03h5G4vCNXBsDJFTFF3Y4ZyQOD2B0?=
 =?us-ascii?Q?XMxIIlQrDVO0XLb6vA4T7x+XCac4TZoWuQNf0pILSSyMr9yB/uKZX6E506mr?=
 =?us-ascii?Q?JV+U?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87ab491-121c-4e1b-aec1-08d895794390
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 21:45:32.9195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrIJ7yp8HIuB8ZMoPgp9uDOHCg+ewdUa6wvdA7g8MLdmrIkXILrVfxEq7xp8ouGNZ9lND3+v7Cxi2CNTTEUO0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6903
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/12/01 3:22, Rob Herring wrote:=0A=
> On Wed, Nov 25, 2020 at 2:06 PM Serge Semin <fancer.lancer@gmail.com> wro=
te:=0A=
>>=0A=
>> On Thu, Nov 19, 2020 at 03:09:20PM +0900, Damien Le Moal wrote:=0A=
>>> The DesignWare gpio-dwapb GPIO driver ("snps,dw-apb-gpio" or=0A=
>>> "apm,xgene-gpio-v2" compatible string) defines the now deprecated=0A=
>>> property "snps,nr-gpios" to specify the number of GPIOs available=0A=
>>> on a port. However, if this property is used in a device tree, its=0A=
>>> "-gpios" suffix causes the generic property supplier parsing code to=0A=
>>> interpret it as a cell reference when properties are parsed in=0A=
>>> of_link_to_suppliers(), leading to an error messages such as:=0A=
>>>=0A=
>>> OF: /soc/bus@50200000/gpio-controller@50200000/gpio-port@0: could not=
=0A=
>>> find phandle=0A=
>>>=0A=
>>> Fix this by manually defining a parse_gpios() function which ignores=0A=
>>> this deprecated property that is still present in many device trees,=0A=
>>> skipping the search for the supplier and thus avoiding the device tree=
=0A=
>>> parsing error.=0A=
>>>=0A=
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
>>> ---=0A=
>>>  drivers/of/property.c | 16 +++++++++++++++-=0A=
>>>  1 file changed, 15 insertions(+), 1 deletion(-)=0A=
>>>=0A=
>>> diff --git a/drivers/of/property.c b/drivers/of/property.c=0A=
>>> index 408a7b5f06a9..4eefe8efc2fe 100644=0A=
>>> --- a/drivers/of/property.c=0A=
>>> +++ b/drivers/of/property.c=0A=
>>> @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)=
=0A=
>>>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)=0A=
>>>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)=0A=
>>>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")=0A=
>>> -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")=0A=
>>>=0A=
>>>  static struct device_node *parse_iommu_maps(struct device_node *np,=0A=
>>>                                           const char *prop_name, int in=
dex)=0A=
>>> @@ -1319,6 +1318,21 @@ static struct device_node *parse_iommu_maps(stru=
ct device_node *np,=0A=
>>>       return of_parse_phandle(np, prop_name, (index * 4) + 1);=0A=
>>>  }=0A=
>>>=0A=
>>> +static struct device_node *parse_gpios(struct device_node *np,=0A=
>>> +                                    const char *prop_name, int index)=
=0A=
>>> +{=0A=
>>> +     /*=0A=
>>> +      * Quirk for the deprecated "snps,nr-gpios" property of the=0A=
>>> +      * DesignWare gpio-dwapb GPIO driver: as this property parsing=0A=
>>> +      * conflicts with the "xx-gpios" phandle reference property, igno=
re it.=0A=
>>> +      */=0A=
>>=0A=
>>> +     if (strcmp(prop_name, "snps,nr-gpios") =3D=3D 0)=0A=
>>> +             return NULL;=0A=
>>=0A=
>> What about printing the warning from instead of doing that from the driv=
er?=0A=
>> Like this:=0A=
>>=0A=
>> +       if (strcmp(prop_name, "snps,nr-gpios") =3D=3D 0) {=0A=
>> +               pr_warn("%pOF: %s is deprecated in favor of ngpios\n");=
=0A=
>> +               return NULL;=0A=
>> +       }=0A=
>>=0A=
>> So when the property is removed from all dts'es we wouldn't=0A=
>> forget to discard the quirk?=0A=
> =0A=
> Why do we need this change at all? We've already got a message printed=0A=
> and devlink is still default off. If someone cares about devlink and=0A=
> the error message, then they should fix their dts file.=0A=
> =0A=
> Now if there's a stable/mature platform using "snps,nr-gpios" and we=0A=
> enable devlink by default (which needs to happen at some point), then=0A=
> I'd feel differently and we'll need to handle this. But until then, I=0A=
> don't want to carry this quirk.=0A=
=0A=
I have the device tree fixed for my use case, so there is no problem anymor=
e.=0A=
The improvement this patch brings is a clearer error message. The one that=
=0A=
shows up without the patch is fairly obscure and it took me a while to figu=
re=0A=
out what was wrong. But again, no problems for me since the DT is fixed. So=
=0A=
sure, we can drop this patch.=0A=
=0A=
> =0A=
> Rob=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
