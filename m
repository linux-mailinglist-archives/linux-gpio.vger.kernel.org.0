Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4C02608C1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 04:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgIHCpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 22:45:38 -0400
Received: from mail-eopbgr10044.outbound.protection.outlook.com ([40.107.1.44]:46567
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728188AbgIHCpa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 22:45:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itCgntbZNDDvRZ6uwhrHtKcRa9EDtGwcqfJgc23zHceN4qCK7bBFFcYIXtzhZQmFzMNWu7SnJo7GFWM36ydn8q4n6jbcSr/X1GWpMXQp6MYmJDMAnbGC/B39TMESFyxUk9mJmCYHlmtrgTfECu0VeDB5kZR0stS3ZmRNDbYoq+FZt1+Jjy2CrEe2XNOCXyhZvcv58HRpt2rNTSnBQD6UakVFSm/iXXwmXe9e9GyH1K0c7g5SsSmXcEEU3nfrYevweFXBObHKZfH9VpG/d2oo/Xg55+Cxg+5rb5U8FtK5CBJUSOnnUyxbZfUQQi6DdXKk51jNB8V7N4TZO92fXea9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fFLSVlonnQdUwVxybbrJl8pcXLdh0UzL5a8L1vhltk=;
 b=M6Jp7mo2SM5iiUB5ycpmb/rgqKWs5zUheVPSXO0X3XR3XyOr66oPIDYem4Xy/gvLYddDUgg6yQ8Yu8THs5quUraUR64xAyJC+bRFwV5jRQzLRRyEP+bXUfAYS9Cyo/7EHz+a0No189Q8Hsf76tjKo+7O2PniTGPuts8NHBqj0Whgg9AqmqGkMfpCPv9NKmxKPSD13WkhuwI4rYiwHEZgjbyiNXSPTzt7Neoha+0MR/+bJoB+U01TLDNqBx99DocYl6ieEW+3W7InihN/nmHKjPAoSoB3iqjW5INwaTA9HiVryahrb+8NwFZao1uI7f0balW+TB/zQu+s/8y0nJG/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fFLSVlonnQdUwVxybbrJl8pcXLdh0UzL5a8L1vhltk=;
 b=P5gtqIka3vG+GWPLDnbdp2Rg0WqCtH5tUdSARm+0mHXieTQCxaNvdR7sQoWbKFXIXOQ3BMf5F6i3zKP2cxZ7kKxseCX5mTkEDbNsc71jR8xYbHJUwVvt+Xgu+psftnQn8HxQv/StSzq1RRIRpyLlIIJ/XlSNgvDrNOYoAZChnqs=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 02:45:27 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 02:45:26 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 3/3] pinctrl: imx: Support building i.MX pinctrl core
 driver as module
Thread-Topic: [PATCH V2 3/3] pinctrl: imx: Support building i.MX pinctrl core
 driver as module
Thread-Index: AQHWhRQSNaVgDmc/bEaKQL/qJCRbP6leCe/g
Date:   Tue, 8 Sep 2020 02:45:26 +0000
Message-ID: <AM6PR04MB4966AD60490762DC011C4E0280290@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1599481953-32704-1-git-send-email-Anson.Huang@nxp.com>
 <1599481953-32704-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1599481953-32704-3-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8cf6048c-d422-42a9-50a1-08d853a13e1d
x-ms-traffictypediagnostic: AM7PR04MB6821:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6821DA50A4A1B55BEBAA9F5380290@AM7PR04MB6821.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QOPVtPa047u0IP8zA7+K04tuNGcJBo5J862X6e/namOMf9PnklVuZPLrchMSd771qwwmzqasnDolPGh63kS132M/sRVpUmeKfTerSd14GMaRaDaoNEvp9YDHiaYAstuGs6ELgIOBtbHwqInVTXIgcdbogD1h7HYENFXItqU/1oPQI43ZfVUOVvPzY87NR1Nz+8NOpePF+oHTzNoZLh87Fqzi0cXY8uQHD+ryXjjjzccxIj49y0HZ8w2qKuVbPVY7A8pDZt51S0uMUuVWjF0jCot32I3FSHWJMYsymBVfZQxD2NK3BMW+F7zVOoizz86XFPcEEwjZXNqcOeVX9tQwlnHSRtEg5kTml7z4yfVwlsOWTaAvuMPISD93/r/ksIDr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(55016002)(478600001)(52536014)(76116006)(66946007)(71200400001)(86362001)(6506007)(33656002)(7696005)(8676002)(9686003)(26005)(186003)(44832011)(2906002)(5660300002)(8936002)(110136005)(66446008)(64756008)(66556008)(66476007)(316002)(4326008)(4744005)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: lPVnLjbVhuyFteYIzbt5Bu2I2yvXmBZ2Ptkcqp0E6NWYF+uXTxrhS8fatzEn5KCaiNyvCeAk/hc30EEchGbcWIY9+lwDMBH39N9fQ3yzDHzGzSJC/+vdY/DPPMRdGKM9bcRxovGs2Lb1yY2dOpzE2xRyqIyuwx+IxVbeDeMd46MMSEoWDRK0U7ItiLNr7S3PkR0enV+nYHGz4OOL8LAWM3lt+aUb+UujhAh/E5OB5dmPFrUxHY/+HyAy/u37B2snLM3/GWg1vIztDuKXgMqFkDsARNiKlm+PnwcT9hmKVoFPWL9EJOlXALXdL6c8niO16U/crDwby1YuJ7zGn0rBtfv3gRHNj9k/gwdB1MfQsdN5L+EhMjg7xdzObph6zNkDVsYxOoodQVv5FvZaejuR0PmR4kNpQJMOAcIjXA9/dlltDsW8ZsZ9t2SC8U4cuXCttpcupbj8QYj903lPsfhn3Zs7T8Pvei7QLwu61b7QLeiQcteNapU9IF5a/mbczl2YGh1xBmkmc57fuyO5tsCOYgc1M5aQ2WVhME5pDXFhSTMFlUqS88zRc4vVXsAxDtGEYTfbqkY1wEFp7QC4870ofU5q2RHxrxSSXiwwNXCxXFn4L9Q60cYeDGSCsbG3Kw7tX+7sOXPM2QvlPqxzfpctCg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf6048c-d422-42a9-50a1-08d853a13e1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 02:45:26.9084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSjqy9pl0Ij9DgNuPKqfxkSTdOYsszUUBbfbIWf+Zq7tezCttENNc5CzD5bmUxtkbvfyKoLP5663xx3mxKsuuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6821
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gU2VudDogTW9uZGF5
LCBTZXB0ZW1iZXIgNywgMjAyMCA4OjMzIFBNDQo+IA0KPiBDaGFuZ2UgUElOQ1RSTF9JTVggdG8g
dHJpc3RhdGUgdG8gc3VwcG9ydCBsb2FkYWJsZSBtb2R1bGUgYnVpbGQuDQo+IA0KPiBBbmQgaS5N
WCBjb21tb24gcGluY3RybCBkcml2ZXIgc2hvdWxkIGRlcGVuZCBvbiBDT05GSUdfT0YgdG8gbWFr
ZSBzdXJlIG5vDQo+IGJ1aWxkIGVycm9yIHdoZW4gaS5NWCBjb21tb24gcGluY3RybCBkcml2ZXIg
aXMgZW5hYmxlZCBmb3IgZGlmZmVyZW50DQo+IGFyY2hpdGVjdHVyZXMgd2l0aG91dCBDT05GSUdf
T0YuDQo+IA0KPiBBbHNvIGFkZCBtb2R1bGUgYXV0aG9yLCBkZXNjcmlwdGlvbiBhbmQgbGljZW5z
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29t
Pg0KDQpSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0K
UmVnYXJkcw0KQWlzaGVuZw0K
