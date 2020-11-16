Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529F72B3DA5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 08:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgKPHaT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 02:30:19 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5335 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgKPHaT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 02:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605511818; x=1637047818;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=5s6m3+5cKorud4hvOKGw2M4voIDwlbvKBc4MEnLUCH8=;
  b=H2tdElyo1wfGUIcY1JriWQClOC+hdsymhCRnh0R+nHBjqRLSdgqJoXpL
   pgwIlzr1bUwvDoDDhVmnKXZ1/gkBAAKAoPVyEnsZHOHN2Q8K4dSU0HIQp
   vKWRTFNltyeZ0YYNqLX3Jdn/lUKeGAabHjCZOjUSbyUttWIKZXVXZ+1AO
   y5gsozm0FnF7ULgkILN84RH/pEPj5Yp4xT98woPSsQJkt4NYLSJkZZ/2s
   oejRhkVnHzeTmj8MWtaAjNsKVgvXd3rSjNlByfBaw5PupLhFrAldc3T/9
   ynL8OSoXjf4KbAHu4zEP/w40LTc5BBKSY5Z+NrS5Na+2MwxJBeOGz4DFY
   A==;
IronPort-SDR: 56bidZ+eddAUv5Bv51InOWiXrwUmXyZwrGX+zmAgYr3mgoOydVx5FnbBp/LRkO6yRN/g9gVscw
 lazg9Xr1XfnzWdWD8iQdlW07Fta0bghy9aUtohAI3ihEB2Mm7mD+Qn5+D4JfpeRxhMCdqYyiur
 cSuGbC85o1buleJ3ypGOEzxdBLNxrmag16h8Pk+ekK9R8LurrRGyAnvEqULqab5ChVVNpfWUmt
 7U4U4EfX8CXbSthIc6vF5rutLbeWF3GuV63nnLVbXrPxnm3+sSk81ocPlKQYfSpaUpS533140X
 Edc=
X-IronPort-AV: E=Sophos;i="5.77,481,1596470400"; 
   d="scan'208";a="153884117"
Received: from mail-sn1nam02lp2057.outbound.protection.outlook.com (HELO NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.57])
  by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2020 15:30:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKOj05tS3AjIjd7/agXB+LJzUrwJz0MGBKYPTGfXScvpzQ+Uh+AoHv+mSvG+wLL8ivkuKL5Glg7wbu32u1dESLfL0sdu4TYULfON92Efd9VZJI+qC0qEHL08+CZlOKH6Rn6qsbta4tKQdeyWN51nP8Cn/OAW+2Ny3DsZQbspbIyOradm3NwtRemWWQJ0L0VfsxJzbEbHROjVq564QHGjz+0Hhv5F5nRlozY9X0IJg4Y5ZLQKHXIgYmjRT9MXsLJKMNySvNvc/wq9y5PcRlbf11IX5vCEa/0Gb4ya7SBu6kG52LZUmeIsdLbHjAZlRvlNAeLKEjgDCx4zPwVO91wW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dm5BP9cs5U9SJuW4Su2hatMSrNWX8hkNdSkd/v65KM=;
 b=khHySzODjq4tVoWlslXBrtfcVAXCbAsvywuWE6Ja2mWPnyaCyiWqOftemvPCDuIwEMAkOJndMigxyFgxy3BbMZ73aC5zz+BLJ9cECZE+1qElqKbo2uabYQ/rdArdisyLbc+8M6onX3dwgTv7DfzOPypQgR5I7tE72s7pbfxdhPt8n3FUBbbsRfyhVTdb+zvbn+QRoscH4ZIculDHEJ6mcJLPcRd7sCWCEQsf9qL/KbX8Kfvzic11Tm4KLnHFXhT+ApTE17lBYphf8ELwq2OrLu5Xkp9j3r5q96abu+x/LlZXbTR9hTocarryNmKJK+OIoBtwhK0vKyTMviahAxEoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dm5BP9cs5U9SJuW4Su2hatMSrNWX8hkNdSkd/v65KM=;
 b=hV/mgd7u7Rn9nMVpA+H9OS6BuX+tuxXRkSoMYotr7cMBkdNIoBQ8lfYQFbwwT7Vc2c8NfxyamgqEnYWVOtXZQnrgohY8V0BPlZrZ+7F1ULmrO8g+wRmwRDYmr3QDNIKZNTMJpBDQH4kKDgjRt1q6PQsy/3yLoYM8fXbijK1ykvc=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4451.namprd04.prod.outlook.com (2603:10b6:208:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 07:30:15 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Mon, 16 Nov 2020
 07:30:15 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH 01/32] of: Fix property supplier parsing
Thread-Topic: [PATCH 01/32] of: Fix property supplier parsing
Thread-Index: AQHWtN4FpvYZREsvUk2FACZw1wMGRA==
Date:   Mon, 16 Nov 2020 07:30:15 +0000
Message-ID: <BL0PR04MB6514880A6977E605D38D68BEE7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-2-damien.lemoal@wdc.com>
 <CAHp75VfvUZ6h+JGCUQ65i7qFsugvbd3n=aCprgvp=geRSpQEhQ@mail.gmail.com>
 <20201109174450.myombn5skpj5wcxh@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c574ff1a-c0ed-479a-11ca-08d88a01765a
x-ms-traffictypediagnostic: BL0PR04MB4451:
x-microsoft-antispam-prvs: <BL0PR04MB4451FFC9081436C8D99E7EC3E7E30@BL0PR04MB4451.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uL8wQBF34R3LL+8iwxaiaOyCDllnPlAK1cF2oJW1pnpx9jfigxRnE+B8vraspc2Xk5fORtaQLXyzo7Y6RHP7Gcy62k4P0Hpvd9y/IiLdrcJcvxM5mEV6jr8MTF5WOLivSrbzXpKdIx2cs5MQHdnCfPV6giW7WoDjkAbU1KmAxWd6eU/Aq5mofNEU7YBKzsIQ62AIMdCCuLaG1Imlm5W+iZI1zAr46rel5GrzuTXH22QSoA+uHlhTAA8JWDD6PDR1jghLQy+eZMSjS36YJ/3JnKt5KC+YORBseJ1apCoZWleyt21JKOYqH2RyjVGmzfuC+KXSVYiZLTrMt1on5FsOug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(6916009)(53546011)(4326008)(7696005)(83380400001)(186003)(26005)(6506007)(52536014)(9686003)(478600001)(5660300002)(316002)(55016002)(54906003)(66946007)(66446008)(66476007)(86362001)(2906002)(8676002)(8936002)(76116006)(66556008)(64756008)(91956017)(33656002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: r45iw7P1n+wq74p1+Na2EMfUoD2GpUiyT1uA1Vfyed0P59+FzwSuhlNLGHUKoXlaBNB9uFp03bMgsZLWfx6ZiI6qrZlEb/V1OxB143ABKdjbdQ85jhQ5pt6fND3GPxMZjB8VGk9uDHbcMnBJeOVcYhql9+vFRgfw0FLE9lM4VRM5H1x/9h5B8E+eUHbu1BEz8caURGLHluHrygZV/eiE+x9KqhCoBZaEdgHZL+pjoagr7yF2S90bZkXncQiXY1aEy7G2aOU7IEnbVtCrm5YrOeesUhrJ1wyBVNLnzol++81DhRYjFWwBVCIMk/owctLex8FZUnM6tvUu2hnfvtnXDCohpk2J1K3RYcIFw3QZrMW6HGyCsT36Fzyy72xa2xRNCCYYf/ADuqboK7RgUsEDrQfrmG6WtkGsokPP7VlOteEKv3zH+0saGKKNhk0GfkX4gJJvnygQ1Xq+ETlZTf4hBsaQS+iqSn7Q/usmg5q+c/bZv6VHBbvEcKU76Uapj/RsiooSmhinNkKLnmBD8mPzXyfmsJiW60CfcvuOYrrqLmyQZMnDnNmipYe9zdN+AM5jNzKbzBRbbQJQMtckAShBmtvjtZy0aY5UOEaY+CRAtXvO2n0Da+TJKqFsvIDIVRFEvO8zQqlS2zoB2mFJqQDbBg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c574ff1a-c0ed-479a-11ca-08d88a01765a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 07:30:15.6686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cncInH0B0C6ooVX5ERT22xfLVjGzvKY0uGtB6XmAIC2GjGsdpcT8oM0y8q1FFbsvnRo6stsTNITHy9a839HHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4451
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020/11/10 2:45, Serge Semin wrote:=0A=
> Hello Andy,=0A=
> =0A=
> On Mon, Nov 09, 2020 at 05:14:21PM +0200, Andy Shevchenko wrote:=0A=
>> On Sat, Nov 7, 2020 at 10:14 AM Damien Le Moal <damien.lemoal@wdc.com> w=
rote:=0A=
>>=0A=
>>> @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)=
=0A=
>>>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)=0A=
>>>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)=0A=
>>>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")=0A=
>>> -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")=0A=
>>=0A=
>> Sorry, but the above doesn't sound right to me.=0A=
>> It's a generic code and you may imagine how many systems you broke by=0A=
>> this change.=0A=
> =0A=
> Damien replaced the macro above with the code below (your removed it from=
 your=0A=
> message):=0A=
> =0A=
> +static struct device_node *parse_gpios(struct device_node *np,=0A=
> +                                      const char *prop_name, int index)=
=0A=
> +{=0A=
> +       /*=0A=
> +        * Quirck for the DesignWare gpio-dwapb GPIO driver which defines=
=0A=
> +        * the "snps,nr-gpios" property to indicate the total number of G=
PIOs=0A=
> +        * available. As this conflict with "xx-gpios" reference properti=
es,=0A=
> +        * ignore it.=0A=
> +        */=0A=
> +       if (strcmp(prop_name, "snps,nr-gpios") =3D=3D 0)=0A=
> +               return NULL;=0A=
> +=0A=
> +       return parse_suffix_prop_cells(np, prop_name, index,=0A=
> +                                      "-gpios", "#gpio-cells");=0A=
> +}=0A=
> =0A=
> So AFAICS removing the macro shouldn't cause any problem.=0A=
> =0A=
> My concern was whether the quirk has been really needed. As I said the=0A=
> "snps,nr-gpios" property has been marked as deprecated in favor of the st=
andard=0A=
> "ngpios" one. Due to the problem noted by Damien any deprecated property=
=0A=
> utilization will cause the DW APB SSI DT-nodes probe malfunction. That=0A=
> though implicitly but is supposed to encourage people to provide fixes fo=
r=0A=
> the dts-files with the deprecated property replaced with "ngpios".=0A=
> =0A=
> On the other hand an encouragement based on breaking the kernel doesn't s=
eem a=0A=
> good solution. So as I see it either we should accept the solution provid=
ed by=0A=
> Damien, or replace it with a series of fixes for all dts-es with DW APB S=
SI=0A=
> DT-node defined. I suggest to hear the OF-subsystem maintainers out what=
=0A=
> solution would they prefer.=0A=
=0A=
As Rob mentioned, there are still a lot of DTS out there using "snps,nr-gpi=
os",=0A=
so I think the fix is needed, albeit with an added warning as Rob suggested=
 so=0A=
that board maintainers can notice and update their DT. And I can send a pat=
ch=0A=
for the DW gpio apb driver to first try the default "ngpios" property, and =
if it=0A=
is not defined, fallback to the legacy "snps,nr-gpios". With that, these ne=
w=0A=
RISC-V boards will not add another use case of the deprecated "snsps,nr-gpi=
os".=0A=
Does that sound like a good plan ?=0A=
=0A=
=0A=
> =0A=
> -Sergey=0A=
> =0A=
>>=0A=
>> -- =0A=
>> With Best Regards,=0A=
>> Andy Shevchenko=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
