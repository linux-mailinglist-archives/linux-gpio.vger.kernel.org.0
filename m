Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E88034145
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 10:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfFDINo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 04:13:44 -0400
Received: from mail-eopbgr740059.outbound.protection.outlook.com ([40.107.74.59]:62048
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726637AbfFDINn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jun 2019 04:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1FG6zloKqxGnK9Sf5W6AQAEFuisLyxvP7AEIBxtQfM=;
 b=eJsTBbOaO5Cv1S1TpJ8FDHif+JO7GCEqps1G1kkj+A2JcY/wvq7960CrCCvtK+Hp3SZZ1cWeFjbtttitd74pf71EJtH8Ffs9nLbkorV9WF6b5s0oyG/orn8OYFWaQPDFRFjXiMSWvF2apmPNvAIpTD3hc6rSR7koJdqz6MWos1w=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.31.141) by
 BN7PR08MB4164.namprd08.prod.outlook.com (52.133.220.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 08:13:38 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::8d6c:f350:4859:e532]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::8d6c:f350:4859:e532%4]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 08:13:38 +0000
From:   "Bean Huo (beanhuo)" <beanhuo@micron.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: RE: [EXT] [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
Thread-Topic: [EXT] [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
Thread-Index: AQHVGqX7mZWyymp0D0+pRLZPzmjhVqaLH8ww
Date:   Tue, 4 Jun 2019 08:13:38 +0000
Message-ID: <BN7PR08MB568450B1EC51ABAA2E426AC0DB150@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <20190604072001.9288-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190604072001.9288-3-bjorn.andersson@linaro.org>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [195.89.176.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ae37eab-556d-4259-ca02-08d6e8c48c83
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR08MB4164;
x-ms-traffictypediagnostic: BN7PR08MB4164:|BN7PR08MB4164:
x-microsoft-antispam-prvs: <BN7PR08MB4164F5C147BE78F2515C7267DB150@BN7PR08MB4164.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(39860400002)(366004)(346002)(396003)(189003)(199004)(186003)(74316002)(9686003)(486006)(26005)(446003)(76176011)(52536014)(55016002)(476003)(66446008)(73956011)(229853002)(7696005)(316002)(66066001)(6506007)(102836004)(25786009)(110136005)(54906003)(4326008)(99286004)(66946007)(76116006)(6436002)(3846002)(478600001)(53936002)(66476007)(64756008)(14444005)(33656002)(11346002)(6246003)(68736007)(66556008)(8676002)(71190400001)(71200400001)(2906002)(81166006)(86362001)(81156014)(305945005)(7736002)(5660300002)(6116002)(5024004)(8936002)(256004)(14454004)(7416002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR08MB4164;H:BN7PR08MB5684.namprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cXZuNu4cK0kkbe6cdlEKLGOU5WftKvUrZ7lzRwcQSW4zYvos/kKKux6MOhcyDmF+CUw2molHCuEKXPLA5H55Kden09dvQU4wm7ALW6ZFFRKxBYMaESibhec5KdM+ZfJLv5edcY+c/NVemrRAlWkVNINTXlNoNKnSHDttV1D1gSKRJFzhUg6w1bdnYzTMYOGYY51HbIZhC1s0iWrLVaHUfHhsAV01cNRVJOMingHSvulDILYiEUybCGaqlyjPnDkpUbhGyniCo4FVy3NXwi102EOEuXkDw0jL3wBBwjL/eIoRWZ/U/2QEy+Y7xSen6TSK7Dcnc01ljlsK8YrcGWw/ZwpZ5KQ74R/sGzcvDOn+D9EQFODKvXNJbmi3oOdC1I0TnHG96z7n9hqlk+iKfAZKHkqqUzxC5L7cqA/Vwj5/TDQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae37eab-556d-4259-ca02-08d6e8c48c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 08:13:38.6206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beanhuo@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4164
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Bjorn

>Acquire the device-reset GPIO and toggle this to reset the UFS device duri=
ng
>initialization and host reset.
>
>+/**
>+ ufshcd_device_reset() - toggle the (optional) device reset line
>+ * @hba: per-adapter instance
>+ *
>+ * Toggles the (optional) reset line to reset the attached device.
>+ */
>+static void ufshcd_device_reset(struct ufs_hba *hba) {
>+	/*
>+	 * The USB device shall detect reset pulses of 1us, sleep for 10us to
>+	 * be on the safe side.
>+	 */
>+	gpiod_set_value_cansleep(hba->device_reset, 1);
>+	usleep_range(10, 15);
>+
>+	gpiod_set_value_cansleep(hba->device_reset, 0);
>+	usleep_range(10, 15);
>+}
>+
> /**
>  * ufshcd_host_reset_and_restore - reset and restore host controller
>  * @hba: per-adapter instance
>@@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba
>*hba)
> 	int retries =3D MAX_HOST_RESET_RETRIES;
>
> 	do {
>+		/* Reset the attached device */
>+		ufshcd_device_reset(hba);
>+

what's problem you met, and you should reset UFS device here? could you giv=
e more info?

It is true that we don't reset UFS device in case of device fatal error. Ac=
cording to UFS host spec,
Host should be device reset except that in addition to resetting UIC. But a=
s so far,
We didn't experience any problems result from this missing reset.

We have three UFS device reset ways.  Comparing to this hardware reset,=20
I prefer to use DME_ENDPOINTRESET.req software reset.


> 		err =3D ufshcd_host_reset_and_restore(hba);
> 	} while (err && --retries);
>
>@@ -7355,6 +7378,18 @@ static void ufshcd_variant_hba_exit(struct ufs_hba
>*hba)
> 	ufshcd_vops_exit(hba);
> }
>
>+static int ufshcd_init_device_reset(struct ufs_hba *hba) {
>+	hba->device_reset =3D devm_gpiod_get_optional(hba->dev, "device-
>reset",
>+						    GPIOD_OUT_HIGH);
>+	if (IS_ERR(hba->device_reset)) {
>+		dev_err(hba->dev, "failed to acquire reset gpio: %ld\n",
>+			PTR_ERR(hba->device_reset));
>+	}
>+
>+	return PTR_ERR_OR_ZERO(hba->device_reset);
>+}
>+
> static int ufshcd_hba_init(struct ufs_hba *hba)  {
> 	int err;
>@@ -7394,9 +7429,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
> 	if (err)
> 		goto out_disable_vreg;
>
>+	err =3D ufshcd_init_device_reset(hba);
>+	if (err)
>+		goto out_disable_variant;
>+
> 	hba->is_powered =3D true;
> 	goto out;
>
>+out_disable_variant:
>+	ufshcd_vops_setup_regulators(hba, false);
> out_disable_vreg:
> 	ufshcd_setup_vreg(hba, false);
> out_disable_clks:
>@@ -8290,6 +8331,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem
>*mmio_base, unsigned int irq)
> 		goto exit_gating;
> 	}
>
>+	/* Reset the attached device */
>+	ufshcd_device_reset(hba);
>+
> 	/* Host controller enable */
> 	err =3D ufshcd_hba_enable(hba);
> 	if (err) {
>diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h index
>ecfa898b9ccc..d8be67742168 100644
>--- a/drivers/scsi/ufs/ufshcd.h
>+++ b/drivers/scsi/ufs/ufshcd.h
>@@ -72,6 +72,8 @@
> #define UFSHCD "ufshcd"
> #define UFSHCD_DRIVER_VERSION "0.2"
>
>+struct gpio_desc;
>+
> struct ufs_hba;
>
> enum dev_cmd_type {
>@@ -706,6 +708,8 @@ struct ufs_hba {
>
> 	struct device		bsg_dev;
> 	struct request_queue	*bsg_queue;
>+
>+	struct gpio_desc *device_reset;
> };
>
> /* Returns true if clocks can be gated. Otherwise false */
>--
>2.18.0

