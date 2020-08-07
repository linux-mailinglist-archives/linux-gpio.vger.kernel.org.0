Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33B723E59B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Aug 2020 03:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgHGByG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 21:54:06 -0400
Received: from mail-eopbgr60065.outbound.protection.outlook.com ([40.107.6.65]:64619
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726013AbgHGByG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Aug 2020 21:54:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COeQz/KObXZ4zSybl2AAyrlEWggYKJDzEhExf9n5RLbBL1iYa8TJsjUuccZX1BmI80G3mgKkdrx+5QIg7fktfbE+0GX7yENqbMeyO0Ne7bWHYW/RA0zSnkUNCJL7IHKqakjLXdlEHyiobh/BgXW3MtewxTL9ZXDxXeM+P33KCxKqriG594GvLxN06AexStpcRjzCKBkFRyh6aYqY6kG06zmJx2Q3+FnNUv0nU1hoEwIIsnFsWMfSDrVWPlJRGJdX6oLDcMzhIylPlIVvKMeBs6J1NIt9uqm5C+AbMfSXSHwOpLrl+LxtRDOV3HcdPcqa8yOkWVpvw0zoi44yzshM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gg7y9SEdrLnRrNAPj9ui40tIdIt+TJJh4hajEZ96fY=;
 b=XrbmlmvsagfKxkMHidGSyKcjL8IcMuxpnlNFr7zTjGs9u/2MYhjbsDRwxND8p3l6Hkf4KsFAtyl4HLeyvF1EGLP+fOp7fCAKiTmvaIAtYRK9cJyE8G187fKk/Y6c4sQoKJSP0OBRbqlRG2Th3Z8V58jRaDlkMpx+jvnB0gMrciQjOB7MXE7AeKUn8+e4NkMNdjQqUcNRHK53fG/x/s/9a3KNjJJaeZUiOlah7GSrmgayhIiVOgfOtzT3ZylVlNfvZd6GyLhK5ub0ZjvqFOktcWWcbXeTGqaFqVKhYODXrm+ke7FFByxxbsTyb7JIXbTWAxaOx2rss1bmuyclRAIcvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gg7y9SEdrLnRrNAPj9ui40tIdIt+TJJh4hajEZ96fY=;
 b=Q1ihf0KVKFWCqmioH9pp8jvf7wU5Mn6H2DJbO3cK3I/cJ9uVEqAUmxILdcHYOrQsXI1lbIiHl24ScqKx3ajx3HwRNrTo2b+WX3QZH/CucI6h8SqJ2PafClTWwF9qfq91t2BIuK5ixyaFCMrSMDLRaqzLP237jTDwB73p6RPG/mc=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18)
 by DB7PR04MB5994.eurprd04.prod.outlook.com (2603:10a6:10:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 01:54:02 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8db5:8715:8570:1406]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8db5:8715:8570:1406%7]) with mapi id 15.20.3239.024; Fri, 7 Aug 2020
 01:54:02 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "stefan@agner.ch" <stefan@agner.ch>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: gpio: Convert vf610 to json-schema
Thread-Topic: [PATCH] dt-bindings: gpio: Convert vf610 to json-schema
Thread-Index: AQHWanDUsv5s6HEs8UmAXMW6+qGJdqkrIOgAgADEmlA=
Date:   Fri, 7 Aug 2020 01:54:02 +0000
Message-ID: <DB3PR0402MB39160FB9BEE17C4375308D57F5490@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1596553308-13190-1-git-send-email-Anson.Huang@nxp.com>
 <20200806140718.GA766974@bogus>
In-Reply-To: <20200806140718.GA766974@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8118909-d4c1-48f0-7ed8-08d83a74c263
x-ms-traffictypediagnostic: DB7PR04MB5994:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB599455B1A71014E70E135B48F5490@DB7PR04MB5994.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f8SUzQPaTIYj9mkB354UShLjRp4dv8Y4zn+x1y4/Y5oqHHzZaQvQeiAY4D270+S5Z+m5TSTfc+8boIgq1JR5N1iNwgHPZBFSbcYzBUVYfUSwu6RJ2Q7SHaqXrfMQZzOnSZ+CaRC45+eR699n3f66hI+ZfkCXDghwkMAYBcaU2EJNjoGGIyA2H1sAYLYVpNhwLURJqtihj+r9a1UkTZHIkYuY3elBnP4kKTDw50t6Xq7yarurDx3YIWFrV3I6k0HPgepWVEO67Pa0QrbrmI2NQRBhe49m8WxMl8mxU05d9AS9NZxOzFqPWgdRsO7Jf7tD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(26005)(33656002)(7696005)(8936002)(6506007)(8676002)(66556008)(5660300002)(4326008)(2906002)(64756008)(186003)(52536014)(66446008)(66476007)(76116006)(66946007)(316002)(83380400001)(55016002)(86362001)(71200400001)(9686003)(44832011)(54906003)(478600001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: hatUAiSV3BcQqaCbZo6yoZMUUZr0gHocLMZCDE4Yi9mh3QnOMHXevua4mAjsf/rQqThG2+KGIWHE1nwcgor/eA5DEI9Sgx2AZPeQqLfFPDqoZJHkD1dtR48TmeI2mW7ITieFAFKy2tq71OElienxOGaqLX/mPiDGmePT6zaVBgbDodomFnYYmLpQr/nZY8YNhCWqfjWRMjpmJqVEVG5hs46KJdOqe/qrudBZRLuk+v0V4aZUuRCTVjl4e+bR3BGcznZdYkP4/Kqrxk9GCEDt1Hj7RgqaXvcEDs4emhS7PnXwRnlr/wGfLISkZLlM6mZfB907Ud9pwCe2LJgmj4p04LgdQmBsFdw2GNmvuoHmPBxgeyRYSJtlqiGVElV2qxOOLR1qfPRxVYE3jI6Ok9fhwEJeCj0jJ2Y2v/3YRxBLfpodjxgN/exlYDfJv56pagESbuRcVHOwFxeXo2LMUSfXdj1qgFK3dWkwm7brIOVNsXbJD/saQBCY1oTicRMBJaIHVKeZpK5knl1QccY+0OtM2beYUggw6vQT3MIVteooN9VFaJFXOm3S0JTG5LkrdWR+jGngKS9krGg4LSKkXpAPoGbe6/3I2Vq8wfehD5qagn49mLCaxH57zmutKjEgAmu0PmXR834Q94I80BBaJQbUCw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3916.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8118909-d4c1-48f0-7ed8-08d83a74c263
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 01:54:02.4103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kbCkXll3KVQcuMhTqVv8yME0xjK+n8ezhlFGvTwA684DciqbZ8W+FDVR5hJJillhOclcnLCqph9O6jORyoWoPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5994
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Rob


> Subject: Re: [PATCH] dt-bindings: gpio: Convert vf610 to json-schema
>=20
> On Tue, 04 Aug 2020 23:01:48 +0800, Anson Huang wrote:
> > Convert the vf610 gpio binding to DT schema format using json-schema.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  .../devicetree/bindings/gpio/gpio-vf610.txt        | 63 --------------=
---
> >  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 79
> ++++++++++++++++++++++
> >  2 files changed, 79 insertions(+), 63 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/gpio/gpio-vf610.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> >
>=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio=
/
> gpio-vf610.example.dt.yaml: example-0: gpio@40049000:reg:0: [1074040832,
> 4096, 1074786304, 64] is too long
>=20

I updated the dt-schema and the latest commit is as below, and there is no =
build error
on my side, do you know why?

commit 8fd8ce7ff6bd47616ceb48f69d1a04116dee7a41
Author: Rob Herring <robh@kernel.org>
Date:   Wed Aug 5 10:38:08 2020 -0600

    dt-extract-example: Use the C yaml parser

    The 'pure' (Python) loader was needed at one time for YAML 1.2, but rua=
mel
    has supported 1.2 with its libyaml since 0.15.63 and we depend on versi=
on
    0.15.70 at least.

    Signed-off-by: Rob Herring <robh@kernel.org>

tools/dt-extract-example


anson@anson-OptiPlex-790:~/workspace/stash/linux-next$ make.cross ARCH=3Dar=
m dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/gpio=
/gpio-vf610.yaml
make CROSS_COMPILE=3D/opt/gcc-4.9.0-nolibc/arm-unknown-linux-gnueabi/bin/ar=
m-unknown-linux-gnueabi- --jobs=3D8 ARCH=3Darm dt_binding_check DT_SCHEMA_F=
ILES=3DDocumentation/devicetree/bindings/gpio/gpio-vf610.yaml
  CHKDT   Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
/home/anson/workspace/stash/linux-next/Documentation/devicetree/bindings/pi=
nctrl/ingenic,pinctrl.yaml: ignoring, error in schema: additionalProperties
warning: no schema found in file: ./Documentation/devicetree/bindings/pinct=
rl/ingenic,pinctrl.yaml
  DTC     Documentation/devicetree/bindings/gpio/gpio-vf610.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/gpio/gpio-vf610.example.dt.yaml
anson@anson-OptiPlex-790:~/workspace/stash/linux-next$

Thanks,
Anson

