Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255901ADC0B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 13:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730280AbgDQLPM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 07:15:12 -0400
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:41328
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730091AbgDQLPL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 07:15:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbdeB9fThlluJYhHT1iQrzaR0m5XRkY8JtvxH736t85fKNibumEWapkGiA7HDAS4x32iKO/iNtFNAmKfufUuOh5z2+Bz2jMim6POWFQIEUS55BAeuuf3WJbKVS1SlO4+73letBWARryMTGxua2He5lHR0QZU/wzYTrqKydYOvD7u+oKEdRQ158VoFBgbV6/qdwE/kGl7eElQIKQpWCdI4eFaHsnLhkZO7u1ADUhreTq4y4ujEY83DkkKiw6Mq65AX2OmcHpaL5i9Bk99opu48FPqBDTR2aPuwHfW3VvM07Kumgbdg1hIKvu3X1ODpNR/bGxggOWtt/9wzDzkcZuBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSF/I7pU91uWtMyr2pn+qqXm02ga7XhdfgYdq3T747c=;
 b=lv8Zz2J+PqKvgy8+PtzcebOn+xexDJsEUkZK6xWwqdL4r+bI0Ep4U9GsXPj+3WDaRypnAt6ShVW3pHFsD5tg72P5IeDCmgfVNbBo2ppBcP6/Me7Ti74kToRgvDcPkJsan0Bx62wyuc1WFhRpOlAokgbMW+0ty0fvZKYMN/JCuzUIqMfNn/00ntMI9wup3sumWF3hvgo8vzD8ygRNJFJIvH/qqitpyJMfevKf3veUgrVVNyKBLXuU7nbX+c9SuziisgTLvgkj6pcjEf4WxYf+h2h070UF2nvvaGYBemZCqc5YA8IWLoGGavch5LUpato0EDGW+1L1ugXlmowiVrRIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSF/I7pU91uWtMyr2pn+qqXm02ga7XhdfgYdq3T747c=;
 b=pbDN/7w7zzzXI/w2twkXaO4VbQSH6juEFwTz29PWlwbMKr4ArZN7sGXIA/fN9kKNQ3at+zm02O+plJXGmWWd2Kql8rg4WCk2A1/5DpnMEI7YOGz5TPzt7i8SFgjCLdnTm3Cop950r7AKghkGaC/7CTBDw2EnF66sEKsPZ9Ryb2g=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1804.jpnprd01.prod.outlook.com (52.133.162.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25; Fri, 17 Apr 2020 11:15:07 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::9582:9902:5907:49e7]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::9582:9902:5907:49e7%5]) with mapi id 15.20.2900.028; Fri, 17 Apr 2020
 11:15:07 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Jason Yan <yanaijie@huawei.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: RE: [PATCH] pinctrl: rza1: remove unused 'rza1l_swio_pins'
Thread-Topic: [PATCH] pinctrl: rza1: remove unused 'rza1l_swio_pins'
Thread-Index: AQHWFJXQsXhsTZKwwEKi8S4yw1tG4qh9DNoAgAAR1gCAAAm4MA==
Date:   Fri, 17 Apr 2020 11:15:07 +0000
Message-ID: <TY1PR01MB156234F694E0056AB7CD7FFC8AD90@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20200417092042.11994-1-yanaijie@huawei.com>
 <CAMuHMdUfwbsfLNSxJLqkwTNEQims1RHBn_EwBvBUqEZshHZHdQ@mail.gmail.com>
 <76de8e85-d9a5-c58f-206e-15da59ee110e@huawei.com>
In-Reply-To: <76de8e85-d9a5-c58f-206e-15da59ee110e@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYjAwYWJjY2UtODA5Yy0xMWVhLWFhNjEtOTRlNmY3Njc5M2FlXGFtZS10ZXN0XGIwMGFiY2QwLTgwOWMtMTFlYS1hYTYxLTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iNjY5IiB0PSIxMzIzMTU5NTcwNTU0MzIzMzMiIGg9IkZjYkdMZ3hhZXlHTmd4NzFPWE94N05FRXA4WT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 77c54c26-c759-4bfb-4694-08d7e2c0963f
x-ms-traffictypediagnostic: TY1PR01MB1804:
x-microsoft-antispam-prvs: <TY1PR01MB180484301E71975919A80F7E8AD90@TY1PR01MB1804.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(6506007)(71200400001)(33656002)(54906003)(52536014)(478600001)(316002)(7696005)(4326008)(110136005)(26005)(64756008)(86362001)(2906002)(81156014)(55016002)(66946007)(66446008)(9686003)(76116006)(66476007)(8936002)(5660300002)(4744005)(8676002)(186003)(66556008);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dq9v1ruu/jGNFIFwvrxO8VoPpCStIkubCKnnNlJFcBXs5wyqG7g/ppMox/lAMmLghn62hcY6uUd+hqAUpoqeUksGUuk93F6RRHv3fbzWi446wNpa99Da60KfFyeFKSVqh3rJrnPsvmjuamGWBH/+8XADDTC54agb2rtGyi1X1JA6SAo0XV4JeXS7eUlVXosY6GDFJcqswyVhPubzjH04utusz8uQtz5v9UHHmnpfcl/7iUEvLXmSNnLFRe5OPRvJf8zcALkl1KazkI32tYCdIYb366PwJAMTBnKWU/awXxuM0VSD0YAuA5Q2WmJC8tipFRA6f4ANlNGcFeOL5QkVWIzPVtoBZ5SyA1CTzeu648JBBKcuvDuyxgJnoPcnm5KKMBAKa8TSBay4q9LCkuft59kzE1sTVZ+4y9rhP3BV+e2c2FfZBaWuZd8D99sjodaD
x-ms-exchange-antispam-messagedata: lvHXXRZhsrMIPpmXJRsYrwBR3XIWrTkeiz+Ns6Dxvi8f1ZtAB2+aIyargM2V9DnHa/MejlqvlQxK67NJQfVySY8kYHmICBjB7bc73msZEAgDczg/0OGjptpmH6DJejEeCsWN9UIxNQ3l8yZGZ5Lh6g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c54c26-c759-4bfb-4694-08d7e2c0963f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 11:15:07.6603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAOhdRTxNiP+V3aHYGX2eXYS0jZm6pH1lCP70xyIJt97txlV6rNtJ0sv/u4t/yUeH0zL7axoFXJubJKNkvNgIsN/k7v1B/L4P3BffV26xFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1804
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gRnJpLCBBcHIgMTcsIDIwMjAsIEphc29uIFlhbiB3cm90ZToNCj4gPj4gICBzdGF0aWMgY29u
c3Qgc3RydWN0IHJ6YTFfYmlkaXJfZW50cnkgcnphMWxfYmlkaXJfZW50cmllc1tSWkExX05QT1JU
U10NCj4gPSB7DQo+ID4+ICAgICAgICAgIFsxXSA9IHsgQVJSQVlfU0laRShyemExbF9iaWRpcl9w
aW5zX3AxKSwgcnphMWxfYmlkaXJfcGluc19wMSB9LA0KPiA+PiAgICAgICAgICBbM10gPSB7IEFS
UkFZX1NJWkUocnphMWxfYmlkaXJfcGluc19wMyksIHJ6YTFsX2JpZGlyX3BpbnNfcDMgfSwNCj4g
Pg0KPiA+IHJ6YTFsX3N3aW9fcGluc1tdIGlzIHVudXNlZCBiZWNhdXNlIHJ6YTFsX3N3aW9fZW50
cmllc1tdIHJlZmVycyB0byB0aGUNCj4gPiB3cm9uZyBhcnJheS4gU28gSSdkIHJhdGhlciBzZWUg
YSBwYXRjaCB0byBmaXggdGhhdCBpbnN0ZWFkLg0KPiA+DQo+IA0KPiBUaGFua3MgZm9yIHRoZSBl
eHBsYW5hdGlvbiwgSSB3aWxsIHNlbmQgYSBuZXcgb25lLg0KDQpMb29rcyBsaWtlIHRoYXQgb25l
IHdhcyBteSB0eXBvLg0KDQpUaGFuayB5b3UgR2VlcnQgZm9yIHBvaW50aW5nIHRoYXQgb3V0IQ0K
DQpDaHJpcw0KDQo=
