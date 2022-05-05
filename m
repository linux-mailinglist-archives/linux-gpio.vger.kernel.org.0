Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0901A51BB4C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 10:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345343AbiEEJCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 05:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbiEEJCb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 05:02:31 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC7E4B1C5;
        Thu,  5 May 2022 01:58:52 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2458wkh4042367;
        Thu, 5 May 2022 03:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1651741126;
        bh=/ERSrtnW080lHG0uAK8hOjnqXgpAuvT8+uW0erq7CVM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=eeZUwDAIrLcAfvNnpvAnrD8G1v8VzZYkqJ8zfEKKWdQxIfIZFTsISBN9PTp+5zqFr
         Lp40bUrbeBECvtBce2erYStjmaGbZ7WnImxlj4e8uyShtK64Ws7lSXxAEAtWJUcjAy
         CCGLJnMmXlRh8VziN2ULWuWY+hihk8fJBIKTBMWo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2458wkkp037169
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 May 2022 03:58:46 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 5
 May 2022 03:58:45 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2308.014; Thu, 5 May 2022 03:58:45 -0500
From:   "M, Aparna" <a-m1@ti.com>
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "Govindraju, Aswath" <a-govindraju@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>,
        "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller
 bindings to YAML
Thread-Topic: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO
 Controller bindings to YAML
Thread-Index: AQHYYF5TXqMLIteje06nkAveL3LoWA==
Date:   Thu, 5 May 2022 08:58:45 +0000
Message-ID: <e682175fcfc54217a6ed006270877f4d@ti.com>
References: <20220223174215.17838-1-a-m1@ti.com>
 <CACRpkdbj2B90-RE2XKQJ5qEj1hZQA-u=vUu2vpXwNqQLf_kaPg@mail.gmail.com>
In-Reply-To: <CACRpkdbj2B90-RE2XKQJ5qEj1hZQA-u=vUu2vpXwNqQLf_kaPg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: DFLE111.ent.ti.com (15.01.2308.014)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.24.159.86]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-ID: <88ED82CFF925304C89778BDE264DAEDD@owa.mail.ti.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

K1ZpZ25lc2gNCg0KUGluZy4gQ2FuIHRoaXMgYmUgcGlja2VkIHVwIGZvciBuZXh0IG1lcmdlIGN5
Y2xlPw0KDQpPbiAxNS8wMy8yMiAwNjozMSwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gT24gV2Vk
LCBGZWIgMjMsIDIwMjIgYXQgNjo0MiBQTSBBcGFybmEgTSA8YS1tMUB0aS5jb20+IHdyb3RlOg0K
Pg0KPj4gQ29udmVydCBncGlvLXRwaWMyODEwIGJpbmRpbmdzIHRvIHlhbWwgZm9ybWF0IGFuZCBy
ZW1vdmUgb3V0ZGF0ZWQNCj4+IGJpbmRpbmdzIGluIC50eHQgZm9ybWF0Lg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEFwYXJuYSBNIDxhLW0xQHRpLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdh
bGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4NCj4gWW91cnMsDQo+IExpbnVzIFdh
bGxlaWoNCj4NClRoYW5rcywNCi0tIA0KQXBhcm5hIE0NCg0K
