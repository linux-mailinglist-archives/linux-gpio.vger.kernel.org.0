Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849A23A8900
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 20:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFOS7L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 14:59:11 -0400
Received: from mail-bn8nam12on2131.outbound.protection.outlook.com ([40.107.237.131]:20161
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230205AbhFOS7K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Jun 2021 14:59:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6O1U7XW1SFE3+wjq4sLmIdvVQioRcJe8stht0vCj1ktKWNwppPTMBPE638wdCQcS1idJ6V3COiEhkdRWQRTKqy1gyFeYI9uMfzXgOIJDWkDa74cb9WWrPSl0GO7yZnz+M/iG97ZO4fLVetVa4flL4BVCwik/B2iqj1qHExJCmKbC+EIFGXdzO7whXr7ElX4JufV9GBn8dm78IDoUwMo/QpbpIagQYFHjhbHXrD9xXh1C1A6ienwPB4lP1P2iEFHc+CpK7k56Q8r8PIQI6dnRVEadT5NRbQJOa9EJ9seyYwrqiavHz3AtfSx7JZzI9eFPAkr0w+a9sUU4p8OPPl7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQWrZF7q70R4In7kjJyEGBZg2Ew6BupQvG7E1uYII0A=;
 b=cdDO4uFnvb6zO4OF5TjutWaDUtBKsFS8VfHxjauE7Ngaq3J0Ib9F8aAoK5wQ1UZC+2yqZJLJvChXGSzbBZnj1L2dd8nsmv08DYLua8lS6yfsqAWBu0lEHmv5JdOeCm65zkHsT1hQoihijCK3/Ruw92qjCF54qz752jiw1yZWgcxun1xQ2kYpZ+S/4n3mYGPaR8fWyyOgYCizYoIOGlveRDZ1OfxATgm347eLTyniWikpiDs7L9uilk+t/YyL7xOUOuJg/g/0cSRR485edPRXMqsSQST8CpfO1yWVTeKmLa8XvIKXCJMLVt9pDgpvtDJbzJrFBJQIrPymKyz4+JPJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQWrZF7q70R4In7kjJyEGBZg2Ew6BupQvG7E1uYII0A=;
 b=Gifzt90PbwMBq+OCUO9pjWFT96kGbXzAnqVcUwbKAdXhsqIMwd6yjSF+VWfsTFK+w8OFvuRzSncgR0/NsR2DhxcUxvu2xf3sA8YkXci9OwmvS9lJs0nFrctE+FaA6rdOvuCqLvb0GrKhXp0YGbySycShlGZpsQbWmUm692Fz6hU=
Received: from SN4PR2101MB0734.namprd21.prod.outlook.com
 (2603:10b6:803:51::25) by SA0PR21MB1962.namprd21.prod.outlook.com
 (2603:10b6:806:e2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.3; Tue, 15 Jun
 2021 18:57:03 +0000
Received: from SN4PR2101MB0734.namprd21.prod.outlook.com
 ([fe80::d465:53d1:f8aa:8ae]) by SN4PR2101MB0734.namprd21.prod.outlook.com
 ([fe80::d465:53d1:f8aa:8ae%6]) with mapi id 15.20.4264.004; Tue, 15 Jun 2021
 18:57:03 +0000
From:   Gabriel Knezek <gabeknez@microsoft.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Potential bug in gpiolib-cdev.c in v1 notification about line info
 changes
Thread-Topic: Potential bug in gpiolib-cdev.c in v1 notification about line
 info changes
Thread-Index: AddiGCFVNJWUYCsfSSKNHjmzifRI1g==
Date:   Tue, 15 Jun 2021 18:57:03 +0000
Message-ID: <SN4PR2101MB0734B4BE5D7750A5CD43C3ACDA309@SN4PR2101MB0734.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=bb03914b-6f0a-4e76-a43e-0c52e29cce04;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-06-15T18:54:01Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a22c16bf-1869-40e6-43e6-08d9302f5d73
x-ms-traffictypediagnostic: SA0PR21MB1962:
x-microsoft-antispam-prvs: <SA0PR21MB19627BEF04994C976F36A6DADA309@SA0PR21MB1962.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ypvT1+AHomm7Xd9RKcTbxdZdJ+mAGa3QdvH2g8NCyUnfcNNwlzOeaw8LsbDxhilPNMsGZ3vyEk4YibVRa+oMLH+h/8FWrvfGkkJU3CX3vxMNJh8njSmzwqtHA6wtRVAQweivQ8ibOijKc0m3f8/kSlflx+LPTdy/pVdy+cOn09SHjbkwVkcZhPJcWcUOEC9CVv2kpsKY/nAm/OCYGSNUt4BM/nhpZ/6RPA0DyE5yiI1/JF8Yj6saIB+OZdGjSPBsiYvA0YnYw2r59tpgKGc4/mn+kjE20EeQUtxnXlnOtZ75alxBnMizvuGb+EqY3UUz94uq6qmWyZC0Y9FkNF2jPwy8AKRS7gibFbyG19xTIG1ysBoqxg6iqW31rGX2NafYAHA1pyKwYz7AiDWrUsciw5aVxsVVmM7GArhrQ1miObHD9fIxnBjSQmUBvSMImj0s4xbcJ4P2oQB4GwDxg1vmqvMGg+/uD53fHhmKljeBCdGmt7y2yaU+yjj+wEa2Cw1bm3793V1JKhGyODV672rF5aXUNFM/F7Bs6jYpUkbF2nRwZSvm/b/5efxsgA1i8ZHvU+5+kLYfjpf1yusuoONjqHyu19mE997dancqIH/ZkZuF0rw1ctQhntGSYxHbR3+dTLX22H8Nnbp/S7r9Ypi+fap2LKXeTL4Gaaf+kd23wq6qLBOX9Baav18PTpKTRQEzPilmj7dkoWqJ63mFnDkhCsNn2cjp9ZtliQeDJN7DYbB5ZTIg57zc+BMqwsyurxmMVwKRu25mfMrWxypKh/rZzwZREVzoxlVcE8YhYic3iSKGNUM/vbdMeswDbiIy91y9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR2101MB0734.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(66476007)(316002)(8676002)(66946007)(966005)(64756008)(83380400001)(66556008)(86362001)(66446008)(478600001)(55016002)(26005)(76116006)(33656002)(9686003)(71200400001)(82960400001)(7696005)(6506007)(82950400001)(15650500001)(2906002)(4326008)(38100700002)(122000001)(5660300002)(52536014)(8936002)(10290500003)(8990500004)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ch/xENJleEMfjuk84quIpvCYCRl/gYEaRbYi0135RHD9glx7RAqw4RQVIm?=
 =?iso-8859-1?Q?W439kUpemTDKzyxjBQG/fSRretGA/Mk13Zv2xjLGw+BZMV8Q/gnvT2oLyg?=
 =?iso-8859-1?Q?KSo/6BUVqtqlMLga+TKQmG5bkGOVNHisym9nnNUuXTVI383QfZDlKe6fQT?=
 =?iso-8859-1?Q?goEFnS/5N8JMTMnHwSmFIJpVNLDBeN04z+PT/X3S4x066SVa/YeJL5KYMh?=
 =?iso-8859-1?Q?8fuWwt0QFRpMC4AaZkjgKTWGUaxx4KEk9YEUhmyYea5o6rpbIhV+ZVHoOT?=
 =?iso-8859-1?Q?F0LSPnmQVzwhCOLh0TR4e6CnnHbKdkLsKiHEgbgxw/OwJp0LCNbDR7WJKs?=
 =?iso-8859-1?Q?cTfl9SmLlR23bj6sFBo4Vy6BBXuUuBn+ve6HESBL/cOK8HNNKk+xucWA0u?=
 =?iso-8859-1?Q?mG7TEH2fED3SJ96OPKSjzM4syb86y+72Ab2eX1BXqlKYLmVgdsipUP9lSr?=
 =?iso-8859-1?Q?tvadEZBgAlT+gAsCKGC2fTuZCvMf9JbDc9Yuc246v21SVSKpIvxjaCVQsC?=
 =?iso-8859-1?Q?ZMe7uuU/s77NyY7dE3wC3d5MomuWqTnZ+VqxFp+YKDM4yk57BI/pf/8Axk?=
 =?iso-8859-1?Q?UCZJNlW63gTGlNN8bD5LjJqIYikv1fhRqoNzzt9NRy+N/47JxxcJNmIU8U?=
 =?iso-8859-1?Q?cJHKbYClG8l0WQHgAw8/K7itKbCOgzp+kt6cGbPXFYpMyocT3SsOzOu0Cy?=
 =?iso-8859-1?Q?tPoeqTUJJFxdGZM5ukNDEdcje/82zWYXlFObxFHLlM5m7wdJrzIM8IbPhh?=
 =?iso-8859-1?Q?sdMIRzem6LjV69y6CgjKOkXO2YB3E43NvzQVF7PdWazF8pcQMak5kUFTi0?=
 =?iso-8859-1?Q?HYOpzoKpgDNtBB3i3csxoofqUU/v2vfoRt0yKXI1QbSBxH73rfxtRwMV52?=
 =?iso-8859-1?Q?DbU/KjbOY+qCZEoNQUahzsdL5aroOc5rn8mjtrMJ3doj9qmFB3kstGpVws?=
 =?iso-8859-1?Q?Z2qnUpedco1knTWkR1CiRJevsXKKlrL08s6Dr/Ye8HIGUEnVjLnnAHUep4?=
 =?iso-8859-1?Q?4ooulZR1wQg/N1gJXvgKnbW6+vU2S1Y0+EOxTvYzcxO/OjXZTbsxv3vdKn?=
 =?iso-8859-1?Q?xI3vSYQqYClrdqJAFEPe7WdHCc29k0qCJwMxHhil5DZSi8W8Jwx94hEmji?=
 =?iso-8859-1?Q?y5U10VRRGT2RqzA/RJrjPgSZu7gnyZ0OL9MuCOSSVx4unokIrX3pbxkx0U?=
 =?iso-8859-1?Q?D/bgd83CF+2oOXXfaZaX2402EqIrF6lVczFnjSs0S9Hv0S8ES0El0BTn9f?=
 =?iso-8859-1?Q?2pxAUJv/xr5k8t9I1J9pHqM20vsKwrQgFFDIcy7Et4+/bjBo2lOsKn2a3G?=
 =?iso-8859-1?Q?c0iSbgWowze5hm3Ie8oWmDd60q9Om+pz7zxeRhIinTLtF9lXwO7J4XTEne?=
 =?iso-8859-1?Q?yfs9XGDGvB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR2101MB0734.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22c16bf-1869-40e6-43e6-08d9302f5d73
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 18:57:03.7767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c5QLfHbJHHBmT/iK/rzdwiBnP4JNhAyRwhqKcXw5zptIJt04oWy7E418fOUuocgf9w4uDALzgsJsmNZm3nrB73nuwsnvnkoLa1kheIIUT8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR21MB1962
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello GPIO maintainers,

While upgrading our system from the 5.4 to 5.10 kernel release, we noticed =
this potential defect in the gpiolib-cdev.c file: https://github.com/torval=
ds/linux/blob/master/drivers/gpio/gpiolib-cdev.c#L2255

In the lineinfo_watch_read routine,

} else {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct gpioline_info_changed =
event_v1;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gpio_v2_line_info_changed_to_=
v1(&event, &event_v1);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (copy_to_user(buf + bytes_=
read, &event_v1,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 event_si=
ze))
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 return -EFAULT;
}

if userspace requests a GPIO v1 line info changed event, the kernel populat=
es and returns the event_v1 structure. That structure (https://github.com/t=
orvalds/linux/blob/5bfc75d92efd494db37f5c4c173d3639d4772966/include/uapi/li=
nux/gpio.h#L367) contains 5 words of padding at the end of the structure th=
at do not appear to be initialized in the gpio_v2_line_info_change_to_v1 ro=
utine (nor its subordinate routines):

struct gpioline_info_changed {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct gpioline_info info;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __u64 timestamp;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __u32 event_type;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __u32 padding[5]; /* for futu=
re use */
};

It appears that this could be a potential kernel information leak to usersp=
ace, and could be fixed by zeroing out the padding field before copying the=
 structure to userspace.

We wanted to get your thoughts on if you feel this is actually a bug, or if=
 we overlooked something.
We're proposing to fix this issue by memsetting the entire structure to zer=
o before calling the conversion routine; if you agree that that's a valid a=
pproach, I'm happy to submit an official patch.

Thanks!
-Gabe Knezek
gabeknez@microsoft.com
Azure Sphere Team, Microsoft Corporation

