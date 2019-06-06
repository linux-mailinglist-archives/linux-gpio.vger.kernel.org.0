Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 997DE36C4D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 08:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfFFGcU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 02:32:20 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:51466 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfFFGcT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 02:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1559802740; x=1591338740;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ebaA4IwcctmtX6EvJcI+FohW8pc9ALJiXy6YHR3ny2I=;
  b=T1TwHoTQ4J7JRofov2TxphJMILBpqpGhIaLXGMOuN9o1+WysVQ2daQZJ
   mqdgaEICur4vkaACpv3VAAybtan1Vg32kW6vRPrWwLwrB8No2f8oPcEEv
   dfQG5KFdtHbOgv7rMLaY2/tMegFbG9x1+PdtPsp0HD7+6845eNNYX/fGl
   axv2zOLO/+yEluqIBPn3MbAwC6uOGPHG/I/1BnaxrPLkXEr9hs8mKhHlh
   fo8dVO0k/OxXEk1qW/3+vRQwflgGKxPTcMPmQg/SW1IGQa2+ZxJYPAAOR
   +Q4mCpsFceHEwL+DHvWaMgbu2uw2wWbD7KQobMiqsHcOgiLwRUhqoRWZJ
   A==;
X-IronPort-AV: E=Sophos;i="5.63,558,1557158400"; 
   d="scan'208";a="109916908"
Received: from mail-dm3nam03lp2051.outbound.protection.outlook.com (HELO NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.51])
  by ob1.hgst.iphmx.com with ESMTP; 06 Jun 2019 14:32:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aAGpDL2fIiqLgap8rHKwiHc7yqVAxZwG0hlactOhrc=;
 b=df6kiH5iPsvtDyxj+8PfhFCFfRyI+V222twjJvS8lfT0KX85J1+ZecI+HTPfPfzBu8PJlzSxHMHQrpBmRcOWK6fYRextrwDFMEFSwSrt36UzQP0b5hBoQUZL2/eYDkrPWYaDv22AlNyC2hVL3SmB/3YkNVqxZSRg4ehGmLKZsAY=
Received: from SN6PR04MB4925.namprd04.prod.outlook.com (52.135.114.82) by
 SN6PR04MB4349.namprd04.prod.outlook.com (52.135.72.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 06:32:15 +0000
Received: from SN6PR04MB4925.namprd04.prod.outlook.com
 ([fe80::6d99:14d9:3fa:f530]) by SN6PR04MB4925.namprd04.prod.outlook.com
 ([fe80::6d99:14d9:3fa:f530%6]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 06:32:15 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [PATCH 0/3] (Qualcomm) UFS device reset support
Thread-Topic: [PATCH 0/3] (Qualcomm) UFS device reset support
Thread-Index: AQHVGqYAlQFsNx0blUeatbYnjFKLiqaMDImAgACCvoCAAAPGAIAAOZnggAD+y4CAAGBH8A==
Date:   Thu, 6 Jun 2019 06:32:15 +0000
Message-ID: <SN6PR04MB49255AF3D92E655E1BBD75AEFC170@SN6PR04MB4925.namprd04.prod.outlook.com>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <CANcMJZBmgWMZu7Y53Lnx_x3L2UpCmEbFRHVW0SFCXfW=Yw9uYg@mail.gmail.com>
 <SN6PR04MB4925530F216E86F6404FE14CFC160@SN6PR04MB4925.namprd04.prod.outlook.com>
 <20190605060154.GJ22737@tuxbook-pro>
 <SN6PR04MB492521B7D2DB6F3462EDB7D9FC160@SN6PR04MB4925.namprd04.prod.outlook.com>
 <20190606003959.GM4814@minitux>
In-Reply-To: <20190606003959.GM4814@minitux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0278664b-7e2d-414f-12bf-08d6ea48b7a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN6PR04MB4349;
x-ms-traffictypediagnostic: SN6PR04MB4349:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <SN6PR04MB434991222811C9904BDF96EAFC170@SN6PR04MB4349.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(376002)(346002)(136003)(189003)(199004)(66066001)(53936002)(6436002)(9686003)(14454004)(52536014)(8936002)(478600001)(2906002)(33656002)(6916009)(68736007)(7696005)(81166006)(55016002)(81156014)(54906003)(72206003)(74316002)(229853002)(99286004)(6116002)(102836004)(3846002)(76176011)(8676002)(7736002)(7416002)(186003)(6506007)(25786009)(71200400001)(71190400001)(446003)(476003)(486006)(4326008)(11346002)(73956011)(66946007)(256004)(14444005)(66556008)(66446008)(64756008)(6246003)(53546011)(66476007)(26005)(86362001)(305945005)(76116006)(316002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4349;H:SN6PR04MB4925.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1ZURo+fkpKIoPJNpnvlFsYOiygUhixpJm98K/Bd/0WIVClv6E2gBKAWSo4F/VWmo4fjgT5d5ZHCOLTCnZF5EgELRS6SYl1oKDiBQYxK5QjWZfzE++HFEfTJt2ZyiT1QU0wKHSpNoQLyjHOFaD3Wzbr5Sx66ICUOaok2oeF7MhJqArygdoCO1p8iSK7FmYW7u3jefXqLlhYUQFaMzPmeY1QgUlQxcffq+CuLVJ4XAYFOJi5ZdI6DbGv+L6se5ldz3DfGkHt2FfRHZON+GdWv/9TC5a72rtoWfwPGlyfJCeL/6P1nqKIaO8kIjYoWGRByUsriLWlnCBk67EeGmK9cya5Z/rOSw0ODsQoAwTRrmEHSBCgiuZBNW4NyxoXRMepayATF+5K0cgdNQFq0XGXt1c45we1bVrut4LPAu6pPscn4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0278664b-7e2d-414f-12bf-08d6ea48b7a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 06:32:15.8083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Avri.Altman@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4349
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>=20
> On Wed 05 Jun 02:32 PDT 2019, Avri Altman wrote:
>=20
> > >
> > > On Tue 04 Jun 22:50 PDT 2019, Avri Altman wrote:
> > >
> > > > Hi,
> > > >
> > > > >
> > > > > On Tue, Jun 4, 2019 at 12:22 AM Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > > >
> > > > > > This series exposes the ufs_reset line as a gpio, adds support =
for ufshcd
> to
> > > > > > acquire and toggle this and then adds this to SDM845 MTP.
> > > > > >
> > > > > > Bjorn Andersson (3):
> > > > > >   pinctrl: qcom: sdm845: Expose ufs_reset as gpio
> > > > > >   scsi: ufs: Allow resetting the UFS device
> > > > > >   arm64: dts: qcom: sdm845-mtp: Specify UFS device-reset GPIO
> > > > >
> > > > > Adding similar change as in sdm845-mtp to the not yet upstream
> > > > > blueline dts, I validated this allows my micron UFS pixel3 to boo=
t.
> > > > >
> > > > > Tested-by: John Stultz <john.stultz@linaro.org>
> > > > Maybe ufs_hba_variant_ops would be the proper place to add this?
> > > >
> > >
> > > Are you saying that these memories only need a reset when they are
> > > paired with the Qualcomm host controller?
> > ufs_hba_variant_ops is for vendors to implement their own vops,
> > and as you can see, many of them do.
> > Adding hw_reset to that template seems like the proper way
> > to do what you are doing.
> >
>=20
> Right, but the vops is operations related to the UFS controller, this
> property relates to the memory connected.
This is not entirely accurate. Those are vendor/board specific,
As the original commit log indicates:
" vendor/board specific and hence determined with
 the help of compatible property in device tree."

I would rather have this new vop:
void    (*device_reset)(struct ufs_hba *), Or whatever,=20
actively set in ufs_hba_variant_ops, rather than ufshcd_init_device_reset
failing as part of the default init flow.

Thanks,
Avri

>=20
> E.g I have a Hynix memory and John have a Micron memory that needs this
> reset and my assumption is that these memories will need their RESET pin
> toggled regardless of which controller they are connected to.
>=20
> Regards,
> Bjorn
