Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC5F4171C5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 14:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244773AbhIXM1N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 08:27:13 -0400
Received: from mail-bn7nam10on2098.outbound.protection.outlook.com ([40.107.92.98]:43572
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244406AbhIXM1M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Sep 2021 08:27:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emP+1ZXM1J0lkcb69tFJHycKuX27BAAli9rfDctst4++OHkYHz03RQQCM2U+FezRvkaOm2ANyCsthiFV5Z2fIgrMByrnLqBEff5GVpXjZAXjtAOch2ws4FN7XaqBPOS6RdliV0FNMZRkS8UQ81rU5GWNcw54XmOw5hUE2cyt/qwFAED4BUeUWmdlBIfldvhcrgIO/c7kE/qxsjAjQnk7cJ+ZLKcSvsv8TBljjwYuXDRnbXfKl4h3BjBE5dmpc7SR8jCG5KVG5cjTCY+jNSIFeU7RJeCn3RGP2qvwbuSoxrpi+CSY0OQKG0oKIU9WQqhsHv7RUzhYj7o6LJuJPOZcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Os7/8PInCCWZMRuHAEwjL/jxQrwtQwAcLuW3adVnZ4o=;
 b=de/Q4R4weKql+Ae3v8z8DPUykBvHRuwjYvt571smyJjzuLa8fpkpHMgQ0w3WV64LN8VEvLPyg4Yl7Oinev511m32z23/Nk/E0HMPOa9cFm9+1au2cPFCP3OH4c4DAzTWm2efRUAGR7zUTFXCiWxBjW9VhWlulYN4woH9D8XAq+SoYryB6EbVuUwcS2FQUhBevwSupdAKzUOLL/w5VWSp6DFewx884FzpkB4BqM4RQjiX7qBjDSNkrNmiMFNseLAiHuFsXKEDrohKUXlLkJO7xEg0TZovUjDr6qYz1vSyIJ2hie0V2Q+SjEdtdISlh3JBGJY6M+Ttw8sZ7zZArNyXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designlinxhs.com; dmarc=pass action=none
 header.from=designlinxhs.com; dkim=pass header.d=designlinxhs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designlinxhs.onmicrosoft.com; s=selector2-designlinxhs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Os7/8PInCCWZMRuHAEwjL/jxQrwtQwAcLuW3adVnZ4o=;
 b=PakNkv++JtiMh+lwV47VkSCASEqc2ge9p9035sHxB4DDLhiy74V0jWuS/MJlGrZb5VqPt793I4AwGpjTDoOTc/4PK2sleCKJ0AN4Cphc/O/cQY+Q9aH9ihD4SIcpIougngQwLpPUP/bQxS44TeVMMAUyuuMV/OxELSn6r27Lc/4=
Received: from BN8PR17MB3025.namprd17.prod.outlook.com (2603:10b6:408:5c::32)
 by BN6PR1701MB1844.namprd17.prod.outlook.com (2603:10b6:405:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Fri, 24 Sep
 2021 12:25:37 +0000
Received: from BN8PR17MB3025.namprd17.prod.outlook.com
 ([fe80::1d3f:2873:aa1b:f1ca]) by BN8PR17MB3025.namprd17.prod.outlook.com
 ([fe80::1d3f:2873:aa1b:f1ca%5]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 12:25:36 +0000
From:   Kenneth Sloat <ksloat@designlinxhs.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Kenneth Sloat <ksloat@designlinxhs.com>
Subject: Re: GPIO Bulk Request Problem
Thread-Topic: GPIO Bulk Request Problem
Thread-Index: AQHXr8YwOhjB6pVEIUqxM4+6LWyHdauy9YMAgAAm5JA=
Date:   Fri, 24 Sep 2021 12:25:36 +0000
Message-ID: <BN8PR17MB302555D87D065ED3D19AB340A1A49@BN8PR17MB3025.namprd17.prod.outlook.com>
References: <BN8PR17MB3025D723599B15E5AFB208DAA1A29@BN8PR17MB3025.namprd17.prod.outlook.com>
 <CAMRc=Mewmbqo+y++j4iFEn36NMW3xL7AG9Vd+pLt6-PLE3cn0Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mewmbqo+y++j4iFEn36NMW3xL7AG9Vd+pLt6-PLE3cn0Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 766afb20-9dcb-858c-98f8-8a3f4b75aec7
authentication-results: bgdev.pl; dkim=none (message not signed)
 header.d=none;bgdev.pl; dmarc=none action=none header.from=designlinxhs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d6d77f0-1fa1-4a2c-983d-08d97f5669be
x-ms-traffictypediagnostic: BN6PR1701MB1844:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1701MB184486094701A741CC4477F1A1A49@BN6PR1701MB1844.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jmD7TCQKtKxl7Z1XejGQd8YYS1jRXZX0FOl0KcT+PjvamE9fr+zs1Hu72YkKL64DaPh9Uk/B3azMs6EcZ5KCOWyK7Nb+HbXK5QKgFxG1GJccFvmdEUfeUQ4Kdh29epMAIPu4jeTdioxQKy6yHQn3Psvmcy6uihzAN8vpXrSHc4Ep4vyMev4ADiEJfHt48MZekpaeJv3CQ5awZ3a/Fy6Sp+36evQ3OGgcfESOFCfKYZwP2ps7WbUN/Qwf1X8QkY90LqMIH+MMqyDyE6lTXNDKnVbUwFClPn9lt28PRpaPfVX+rxDzwCcW5c+JvFVzMqHe2o+VqLOUFwu/f0B/iqqOkVsmShGL4AlFEMbayKxp4LAwW81aXVbvIU56rzfdZ/fCqYW2UkKKMKKAVG82IlI9xzh3ZkbrDLQPOuTEXDQnwy/Sf9rhbvNXzd0yvYKGfbYlBUk9Z/5PkfLO4KiPqsXyuGqj/EEXNqqsFRRIiSgNiLDdc/wpWulY/dgW75yUdZ28YO8BaQGmq/qRIYdgKp6yOBdKRRInr0FiYJwMSL7aB8wMfZ77I2UcvMIkZ2CPK4l/N+jNEkbch4to5Ci1MHTBVaDRNPpLSaxKPeQW5W1TRw3C08PEvvsbWdPvCQ4R8NuwWCYM0aO5eGNg7Tlr7VkX2R7CsISca1YsJ+vJytXhYBxVCZTxsoY2x6742Jc2UKG2iQJh44hrHtG+fEZCfdxrhg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR17MB3025.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39830400003)(396003)(366004)(136003)(346002)(33656002)(38100700002)(66556008)(122000001)(26005)(38070700005)(3480700007)(9686003)(66476007)(54906003)(55016002)(86362001)(2906002)(316002)(508600001)(8676002)(107886003)(5660300002)(76116006)(53546011)(6916009)(8936002)(83380400001)(4326008)(71200400001)(52536014)(7696005)(186003)(6506007)(66446008)(66946007)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zoj8NLtQQ+PdtTb/SMHoZopEPP6MUbcDr0pKWIdPZn/I81ayAg+u4vz2nK?=
 =?iso-8859-1?Q?hl3SJWOFabE7d4A3KoZQUHeNVNRXnIV9JBJTPg9ENGGHGFGjQEdzH8hKUD?=
 =?iso-8859-1?Q?3OszsQueGlDPC7GdFivn4yw8Hd4Ep49QjD9Ipi/ETraZ4vJEixRhc/Aobg?=
 =?iso-8859-1?Q?C03jzLY0p8zI/1yLClFcF5/NcmZI4nl5jj1OZJw+z7/u+CO8XzJEgP+zYg?=
 =?iso-8859-1?Q?xwy5r9FPi8Vim5qvxH+Itmd8bG2Q+QEPMGjIcdmP653eAT0i+FfPBFnIfo?=
 =?iso-8859-1?Q?DDJRrLnEi7AEg/vKH1xpO2AH9/pHk197slUu3FishdGygLYp3zIcc4iv0N?=
 =?iso-8859-1?Q?le5lAwq2vMm146YVTdcqIdmdxHNf+88dRCIk7BQcS2qXA7kg+U3Jc1QDM5?=
 =?iso-8859-1?Q?avDmInZZ8eyCEIETR4hYcxDKwMhBNOIKO9sFR1x3rs2+tZGIrrmwUbLplO?=
 =?iso-8859-1?Q?/DKbQEmkyJwvlI30eUoV5fEXn9vEvy1GP5gR4WelGfJxrPJ8XSbwY74fEz?=
 =?iso-8859-1?Q?1hdlCja7+z0TNAm2NCMt5j7bUsNa09O97gAEuiYOITleApj3ZrfGovRjMx?=
 =?iso-8859-1?Q?3d4R79lYurRXDrbO04eIm38UbCpnNFLwZ9Gvx56vATpjre6XTB/01LzLYt?=
 =?iso-8859-1?Q?Mas+PkkfpHrNtmfzahA2/F9e0NMQFLRYMvLX28jBc/fwv0PzwPTP28l6SB?=
 =?iso-8859-1?Q?X2GK7+qTTA3Q4ByWjUhbL5nhnjmDhFtowEqkhfxjvK3N5Hd45mVXw5QPCq?=
 =?iso-8859-1?Q?QIp8dePU0rzdpgJO6SdoyugDegi/9i5YI4ZYhlQ7IogDKJJeZBEw+ZxVog?=
 =?iso-8859-1?Q?PnK+CkX9Taddz/A5HM6YNetCKBpb116qBBIvm+WJ4kvvMXgkxNwe4YqcSs?=
 =?iso-8859-1?Q?iR6HsJCIUMDE9jpDM97TP5JcmGutIiNeuWlX7YSovVMy9UaTApPU+2/s2L?=
 =?iso-8859-1?Q?Br1A2uUJBhBrRwrqCs8tRpChwgKonhGZJW5J2+yEOpbx/cEeGZHPwwPS8m?=
 =?iso-8859-1?Q?bsvYqGrLeFCNAwVk7pWAVnsa7RlrG8HTpYfYUe+XiHkIzvMDNe+y9Hqzel?=
 =?iso-8859-1?Q?lAmhRxMmzfR05eykD4kuDfM6yfKVdxpSmCTi+redGMVWiVCYduZ+nHf0cj?=
 =?iso-8859-1?Q?E9zAJE3lOuEfQCzk1FcCZzpNFsAVuSb5VW3KIAu0rcUBAQ6kVcGDITxWeq?=
 =?iso-8859-1?Q?6ISV2EnQXgrMFx/Ce118vANlEPa8Ic3GrjxrVMI3/9q7UA+P1DysGxe5ol?=
 =?iso-8859-1?Q?mY3DL01zCk4LGzusrQPE0V1LpGH2R7FwbTzb8P2AK5d2nkIkA05TOtqdii?=
 =?iso-8859-1?Q?hjFahMAhFaDcUaF+2Ha1WQVFH6Z5znEilbBKQqHTPnmeVq4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: designlinxhs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR17MB3025.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6d77f0-1fa1-4a2c-983d-08d97f5669be
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 12:25:36.5520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21db78a4-85a8-43a2-9030-593b170ddfa9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V730x596URTezwNgl6uLByLKcQR5opo39dDBc4tdJueNA2okTGvx/igFNsPmb7jEBbh4uCp/GyGgN8vnRu7mqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1701MB1844
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,=0A=
=0A=
On Wed, Sep 22, 2021 at 6:27 PM Kenneth Sloat <ksloat@designlinxhs.com> wro=
te:=0A=
>>=0A=
>> Hello,=0A=
>>=0A=
>> I am using libgpiod v1.4.1 and am having trouble using a bulk request of=
 gpio lines as outputs from a chip. I am using the C++ bindings. I have con=
firmed that I can individually request lines and set them as expected. Howe=
ver, if I use the bulk request, while I get the expected number of lines (a=
nd defaulted value is set correctly), iterating through them (with array op=
erator in this case) and trying to set the values is not working as expecte=
d. I find that for every index/position, line 0 is the one being toggled.=
=0A=
>>=0A=
>> A simple example is below:=0A=
>>=0A=
>>=A0=A0=A0=A0 gpiod::chip *mychip;=0A=
>>=0A=
>>=A0=A0=A0=A0 mychip =3D new gpiod::chip("1");=0A=
=0A=
> Why would you need to allocate it with new?=0A=
=0A=
It's just how I chose to throw the example together.=0A=
=0A=
>>=0A=
>>=A0=A0=A0=A0 gpiod::line_bulk lines =3D mychip->get_all_lines();=0A=
>>=A0=A0=A0=A0 lines.request({std::string("gpio-test"),=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 gpiod::line_request::DIRECTION_OUTPUT, 0});=0A=
>>=0A=
>>=A0=A0=A0=A0 for (unsigned int i =3D 0; i < lines.size(); i++) {=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 printf("Set line %d\n", i);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 lines[i].set_value(1);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 usleep(1000 * 1000);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 printf("Clear line %d\n", i);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 lines[i].set_value(0);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 usleep(1000 * 1000);=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 printf("\n");=0A=
>>=A0=A0=A0=A0 }=0A=
>>=0A=
>>=A0=A0=A0=A0 return 0;=0A=
>>=0A=
>> Not sure if this is a usage problem on my part or an actual issue.=0A=
>>=0A=
=0A=
> I'll see if I can confirm the behavior here but it looks like a bug indee=
d.=0A=
=0A=
> Bart=0A=
=0A=
Thanks Bart. If you use individual requests to the GPIOs as outputs first, =
use can still use the index operator (or iterator) on a line_bulk object to=
 individually set the LEDs. It doesn't work when you only use the request t=
hrough this object though:=0A=
    gpiod::line_bulk lines =3D mychip->get_all_lines();=0A=
        lines.request(......=0A=
=0A=
> Thanks=0A=
>=0A=
> Sincerely,=0A=
> Ken Sloat=0A=
=0A=
Thanks=0A=
=0A=
Sincerely,=0A=
Ken Sloat=
