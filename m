Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D79F6AE38F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 16:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjCGPAO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 10:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjCGO7q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 09:59:46 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33334FF04;
        Tue,  7 Mar 2023 06:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNCEt3LF69fW+vL9GiOKHctu+5Fy87jIRJoTYfikJyPP9zLFYwl4O3Bs3MdsWdnIPHDI6+ERZfwzHBXEjeXvR1GuyrRCxXCWd+j97z//vovjZdnN6pED3IkaY5bxfupGPI27BHOFeGOmFxcDy7+XTC/A2Nltbvla8OUGDHxHgiJ5ztTHIrNe80feV+m0+i0e011sqeGz1+Loegp1d3sHfnAPxrHaVMdMxeLIvlhHn4FJZMZA4GIkSJ6R9oPyVoQ59tkSlEH+LNn8IuCoAz7M7NnXvX5wyK1MEC/5B4Ixv+H9FEj3eQf6w1PyJzk9yYhJBYSliWO4udqnsrJWMP1lYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YubNl/kF9SUYpC3ER+zc0LYHzp0Os/Y/1WYnHqlnm1M=;
 b=Eyy3XJMsB/7dxWmqqCCESFVt+EKjdYmhOklDgMgzylZdCItIJ5dvEZlZxHmYrF1xCkwJ7FVqxEGSOYDMnPSKSlNoGm0lWhajvL+etgDWtCCdYsFKaQmY6TdDl7F9qCZlAkF6KRrAPbtC0uIkx3rfe8RXedOha9mGy+251ZBpxsyqAf6eiyJFxGfXAw0vB8NXDpHzGmRK7A687YpOG22QBKHiZHoZE6hphJ9z0FSzA93+dVEQTthQ3BUkE7cX36B9qziyKf5kKwAT9dtpHai8Ve3o/JNUFczwHK3QUf1/lJ/MxYXHABtU7yU5HGveEBgmF27R1yJs9VKwsX2u9mG2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YubNl/kF9SUYpC3ER+zc0LYHzp0Os/Y/1WYnHqlnm1M=;
 b=qQ0/tEy2TFKGYq2Qk16ZFLKfDsXiuWrL8rk6lwcAXS4aU14jgfZiVA1Elfbx7VQHFV2UoYtpSrjKA4ntAixMK0zeOoJ4NSqaiW2/yee/1/4nu3esRO02jMTnX/3CcJZcV2XhnMf/xLILkXYJcvObBPgujjbEBp1JsKZVKShdkdg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11463.jpnprd01.prod.outlook.com (2603:1096:400:389::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 14:43:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 14:43:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 03/13] pinctrl: Add sysfs support
Thread-Topic: [PATCH v6 03/13] pinctrl: Add sysfs support
Thread-Index: AQHZUAod67d4ssuUm0SKoF179JRYhq7vVOYAgAAGQAA=
Date:   Tue, 7 Mar 2023 14:43:54 +0000
Message-ID: <OS0PR01MB5922171F49133EB3793BCDBF86B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
 <CACRpkdb-gyn29ns3tGXXnrGgySNP7R90h0M7fan=zeNMU7-QKg@mail.gmail.com>
In-Reply-To: <CACRpkdb-gyn29ns3tGXXnrGgySNP7R90h0M7fan=zeNMU7-QKg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11463:EE_
x-ms-office365-filtering-correlation-id: 3eab0778-95b0-4fad-06b9-08db1f1a5fd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JesY4SNzEwYdVZ/xf2mlnba7Lmnav4telDLmKR7daCdghR+J3L9fnfWaE8DhN9tjxszZBFWWS4jgscV3Qq9eRWVKxJFe9zFS63uutaa3wJo3oyV9wiJSx0kef/KzVK8uVjODIOBpNTwRT9iL0j7eyHkr0vBPI502WnHb5SBoeuomEOBabO1mmqzV0h6jOaPzqN2Vsevf1Kf5Rt78XN9v6Y/1vLvwP2rxWhFRYAX/pmJ0z7DlH3UZMl8ISr4hyniqREJBqVggskrnhNSud4ennbjfBtW+JVvKEYg97gA0H08qNfDvqJnRX8YUkIaS+EvmF9I6Q3YlzJWXuQ4WkPW7dIqzSNbNDZ8FVtz/jvQcP4qvKbidSwx5sgRpt0B+TWmYgbhyFHdwS841uqcNa/ILQTJD8wPW0szpjw5zzU4lZHXajh4Rdt5O2ha155FIer3VRkT/HczmLoc9RzAqp334lRGIrY+YYUlyi2F20gpANx+L60jW/Z710mJnzUf1VpjGZce01KiQE8vPjgGdva8oB/mgLLg5JswjYaI1VLavd90184913jnG/Tw7nwfM6kC6dBLXrWGAzNxxoXdZzNQUsSN64GDb98gJB+ttmG6apWIr3BXlnjrR8hFBBMKt5w0w0fjI+YdtxDVRxQ46OmnKDu37oxpguecOtWg2uaDmQ+Ya/BYwodD1x9cF1PB+rlSGjBYpE0gFzK8fdEV249fMuw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199018)(316002)(76116006)(8676002)(66556008)(4326008)(64756008)(66446008)(66946007)(66476007)(83380400001)(86362001)(9686003)(186003)(55016003)(122000001)(38070700005)(26005)(38100700002)(478600001)(110136005)(54906003)(53546011)(33656002)(6506007)(71200400001)(7696005)(8936002)(2906002)(66899018)(5660300002)(41300700001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU82T3E4b3haNlVXTTl0ejFPRU5UVGZkQWVXbVM4TUxDcmx1Vldva3RlSU9y?=
 =?utf-8?B?SjZZNTdnQU85RmQ3MTZoRDNub0o4TUJRbTF2MHB1dVZKUTV6L28vVFg3aDJ3?=
 =?utf-8?B?S3l3L3hTaTRTZFpKRklyRnVnanhPajJrRXhxaTQ2bVlKZmpWZ05ZSG0rbkpH?=
 =?utf-8?B?eEZpdk1ROE40Qm9qdStJa1NaK3UxbFl2L1JlNU0xWXdic2llQ1E2MHFCTWRy?=
 =?utf-8?B?c24wTU5ZcXFZSjl4cFhsRks4dTJEMDdKZXVranp6YW5YL254QlNmUS9CSDBQ?=
 =?utf-8?B?L3lPS044K0JBZ2xzRTNHelZkbVA1dW15NTh0dzNkY1hpaElqYjJFVjEvZStu?=
 =?utf-8?B?ZEhMUy9NTDYva0JLVDcvdTVURmlub2c5N0lFbnFpTG1CcTNjY2lVRXlrWFI5?=
 =?utf-8?B?V2N3ek52L0k5MnZUYUxJVWZFZ0FwK0JIWW1QNWdpYkRMSks3UXFnRnZGY2g3?=
 =?utf-8?B?NEx2amVSRk5wc21SRzZLbzVzb1V3WDM0ODNNK0ZQYzZLWCtIbzdQTlE2Mmlt?=
 =?utf-8?B?eVdVK0dONmU2UGJyM0p6bGNTOVpVdjMvUGpNTU53ajBhdFR1VStCZ2c4aFFv?=
 =?utf-8?B?eVpHOVI4VVpsQ3J4OWlQTEN3RWJWN0FpWklYdUc3UVRUUkZIdTU2YVJvREdW?=
 =?utf-8?B?YVZnU3loTU05OThMVU5PYzN3SWJKWHZSbXV1N3VsUkk2QkNGZGFVM1Rhbm9I?=
 =?utf-8?B?YThYaHRtR0ZQL1FZTXI1VnhlMG9pbzN4cCs4cU5NeFJ0Uit3NGRPaWo3bnE5?=
 =?utf-8?B?SW9wVTQxcUJGbVptbFZGbzNaeFl3RitMT08xa2ozUHg5emtMcVcrWUNMNTZU?=
 =?utf-8?B?TTIvNldZTGVJMzdkREp0YkE1RVVnWkpESXV2NWtPQmtFU3BpWi9Jd3ZGVnNy?=
 =?utf-8?B?WjNMMjVma1NJV0k4Y1VKYVdOZWFuQWZEV21TT3d0ZDM0ckF1OVFyRzI2b1Zq?=
 =?utf-8?B?K0VmanN6Ri9haklBa0NUaDZxeXd6ZWRKTk1KY2Z1SHNCL1RRbTkrYTRLK3RR?=
 =?utf-8?B?a0pnRXJGQVFTT0pOUTh0RDkydGNQYWpzbjE4WGhMWURRNVVyeU5jOWhBd3RK?=
 =?utf-8?B?WmFhVUNjUkpkNmxvZFVCTTlVSVlXd0ZtZjZhRzlPblBZUm5abStkditiNHZ3?=
 =?utf-8?B?ZURucEVpa25vY2k4WVczYm91Z1hxZEFqTWN2RkNFaVY1QmJaVGNPUTVGbFc2?=
 =?utf-8?B?TDdGUkVLVy9wOEVXcGhjbUFjWXFrYVYweXUrVXVYUHJxWlNBZUdNVW9wcktq?=
 =?utf-8?B?dDVQL1NTaG5Ga2duRzBMd09wWUtzZGlWZGVyV29qM3g0aWIzUy8rTFBoVDhx?=
 =?utf-8?B?SXVqbzJjUG92VFAwdW84OUI3SGkwN0F5NVZuR1dIRyt0NDRobTVpVUYvVnBR?=
 =?utf-8?B?MEIydWJpa2JvMFZqUXNNQlpNS2MrV0FqZXNDZ2JOR2ttbTRIcStFS0dwRGZq?=
 =?utf-8?B?VmVGdE5KQlNQQTFzMFJuVzcwT1pPQXllYkYrU2dWaGpLRUdzOFYxV2pBc0Mw?=
 =?utf-8?B?STRJaU9JbUgyQVBOeDV5VTBnS2FteGZVQlVGamZ1NU91WkFBRHNhaUJ5ZXds?=
 =?utf-8?B?Wk9vMGZRdWFISjRFenZzaUVacUlYenlmYkFIZEh1OUtMOGxBOFIvdTcvcnJa?=
 =?utf-8?B?NTNyU1p4R0NnK2l5VEpTdmNkdkxGb1B1UmhRZ29XY0dNZ0JjZlJKRGhjei9U?=
 =?utf-8?B?ZldybklIb3o1RUs1UHpNWTh6ZUJZU0g4V1JvZkdZZS9CamlGdzF5eFBQbVZv?=
 =?utf-8?B?TDdlQlhKeEtQajlISHBob2lzaE5sc3VBVlZyVUh3aEtZSDZ3U0NIYVlCdVRl?=
 =?utf-8?B?c0EvYTZ3NXNCZTA3UTJiWFRkZkVKRFZNWUxzRWlZeTBob2hHeHo2aGdoTUs2?=
 =?utf-8?B?NFNnc2pGV01tYkpFanJhZHhyNGNvZlJNWDNKVlVSWUc4cDV4U0dTaXlQV3FQ?=
 =?utf-8?B?U3J1WEl5c0E2MEtNUmgxZGZTdlVIVFZKZFVWTXlJeXRkRUQ1Qi9yWXBvVmd4?=
 =?utf-8?B?WFAyK2Z2SHVxVGY0ek53a0JNU0RJS3d1dXVPY0hOREtraHVJaXFXanc5KzlX?=
 =?utf-8?B?dzU2aCtSM1NTVU5nSk9HbWQ4L1UwdWtISGJYdWNmRVdUY1hrSGVvcGE4WW9I?=
 =?utf-8?Q?qBtbPXyAqf0jeCwkixQt+gS1a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eab0778-95b0-4fad-06b9-08db1f1a5fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 14:43:54.0308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sJEarVPaZr1Xackn7g+zoHdv34+IFdFphFK4Iq5XSlGq1YUZbRfb8NuEvjTOwsDtis2u6y7BtHrudEq887vGyM6wTy5tVfpSClldwRbPlWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11463
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMgV2FsbGVpaiwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NiAwMy8xM10gcGluY3RybDogQWRkIHN5c2ZzIHN1cHBvcnQNCj4gDQo+
IE9uIE1vbiwgTWFyIDYsIDIwMjMgYXQgMTA6MDAgQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gDQo+ID4gQWRkIGEgc2ltcGxlIHN5c2ZzIGludGVyZmFj
ZSB0byB0aGUgZ2VuZXJpYyBwaW5jdHJsIGZyYW1ld29yayBmb3INCj4gPiBjb25maWd1cmluZyBw
aW5zIGZvciBvdXRwdXQgZGlzYWJsZSBvcGVyYXRpb24uDQo+ID4NCj4gPiAvc3lzL2NsYXNzL3Bp
bmN0cmwvDQo+ID4gICBgLS0gb3V0cHV0LWRpc2FibGUvDQo+ID4gICAgICAgfC0tIGNvbmZpZ3Vy
ZSAgICAody9vKSBhc2sgdGhlIGtlcm5lbCB0byBjb25maWd1cmUgYSBwaW4gZ3JvdXANCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvciBvdXRwdXQgZGlzYWJsZSBvcGVyYXRpb24u
DQo+ID4NCj4gPiAgIGVjaG8gIjxncm91cC1uYW1lIGZ1bmN0aW9uLW5hbWUgMCAxPiIgPiBjb25m
aWd1cmUNCj4gPg0KPiA+IFRoZSBleGlzdGluZyAicGlubXV4LWZ1bmN0aW9ucyIgZGVidWdmcyBm
aWxlIGxpc3RzIHRoZSBwaW4gZnVuY3Rpb25zDQo+ID4gcmVnaXN0ZXJlZCBmb3IgdGhlIHBpbiBj
b250cm9sbGVyLiBGb3IgZXhhbXBsZToNCj4gPg0KPiA+ICAgZnVuY3Rpb24gMDogdXNiMCwgZ3Jv
dXBzID0gWyB1c2IwIF0NCj4gPiAgIGZ1bmN0aW9uIDE6IHVzYjEsIGdyb3VwcyA9IFsgdXNiMSBd
DQo+ID4gICBmdW5jdGlvbiAyOiBncHQ0LXBpbnMsIGdyb3VwcyA9IFsgZ3B0NC1waW5zIF0NCj4g
PiAgIGZ1bmN0aW9uIDM6IHNjaWYwLCBncm91cHMgPSBbIHNjaWYwIF0NCj4gPiAgIGZ1bmN0aW9u
IDQ6IHNjaWYyLCBncm91cHMgPSBbIHNjaWYyIF0NCj4gPiAgIGZ1bmN0aW9uIDU6IHNwaTEsIGdy
b3VwcyA9IFsgc3BpMSBdDQo+ID4NCj4gPiBUbyBjb25maWd1cmUgZ3B0NC1waW5zIGZvciBvdXRw
dXQgZGlzYWJsZSBhY3RpdmF0aW9uIGJ5IHVzZXI6DQo+ID4NCj4gPiAgIGVjaG8gImdwdDQtcGlu
cyBncHQ0LXBpbnMgMCAxIiA+IGNvbmZpZ3VyZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gDQo+IFlvdSBoYXZlIHRv
IHJ1biB0aGluZ3MgbGlrZSB0aGlzIGJ5IEdyZWcgSy1IIChhZGRlIG9uIFRvKQ0KPiANCj4gPiAr
c3RhdGljIHN0cnVjdCBjbGFzcyBwaW5jdHJsX2NsYXNzID0gew0KPiA+ICsgICAgICAgLm5hbWUg
PSAicGluY3RybCIsDQo+ID4gKyAgICAgICAub3duZXIgPSBUSElTX01PRFVMRSwNCj4gPiArICAg
ICAgIC5kZXZfZ3JvdXBzID0gcGluY3RybF9ncm91cHMsDQo+ID4gK307DQo+IA0KPiBXaHkgYXJl
IHlvdSBhZGRpbmcgYSBuZXcgZGV2aWNlIGNsYXNzPw0KPiANCj4gSUlSQyBHcmVnIGRvbid0IGxp
a2UgdGhlbSwgd2Ugc2hvdWxkIHByb2JhYmx5IGp1c3QgZGVhbCB3aXRoIHRoZSBkZXZpY2VzDQo+
IGRpcmVjdGx5IG9uIHRoZSBidXMgd2hlcmUgdGhleSBhcmUsIHdoaWNoIGFsc28gaW1wbGllcyBz
b21lIHRvcG9sb2d5IHNlYXJjaA0KPiBldGMgd2hpY2ggaXMgYSBmZWF0dXJlLg0KDQpJIGFtIG9r
IGZvciBib3RoLCANCg0KSSB0aG91Z2h0IGFkZGluZyBuZXcgZGV2aWNlIGNsYXNzIHdpbGwgYmUg
bW9yZSBnZW5lcmljIGFuZCANCnBlb3BsZSBjYW4gdXNlIHNpbXBsZSBzeXNmc1sxXSBsaWtlIHB3
bSBmb3Igb3V0cHV0IGRpc2FibGUgb3BlcmF0aW9uDQpyYXRoZXIgdGhhbiB0aGUgU29DIHNwZWNp
ZmljIG9wZXJhdGlvblsyXS4NCg0KWzFdDQovc3lzL2NsYXNzL3BpbmN0cmwvb3V0cHV0LWRpc2Fi
bGUvY29uZmlndXJlDQoNCnZzDQoNClsyXQ0KL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMTAz
MDAwMC5waW5jdHJsL291dHB1dF9kaXNhYmxlDQoNCkNoZWVycywNCkJpanUNCg0K
