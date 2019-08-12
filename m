Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C2889A85
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 11:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfHLJxv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 05:53:51 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:47894 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727140AbfHLJxv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 05:53:51 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7C9qG81001701;
        Mon, 12 Aug 2019 02:53:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=MmBhk0vHRYgcB17h3GZSvctr9j1wsy+npKYT7K2v9Cg=;
 b=eUkUktnr4n1ohiDZEmmUZUcIs4GuJV2j0IWT00+prsKL2TcoPAZIfP3Klbh4xpQ0TEVo
 JTapruaZwXQ5gViJ5ASiwK4jmqHG1L8iqJo6KIi7BZ2iEslt5jHJd9mkabD/gZkhP+gJ
 bGLYT5l+QvzxYcFslvA96uJVj+mB+5mrxHasoUKxiw8f1GgLgKCjez7axNlbR3OAJqUM
 Ql8cdoXieTjuViiorM3FO36BVQJTHpTB7mNKXMqkBWOCX4qGBfyRvhpDIrxdSElIbDCA
 bu8vBoMa+rBovgOoFPejgHk/J6k4aHNR07cxJF+aXuUPEIPv6WU8HYjifzCfzJevfS0T BQ== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2051.outbound.protection.outlook.com [104.47.40.51])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2u9tfs57vb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Aug 2019 02:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DM9XG/0pUJokNYiHSRIqBrxRLDniVIaItwvotE70O33NO+E3+BFxP5D4pZrt++WBJD3sER6RAiXIS9uYmSMDL3J2uwpg6qti83/fPI0zLSti/D7tQZXZ7pymo451AT7K5xP2QGhBav01ZBrGdKAl86QUd4UyhBKr/wZMxyX0EA3VNY0D/H0ZWjYZuJ3z5uWM87Y8wkAZJZ19/IVJYoRVK4lVbern4oEiewHlpNNO8ANJReixvh597+aYflRnFWMQhq4pVm/2yrSohK42lEcIgP2JT4z0m53J9o4nwCzBEzUxZWfeCWGx7e9HFjCV4fRmHOMX5MWzzaRa+VdG5PJzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmBhk0vHRYgcB17h3GZSvctr9j1wsy+npKYT7K2v9Cg=;
 b=TMCGuaymEY7qTwPyw5gQBwMZMC0pLNTUaWdRx9LBZCuhm13RKJrAzxZVxmaUXh0ZjKkaEO3RpTBaGNz2lSuwlSZuHhBzZe9YUA7BFWSkolc52YX6xneNtVxPjj3X//7idxjgOE5fxXHEzouc/dWWpLy0ubpOmYo56UAyVWk80PhZ9q+onOqaraANSR1VqK5agZP7RYa4Ro0PrPOGFdrQgIt5EULvY8EXzGvVPfJASnMySbyuU+evpaQ8mutjaVz4+lwd4C1hW1+2HiWfwoUYbgFSowTHEaBBL2tJZCcYhypMWzeMeVJXXd9vcreSosly4vTBOSJlMOBJIKn7RM3sPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmBhk0vHRYgcB17h3GZSvctr9j1wsy+npKYT7K2v9Cg=;
 b=g/HgaxcHRFBf5mmGOHSAiO45MFIT/FhmnMzLvW9F+2bwHT1OEULXDD2636J4oHBxwQEDgAmdNa5Q564e1wCc/153UM60WJ2W65d/pg8CBmnsMIvW7ubXgquZIqFl79NnUbaqadwNUUb5afnLTeo8u4VkmdLh5+qMcHFvkyuS1rI=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2617.namprd07.prod.outlook.com (10.167.16.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Mon, 12 Aug 2019 09:53:45 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::2cc9:1e25:81ae:bc20]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::2cc9:1e25:81ae:bc20%11]) with mapi id 15.20.2157.022; Mon, 12 Aug
 2019 09:53:45 +0000
From:   Jan Kotas <jank@cadence.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jan Kotas <jank@cadence.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: cadence: Pass irqchip when adding gpiochip
Thread-Topic: [PATCH] gpio: cadence: Pass irqchip when adding gpiochip
Thread-Index: AQHVTrTlcTdS7y+xz0Gl7Rddx404tqb3Sj4A
Date:   Mon, 12 Aug 2019 09:53:45 +0000
Message-ID: <95B402CC-A698-42FE-9D3E-D4B05997ED3E@global.cadence.com>
References: <20190809131804.20352-1-linus.walleij@linaro.org>
In-Reply-To: <20190809131804.20352-1-linus.walleij@linaro.org>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.140.1.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98d86f5b-e0ee-4801-62e7-08d71f0af72b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY1PR07MB2617;
x-ms-traffictypediagnostic: CY1PR07MB2617:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR07MB26177CB5EE058951B899DE8ED0D30@CY1PR07MB2617.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(189003)(199004)(36092001)(6246003)(102836004)(54906003)(8676002)(25786009)(476003)(33656002)(99286004)(5660300002)(446003)(76176011)(6436002)(14454004)(53546011)(6486002)(2906002)(6506007)(4744005)(478600001)(316002)(11346002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(91956017)(486006)(26005)(6512007)(66066001)(186003)(86362001)(71200400001)(71190400001)(53936002)(305945005)(6116002)(3846002)(229853002)(6916009)(4326008)(256004)(8936002)(81156014)(81166006)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2617;H:CY1PR07MB2521.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y9sKPE4oxOB08LSLpx7tVsT26rmG+w/KYPCce+Q7UD1Xva5VLoCCibSIP1PLTvMa6155fjLwmAfRXhXxeZn7YvG8JPrwUoEHMMHWNXo5VTnr0y7TPYR9A7YUju8wJe6JOflxRQn3UJv7+t9R3s0kPlzbwTmbyhCmppnq5RsHymkTppErMP6G09XGLdsL4Ryu1gSwsIHpLpH7vCXv7ZtecFZvhZo4llToYTU8rbyBJmRY095KjZg/6sszRjCinkSwbOSkhduDg+nUmQzKiy22ZNCWsr6A/vgsp9SMaBjivXAJBetzn8qpi2k3OnnyWh+pP3CnQdlWGHA9I+9LHBN16ZtFy993eICOQ9Mnb7aUmtVX000Xrt0GFR9a3mXUdAKyorzmZtKWc1sZbLnczOS/2d1TV3izfRnUmx0GK4bcgN0=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B8312DF4B7405B4FB1CBFDDE856F6B1C@namprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d86f5b-e0ee-4801-62e7-08d71f0af72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 09:53:45.2024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxT+ad/VVpMAyUa6nsAmkyc2fKOO3t71ZOT+9bJquQJFS2diwDaIA4zbwJfb8ToaLo84kFlwoVv6rKDo1m08Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2617
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-12_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=911 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908120110
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> On 9 Aug 2019, at 15:18, Linus Walleij <linus.walleij@linaro.org> wrote:
>=20
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>=20
> For chained irqchips this is a pretty straight-forward
> conversion.
>=20
> Cc: Jan Kotas <jank@cadence.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi Jan, it'd be great if you could test/review this
> patch.

Everything seems to be OK in my tests.

Regards,
Jan

