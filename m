Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF04ABE84
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 19:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405967AbfIFRQb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 13:16:31 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:53818 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404253AbfIFRQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 13:16:31 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 72E4AC0E6E;
        Fri,  6 Sep 2019 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1567790190; bh=kWI9VgqhXX+/hmGmLXK/piySnsf9ewxhsNjI3CkoVM0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=V/cjasBtprSQtjbsMIKtqtHM9zlANNbrfEmzgU3MxcU0ri0/fRMNWklqdDSDsjqZJ
         58DgzERdQC0zuLN7y9YA9mptYWoKJ3B2pIVxE4Q9ckrsImrO8DZXdvez0K0YA1wF7Z
         SeuFy/3gRqFbUJ3j1mnd64rtRvAGA0kvB7nvaN+H181LlFBl7VJZqQAWYw0zj+/47V
         rDc+Ud3H4fPIu2w7UmDDfU9oSA+LMX8Q/v5L0nknqS9YSIeiL15kIVj4WTe3clUsC2
         gzPQ47u0QON0QC8zAAM+aZAyl1F6r063pgTAwmD/Oe+Aeo3uJGHg1dy+ddpenF9vFL
         hsZn5wrlAXzpw==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6FB6BA0097;
        Fri,  6 Sep 2019 17:16:29 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Sep 2019 10:16:28 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Sep 2019 10:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRdz0EPfuJwHBgMioUz8ZiKqGXMui6aDBebCC+7P8Pb+FaiavfAwvu8uzcL8PelIB9IMz2bC8UgcemqkjMngdqVTj7AEuwpqH1Fz39U3HrkgiaxXLCY1aLVlhNUzufyyAE1fInimaJvjN3NqKqsvwoDSo92uH8Gn3RoiDz3Y7hBPxWlrm4UZOulb3gh3lqGKK0wCtcm+3tM93j7IO+0gM8fnejNmVpMpdjcw5PEuquprX3g9S6yhCtTlNTDCHWwTx6YAUEGK//Yr5qG15PWqhBsZTbUBUhwO62dNkooHeE5Fep9XZEc4VsdJyD/PrMg9qJmszOEElVQtFV9dVXtxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddpjCxsYQiS8uaEMuGq1luFTm+nMKX2prvN5BkznKQo=;
 b=oIO+0BJ5ObSoXPikhV+FxPZLnddBLgI86kUZQhEAOxOTq/Sr6WwtCa03DATDQ58ZIpm6ba96VFAu2E8yPxzufQoJwBvEUs/uNE0LxiTyOtrOoJn+JEMT9Z3EAjyeQbhKeE8JcKaNqx19ng58OZbpZ5HGymOsyA7WU+DMVqvQQBS2x+wVRGBFP22CKj6aRIZi14wegpUh5Lr7mdT0j1m9OT2wXpCOURuO+rVYY7Y4IqeQrQBqbdeizW+PDpIYa7FHOca+i1G/xeuESXcBoypH47stmhhPPZEIihvseI/t8yOVzoV1M9iqz1O45BQiMW9CGglGtdlTeUPN8hCxX+cQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddpjCxsYQiS8uaEMuGq1luFTm+nMKX2prvN5BkznKQo=;
 b=Fbu0xjgiCnbke3VjHdOyTLEMQ9plL/svviZDprJd58iNnmwJPdUnBOHP8ZExxMugVGSZCNRK2guPgDj6jr6mTPX7dh2NJIdagnJ+qWsbKn3FOgFQa+Mq5NGEGlUU/Mx97L+HJwKAIwjHAqmMMC28UMfXU/Lkg8YDyvYfdu2a8tc=
Received: from BY5PR12MB4034.namprd12.prod.outlook.com (52.135.53.73) by
 BY5PR12MB4116.namprd12.prod.outlook.com (10.255.126.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Fri, 6 Sep 2019 17:16:27 +0000
Received: from BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::a586:3851:b734:476]) by BY5PR12MB4034.namprd12.prod.outlook.com
 ([fe80::a586:3851:b734:476%2]) with mapi id 15.20.2241.014; Fri, 6 Sep 2019
 17:16:27 +0000
From:   Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To:     YueHaibing <yuehaibing@huawei.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] gpio: creg-snps: use
 devm_platform_ioremap_resource() to simplify code
Thread-Topic: [PATCH -next] gpio: creg-snps: use
 devm_platform_ioremap_resource() to simplify code
Thread-Index: AQHVZLnZrjliSypkrkeFuMimSB9ye6ce42L/
Date:   Fri, 6 Sep 2019 17:16:27 +0000
Message-ID: <BY5PR12MB4034937150040335D9C68FF9DEBA0@BY5PR12MB4034.namprd12.prod.outlook.com>
References: <20190906131032.22148-1-yuehaibing@huawei.com>
In-Reply-To: <20190906131032.22148-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22c4ee1e-228b-43c1-32ee-08d732edf3b7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BY5PR12MB4116;
x-ms-traffictypediagnostic: BY5PR12MB4116:
x-microsoft-antispam-prvs: <BY5PR12MB41160F9640E38B574A91A7D6DEBA0@BY5PR12MB4116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39850400004)(346002)(396003)(136003)(376002)(199004)(189003)(66556008)(6436002)(316002)(6116002)(3846002)(66946007)(64756008)(66446008)(2906002)(7696005)(66476007)(110136005)(54906003)(76116006)(91956017)(6246003)(66066001)(4326008)(229853002)(26005)(14454004)(55016002)(9686003)(102836004)(53546011)(53936002)(6506007)(76176011)(25786009)(186003)(446003)(8936002)(81166006)(81156014)(8676002)(11346002)(2501003)(486006)(476003)(478600001)(256004)(86362001)(2201001)(71200400001)(71190400001)(52536014)(5660300002)(99286004)(305945005)(7736002)(74316002)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:BY5PR12MB4116;H:BY5PR12MB4034.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7LRpQWD6v0TxLJmXi922dKqzJhAN8wDaX+Nllh5dZy28Aut4aRtLkJ3cU3AlvAz0vuLJqYA7mg+4zYxfjowp0Ln977WIH3h3AIx2pbvHB30zNUezCe68QEvFvBNXu9B9nKB3aCTbvKndrUzhBIHejUB4TrR3Hk6UewARce9M/GvQYOQZ2dNSL929hJr+cQcWAAQF2ByIeRGb2F/e73dESKNXF5jBOgf9VddvcpX885dh4kdsh2tIlRXtO8R6uAuEBsQJ0r3fhSy5/Mp+k+vtQSESKpsT6FuZ1xbVzfT698u6s0KpicW23PR3B+MonHioPnB9Z8pBHCQLedz+p8CiQQeayPNZbXpvwxXntIcRQdZTHx/vYkRmfkX3LpYVS1PO9fwriUn+3+0yoLDneXRFA+44WaUZOWv4w8uq1hOGq2g=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c4ee1e-228b-43c1-32ee-08d732edf3b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 17:16:27.2581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcnsXXKlddpRRofVIjEdnX9XOLyrByO3qtGwfiqq813dRdyuS9anb9NBf6VZSae1d362ya09lvPpwIsoZEsunA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
X-OriginatorOrg: synopsys.com
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi YueHaibing,=0A=
=0A=
thanks,=0A=
Acked-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>=0A=
=0A=
---=0A=
 Eugeniy Paltsev=0A=
=0A=
=0A=
________________________________________=0A=
From: YueHaibing <yuehaibing@huawei.com>=0A=
Sent: Friday, September 6, 2019 16:10=0A=
To: Eugeniy.Paltsev@synopsys.com; linus.walleij@linaro.org; bgolaszewski@ba=
ylibre.com=0A=
Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-janito=
rs@vger.kernel.org; YueHaibing=0A=
Subject: [PATCH -next] gpio: creg-snps: use devm_platform_ioremap_resource(=
) to simplify code=0A=
=0A=
Use devm_platform_ioremap_resource() to simplify the code a bit.=0A=
This is detected by coccinelle.=0A=
=0A=
Signed-off-by: YueHaibing <yuehaibing@huawei.com>=0A=
---=0A=
 drivers/gpio/gpio-creg-snps.c | 4 +---=0A=
 1 file changed, 1 insertion(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c=
=0A=
index 8cbc94d..ff19a8a 100644=0A=
--- a/drivers/gpio/gpio-creg-snps.c=0A=
+++ b/drivers/gpio/gpio-creg-snps.c=0A=
@@ -137,7 +137,6 @@ static int creg_gpio_probe(struct platform_device *pdev=
)=0A=
        const struct of_device_id *match;=0A=
        struct device *dev =3D &pdev->dev;=0A=
        struct creg_gpio *hcg;=0A=
-       struct resource *mem;=0A=
        u32 ngpios;=0A=
        int ret;=0A=
=0A=
@@ -145,8 +144,7 @@ static int creg_gpio_probe(struct platform_device *pdev=
)=0A=
        if (!hcg)=0A=
                return -ENOMEM;=0A=
=0A=
-       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=0A=
-       hcg->regs =3D devm_ioremap_resource(dev, mem);=0A=
+       hcg->regs =3D devm_platform_ioremap_resource(pdev, 0);=0A=
        if (IS_ERR(hcg->regs))=0A=
                return PTR_ERR(hcg->regs);=0A=
=0A=
--=0A=
2.7.4=0A=
=0A=
=0A=
