Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6A9B4A999C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Feb 2022 14:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245006AbiBDNC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Feb 2022 08:02:29 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:11842 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244168AbiBDNC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Feb 2022 08:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1643979748; x=1675515748;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=qwUfhbqcsQ1O5K86JZSYXV+Txe+uDqnAEtxaNOX1CaA=;
  b=ZDbbnUqpFohS11+dYGEXBXTSZYt3EFdRCHScQjXgtGV8RnAXEeexcxl6
   /ZqCPY+ldBW6b/YFy5f6tt2fVjOVqc7vj8aH477eh+ndGEPcdwVi8dwKT
   3Cf4aku43RQ6L1HI0wxYpOHOCB337j8YKu2ztv6cIn4JpY59P0xNNuIBY
   GsouIo8ncGrr8CItBdhz5KxGtjL4shYpACAwp0Qq0jpn6dYhUamlDOQzW
   wd8evmUK2uODr5uT13Th9kKKwQrYvX0rtWZIwCcYFvN52JWK/9SYX84s2
   Ts9AEZ5fdRibtXiA4D0id2WQMvQop3nFa9HJEJRN+onRBjeQzyM5kvDf9
   A==;
X-IronPort-AV: E=Sophos;i="5.88,342,1635177600"; 
   d="scan'208";a="192164282"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
  by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2022 21:02:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmB/oF/BMk+bgGiNy+CLIKL+Ihl2UURowD+6Jm3Tywdm4k7LatHwJbkhfxUcfSjvKyCPHfZOCPHoO+pQXDFnIEBY3ds/GSPy6mpMA8q96f1CT3G9srq8aUj3+wtISb4saREpwVChF0TCbcyle24KGRXGQn1ThgfC1xsz5oKR8b8nMByPlbccbeY/G1BX5DwFCOuhfp7ncZuievKa+dJl8PFcM+y/xt23VVyxDar04lygjn210hQ+qG/AKtGxL2+JKaYTwbobb25o5bVb8Yt7KM2G/pIimYuzRNJrftdxoalw4Xtkc/rvAGRrrEqKZKG4HGXYdy9QTuES6omFaYPj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkT8oww68rrqWdksI7v9mk9ibe+GR8twWWSdb3UjkFg=;
 b=L62np3/2yyKXNYgg7xe0/vQUqOuU/38JV4aHVU9x+JrpPskGbxsCdEgdkd5fDcH+X7E2+v4U/TPAiL/Zd+i+JIrQ7Gq9Vrr5QlciMSUxdsFWFL0UsXx8r5iaBWvD0ZgPbrrNf1rzwu5QT/HZfaSB29tIveoUE+z1AL8Ifi4zl2GooA3OE/hteDIEJQztB1tUrv00olKVqR7boiMEdo64OZbRKYQatxxjvz9hE/y6c/a5tM6aHai4Dr5NFj9VTA92x16yBgj0kgDmdbcAeBkStMO9+byX3JzvAxQvNpGxeQ1lPMEbM5yBt8LmEPFy10nznuWzNz1oYJZRTm4LHyg+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkT8oww68rrqWdksI7v9mk9ibe+GR8twWWSdb3UjkFg=;
 b=hjqbYc7As4GOFGsonCei/niJxxLIUG4Yt9ZC7hB74eGNMNMGw+Dghfopq5YXB0L1IlTbGc95qJE9nZttlxGJHMKY9cwA125Ownh/aiuH5uyulixsDQIph021rSyK31ew+3z931BQg2yuqxLyrXOfbOVcBhAXuPbaDv4qb8kNTQc=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by BYAPR04MB5671.namprd04.prod.outlook.com (2603:10b6:a03:10a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 13:02:26 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::ad7c:72b0:de53:f5d2]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::ad7c:72b0:de53:f5d2%8]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 13:02:26 +0000
From:   Niklas Cassel <Niklas.Cassel@wdc.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
CC:     "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
        Niklas Cassel <Niklas.Cassel@wdc.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: [PATCH] gpio: sifive: use the correct register to read output values
Thread-Topic: [PATCH] gpio: sifive: use the correct register to read output
 values
Thread-Index: AQHYGcd1jDKOa8jQ/0eC1rqOXQQztQ==
Date:   Fri, 4 Feb 2022 13:02:25 +0000
Message-ID: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cadccd56-f5e1-4f8b-e8a7-08d9e7de979a
x-ms-traffictypediagnostic: BYAPR04MB5671:EE_
x-microsoft-antispam-prvs: <BYAPR04MB5671ED05D354B2D62D84143BF2299@BYAPR04MB5671.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0/tLg5QYamAprzirLtcyBoKsbH4JfAMONYEsAT0/5bkZaK4PZ7YuWgvVstIAovEVQIl8Dfede6Fqu05fs80WFHzqouNJ88zpdiunqU16cwOpoxI+LNznqH9f3qh82VpdLs7mJOmpKcuX1+M9hatt/0l7BuYwA1k2YIwz/hxiP//BXe7b0tJY6S2bygbVQcQcYs6m1//dX6esWA7i/5jNsh/E/jqSOQqEeAB8CyUHPctbQ1AbFcnjGeOPmKyXfja59lHnfmij2bYh9ofz5df341Hw7G1SIYFbFQ9c1ZHZY/Nd9BJbHvTazHtQFgveoRqarQhqNjQsGvAPHCEdACLKpPoBI5k2J2OzXY5DQH0Wlc9WmrVdze+VnPYJS1mtmpM/iemzQ0hwBjJjBNjj9VITJnnvel8Ic5E/b2r9NreU9yLn1xnZ7j7XXrIuvZmiuELxVfoLyrm9+NzvomaawDBGSlh52QdkxpLIzgfRZJiVnFrEz+53gtRdgzk2L4Akbxqj4R/LZ0zIzfv/T7YR3CLW5qq5GRiVtMWkXDSATeVU15fAQJI7S/Rzbkc2i6ftqbPdYQj8s7o9jOzjUXTEIyp/mg7d83yyMAKJ3hSOD5dssg+YiQ7YXjLe3xaYeYLz/i2GyrIU0rZGhg2VOpMlAB8vn/9GilcZrxoPDRpUo+4+0QoyNNJhIbSH8UUYw6rPOSzs44tTY6hpE4U6vUMW8+BfPA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR04MB7158.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(36756003)(71200400001)(122000001)(66556008)(66476007)(2906002)(1076003)(5660300002)(83380400001)(186003)(26005)(508600001)(2616005)(66446008)(316002)(54906003)(6486002)(76116006)(110136005)(38070700005)(91956017)(6506007)(4326008)(6512007)(82960400001)(64756008)(38100700002)(66946007)(86362001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fAWeWDqRB21VwU/FPxYE87q2e1wYi8lrCK4K/TLXvr7VJNOUEYaZbhRFod?=
 =?iso-8859-1?Q?2qW1l8/Kwb63tMnRkptwoaLlVmGzkDoF4NJXm+Q3zrZqKSdlqc3EBD90PT?=
 =?iso-8859-1?Q?YB8RcLsq1FeY4BkLzZiVsvlXL3spZUn32vJhGzELo7WMxn3cMi77xTKitY?=
 =?iso-8859-1?Q?7ZJC5ygsV27TZaodo6lArOnNk3zGUtrCCm59OQoyRUW3R93+BipeQAvCui?=
 =?iso-8859-1?Q?4GrHIlpQTsrWRmqdfQKYmwrePjxhXX0oKcnxE788nnj4pDksAAB1aKYVuH?=
 =?iso-8859-1?Q?fefkGHf/1tN+/yZzWsYmhDYLaJu7RtlUpxUcjuRbqXwd052VdupKDpDn2R?=
 =?iso-8859-1?Q?qlv+PBbYNkBnL5Vn1DvxacIJTYNg+zhfmMvaYa/cgtp16iLVkA51Crtn+A?=
 =?iso-8859-1?Q?g6t0leH0ReliTGtE87iNNxNyIdFwzE3mws1X8RDyWSLOcRdxP5lvVubOw6?=
 =?iso-8859-1?Q?3nMTB1CVMCbppi2WjnrygEnHGlHLoCHmYJDPy+1J9e3gDfDt7KZj51ZfGr?=
 =?iso-8859-1?Q?gGV7nSWsrAAW6v4wY64AAb8N2Bq713MQSovkQ0bfd3V1fGjsSevHMaBFQn?=
 =?iso-8859-1?Q?RBytpAExnmTFJETvb/LOOeS8McnJdthK/Im1E3JqslBFB3rYl9S+7fNgAH?=
 =?iso-8859-1?Q?Wesip+yKqziCghlZknydKbPpLVWN1ZMaT0oSz+yrzCD+AmXXDZEn4xuskc?=
 =?iso-8859-1?Q?zfMkDwjVVmldYawNOKoe4VC87+iqCLzkVJJZUIK/8ylgjL0bzHs7j5pfHn?=
 =?iso-8859-1?Q?GLvV/UiHWRFqmR8UxHryqz1MEhyXkXkUvQPvTNds6xU2DkUdPMlFXksMh1?=
 =?iso-8859-1?Q?ZHgAcI0LW5GE+rziHiqvtmvLCo7BqxWLawyKR3ec0d2a8RSQDNk4m/V/Kj?=
 =?iso-8859-1?Q?mVLDGoHzwRifs7hA9fjt6AVGuE1qcI2uOxB5Nkl21pCLjWnnXsCQ8zNoDy?=
 =?iso-8859-1?Q?p/MxmjPgDnLoukkToEIN9r/MycJhPZfB0AghBv4HJPk6w84YnI9ACpz/aP?=
 =?iso-8859-1?Q?SnHI4GZKA4D8npv2tiYoCnRLSxEVMFy2yDIDJ1dOxWHq9dg4VRWNEJSty6?=
 =?iso-8859-1?Q?G6PW87QnKc56BaFwCv0WRlbMEj+xeWBpeGA14CHu7hZ+C4SManV30t+CvP?=
 =?iso-8859-1?Q?Q2UNtaiXEQsm0BWIAiJkhFSqIxtxzyuaUbSrD4YMCp/33311iR0XjpEuXz?=
 =?iso-8859-1?Q?h8NEr5DsORgPnflynYAOfEl481zt+db5VyGiLD2r4XVvXQKFvBRakiCkW+?=
 =?iso-8859-1?Q?9OHZyxkFjcZ4f7VwoQb5tzxqkjhD+2lDKwoOdARQat24yfm51FA7z+Zh86?=
 =?iso-8859-1?Q?bIUoMbdr/HxM/W9rJtpOyr+Qrbeuhwgg/7juTcwYLFv+mU/cRjmjVFsQz5?=
 =?iso-8859-1?Q?59z1jVGqwYPOHMzJIfhwIOfUj2TgCyLhhX6jUoj6z7a2ZnD6I5DDoq1tXL?=
 =?iso-8859-1?Q?U47bHYeAnqxhbVUvpwekQNKrBqQOAeIiXYRfwra5rlcWzNZYDVIUTeU+1Z?=
 =?iso-8859-1?Q?Mz0Ri7TvM46jKLLPEOc+1c9DqrwVg4MmQqpW9iTgCeqzO0wLxj/NutwG0K?=
 =?iso-8859-1?Q?wzkwO3WPGQGgywwxe/qkgQEyiQRLH0+q9Z7mi2zhfVCtP3iSeTm5h6qS17?=
 =?iso-8859-1?Q?rsixBnOfFXO7TBV5Pmo27TNrCWDHr1GaBgbVMGT4kBhMpzR1STLiyZaaXl?=
 =?iso-8859-1?Q?bvT2RQv8LrKNf39fO5xFLIGqyvhzceyKJ0kJH9qY?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadccd56-f5e1-4f8b-e8a7-08d9e7de979a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 13:02:26.0185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m/GS/OqUblwzckisM6mjKc5cr3SFspHc/A4VH4A3mtyLuanzPL7cpTd5LBbN6WiJJUHDzRGaeffqGp/fHFL13Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5671
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Niklas Cassel <niklas.cassel@wdc.com>

Setting the output of a GPIO to 1 using gpiod_set_value(), followed by
reading the same GPIO using gpiod_get_value(), will currently yield an
incorrect result.

This is because the SiFive GPIO device stores the output values in reg_set,
not reg_dat.

Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that the
generic driver reads the correct register.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
The patch was tested on a canaan,k210 board (canaan,k210-gpiohs compatible
string). It would be nice with a Tested-by from someone with a SiFive board=
.

However, the u-boot driver for this device already behaves exactly the same
as this driver does after my patch, for all platforms using the driver.

 drivers/gpio/gpio-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 403f9e833d6a..7d82388b4ab7 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -223,7 +223,7 @@ static int sifive_gpio_probe(struct platform_device *pd=
ev)
 			 NULL,
 			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
 			 chip->base + SIFIVE_GPIO_INPUT_EN,
-			 0);
+			 BGPIOF_READ_OUTPUT_REG_SET);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
--=20
2.34.1
