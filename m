Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D252185F4
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 13:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbgGHLVH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 07:21:07 -0400
Received: from mail-co1nam11on2061.outbound.protection.outlook.com ([40.107.220.61]:6196
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728385AbgGHLVG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jul 2020 07:21:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpWipCSgCfbBvx8vWygU00vf43xyxLx+9ZXYX3kimEuY54jBEtnknnsqzWEan7r4o5RJvj8LwhNF76jIzlarUWnUggp94ed+6VK8o7/kmPMfHXc/qIHakGn8olIZcqKpXMDAN2mt8BV6+KDQh326ZOLWb0b/aTQMtQ9VmGk1/eVPkZACK69Kxy8z8Ng4zsDIADSB3t7c3ULFWSlpJecvLeNo6vtuNBv8gphH7tFh7Y5dt4gbkxtJSE1N05orEZ6gFQ+vt25PqS62cK/0wytijAWiFy4Q1n2Z40sIkFBFvRnTakcjB+j/0bCzb0cpNXBdE42H9Hzns4x9rHdB3LCsxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/826hUXdtB9A5hPYx9ENymFLpvx2OTuVpp7OesRiK6A=;
 b=BH2J3Gv8Irs0S7T+8LDIKX9pVa/a9BRM1kdHbIDwQnx3lsQFRjU19jp0vRnLy70TQKabb2ScG/zVLegDW5LGqCutMVtpPR7kUWAEnoR5vA/fYZ8MLcpKIJfGGI47796a+dKT+xlkHLClfve8/obHsw9+R0g+GkPm/NSwU0CsWqNqsLajXvS59AV1NSm8HBlFPsK9qo9MdxUxD27BcKcHs9K/99Z7rW+gsBDkFUaAm5aQz2+832ici+VpAWzaLBnAvh6JpNYuMX3QmxNMZF5MkSSSCiEsfaA2iwJq6/U0pDZZxvpmZGRI6L1t+saJPqncYpim9UZ4ZSUpoMoXl7a5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=sedsystems.ca smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/826hUXdtB9A5hPYx9ENymFLpvx2OTuVpp7OesRiK6A=;
 b=rDoOF4zUK7aNTM7eimqDHVwJPnOn4svWOM2ZJfW/naz0HPeYMY0CRHtpLxBLZgM3rCf8dySnzfb9UsTuoPa3gb9x8tbFz7C+OB7R5lEIgzNuazsB1ItvdcaMH50Yn+bxbHSpDv4OuikZqR8msTqrM/bOZBtLspb455Q4M/vm/lk=
Received: from SN4PR0501CA0156.namprd05.prod.outlook.com
 (2603:10b6:803:2c::34) by MN2PR02MB6061.namprd02.prod.outlook.com
 (2603:10b6:208:1b5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 8 Jul
 2020 11:21:00 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2c:cafe::81) by SN4PR0501CA0156.outlook.office365.com
 (2603:10b6:803:2c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.14 via Frontend
 Transport; Wed, 8 Jul 2020 11:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; sedsystems.ca; dkim=none (message not signed)
 header.d=none;sedsystems.ca; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with Microsoft SMTP
 Server id 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 11:21:00
 +0000
Received: from [149.199.38.66] (port=40406 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jt86o-0007oz-PR; Wed, 08 Jul 2020 04:19:26 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jt88J-0001f5-Q5; Wed, 08 Jul 2020 04:20:59 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 068BKmk3003081;
        Wed, 8 Jul 2020 04:20:48 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jt887-0001a8-Qw; Wed, 08 Jul 2020 04:20:48 -0700
Subject: Re: [PATCH v2] gpio: xilinx: Add interrupt support
To:     Robert Hancock <hancock@sedsystems.ca>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
References: <20200611164953.37039-1-hancock@sedsystems.ca>
 <CACRpkda0MOXHgD6KNAzzDNTFSc2f1_Nng8-UFuOGo-dm+6VS0g@mail.gmail.com>
 <d7313b79-1fcd-d04d-fdae-cae1c8c5c233@sedsystems.ca>
From:   Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzR9NaWNoYWwgU2lt
 ZWsgPG1vbnN0ckBtb25zdHIuZXU+wsGBBBMBAgArAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIe
 AQIXgAIZAQUCWq+GEgUJDuRkWQAKCRA3fH8h/j0fkW9/D/9IBoykgOWah2BakL43PoHAyEKb
 Wt3QxWZSgQjeV3pBys08uQDxByChT1ZW3wsb30GIQSTlzQ7juacoUosje1ygaLHR4xoFMAT9
 L6F4YzZaPwW6aLI8pUJad63r50sWiGDN/UlhvPrHa3tinhReTEgSCoPCFg3TjjT4nI/NSxUS
 5DAbL9qpJyr+dZNDUNX/WnPSqMc4q5R1JqVUxw2xuKPtH0KI2YMoMZ4BC+qfIM+hz+FTQAzk
 nAfA0/fbNi0gi4050wjouDJIN+EEtgqEewqXPxkJcFd3XHZAXcR7f5Q1oEm1fH3ecyiMJ3ye
 Paim7npOoIB5+wL24BQ7IrMn3NLeFLdFMYZQDSBIUMe4NNyTfvrHPiwZzg2+9Z+OHvR9hv+r
 +u/iQ5t5IJrnZQIHm4zEsW5TD7HaWLDx6Uq/DPUf2NjzKk8lPb1jgWbCUZ0ccecESwpgMg35
 jRxodat/+RkFYBqj7dpxQ91T37RyYgSqKV9EhkIL6F7Whrt9o1cFxhlmTL86hlflPuSs+/Em
 XwYVS+bO454yo7ksc54S+mKhyDQaBpLZBSh/soJTxB/nCOeJUji6HQBGXdWTPbnci1fnUhF0
 iRNmR5lfyrLYKp3CWUrpKmjbfePnUfQS+njvNjQG+gds5qnIk2glCvDsuAM1YXlM5mm5Yh+v
 z47oYKzXe87A4gRRb3+lEQQAsBOQdv8t1nkdEdIXWuD6NPpFewqhTpoFrxUtLnyTb6B+gQ1+
 /nXPT570UwNw58cXr3/HrDml3e3Iov9+SI771jZj9+wYoZiO2qop9xp0QyDNHMucNXiy265e
 OAPA0r2eEAfxZCi8i5D9v9EdKsoQ9jbII8HVnis1Qu4rpuZVjW8AoJ6xN76kn8yT225eRVly
 PnX9vTqjBACUlfoU6cvse3YMCsJuBnBenGYdxczU4WmNkiZ6R0MVYIeh9X0LqqbSPi0gF5/x
 D4azPL01d7tbxmJpwft3FO9gpvDqq6n5l+XHtSfzP7Wgooo2rkuRJBntMCwZdymPwMChiZgh
 kN/sEvsNnZcWyhw2dCcUekV/eu1CGq8+71bSFgP/WPaXAwXfYi541g8rLwBrgohJTE0AYbQD
 q5GNF6sDG/rNQeDMFmr05H+XEbV24zeHABrFpzWKSfVy3+J/hE5eWt9Nf4dyto/S55cS9qGB
 caiED4NXQouDXaSwcZ8hrT34xrf5PqEAW+3bn00RYPFNKzXRwZGQKRDte8aCds+GHufCwa0E
 GAECAA8CGwIFAlqvhnkFCQ7joU8AUgkQN3x/If49H5FHIAQZEQIABgUCUW9/pQAKCRDKSWXL
 KUoMITzqAJ9dDs41goPopjZu2Au7zcWRevKP9gCgjNkNe7MxC9OeNnup6zNeTF0up/nEYw/9
 Httigv2cYu0Q6jlftJ1zUAHadoqwChliMgsbJIQYvRpUYchv+11ZAjcWMlmW/QsS0arrkpA3
 RnXpWg3/Y0kbm9dgqX3edGlBvPsw3gY4HohkwptSTE/h3UHS0hQivelmf4+qUTJZzGuE8TUN
 obSIZOvB4meYv8z1CLy0EVsLIKrzC9N05gr+NP/6u2x0dw0WeLmVEZyTStExbYNiWSpp+SGh
 MTyqDR/lExaRHDCVaveuKRFHBnVf9M5m2O0oFlZefzG5okU3lAvEioNCd2MJQaFNrNn0b0zl
 SjbdfFQoc3m6e6bLtBPfgiA7jLuf5MdngdWaWGti9rfhVL/8FOjyG19agBKcnACYj3a3WCJS
 oi6fQuNboKdTATDMfk9P4lgL94FD/Y769RtIvMHDi6FInfAYJVS7L+BgwTHu6wlkGtO9ZWJj
 ktVy3CyxR0dycPwFPEwiRauKItv/AaYxf6hb5UKAPSE9kHGI4H1bK2R2k77gR2hR1jkooZxZ
 UjICk2bNosqJ4Hidew1mjR0rwTq05m7Z8e8Q0FEQNwuw/GrvSKfKmJ+xpv0rQHLj32/OAvfH
 L+sE5yV0kx0ZMMbEOl8LICs/PyNpx6SXnigRPNIUJH7Xd7LXQfRbSCb3BNRYpbey+zWqY2Wu
 LHR1TS1UI9Qzj0+nOrVqrbV48K4Y78sajt7OwU0EUW68MQEQAJeqJfmHggDTd8k7CH7zZpBZ
 4dUAQOmMPMrmFJIlkMTnko/xuvUVmuCuO9D0xru2FK7WZuv7J14iqg7X+Ix9kD4MM+m+jqSx
 yN6nXVs2FVrQmkeHCcx8c1NIcMyr05cv1lmmS7/45e1qkhLMgfffqnhlRQHlqxp3xTHvSDiC
 Yj3Z4tYHMUV2XJHiDVWKznXU2fjzWWwM70tmErJZ6VuJ/sUoq/incVE9JsG8SCHvVXc0MI+U
 kmiIeJhpLwg3e5qxX9LX5zFVvDPZZxQRkKl4dxjaqxAASqngYzs8XYbqC3Mg4FQyTt+OS7Wb
 OXHjM/u6PzssYlM4DFBQnUceXHcuL7G7agX1W/XTX9+wKam0ABQyjsqImA8u7xOw/WaKCg6h
 JsZQxHSNClRwoXYvaNo1VLq6l282NtGYWiMrbLoD8FzpYAqG12/z97T9lvKJUDv8Q3mmFnUa
 6AwnE4scnV6rDsNDkIdxJDls7HRiOaGDg9PqltbeYHXD4KUCfGEBvIyx8GdfG+9yNYg+cFWU
 HZnRgf+CLMwN0zRJr8cjP6rslHteQYvgxh4AzXmbo7uGQIlygVXsszOQ0qQ6IJncTQlgOwxe
 +aHdLgRVYAb5u4D71t4SUKZcNxc8jg+Kcw+qnCYs1wSE9UxB+8BhGpCnZ+DW9MTIrnwyz7Rr
 0vWTky+9sWD1ABEBAAHCwWUEGAECAA8CGwwFAlqvhmUFCQ7kZLEACgkQN3x/If49H5H4OhAA
 o5VEKY7zv6zgEknm6cXcaARHGH33m0z1hwtjjLfVyLlazarD1VJ79RkKgqtALUd0n/T1Cwm+
 NMp929IsBPpC5Ql3FlgQQsvPL6Ss2BnghoDr4wHVq+0lsaPIRKcQUOOBKqKaagfG2L5zSr3w
 rl9lAZ5YZTQmI4hCyVaRp+x9/l3dma9G68zY5fw1aYuqpqSpV6+56QGpb+4WDMUb0A/o+Xnt
 R//PfnDsh1KH48AGfbdKSMI83IJd3V+N7FVR2BWU1rZ8CFDFAuWj374to8KinC7BsJnQlx7c
 1CzxB6Ht93NvfLaMyRtqgc7Yvg2fKyO/+XzYPOHAwTPM4xrlOmCKZNI4zkPleVeXnrPuyaa8
 LMGqjA52gNsQ5g3rUkhp61Gw7g83rjDDZs5vgZ7Q2x3CdH0mLrQPw2u9QJ8K8OVnXFtiKt8Q
 L3FaukbCKIcP3ogCcTHJ3t75m4+pwH50MM1yQdFgqtLxPgrgn3U7fUVS9x4MPyO57JDFPOG4
 oa0OZXydlVP7wrnJdi3m8DnljxyInPxbxdKGN5XnMq/r9Y70uRVyeqwp97sKLXd9GsxuaSg7
 QJKUaltvN/i7ng1UOT/xsKeVdfXuqDIIElZ+dyEVTweDM011Zv0NN3OWFz6oD+GzyBetuBwD
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <7a39d894-e5ff-283d-650d-a0a2f64b350b@xilinx.com>
Date:   Wed, 8 Jul 2020 13:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d7313b79-1fcd-d04d-fdae-cae1c8c5c233@sedsystems.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(376002)(136003)(396003)(46966005)(186003)(83380400001)(356005)(2906002)(36756003)(8676002)(8936002)(107886003)(81166007)(2616005)(9786002)(31696002)(31686004)(47076004)(26005)(426003)(82740400003)(53546011)(336012)(54906003)(4326008)(70586007)(44832011)(478600001)(110136005)(5660300002)(70206006)(82310400002)(6666004)(316002)(42866002)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d161291-2b55-473a-8684-08d82330fe15
X-MS-TrafficTypeDiagnostic: MN2PR02MB6061:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6061319E47C0A09DBC52C1F4C6670@MN2PR02MB6061.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QcVFTpjxhMcazzq5MyiRr1jMxPi3dxDzFNX7cFCQMoWHGSUlJVaidvQ+itKYIbLI8La49qeymCcbH7fi58LYlVYgzcXKwFYe+jah/ZrxcmClPGECPWHz3INFZm+gECX3oz3/08QdUV3z1WdLE644uKJuJVUuR2Mqx1LKDqBFptb0qrrZPFf9WGIfxagRkEmbjK3l6tf39Qgyx6lL3KqQUdvnsWydhOrnnPscsKI1RVKQTqZx56aVpj2pQfphS2PSp/xwPoQABUDy2PFEjN1Dkw0r/89X/FqKqUrsIjKSIwnEB5O4FZDa7Xu+cqq8w8FQGIMJ2+2qRqiK88femVETFwl9LZZKSdSGRwn8qxlwqpzTPcFDP4nPEN3IGB4iSJhXLAx2M/Uf7mzGX7WERgur87tnCS7BIooYficZd/AhgSKu6gcF4zialb+k02K4Tr9rKZalo4WBHVe3Sq0Ybcimsg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 11:21:00.1081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d161291-2b55-473a-8684-08d82330fe15
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6061
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 07. 07. 20 18:16, Robert Hancock wrote:
> On 2020-07-07 5:09 a.m., Linus Walleij wrote:
>> On Thu, Jun 11, 2020 at 6:51 PM Robert Hancock <hancock@sedsystems.ca>
>> wrote:
>>
>>> Adds interrupt support to the Xilinx GPIO driver so that rising and
>>> falling edge line events can be supported. Since interrupt support is
>>> an optional feature in the Xilinx IP, the driver continues to support
>>> devices which have no interrupt provided.
>>>
>>> These changes are based on a patch in the Xilinx Linux Git tree,
>>> "gpio: xilinx: Add irq support to the driver" from Srinivas Neeli, but
>>> include a number of fixes and improvements such as supporting both
>>> rising and falling edge events.
>>>
>>> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
>>> ---
>>>
>>> Changes from v1: Changed platform_get_irq to platform_get_irq_optional
>>
>> Looks good to me, two questions:
>>
>> - Can you make sure that this applies to the GPIO "devel" branch
>>    that has the previous changes from Srinivas.
> 
> I confirmed it applies without conflicts and builds on that branch - it
> doesn't appear that it has any changes to this driver that were not in
> the version I submitted against.
> 
>>
>> - Can we get a Tested-by or at least ACK from Srinivas?
>>
>> This driver currently lacks a maintainer. I would be very happy if
>> Srinivas or Robert or both would send a patch to add you as
>> maintainer(s) in the MAINTAINERS file, and would also like
>> Michal to to ACK that so everyone is happy.
> 
> Probably Srinivas or someone from Xilinx should be the primary
> maintainer of this driver, but I could add myself in if they don't..

This driver is covered also by my fragment but I am happy if Srinivas
can be in this position. If something happens I am around to help to
resolve any issue with it.

Srinivas: Please send the fragment for this driver and record your name
there. Feel free to add me with R:  Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

