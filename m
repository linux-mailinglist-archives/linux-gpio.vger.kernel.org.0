Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4782E081B
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 10:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgLVJ0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 04:26:06 -0500
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:36027
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725885AbgLVJ0E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 04:26:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlJHgFAQXsGfuy1WHeyQ6O6Jr0HCvJdIdES1011cglpeLi5q70blBmSKmyDEw08AE5THS2T1Hz/3xpN55DFoNxNZ8NlMs6hwOPVI6dmbJ1FhlmJ9IzFSq3RYrkgIjLnUKMSYaB25cApS412TKEHwGMgDOVSpYLao/5wceBCwVnzTcbn43aYAcxM0PbElhSUVeJtFw9ZLJpV5Spc/0DgYlZShCYfz4Mojx7AXQPAtcPrwpWsWAyBwXP5Rg0PAE2Fpi6J055/Q5jQ/dZOt66rzginDJqEm0IehEPoRf7UPyElppV0KUJboRYIQC7uD/huUvigCDLQd25ICvvtEkMYErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LLxtMylsUu+3TVxdP37OrNEGhikyBFcCFSRaexn9ak=;
 b=meUpnYneDaqgfUTEcpTV2f3+1fio6Vl1yJZ3dI+HQUmzK602vsPTOtmLdY1NBv49Refq6/qrQmSDE3E6Amhj4LQtfWHt5t4jgDRNFWVdmT+yGE31tWZsCeGKdbBOGBBhfIw992JOfbJa5yTa2CIvsG6YXzkt8nxKzJu+4g7D+591bUlzS592Db16esk+TQkeD3pwB9Pngy5Vh4gE+tq6ueXq0LzbTjg3Pk1Ult6I5elcyZcuivC1TvKUyyzVMM6NX9xI0iKrEc4jlBSIBh6EhX00qJISHFiJz74uErVAG91OcfZAS7RCW9Ykgl6KUN1xMDjFqUt9Qge0qMNSZh+eHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LLxtMylsUu+3TVxdP37OrNEGhikyBFcCFSRaexn9ak=;
 b=AOl+FK561ZGjIEX9a0D/BhuX108abWvF8HgQvKU3H5Lo6kN+qIA7Rx+ccbHEHT5n5WM1nnjeqmpJxx/e+aQj5RDCxnarsyDGXpvPWFTC0eAOlmP4rz1bOpuiUm5es6CSlgRnd4j0CbW7ACMeqkCKPdaPrM8+/0f1mscHjXp2iRs=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3647.jpnprd01.prod.outlook.com (2603:1096:404:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 09:25:16 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:25:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Topic: [PATCH v4 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Thread-Index: AQHW10SlPV/4ngF3JE6rHPoSH4m/D6oC0DsAgAAHJQCAAAJQAA==
Date:   Tue, 22 Dec 2020 09:25:16 +0000
Message-ID: <TY2PR01MB3692B09ECBAD4FFDB885E530D8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608519279-13341-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdVw_+dj78oygsVFnc4j9sTj97h1Q0GBp7oGWzakxCPfQA@mail.gmail.com>
 <c15b40d02d75a613194a454b4d8a2586639bda93.camel@fi.rohmeurope.com>
In-Reply-To: <c15b40d02d75a613194a454b4d8a2586639bda93.camel@fi.rohmeurope.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:21dc:f9ce:ff84:4ded]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a98c2e49-fb77-4261-f391-08d8a65b7e5f
x-ms-traffictypediagnostic: TYAPR01MB3647:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3647B814DCC4E2635C5EE6ECD8DF0@TYAPR01MB3647.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WMwEUohmVOHlCZbyrr+emKtU+7LvY9b52FNR2vcYenXq3OlxnyggK5IHGYiCs3/RlBbx4MfQ3JqEUFa7sbBEfhOCULbNiPXhkEV8AVwprtywC50xUDEQTaUJTzOnsbXTf1y7g9GI9YlfNOrliLgN3fQ307nXj7XLeWb+1a9tdcnPBqSQNRHDp60tQs3L6Ddjm0ISE8VMCddZz6mIZPcO129w2DslZe17m7rPCiL/IbqOCGjY/9N9pZk0l1njz/qffqA3LQr91JghQk0RnGC7SYmRDq+7UAfhWwgANbMNr8mVDTX3uRo5ZZHIQTX8j9azbX8f1cyum+cyRbegZdM+Ms6u2PTfGFhHd9RweHaQxBmVleth+tT5hOiOVFZBOBYuuLa+QpKJwjQRMvDcXdilQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(66946007)(4001150100001)(110136005)(7416002)(6506007)(7696005)(478600001)(66476007)(66556008)(76116006)(186003)(4326008)(86362001)(5660300002)(64756008)(53546011)(71200400001)(8676002)(2906002)(52536014)(8936002)(33656002)(55016002)(9686003)(54906003)(316002)(66446008)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SytXTVBZYUNtOWtBSDhaNzZodjdXeDZQakp3WFdEdTJvcTZJMXp1U1QzQVdh?=
 =?utf-8?B?dDIzdzNuQjhnT3RydGx4bDlJWHBvQU5XcTY5VjN2c094Qmxwb3JwVktuclk4?=
 =?utf-8?B?OVZGalRSN3h4aUJMZVhJbm5jMmxqYTVrTXltN0ZFSmxGQzlBclVxTXZnbjhC?=
 =?utf-8?B?TWJtcGRGZ3JMb29tckg3UEFvaWZReGcyU3d6Znp3ZmNiOW9xSGhMODMyZklt?=
 =?utf-8?B?RDI4VWhqRnVaR0lRVDFISklLa1NVa0QyaFVnQzdxUFBNTjYzT29lb1RNb29G?=
 =?utf-8?B?c3dONkxyYzRpUzZPMjFHVTFWS1BWMHI5VlR3dGt6T3pZYTE1YzJsT0dtNVBQ?=
 =?utf-8?B?WEViZmFON3VwSGpxVnMzL2Q3MEF0RldxTitvcU5TeFViSnJXemYvUTJHZ2Rh?=
 =?utf-8?B?UGpZZFhxaXRST1ZVWm52VFByeDNrOVJSM1YyaFFGcEJCb3lhdER3MFZMMlc4?=
 =?utf-8?B?Q0VuYnBMRm5nS0hOdGNLOW1pVTA3RVhDY3FURzZXOG9XTnFMRXpneGc4QXAr?=
 =?utf-8?B?QUNiZjNZNGhiQ0Z3ejZ3V1R0a3ltclJzVmp3SHBBSzdCaTl2clpYc1I4THhn?=
 =?utf-8?B?VGVodFI4YldUR0RrM2J6KzdLT3FHL041NjhDWEJ1UEpvQkQ3dW1IaDN0YVh6?=
 =?utf-8?B?dWE0SmtKL2hmRmM0dTlLblBKcEVPY040M3dsVUIzYTBFK0xZV0UrZ0FkL0p0?=
 =?utf-8?B?d0syc1RIMFV6NGxSckUzSjJWRUN5UC9neXFZb3NtbnBoeXJKVmU2dGlXY0tF?=
 =?utf-8?B?TDRnSDJOaXR4OGhSQTcrandyWGl6RWJ2ZXZES0phRFZnZ2lvdHprRHZ0M25y?=
 =?utf-8?B?bms1dGNSbklCSW9RWGdIQjZ5Ukh0ak9PZXhaMUtremx2UUhPdW95Z2w5eHNy?=
 =?utf-8?B?ZHBYZStrQXE0ZkxUSk9VeGFsbTk4Z2taL2xIVmpsVFR5NTNranBJMEFjelYy?=
 =?utf-8?B?dHRTVEtXOW5RVHg0VHA2SnFmZzIwdmhRaFRFSktQdkVPVjl5MFRNbldoelk2?=
 =?utf-8?B?V3VqU000OFRISUxCQTc1YWZhSmpydWRsK2xSWG1Fbnh1SWdUaUo5dGMrUXdC?=
 =?utf-8?B?Vkwzc3hIaktidVhEUDNwZmFhN2FGTkNpMU1QM3RuMTJIQW9RSldzU1E4VEJ3?=
 =?utf-8?B?bVNESHdpcUQxOVdPL3ZwMjlaa2lDeTl0Y1Y3TU50UzNVaFlrV3VZMnY1eC9S?=
 =?utf-8?B?NFBmTHQ3aHhQcWlmK0tkTTQvenpELzNTekdEYXBQYnRZU09UMzdRS2VnRWx3?=
 =?utf-8?B?YW0xMmFQM3EzbHMxblFtV2k1ODRadkFvcEd4dmk0QkpVTVNsYlpoOXRuTzk0?=
 =?utf-8?B?VjFqTmt5NjhjNFdJQ0tZMEwwWlBlT3ZrVnNiRDl0VENpSGd0RmhwMm1kVnhB?=
 =?utf-8?Q?N0s/B0Kn2tko8fNidK/aKjpggipVbNcM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98c2e49-fb77-4261-f391-08d8a65b7e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 09:25:16.4737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XEcNuDsP7+xvCbJmWWcbkImkwnCPT6YTuUes5aH1z67CQ7nzsndIkWouOVUVUb+hvkioVZYXUtleisxFO4y8FzlR07OHImwQKloZlhgAIdt7jKbySJ0OL0L7sY08XDWf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3647
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWF0dGktc2FuLA0KDQo+IEZyb206IFZhaXR0aW5lbiwgTWF0dGksIFNlbnQ6IFR1ZXNkYXks
IERlY2VtYmVyIDIyLCAyMDIwIDY6MTUgUE0NCj4gDQo+IE9uIFR1ZSwgMjAyMC0xMi0yMiBhdCAw
OTo0OSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+IE9uIE1vbiwgRGVjIDIx
LCAyMDIwIGF0IDM6NTcgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPiA8eW9zaGloaXJvLnNoaW1v
ZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gVXNlIGRldl9yZWdtYXBfYWRkX2lycV9j
aGlwKCkgdG8gc2ltcGxpZnkgdGhlIGNvZGUuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
WW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+
ID4gQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4NCj4g
Pg0KPiA+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPg0KPiBSZXZpZXdlZC1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5A
Zmkucm9obWV1cm9wZS5jb20+DQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4gSSB0
aG91Z2h0IEkgZGlkIHJldmlldyB0aGlzIGVhcmxpZXIuLi4NCg0KWW91J3JlIGNvcnJlY3QuIEkn
bSBzb3JyeSwgSSBjb21wbGV0ZWx5IG92ZXJsb29rZWQgeW91ciBSZXZpZXdlZC1ieQ0KdGFnIGlu
IHByZXZpb3VzLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
