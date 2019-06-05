Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1FB359B4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 11:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfFEJch (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 05:32:37 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42221 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfFEJcg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 05:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1559727155; x=1591263155;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S49ZGvfsCAGzg2w+MHzrtpp8i/bDvCsOhxlrQNWnA/I=;
  b=EDEDrpkjHtJFixb21VPMv2InI2x3CRn31D9Lv+SFj84/uWaGTgO+R3yt
   u4x8RwzWlZcRy/BXsfW//KS8R7icL8ALrRBp7Ab50aQaUil9ULWbTI7S2
   5k3jF4SKVjyAE9NmXH1XkqODTNOYBXDMuBt3avTUdXNNKsH+B1oh58t2A
   FNA3e4maIv+oMaoeSn3U03IqyLs/O0Vm/CIbTogaZ1G57GqATw7e1TSS6
   VvhgcrNNCNRMBCwUFQeGu1J9OnbBK606hJIcGMOOQAVVjP4nGwRoxisfn
   qFOtFGekQZucZPU8kDRMg8eS89NaTszoVA+U70CFNoBNKoXhKtoETSo/L
   w==;
X-IronPort-AV: E=Sophos;i="5.60,550,1549900800"; 
   d="scan'208";a="216132224"
Received: from mail-sn1nam01lp2054.outbound.protection.outlook.com (HELO NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.54])
  by ob1.hgst.iphmx.com with ESMTP; 05 Jun 2019 17:32:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEUrWHG8922XedlBsx6DMByA3HjDnspJK8W4joX3FxY=;
 b=mn+uNOg1BWvWoUziHR2uf9Al8auprUPi+CAHCMvLzHGxH5ywH0/mVbs6lRq35fKf/i9HC6qnhPpSCKDTIjjXxnSlf+SjsNQMSF3msyHxp6J7FHAoiIMnszaG2hxkim9WWc0ZjIusIaPAOD64C0cxK2oAgvepBN7ZrvaMt+orRXc=
Received: from SN6PR04MB4925.namprd04.prod.outlook.com (52.135.114.82) by
 SN6PR04MB4207.namprd04.prod.outlook.com (52.135.71.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 09:32:32 +0000
Received: from SN6PR04MB4925.namprd04.prod.outlook.com
 ([fe80::6d99:14d9:3fa:f530]) by SN6PR04MB4925.namprd04.prod.outlook.com
 ([fe80::6d99:14d9:3fa:f530%6]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 09:32:32 +0000
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
Thread-Index: AQHVGqYAlQFsNx0blUeatbYnjFKLiqaMDImAgACCvoCAAAPGAIAAOZng
Date:   Wed, 5 Jun 2019 09:32:32 +0000
Message-ID: <SN6PR04MB492521B7D2DB6F3462EDB7D9FC160@SN6PR04MB4925.namprd04.prod.outlook.com>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <CANcMJZBmgWMZu7Y53Lnx_x3L2UpCmEbFRHVW0SFCXfW=Yw9uYg@mail.gmail.com>
 <SN6PR04MB4925530F216E86F6404FE14CFC160@SN6PR04MB4925.namprd04.prod.outlook.com>
 <20190605060154.GJ22737@tuxbook-pro>
In-Reply-To: <20190605060154.GJ22737@tuxbook-pro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7aafd65c-ff12-49ab-493c-08d6e998bc83
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:SN6PR04MB4207;
x-ms-traffictypediagnostic: SN6PR04MB4207:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <SN6PR04MB4207B2ACBAB61DAF6543CCEBFC160@SN6PR04MB4207.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(396003)(366004)(346002)(39860400002)(189003)(199004)(11346002)(446003)(71200400001)(7416002)(71190400001)(305945005)(66476007)(73956011)(66446008)(64756008)(476003)(66556008)(9686003)(66946007)(76116006)(25786009)(6436002)(486006)(33656002)(186003)(256004)(74316002)(6246003)(81156014)(2906002)(8936002)(26005)(14454004)(81166006)(7736002)(8676002)(54906003)(52536014)(14444005)(86362001)(53936002)(7696005)(6506007)(76176011)(5660300002)(53546011)(66066001)(55016002)(68736007)(4326008)(229853002)(72206003)(478600001)(316002)(3846002)(6116002)(102836004)(6916009)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4207;H:SN6PR04MB4925.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h8LDwK5Ny093YImRAW46u2TjaG5YvBWArvn0zDMyBGu0y6hSobMv44WdK5MZeFdW519pCCIPkmj0+aXtV1PPRCZQwTGjXLpjUTzDbdcfFVl2uC35nrsxHSoqgS8kEeQ9pZ6KJZS+9NxK+bV1lbKq2gAu/L755vRIx81pedn1CLI7TLJYTPU5lY9U40GT/Gfb0hwrBnCcevp8O0ggV04OYzRHfYG8U9n2Muvpad6gKrO7BB+4TSZijzS8LfCvjSLTrnrjpwOwew8nHioQoeSO628scn3Z9sMWmEISQbJa5DEVrS+Wd9ygXqbQ6Sm4qJyOgsnVIkHHxpjRZAzXmNKXW7UV2X+gFWJf3nTFsJj5clGhoacdxSi9wxZ2ts8sUX9y1Cxet8cPjsmOrPaaFhtUTVRTQ9WsTwu4s9fyEMy1Xi4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aafd65c-ff12-49ab-493c-08d6e998bc83
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 09:32:32.5156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Avri.Altman@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4207
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>=20
> On Tue 04 Jun 22:50 PDT 2019, Avri Altman wrote:
>=20
> > Hi,
> >
> > >
> > > On Tue, Jun 4, 2019 at 12:22 AM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > This series exposes the ufs_reset line as a gpio, adds support for =
ufshcd to
> > > > acquire and toggle this and then adds this to SDM845 MTP.
> > > >
> > > > Bjorn Andersson (3):
> > > >   pinctrl: qcom: sdm845: Expose ufs_reset as gpio
> > > >   scsi: ufs: Allow resetting the UFS device
> > > >   arm64: dts: qcom: sdm845-mtp: Specify UFS device-reset GPIO
> > >
> > > Adding similar change as in sdm845-mtp to the not yet upstream
> > > blueline dts, I validated this allows my micron UFS pixel3 to boot.
> > >
> > > Tested-by: John Stultz <john.stultz@linaro.org>
> > Maybe ufs_hba_variant_ops would be the proper place to add this?
> >
>=20
> Are you saying that these memories only need a reset when they are
> paired with the Qualcomm host controller?
ufs_hba_variant_ops is for vendors to implement their own vops,
and as you can see, many of them do.
Adding hw_reset to that template seems like the proper way
to do what you are doing.

Thanks,
Avri
>=20
> The way it's implemented it here is that the device-reset GPIO is
> optional and only if you specify it we'll toggle the reset. So if your
> board design has a UFS memory that requires a reset pulse during
> initialization you specify this, regardless of which vendor your SoC
> comes from.
>=20
> Regards,
> Bjorn
