Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE94AF2C4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 00:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbfIJWFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 18:05:49 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:56100 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725875AbfIJWFt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Sep 2019 18:05:49 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8ALvFav009823;
        Tue, 10 Sep 2019 15:05:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Oi1aRQuIHWWpAPjw0A/tkFVK/FRrpdHJcjfu2BWSOqU=;
 b=Qusch0roIpdObaCUq0cO95k/++MFTvFaYmyrdSTmiWCG+ZPHq1QlK3ylK+d1KqvDb+z/
 U7oT7PbwoJRY5CVJMZr50634ioZ5IWBCDmY6tsqc54NKDKiCRTi3gzcqJaDM+ch2masp
 EMlnxtIyN+KIWwgQTfW+FPdrpfojSUuh0jg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
        by m0001303.ppops.net with ESMTP id 2uxf95t2jx-18
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 10 Sep 2019 15:05:29 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 10 Sep 2019 15:05:18 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 10 Sep 2019 15:05:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVBLBOiAJEx3hj4uRCQjoaXD0XU5MRFYZo8ZtdsYEQ7DA3rMASqxv+SoO+FWU3aVunL/KiYczcvhg9AB1eLqANcCOkenLzvmD8Iwj4k4M4ANeuTVwkZY8skKBlVX1Kds6QontxhmBAP83z8AzZ+MIbkSTj1e3y7dZlH7pbu8djJxCBYHY3SINcdgvl5g4aXqy+yLuM9o3HKaGBT7HMOspg5HWh9vcR8nZu6tGeUqGmJDSi46POfWOqMzZI4QvsFHP8vyCTOdahnSgJ/1UgRutBNKlNhjQYfcQyeRRrT5EfLyyMfS5uAee5X+6RezLhQk8mnSZPgt8SQfIE3jd3xQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi1aRQuIHWWpAPjw0A/tkFVK/FRrpdHJcjfu2BWSOqU=;
 b=OwMXEE3j2qyO3uqCmR8IELPFPRpecY+lnu4tmVWLvEz50YbLDWNNThr629EJYk8XD70ZIZDil8+9vtkt37Nx+PByWnB+bH3/eBhITudTRDcYQXouS6zZ0hLij8Fx0KIBgWAgoOgdCxHapsGC+U3cnOkESGiZ1XwuzhJzHBnTLD/OJaHYR3I443FwDo9GyZ6jODhVkOHgWPVqftoSmN9mdaWQqWlBF+ax/4IqQAQbXoKq6L24JlSXI4Q2Bwr51OGla2qn7BDGxvWQjfl6NHmrItgbuBb3af1DlszAXIilm9HiQ7ZXZyQWrK7ssSf4R2Wa9IQbz1f9GHQfz8QiM9UaBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi1aRQuIHWWpAPjw0A/tkFVK/FRrpdHJcjfu2BWSOqU=;
 b=OtMIX1aI7k/QqurjUXCCHcpNa5IOYiyxMOLiCenGSOq+mFBJapbcREKix//Tj9xT5Xl9ofdlK8YVz+n9prw+aBWkAS4zx9Efm5Rs6EVUrlgfQ1d54PpuBzrrqc0CHHF3Z6dB0skw66CnwDTmT7mhEXAy641mwxQXGKzbRxdCW1U=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1494.namprd15.prod.outlook.com (10.172.160.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 22:05:16 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::38b1:336:13e6:b02b]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::38b1:336:13e6:b02b%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 22:05:16 +0000
From:   Vijay Khemka <vijaykhemka@fb.com>
To:     Rashmica Gupta <rashmica.g@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] gpio/aspeed: Fix incorrect number of banks
Thread-Topic: [PATCH v2 1/4] gpio/aspeed: Fix incorrect number of banks
Thread-Index: AQHVY4eukfcaDm3E3UCrHqUIDwG6LKclCz8A
Date:   Tue, 10 Sep 2019 22:05:16 +0000
Message-ID: <4DEF3F24-0249-4A77-981C-EB62EEC29A92@fb.com>
References: <20190905011635.15902-1-rashmica.g@gmail.com>
In-Reply-To: <20190905011635.15902-1-rashmica.g@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:1b73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7ebd765-f157-4e10-7700-08d7363af698
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR15MB1494;
x-ms-traffictypediagnostic: CY4PR15MB1494:
x-microsoft-antispam-prvs: <CY4PR15MB14943CA2FDFBED9838FEAA39DDB60@CY4PR15MB1494.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(366004)(346002)(376002)(39860400002)(199004)(189003)(91956017)(11346002)(99286004)(66446008)(36756003)(4326008)(2616005)(25786009)(5660300002)(186003)(305945005)(86362001)(6486002)(6436002)(15650500001)(229853002)(46003)(4744005)(6512007)(14454004)(110136005)(8676002)(76176011)(54906003)(256004)(14444005)(7736002)(81156014)(81166006)(6506007)(76116006)(2906002)(8936002)(6246003)(486006)(478600001)(316002)(476003)(102836004)(71200400001)(66946007)(64756008)(2501003)(66476007)(53936002)(66556008)(33656002)(6116002)(446003)(71190400001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR15MB1494;H:CY4PR15MB1269.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HRoumQrngF3joe0cWmM42WJ/fEeBRSKNxvJOH66pglOWJlVOo04hFR3pkx1Re1RTFmWzMrZT5IhTE+3lA4VaRE9EbM+s1PbiJiFAHs//3UVtg/jmB8+bgF9h2OsaIovDyOd+5LrTH84WCrw0sRJ4bZQebwZV66fU2ZhbmcafUTpn3j6ggAxxhFRwIyfR1ikQGGDbaUihYw56vPUSZGsiSDuamVgH2IqkZ/W/nmCkAEuYaEtiOWELSTE8NsXeJy3aV5KdvJnTHOKIWU+mAJx/dY17TEZ1mrp7/ZWdle4ECwLitinhJv6qXyotrsFySc4UkY4UxX10MBA9UfqJqF/upem9bjAp6sl50HC54anWHzsTxtNHCWhdOD32xJ9ml/FOMMucoq/7R1qPoJgZrGEEQ9nqSBxvMd8o3UcjUYpofxo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <04CABF0679C2A6449F9C3251D1D066A9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ebd765-f157-4e10-7700-08d7363af698
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 22:05:16.8514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RSNdzNTdY4L0p1SEgu4xSQgl+8W3qWp7Qhij8q5AR1L9jLbzSxjtepnL2QnaM6G8PTyyIxOzo6AHiPkXQ+dPmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1494
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-10_12:2019-09-10,2019-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 phishscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909100207
X-FB-Internal: deliver
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCu+7v09uIDkvNC8xOSwgNjoxNyBQTSwgIkxpbnV4LWFzcGVlZCBvbiBiZWhhbGYgb2YgUmFz
aG1pY2EgR3VwdGEiIDxsaW51eC1hc3BlZWQtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlz
dHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2YgcmFzaG1pY2EuZ0BnbWFpbC5jb20+IHdyb3RlOg0K
DQogICAgVGhlIGN1cnJlbnQgY2FsY3VsYXRpb24gZm9yIHRoZSBudW1iZXIgb2YgR1BJTyBiYW5r
cyBpcyBvbmx5IGNvcnJlY3QgaWYNCiAgICB0aGUgbnVtYmVyIG9mIEdQSU9zIGlzIGEgbXVsdGlw
bGUgb2YgMzIgKGlmIHRoZXJlIHdlcmUgMzEgR1BJT3Mgd2Ugd291bGQNCiAgICBjdXJyZW50bHkg
c2F5IHRoZXJlIGFyZSAwIGJhbmtzLCB3aGljaCBpcyBpbmNvcnJlY3QpLg0KICAgIA0KICAgIEZp
eGVzOiAzNjFiNzkxMTlhNGI3ICgnZ3BpbzogQWRkIEFzcGVlZCBkcml2ZXInKQ0KICAgIA0KICAg
IFNpZ25lZC1vZmYtYnk6IFJhc2htaWNhIEd1cHRhIDxyYXNobWljYS5nQGdtYWlsLmNvbT4NClJl
dmlld2VkLWJ5OiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCiAgICAtLS0NCiAg
ICAgZHJpdmVycy9ncGlvL2dwaW8tYXNwZWVkLmMgfCAyICstDQogICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KICAgIA0KICAgIGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwaW8vZ3Bpby1hc3BlZWQuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLWFzcGVlZC5jDQog
ICAgaW5kZXggOWRlZmUyNWQ0NzIxLi5iODNlMjNhZWNkMTggMTAwNjQ0DQogICAgLS0tIGEvZHJp
dmVycy9ncGlvL2dwaW8tYXNwZWVkLmMNCiAgICArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1hc3Bl
ZWQuYw0KICAgIEBAIC0xMTY1LDcgKzExNjUsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhc3BlZWRf
Z3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KICAgICAJZ3Bpby0+Y2hp
cC5iYXNlID0gLTE7DQogICAgIA0KICAgICAJLyogQWxsb2NhdGUgYSBjYWNoZSBvZiB0aGUgb3V0
cHV0IHJlZ2lzdGVycyAqLw0KICAgIC0JYmFua3MgPSBncGlvLT5jb25maWctPm5yX2dwaW9zID4+
IDU7DQogICAgKwliYW5rcyA9IERJVl9ST1VORF9VUChncGlvLT5jb25maWctPm5yX2dwaW9zLCAz
Mik7DQpHb29kIGNhdGNoDQogICAgIAlncGlvLT5kY2FjaGUgPSBkZXZtX2tjYWxsb2MoJnBkZXYt
PmRldiwNCiAgICAgCQkJCSAgICBiYW5rcywgc2l6ZW9mKHUzMiksIEdGUF9LRVJORUwpOw0KICAg
ICAJaWYgKCFncGlvLT5kY2FjaGUpDQogICAgLS0gDQogICAgMi4yMC4xDQogICAgDQogICAgDQoN
Cg==
