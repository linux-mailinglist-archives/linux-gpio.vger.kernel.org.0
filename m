Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22BA54D477
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jun 2022 00:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346780AbiFOWR2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 18:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346656AbiFOWRZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 18:17:25 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D4256395;
        Wed, 15 Jun 2022 15:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpL6714mTg0E4r0w3pbZAsP2S22ebMVLAB4MOLjdpEMrzwZvLGppGPJqDGoXTlEHrMSY7CYNPhY5tCck68G1YJH6rM4gH5KnPU8o59x25y8D3gESJR3UCAwC7H7DlWX2tgLdILnRvQ1YS3J98DFfkkh6Y0hOKRt8j4DsvMCU2eamDDDk0Q+mCOc/l3DT4RsA1PM6dbBYJTX2HH5te5diNN8bjoSgh95amdyDimTWdQ5AKgq0Rw6bsJ4liYxpauN4Pu2dWGW8a1sypJb288BG/KWdZceuN7+iM+kN+lTBLq6e7qsumV/W2h3KuK+TuFKWt3KgaLYUlgqSbFT3JFzuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pbJUo//i8eYbFFJpk5pulhiYwC8Ct+DBxUOVmnyLkA=;
 b=mhAh0tKISSC/jHOHyoqgFzi8dVjbvU2MYd0Hle6xP/F44a42ldyESGeaATa6BUsPq+/aYYEzPY7PEC4MG33WFBJVXNEb0lYDDNbjlvEGfIkBt9lbRmpO5VaadtTH66PDpqUegX6PfbmG/rkJy+z1YyxU3YUUoXO9JWcFNmn0kE1lhx54BXVWyuheK5p/cSJKPpdUEP4JTPlcXfQyuK3dk+kLg4kjnUHoT1wmj6C2F0Ieovpi6zvZwNuz4CD8n/yXoWHdb5Uni/pp0O2vyr3LAstYiGUL7oCRmhlRGP95iGyunGAh+HLS5Uc5XhEqTzL51cXSxv9HJjlyikEaPKUfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pbJUo//i8eYbFFJpk5pulhiYwC8Ct+DBxUOVmnyLkA=;
 b=HTxYmceBsvo+U1Pcq3HO6P7I00PD464MdvsKoe1ML7CoKk16bZd/llMIum/prSC6izT1vH7lZ/0ipFpolBlDkqP54SlHam6Y8HtOy4EZO1AGtprusrWt3rLr6LyrivNatnXvqeZZcC45/lZAPn+brbuP/W3a2BfpvSPmAwpwB10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB2413.jpnprd01.prod.outlook.com (2603:1096:404:7f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 22:17:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%8]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 22:17:21 +0000
Message-ID: <8735g5fu6s.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
In-Reply-To: <CAMuHMdUhz==kdNejHh9t15cRVLxyxamsj4APOU6gz1p5H9-=DA@mail.gmail.com>
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com>
        <87v8tdgu1t.wl-kuninori.morimoto.gx@renesas.com>
        <alpine.DEB.2.22.394.2206101756520.828669@ramsan.of.borg>
        <877d5kkuiq.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUhz==kdNejHh9t15cRVLxyxamsj4APOU6gz1p5H9-=DA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 15 Jun 2022 22:17:20 +0000
X-ClientProxiedBy: TYCPR01CA0022.jpnprd01.prod.outlook.com (2603:1096:405::34)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63960914-11f3-43d3-7dd3-08da4f1cd0e8
X-MS-TrafficTypeDiagnostic: TYAPR01MB2413:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB24133805243CC6918577EA5FD4AD9@TYAPR01MB2413.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sq2opLz2ClgrywegJLWTAP0leb1Q93cW740T80FuaZo/+BuEDIBkIbxou1OuJwijZU5EPBMDkA5e/Ed6i74Kx5ATGzXtQIS6GT/FXqLtj8zh31Tiy2SuUz7jmwe7ylAdSzqA1SWEmYR7ZJHqzDlhOa4YsfCSiN/7nRzApP6LC9rapnelPwU0xfk9zy7D4dPlgNjzVmcQgxo/Zble4eP+mLnmyhy5ukBemTwXUDftaYYBmPFNp8b9caWWDWdqFfo6tHBeYdwDR51QFUPJsqVRbs8yfyqaDgRFzTfPygAhbb56tOQ0AyHoDVsGCPSKXdhrpOFY+HYOElq3B07P850c0x3aaQLO5eeZRhZvKFHus6S/L9lu+ZYylPvoeJj1Ev5hSezzrD5itcljtuJUSVesg47CePDiC5I2VlHorJcrqQ7ms4t6UyP4VzTgYSOmGQB4YbHtG1Z58xjK91yKIYgZYnOVrSrCjxYthEOCeMRWGslikiqRWJXQRHAIuY8KKsWNkDKFjI8kWwT+2L8jwDaqg9RBmxyPn4u5QyobAUC+LDOFTI9Z+5vCo/Eyd3E27C1eaT4Qb8VMYlGWArvnkfKknYBsd/jk9kjbG3sJukFarL9NEYFbfK7OEM/Nfyw790uhwHXLnCfaEw1Pz/Z3eI8UrWi2GkxVouqfjXbH5crPXIgGz56NHMGRRS/5+dV7+UT1GaCAemqKTo9OiT9KWAk4S8Nrk2LT0QVXxxtYpHmgYDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(186003)(38100700002)(2616005)(38350700002)(4744005)(5660300002)(8936002)(316002)(2906002)(54906003)(66556008)(508600001)(66946007)(66476007)(6916009)(6486002)(26005)(6512007)(52116002)(8676002)(6506007)(4326008)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1nijYVfYAP/GIVR/OyaLzpP7PV29qbOhJsvUCYBTuIOHcO2szPemGd06uWpO?=
 =?us-ascii?Q?p/qD+jRfzkGY6zy2xhpGt2hsw/ZZZvNKpGmC02jjjdZBaU6F5Axd7/JMQd0r?=
 =?us-ascii?Q?QcroHJ+AYkzyLz7B/crAs6OrmzXAm7+R0hHaw4lXKrsG3gwevpVstn8sV9B/?=
 =?us-ascii?Q?IhKJGCCZCwG8wEpHiN/Pd0XWySaSR6danRGSl40ZVTDbe1qk/e6o3+71Btyz?=
 =?us-ascii?Q?VnpZe5hplA/gNqK+dm/pevQUE4baInM6lxcpsXpQcAU4p2yL88RggE0sIqzA?=
 =?us-ascii?Q?SRdpt539FOLVKa9kt/QG7gCdw60NUPa98D8cQLJtjzxxUany/keodpBV1U+d?=
 =?us-ascii?Q?0qOM846OP/zaasH1PBgh+ZfaJgsaTYvxxdUD0LcBlOTj7bKmBbwwIYiT3WAF?=
 =?us-ascii?Q?NXhEl/iLuSXWMONwdRqtvftfqUwP3lIR/VJSw3E5ObQTUoBXmuSIwReDRfEB?=
 =?us-ascii?Q?g/4+z/mkAEmnKDlSvFZ15ad/hYZJGKhfNj8yZY9mZMgleiCGlsPshR7q4dJp?=
 =?us-ascii?Q?UhNG+khnki0hJnYS9gxJfwfo2jt41IlCIPoc1GQNW+QjAJwf31wToC+CkOsx?=
 =?us-ascii?Q?HkmZ2AV92Q4aqogd86lVWfWqZy1yNPavyt8f44bGuBaDTJ41tQA5kAvWZSos?=
 =?us-ascii?Q?bXmhjpXKNgIXNNnuZB5QEv0lrcm3fWASZ76HiSC6PWK5YQP9UXV8VXUX2stE?=
 =?us-ascii?Q?+wprc0hDKEu91GVfFzn6/sICRvaYRaKvZks+lpdZmbO+uNAHsEPev8YRJLXp?=
 =?us-ascii?Q?ut3uaUWHPVzIslSYSHJE+FsHiAbROpCBsqtWnX0PjxjpF635yIdD6Bry8Mkk?=
 =?us-ascii?Q?JS9Lma8MpCDdGT0jAOlSOAO9oK+BV3neU5ZYR92woO4RB8krOf+KIFHvFU7y?=
 =?us-ascii?Q?ODTC+ZWV5cQrYocZ4ZwyDS9eDFsKSjGlHKJf7vGM6MTEvekDJHmXKoZwzy9q?=
 =?us-ascii?Q?+wWVQHiBHxUpdYjH7FteJGi8xTknQa4CYuZ0USPRDMQIQK9gIO0tomx1oEuU?=
 =?us-ascii?Q?jqKLcSKL4tG1782JeQqsIoAVlpt4MWTlf4Jkx743S64l1Yhcko5g3aJpHxIb?=
 =?us-ascii?Q?ThepUr7nvpywrzdWTNIQOtufjkLQiXiWT75Qhpwl6Y10k9Rz1WGM3Uhy+7/c?=
 =?us-ascii?Q?h6M+stSXYh8TT7KXhYBLHtiamE/19ACzImyBJ0Vbc+N3wN95br934I+hPb7l?=
 =?us-ascii?Q?jBHhBpxFpfTg3gy4uI46DLM6tDSdXpHelmClNgRGeQx1bCZPgLYeLd2WFhN6?=
 =?us-ascii?Q?OmRuQMvzUmyWH8OkvPkMMUtgwsARaiaG+FMOtEdTsDWKkRLSdDrzYocTNe7A?=
 =?us-ascii?Q?BTSkLSPpVhyWTh+WQ/Vbf0krJsWbkyhdggkX3ErGaom5alMN+JmNzLtA4Vc8?=
 =?us-ascii?Q?hXdsir2k+2q7szKdwC7ih39BrNkLIoc20DxMzs/PZkPGREsyJeQE/EEvqtr3?=
 =?us-ascii?Q?NldsAy9fZY71VifXlT+OmaAZ3XTaJLZyfq4TK62E9DgBblxoQEuWG+IFJQsU?=
 =?us-ascii?Q?ix0ps5cdXhNILhObNlspwc2vVUUgXN7ocfMEckDpjne6KduoYvC0TYjc244H?=
 =?us-ascii?Q?WqbqlPfJjvSh0GY2e6YuLASuhm/GtB2HI02oxmOBRPmP5fOXvrGN4Zuo7eqd?=
 =?us-ascii?Q?JznGAIj1mUgCmNDYsJSFw52Y9T4YZ6IObRlW99imWQLfa4YJYdqHZJ/QoPsU?=
 =?us-ascii?Q?n3UPEwFmmam7deaktscUlShCTiO9mI7I4hSRfD4FjBgZI2fmfgHdtu35MF2T?=
 =?us-ascii?Q?yIu+X9Wzp0UkxfjzU9DlWHZWgmHIke+fhoM/gJRpGpkDcj4ndaCF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63960914-11f3-43d3-7dd3-08da4f1cd0e8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 22:17:21.2359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 796oBZ/OVSO4esYngDx5AUloh/DfFNVcJPQ1ZbWCtY4XYEfX8EgG1hk3b2rEGVjDDVc/GmIHcPL+88cP1Z+InvkvofBqAd3qXw40iI9ML9SIuTfUEKbSBIFgsdxc3zFN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2413
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Geert

> > > "<= RCAR_GP_PIN(1, 22)", as GP1_23 to GP1_28 do not support voltage
> > > control.
> >
> > Am I missing something ?
> > I guess GP1_23 to GP1_28 are same as other GP1_xxx.
> 
> Table 7.28 ("Configuration of Registers in POC0 , POC1") documents
> voltage control bits in POC1 for bits 0-22 only.
> 
> However, the pin function spreadsheet says GP1_23 to GP1_28 are
> 1.8/3.3V.
> 
> Which one is correct?

OK, I see.
I will ask it.
I want to keep original patch almost as-is (only cleanup).
I will post it as "fixup patch".

Thank you for your help !!

Best regards
---
Kuninori Morimoto
