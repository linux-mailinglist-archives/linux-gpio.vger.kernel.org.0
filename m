Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5795136C5C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2019 08:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbfFFGga (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jun 2019 02:36:30 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:12850 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFGga (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jun 2019 02:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1559803027; x=1591339027;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GROh4qCTdCjDOeNTyHdfWCyNWpdwRCHJ5JXYERWlgu0=;
  b=LcmEO5ccA5R3PSpAdvlFBX9D2Rl46oBQQBrXh17CJIgev0B9pPavXGo0
   tBGbmgFz8CAvjZuqhX0VLnhFmUjobZHV6cM1n+/lUHjugGnODX3cgcudw
   6owL02qnvaAk0pAn5LIbVaLzgzZYsgtlUzQZP/Hca/HnJT9OuMbIafd5B
   tBVWtFO4by7q209gB7JbPUrG5puAD7KmQUFOsJq0/n8XJcEHU1xiTJ3/3
   ECAJbQ6l/Ara4fOSmJNi92FzhvgZIByFvGBib9HU9+uv0IoDSN7KOSnoF
   V+ZscA37J1Ll4TxucJv2pz9gOMAeQmkKNQZtk3PWu8Qg8gMvsB4DCpRa/
   w==;
X-IronPort-AV: E=Sophos;i="5.63,558,1557158400"; 
   d="scan'208";a="209549030"
Received: from mail-dm3nam03lp2051.outbound.protection.outlook.com (HELO NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.51])
  by ob1.hgst.iphmx.com with ESMTP; 06 Jun 2019 14:37:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdhSAoDoPtdHbdxwUQZniSOsm6I76sfh9IxmQMqTqks=;
 b=r85ctanC0fsTOgTMTSpXJQeucLOZXrTbELDDxPuNqbha/lpON5SeAUkdliMS2/TiDpilTRrdLy5eE17SFFhymJljpvIVaLoThnm1777p6y8tvW70XnBxHwvqiODJbqk0aKFfOAS+91ySGcU+qXrjzgYB2BMee7KmAI/8e4YTtU8=
Received: from SN6PR04MB4925.namprd04.prod.outlook.com (52.135.114.82) by
 SN6PR04MB4158.namprd04.prod.outlook.com (52.135.71.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.21; Thu, 6 Jun 2019 06:36:22 +0000
Received: from SN6PR04MB4925.namprd04.prod.outlook.com
 ([fe80::6d99:14d9:3fa:f530]) by SN6PR04MB4925.namprd04.prod.outlook.com
 ([fe80::6d99:14d9:3fa:f530%6]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 06:36:22 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] scsi: ufs: Allow resetting the UFS device
Thread-Topic: [PATCH v2 2/3] scsi: ufs: Allow resetting the UFS device
Thread-Index: AQHVHAOW/gPfCB+BCUqDoLF2sKUkJqaOK2sA
Date:   Thu, 6 Jun 2019 06:36:22 +0000
Message-ID: <SN6PR04MB4925FC3F1001326AA218DF21FC170@SN6PR04MB4925.namprd04.prod.outlook.com>
References: <20190606010249.3538-1-bjorn.andersson@linaro.org>
 <20190606010249.3538-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190606010249.3538-3-bjorn.andersson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41b35a9c-4567-4f04-99d2-08d6ea494a7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:SN6PR04MB4158;
x-ms-traffictypediagnostic: SN6PR04MB4158:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <SN6PR04MB4158EF452179F86E542F9400FC170@SN6PR04MB4158.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(346002)(396003)(376002)(366004)(189003)(199004)(73956011)(76116006)(66446008)(66556008)(64756008)(66476007)(86362001)(66946007)(99286004)(14454004)(7416002)(74316002)(5660300002)(4326008)(6246003)(478600001)(68736007)(52536014)(256004)(102836004)(72206003)(305945005)(25786009)(71190400001)(71200400001)(7696005)(4744005)(6506007)(66066001)(53936002)(76176011)(186003)(2906002)(8676002)(81156014)(81166006)(8936002)(26005)(3846002)(55016002)(486006)(9686003)(110136005)(54906003)(6116002)(33656002)(7736002)(316002)(476003)(446003)(11346002)(6436002)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR04MB4158;H:SN6PR04MB4925.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O5fXCumXJe8xh/1Hp2CY2EBrpkx9FbkYVpUAE8hwX2oD97nmXB9OQQ0b2zUuSuc0Y74A4G7oDbiORHOKwzTvoJQBNdWu0fqHv/EJuCj1GxdCyBQ7Et4lq6ky9OSZMrO2NZBO39uc22jBHDaQ3LV8lgDeTwiwOVFCvj86kSEJHKY0OjHwDblXP1KDw72uW0lVZoEz3fq+SZLRFeXxcEm0fCIzAY8oKEMBvpUuNKUIX4HHTkMohViLzpa33wd8OlpA6cJJFFZeGKsLc8wO3nJ2clndAtDjhnoBxcIWVDwkR/3woM1l05coO5GOBjaIPZWgp+Tb3OK0llWSyV+fNLjJvQ64bKg/WK8VVRDjUZc1ZS4Xz2oofqjvqSgJZcWjM8DmF1dvi4VXj7cwVEMqzSSUxU0NtajthYpOGAPhpCX9GPw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b35a9c-4567-4f04-99d2-08d6ea494a7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 06:36:22.1322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Avri.Altman@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4158
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


>  static int ufshcd_hba_init(struct ufs_hba *hba)
>  {
>  	int err;
> @@ -7425,9 +7460,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
>  	if (err)
>  		goto out_disable_vreg;
>=20
> +	err =3D ufshcd_init_device_reset(hba);
> +	if (err)
> +		goto out_disable_variant;
> +
>  	hba->is_powered =3D true;
>  	goto out;
>=20
> +out_disable_variant:
> +	ufshcd_vops_setup_regulators(hba, false);
Is this necessary?
ufshcd_vops_setup_regulators() was just called as part of ufshcd_variant_hb=
a_init

Thanks,
Avri
