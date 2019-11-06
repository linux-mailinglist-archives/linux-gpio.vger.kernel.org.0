Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB3BF0FE1
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 08:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730024AbfKFHIS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 02:08:18 -0500
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:21088
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729816AbfKFHIS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 02:08:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlWVO53H8oo4k/5IyQM3v9LGT1e4m3deinRBbOVVgDRh+RyR4EcjKFNh4HkBXsyg2QdcWiT+dU/geKI9hYLD/zShLqr34UkQmIs5DfSt6EY8PXJNXB8VQnYmhoYH7QFuMQ/fbEKZpYqW7Ihq2fex4c9TZUcjcY/zihLejU/JbHy5AiWFgswRz5g+LPC5y7jsLTjkDcAdOQkUOocdAI56QNHmD+NNv6BZIyMZ1MpQaDfoxogH4PgriCNNgWzxaneQccywbYfRbB7sGyPLXvN3XcKvuLjKftFuLoFYuEKsvWfMd/mbr39aWb14IL0ES28pkhERR8vB3j54KJmr/fQ4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHje64i75xm94OEt/fj43Zqpku4iaPIUNapVGiAtTH8=;
 b=bZ5U0uDz+hcWhodWINNVKooNAJBuOFVYV/E3M5wCski/JsRscp5yLOEQFIUoqOWrY9uhnwhBTxLB/R/YUSJ6jlLcI1w4hHE6q2r763yAgNArl9TqKFFE49828gFIBZvYYrXjqvUkbwrct2TCAu9tpGxWgBjOt5RYLqK5ckCn8bFlvghbun0gc5tnhNBXA+aDZ1hf3Pzjc8uvKCZOsCpmj72MbiYrCiD/Pr9kr4K5FMJtVP7cIM9rZ26iZnVR4nEWnBNXZZnpxSZ5M08GAcDjbrXyRCksRjIlNLmd1Vzv3ePRCjUXRz9oH/52SSvv8gac5bs6lsCTZ4y3jlzOv0xmzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHje64i75xm94OEt/fj43Zqpku4iaPIUNapVGiAtTH8=;
 b=XpNX4e+P68oJZxwszuwphpkB+Us2sOVWa4q52MblXHwULanQ3113DX6lh4ZbBvMEWlJ+Nety5YqwG6DMuFm33BSuj1QAiz/CQ+uP8PMB5yP+FXnKpdNJiirhGAK6NWpDE0dRQHmmeixWNXV9NlLoLGgjT5mxJA48+mpxfqqBr0g=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3087.jpnprd01.prod.outlook.com (20.177.103.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 07:08:14 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528%5]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 07:08:14 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
CC:     "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] gpio: xgs-iproc: Fix section mismatch on device tree
 match table
Thread-Topic: [PATCH] gpio: xgs-iproc: Fix section mismatch on device tree
 match table
Thread-Index: AQHVk9d5yJ3dAIIYt02o9qQ+51y3DKd9tS3Q
Date:   Wed, 6 Nov 2019 07:08:14 +0000
Message-ID: <TYAPR01MB45442B7135422BA8D088E29CD8790@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191105124915.34100-1-broonie@kernel.org>
In-Reply-To: <20191105124915.34100-1-broonie@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ea5040f2-d90c-4f66-4ee5-08d762881770
x-ms-traffictypediagnostic: TYAPR01MB3087:
x-microsoft-antispam-prvs: <TYAPR01MB30876EBC29D94964B773D692D8790@TYAPR01MB3087.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(189003)(199004)(51234002)(99286004)(102836004)(14444005)(7696005)(7736002)(186003)(305945005)(229853002)(6436002)(52536014)(478600001)(14454004)(8936002)(8676002)(81166006)(6246003)(81156014)(486006)(4326008)(476003)(5660300002)(25786009)(316002)(26005)(6506007)(54906003)(66066001)(3846002)(9686003)(86362001)(76116006)(66476007)(66556008)(6116002)(256004)(33656002)(71190400001)(55016002)(71200400001)(446003)(74316002)(76176011)(11346002)(64756008)(66446008)(2906002)(66946007)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3087;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oQ4vDAdFJjmGiCYmWz2hfbLGz29A8BPPhAfyq6sOefF2R2+wl/1iIyVDKJnlBTD8nSozSldjkBUdv/zSs/YElyzTQ0F/M2ES0QHj1FecFktpbMcPT5sakNBoo8LJUrUG+knWm1lKM3ahP9BXxtCiSfclIE45uAZPna68Tta80872n4Syj8wQSkiHPiAqGupTcFbFdBxUQ6mYfD4rrKQpIz5DKrjHG72MSx1sbE4gB+BXPzXI00nRNJ+9JdFBb8w3K6OGDQ2m6lDbmyfjS+dJUedyNVyNzZLltaIFycFM8zYDAh2V0D8MauBzeCQA3S00X2GpzPNyp3K2tFBZ9oq9HCFMp/NQxNJGAS4dTKzDEzojtRmaLhYDsm7nUZrJ2OpLT9q8sibFmynGAEbG89oqj0JRuXUQEAifdFjHOQ7lMtumptyYVSg/oOUAWEHovoSUP+6+ycGzkhmBU5B7KDQ2pw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5040f2-d90c-4f66-4ee5-08d762881770
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 07:08:14.3415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vP/Xp5mytzWhPDYGZBn1m9UPdeAFfP8rjxjHts1jmkDK6pr8kVTw7WWx4K+optv1BI3n7DkHzez6KCaglnkJtpwAhvqzWDQTsZ+eOldoowdxG2nM6QALV8yoayhMs135
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3087
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mark,

> From: Mark Brown, Sent: Tuesday, November 5, 2019 9:49 PM
>=20
> The table of devicetree identifiers is annotated as __initconst
> indicating that it can be discarded after kernel boot but it is
> referenced from the driver struct which has no init annotation leading
> to a linker warning:
>=20
> WARNING: vmlinux.o(.data+0x82d58): Section mismatch in reference from the=
 variable bcm_iproc_gpio_driver to the
> variable .init.rodata:bcm_iproc_gpio_of_match
> The variable bcm_iproc_gpio_driver references
> the variable __initconst bcm_iproc_gpio_of_match
>=20
> Since drivers can be probed after init the lack of annotation on the
> driver struct is correct so remove the annotation from the match table.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thank you for the patch! Without this patch, I had encountered another
issue which my environment caused a panic when I tried to install a usb hos=
t
driver after booted [1]. But, I could resolved the issue after
I applied this patch. Also, I confirmed this patch could resolved the warni=
ng.

So,
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

---
[1]
[  146.541188] Unable to handle kernel paging request at virtual address ff=
ff800011f73540
[  146.549099] Mem abort info:
[  146.551885]   ESR =3D 0x96000007
[  146.554934]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[  146.560238]   SET =3D 0, FnV =3D 0
[  146.563284]   EA =3D 0, S1PTW =3D 0
[  146.566416] Data abort info:
[  146.569289]   ISV =3D 0, ISS =3D 0x00000007
[  146.573117]   CM =3D 0, WnR =3D 0
[  146.576078] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000049e4a0=
00
[  146.582770] [ffff800011f73540] pgd=3D000000077ffff003, pud=3D000000077ff=
fe003, pmd=3D000000077fffb003, pte=3D0000000000000000
[  146.593375] Internal error: Oops: 96000007 [#1] PREEMPT SMP
[  146.598944] CPU: 0 PID: 106 Comm: kworker/0:1 Not tainted 5.4.0-rc6-next=
-20191105 #87
[  146.606766] Hardware name: Renesas Salvator-X 2nd version board based on=
 r8a7795 ES2.0+ (DT)
[  146.615209] Workqueue: events deferred_probe_work_func
[  146.620341] pstate: a0000085 (NzCv daIf -PAN -UAO)
[  146.625132] pc : __of_match_node.part.4+0x3c/0x78
[  146.629830] lr : of_match_node+0x3c/0x70
...
---


So,


Best regards,
Yoshihiro Shimoda


> ---
>  drivers/gpio/gpio-xgs-iproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.=
c
> index a3fdd95cc9e6..bb183f584d92 100644
> --- a/drivers/gpio/gpio-xgs-iproc.c
> +++ b/drivers/gpio/gpio-xgs-iproc.c
> @@ -299,7 +299,7 @@ static int __exit iproc_gpio_remove(struct platform_d=
evice *pdev)
>  	return 0;
>  }
>=20
> -static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst =
=3D {
> +static const struct of_device_id bcm_iproc_gpio_of_match[] =3D {
>  	{ .compatible =3D "brcm,iproc-gpio-cca" },
>  	{}
>  };
> --
> 2.20.1

