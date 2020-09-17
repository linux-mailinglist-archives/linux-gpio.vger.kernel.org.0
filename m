Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45ABB26E5BC
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 21:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgIQT4J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 15:56:09 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:13776 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbgIQOrY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 10:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1600354043; x=1631890043;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MCBokrEKiuofgUglm0abnYj4s7LIov56wrrDd9Ep68U=;
  b=H1xbYvff0asv5OIVr8R7HBLX3HjjaxOFJNsmge/z4okSL3QDwd41G4rQ
   O6vjjKiaeVBooSYth8zcnLAAm+jvUjJtRm5Zsb9WeXB2MDytHzxML9A0j
   w1ynNfrazhVeYh7hknZQWnKGoam0X+EhoLAb+pWjUb2i8QhCleDJQOqtK
   ObVywvSIXaXVP3GTIknNYnQQTUHxWAHp63sCLhNcZULA+TQ6XCGdu0ESS
   JSo2zeEEvrQsW7NxF7Vdczul6xZePmZjHd/LBNEEHHCjwHLgf8mVlwaUo
   7pBNTuXC6VMZk6kgzxTLPQfReFftcjHgyzPLtXEjNjRE1pEYWNBtKbQzd
   w==;
IronPort-SDR: 2sVwA/xetzqEK21gWTL2u7LIoE7GPrVq3srN2GWo7GjpuFf2GAZif23/Bdfr0Rb0N7gphVx+Dc
 ktgMF8yfgpvdUVjHax/2WzLEufrZtjmpQd5uGGvb6nazCOXRLsc1Elj3zvWOUfPAtPSYjSI6+B
 Z+vGyYQRUdpfIfHGAK9ciGAv9Hzn6+HjyvNPqu9SuHk/RtwuCkIxJOhUR+f1qTOLUGGgySjfJt
 fZ5wnmvC0xlGhChjj74pYU50zi//JqBvduiPhTly2r/UjSngEQxgfgO69Ck/4WdESo4KAkIQTT
 LYs=
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="92186188"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Sep 2020 07:26:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 07:26:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 17 Sep 2020 07:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtM2yWPF5XQAhEHdss/g35eI1Q92jir3zrF7N1AAkIKxhBC/NcUIX0HxPFHLvRci7wZxLkXFYbQVf8+L+tmvtyF8DmZ2zJ6j61ch8tIR6fEdq5jlUocwRRmmW8nEK/Z/9HJEtFQdmjTlSujx/ZjCgxqmd/2ydmZ4AXVlZzWeXPffQFpOLJsOhQb3ILn83J53wCoK5BdxwpBslCRKewa1/XihbqXd9Ferz4gBcsVArEUop7Jn3axfiU/iTg3+BlzxqWUwN37o3gxuY+0/8c6H821bXh1Xt8+3HZ/Z7u04/PZMLhH58DhpPiHnqj87H0WPSd7JNm66f58TMBYh8AcNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ey++znXeJXOGUVggKKmDbkvmgeTGEz/0fHt1omP8SAk=;
 b=FhPEtv0aD8vg7V4NiSA2STsMsvGad/JnqyV9+ZgvKP180539/faSsEfzFy875gcGkTbZCkNseTvtSE/3jsLzJIBgn5+5cQAqgH3Y3iWIaPHvnCx96p42wWfsewd5kBtUYdjbZ21oyH+ZocrbhH3A7s3tW1Ya9uNW+iNsIZsv1qjIdIN98ZmHc6OYy91wQpQebZUm/NNmivaOLMG+3Hh5AtHT9gx5LpYahiPcQ88sBMc4zosPkND56UhITbJEadz9FPcdh2Kb2tcDpoG/VbMhpkk0/uQrjB763Mdz3OjdhgAHpKKMkeInU6EFRNx0DihZz0NIUb9WJXLh7oCVQHHUkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ey++znXeJXOGUVggKKmDbkvmgeTGEz/0fHt1omP8SAk=;
 b=ZK3aNW21Jdse+Wj7uj5F73Rl/S4kxADTymNxuEOOkr0kdwGQTTRIbTeTuygu+CoJ/ThBtqqqz+l5iPa3ayXyACXGN+Evuw+wQLlK8wK50ULDQTB0Zx+qoAVD+9deNp1FMrdZAcdPIMDwYR5liI8rZYnKUTh9LEN+7i0jKQyZz4U=
Received: from BYAPR11MB3477.namprd11.prod.outlook.com (2603:10b6:a03:7c::28)
 by BYAPR11MB3623.namprd11.prod.outlook.com (2603:10b6:a03:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 14:26:40 +0000
Received: from BYAPR11MB3477.namprd11.prod.outlook.com
 ([fe80::bc5b:8de8:be0a:17b4]) by BYAPR11MB3477.namprd11.prod.outlook.com
 ([fe80::bc5b:8de8:be0a:17b4%7]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 14:26:40 +0000
From:   <Nicolas.Ferre@microchip.com>
To:     <Eugen.Hristev@microchip.com>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Ludovic.Desroches@microchip.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: at91-pio4: add
 microchip,sama7g5
Thread-Topic: [PATCH 1/2] dt-bindings: pinctrl: at91-pio4: add
 microchip,sama7g5
Thread-Index: AQHWjP6PF2QmZDCE3k+XNwg1BXUAJQ==
Date:   Thu, 17 Sep 2020 14:26:40 +0000
Message-ID: <02303ed6-3db7-29ff-b86a-af98d81e1e2e@microchip.com>
References: <20200917131257.273882-1-eugen.hristev@microchip.com>
In-Reply-To: <20200917131257.273882-1-eugen.hristev@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac662e16-db3e-483c-3f5b-08d85b15b1d1
x-ms-traffictypediagnostic: BYAPR11MB3623:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB36232D86CAF468EA366DE81DE03E0@BYAPR11MB3623.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FuOxIE4m0m+oCk2OQTU+u+0GNZ+ARieRn9etgGUEVcXDjJRFrzUkrpda2ty4RohTe9IQeLPZBB36mGkJeHgMUTKNFU6Qjr+P7eO4nb/UXnsztoTNOJ+Ldq4Q+j4SceDCUMDMfZ2KgBmg/dAMo/4DPrqb3NsMEUGYkCTEOiYe0D6bt0xuav1W1Hn9X0lR5VMkbVXNvuL4VGeEmu9g8zM4++h/WSwoWTvK/+6U5XrZIHHKTCs654gjicvfWqsoCrjJaHWdVIXtrO/fBxlEFN0deoySMb/yTXleQtW/qGqdu79ZWSe7V4vCJqmVVxeaT6ERv3tMbutd+GzK+1Qrh/ncHk2rEDXgBo3w0BkPtWt00kc3ycFNuenzBmM+Us6DQKqnfR6TPGc7d+/Z0GhkrrLKGFuXqQPvWBpqn6Us30FshrUbD+2qnv6s06Jy5KqCzmDVVORYprpvtoVRi3tXaV8qrg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3477.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(136003)(346002)(39860400002)(2616005)(107886003)(83380400001)(26005)(478600001)(6486002)(110136005)(8936002)(4326008)(316002)(31686004)(86362001)(31696002)(91956017)(6512007)(66476007)(186003)(66446008)(66556008)(66946007)(64756008)(5660300002)(36756003)(76116006)(2906002)(8676002)(53546011)(71200400001)(6506007)(142933001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cPL5Nbzz2RkIRyiJ5EzOkBCog0R19/bE/Izo436TRdQGJYYAriRBkRzL5e2ytCWStoo82EKBTx7oZRVdbdiK+j0D6oiMpOJCyVtDHEHraWxzv7ZcMJcjyXFEX343o7bnrMZWC6lpomVC46l9YHPqSzmRN7oi/wLERJrorwt49hP0J7jLKMSaGe9+d8nF7ZTF78bedEceO4kn+l7zypNmMafOd/Rg0ii9rqdJfUSpAzQtX13ykI5CYm4TVKROkv8jyRuFn1sWgTpb39CKAt8eLpont1TvfdtFYurHT5sBjSGjedwV2F6dLzNuK9aIZKvoKOSdfQdgWpRWzXI62VNzS6wsmVb4lORyE+391SpXqKI8r6vBpdYmEqlf7aqtEtcIAenHGM+E7zJHnGd/ZvD3sDgPfz2DUgaGmiBtUmfBKm8s8fKlJBxgLe1WsGUtpW2KJ+oEJgCtKBf4DRQscVDMlKX2lXyZwYbNpvIEpfHDATeX707KO3jmkpg5fREVPgE2FEf7QMlH7ZYnGsdNHw6nqYteA2hRHS/qfp0wo1D4k05JsqxZL2+OqchTh6swfrVFlqGb6uw9CHdUCj/qCi9U5euQVcAxSH/TITkU6ta6YhB9YabofdXQ0GGzeKW0186hGoDSX2Oxsi9xoqwP7YjMDg==
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <69BD8614B2F0914EB670043495F100C4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3477.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac662e16-db3e-483c-3f5b-08d85b15b1d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 14:26:40.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+zD5CDIYVtzDrmZxd+HLZF9V5EPtSYwYQe1nrdQeokoKnWuFNBw7BSzK3L/vIPTmb64C8ZceNZgugpYfQtRcja2uR6j9i3W/IqY5zDHwxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3623
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/09/2020 at 15:12, Eugen Hristev wrote:
> Add compatible string for microchip sama7g5 SoC.
>=20
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pi=
nctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinct=
rl.txt
> index 04d16fb69eb7..265015bc0603 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.t=
xt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.t=
xt
> @@ -4,7 +4,9 @@ The Atmel PIO4 controller is used to select the function =
of a pin and to
>   configure it.
>  =20
>   Required properties:
> -- compatible: "atmel,sama5d2-pinctrl".
> +- compatible:
> +	"atmel,sama5d2-pinctrl"
> +	"microchip,sama7g5-pinctrl"
>   - reg: base address and length of the PIO controller.
>   - interrupts: interrupt outputs from the controller, one for each bank.
>   - interrupt-controller: mark the device node as an interrupt controller=
.
>=20


--=20
Nicolas Ferre
