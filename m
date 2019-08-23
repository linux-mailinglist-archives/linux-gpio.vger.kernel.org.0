Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6949B9AB31
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 11:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfHWJOA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 05:14:00 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:31796 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfHWJOA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 05:14:00 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Nicolas.Ferre@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Nicolas.Ferre@microchip.com";
  x-sender="Nicolas.Ferre@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Nicolas.Ferre@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Nicolas.Ferre@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: cNqvVtt9a3IDeqOscB8kEVPfUd32aq023tmhdicUVbdb+KvxdLvb+EqCtmMRreIYRIi+p0jJX+
 50Ym5+FqhNLBnhxZeE/6zt5Czp2rqN0VWFBjJSXmjDz4PFPKs3ZRjrytc/qiB3BSOzlZRh7nhI
 esNictdDGjkj0EUQATj3ttgqs1MDunv1uw5D334EMOamyqGV5RJC9KoqlXI0B09CoJnn7Hj6Ph
 vBcNA6gt8fmVejW0L1jsY6O/tx3wMFI/xoZoBrauW1rqdOXRkO9kk1kPlEXh/I3IKNJTXv+4N6
 FM4=
X-IronPort-AV: E=Sophos;i="5.64,420,1559545200"; 
   d="scan'208";a="46273240"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Aug 2019 02:13:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 02:13:58 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 23 Aug 2019 02:13:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrdbAv9EtE1fDJiFTNFI5EljBHUP1X42It2ORpbl6EILE1ScEGsKdDAK6U3Tdo/4l4FkaU3YFYJwCnKQGcwYfufifbWvXTESIKWL4T346Su6iEjn3m3WOQKG47q85n0u1lOZ8/OA3dxA2jTuomamVV9B38fbLT79WhPfsfY/zxtX/UWpYxWsTp3nd38Q1xXFXN5xEnjPZCzlAzGbIY1ZDhuTAocusUGrBhUnWci8CKuI4dO8C9PSCQfgYikTKtutAW9uVCl/B7OvaEPxoGAPVrckHVsuB9ij7I1VLX2reN+5De/cuJWJo1e36ojUirsR/F649sn6aYiCLHVgCF27Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcf7zRSxm5W2Bk6tPrmrK65rz9pk1nI9QZjjnnZKrXQ=;
 b=hHWeSDOiwXrGkHLja59IHnePhXR46uIbIm3qcr7nNVzAwW1WRXG2gfnf7D+I4YWArj4bwmPuFMBDncTpPSEvqK/UTR7yONbBGTZh/+ruNZ3+FGddP7Sx6Ofkk3zRqB+BXlM9EN60Wy55a+GDfjvPSL3w+2XWGfjvBE+APYxdLyW6tTtX3gqemAx3Y9gTtX1h5rNij117R0mJh2nEJX3chOEFgE3NvwR/j1+/pzSgR60452MCWSN+20AWj+OSCnXibuIlO64nbEELUelbRIL3sCbJNLd7/tmWvQmOVVxxmxOSnXamCK9yNZgJkixtzMqZeXZp/6ozr49ssXh8Hy4Xrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcf7zRSxm5W2Bk6tPrmrK65rz9pk1nI9QZjjnnZKrXQ=;
 b=Hk7FYPxFtjI+UqxHDYiBSXdNP1hABbUNY7s+Tt06SV+TxgaHi+3M+LjCRw1ajQWmkuy5j/hBdvqr77Kq0ShEpkEAfW5kBuwKQ8bq2IzXUY8t0j4L5ZBb6HSWuswz2hauW1HWUeQpDnZinhKnDIi7lrvvAaM0Ao537nyv2rhpA74=
Received: from MWHPR11MB1662.namprd11.prod.outlook.com (10.172.55.15) by
 MWHPR11MB1437.namprd11.prod.outlook.com (10.172.53.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 09:13:57 +0000
Received: from MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::410a:9d4b:b1df:2134]) by MWHPR11MB1662.namprd11.prod.outlook.com
 ([fe80::410a:9d4b:b1df:2134%12]) with mapi id 15.20.2178.020; Fri, 23 Aug
 2019 09:13:57 +0000
From:   <Nicolas.Ferre@microchip.com>
To:     <sebastian.duda@fau.de>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <lukas.bulwahn@gmail.com>,
        <Ludovic.Desroches@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: Re: Status of Subsystems - MICROCHIP SAMA5D2-COMPATIBLE PIOBU GPIO
Thread-Topic: Status of Subsystems - MICROCHIP SAMA5D2-COMPATIBLE PIOBU GPIO
Thread-Index: AQHVWZMXcPl+3nOggkK/p91ZWTeY5Q==
Date:   Fri, 23 Aug 2019 09:13:57 +0000
Message-ID: <f73f5db7-edcd-f579-ec2a-e42bf92c044d@microchip.com>
References: <d2bdb45a-3571-5989-8278-6f5c7d9839f2@fau.de>
In-Reply-To: <d2bdb45a-3571-5989-8278-6f5c7d9839f2@fau.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::22) To MWHPR11MB1662.namprd11.prod.outlook.com
 (2603:10b6:301:e::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 667b0b06-8074-4a6f-f53f-08d727aa3a1d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR11MB1437;
x-ms-traffictypediagnostic: MWHPR11MB1437:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1437A7C30B9EA9B37EE595E2E0A40@MWHPR11MB1437.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(366004)(199004)(45074003)(189003)(81156014)(8676002)(5660300002)(36756003)(86362001)(6512007)(76176011)(25786009)(966005)(6436002)(6306002)(52116002)(64756008)(8936002)(66476007)(66446008)(66066001)(66556008)(3846002)(2906002)(6116002)(66946007)(7736002)(4326008)(478600001)(186003)(14454004)(31696002)(2616005)(476003)(316002)(4744005)(446003)(11346002)(256004)(54906003)(53936002)(6246003)(26005)(6506007)(6916009)(386003)(99286004)(53546011)(102836004)(229853002)(6486002)(81166006)(71190400001)(71200400001)(486006)(31686004)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB1437;H:MWHPR11MB1662.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wSzHt9mvaJnHyjhCgsjoww6rtwrpvGbULz/CuIYQHjNm2VCWuwxvCNeNiXOfo7oKO8qNWibuLZDQIO5z+DavCZWJrmnqXIaCqkVyyPy546H9NNgs6e5wBS2eWV1EdoHKIDIMhGak63IqoeEN4C57mGE4dfo8BahH0h1QxmwCdLwFjSm9cNWbS8J9KBXdtLB4lC8BCopZ+g7+R0FYzAEpzzGaxwcxKNLNPaneKpC2bYnQrfoQCIb260Vlt8YtZTMqqsbGwieZTO13GGhpklqyV1eYcdtlkB8VOZqE08wUySgEc75hHYQU4UKNqd27g8v79aVCxjuRkneYqx9b1KkJ/NQK0UJZMOcAszZLqM5yB0+ReOyyiIf43JFSjNTBFhXoJGrnFTkCK4qvz2EkyTaSg9BmZkdckbetkrvHQ18VN3A=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <23C79482857EE14793949EFCB96DAB9D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 667b0b06-8074-4a6f-f53f-08d727aa3a1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 09:13:57.0489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWjjOFHtWA16+i+rhNJvFVPEf3MZG4srPjHietVoKE0eYTJHdNR2L8nVu4qyyRnuElJB/+HSbO2NmtMLZh/A7CTxMsAgrMNzkAcaGOSWmjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1437
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sebastian,

On 20/08/2019 at 15:27, Sebastian Duda wrote:
> Hello Andrei,
>=20
> in my master thesis, I'm using the association of subsystems to
> maintainers/reviewers and its status given in the MAINTAINERS file.
> During the research I noticed that there are several subsystems without
> a status in the maintainers file. One of them is the subsystem
> `MICROCHIP SAMA5D2-COMPATIBLE PIOBU GPIO` where you're mentioned as
> maintainer.
>=20
> Is it intended not to mention a status for your subsystems?
> What is the current status of your subsystem?

I've just removed this entry and merged it with other gpio/pinctrl=20
driver's entry:
https://lore.kernel.org/linux-arm-kernel/20190823083158.2649-1-nicolas.ferr=
e@microchip.com/

Best regards,
--=20
Nicolas Ferre
