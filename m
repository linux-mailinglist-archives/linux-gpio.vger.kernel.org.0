Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F15535A96
	for <lists+linux-gpio@lfdr.de>; Fri, 27 May 2022 09:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240344AbiE0Hj3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 May 2022 03:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbiE0Hj2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 May 2022 03:39:28 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE51EBEB5
        for <linux-gpio@vger.kernel.org>; Fri, 27 May 2022 00:39:27 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24R4d4wO032597;
        Fri, 27 May 2022 03:39:20 -0400
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3g93vdu3cr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 May 2022 03:39:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/+1kNx4Hzh6k5GtzMu0qsD4xC0Jod9Eu5DMfzxJFvRErdgSdPXAwBfArrBCdhKC3llN5cAzJlbrRkRbJSZm/+SW35nldFCxFioHewgHJiFt1fxCWN4jJvchKgNmIlhcsoQuWDlYzjazqhp+th3O63QDqWuP72hoAZ3UJtVL+pAwRt3cegHg3TI86xgCvLH4GeUk7ije0wqeiM4BoDLzvEBK1MGQjJ76cfrmHCwyAS/SKglD8JGJ8nAvVKprEDcxu2DQfbm7SXcaJfVOmM2FWmhS1hJOWAJuNyHkMTKt+z0TUI6b+td/uDfG+DQEjzjdEitkKKGeezEg1zqQ/wUfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biAq9CN1breQOH5c3Agd0+9cHEcnmhLyLF4wXYQh8pY=;
 b=UKlzYbCLIpWqJqAO3ibUfhpt6pfhznjLpYb7lx99DNWmIg5gd1gqlMxt8b3MX7ZIDkjahlIffKG6sV1vxjtevSBksN3wU5qziWFtx9AfEMxhs5oqGyyyNgVx0BByZ1PlUNKNuBBNn9cUyq27cwNrtgHKGZSlx6lBL4LVkCHAdQnuZ5mPZtxZGUu6xQMLiM3cTqRFCF2TzkqsYYFJNJslckdXxMYMOSwBEAiMMBhJN2HZ+whJPKlPMqb6TqUCYm2LSvH1jGgBMIxmxT9EM1kRR6p8DvukSEEkqE8/Cpam8EIc6hEQPeyYyEKIYQFXe0H6I2bPiYPVmLMnH1S50MTXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biAq9CN1breQOH5c3Agd0+9cHEcnmhLyLF4wXYQh8pY=;
 b=X9SnQGgt1LEl7uBiJKDrXjypcr0XtVSp4siGXF9Ssg9zrAOQCyJ9FrWkH0QX2lbCOAATxC2kKNZEkf7A+hrQlARfChg1jAIkqgnqTCUgFa0XQg2IfyFBs6J4qQkxwEsLQqARxyofNFzW7n0RCDQ4SCtS1X7Vki60cWsD36WIoI0=
Received: from DM8PR03MB6246.namprd03.prod.outlook.com (2603:10b6:8:33::16) by
 CH2PR03MB5238.namprd03.prod.outlook.com (2603:10b6:610:a1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Fri, 27 May 2022 07:39:17 +0000
Received: from DM8PR03MB6246.namprd03.prod.outlook.com
 ([fe80::15ee:3dc8:f7e5:d008]) by DM8PR03MB6246.namprd03.prod.outlook.com
 ([fe80::15ee:3dc8:f7e5:d008%8]) with mapi id 15.20.5293.015; Fri, 27 May 2022
 07:39:17 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] gpio: adp5588: Remove support for platform setup and
 teardown callbacks
Thread-Topic: [PATCH] gpio: adp5588: Remove support for platform setup and
 teardown callbacks
Thread-Index: AQHYboC0VQnKiOqNpkae1OP5G5G40K0yXENQ
Date:   Fri, 27 May 2022 07:39:17 +0000
Message-ID: <DM8PR03MB6246CE28B5EC3EA92DA133808ED89@DM8PR03MB6246.namprd03.prod.outlook.com>
References: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYldobGJtNWxjbWxjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTB4WWpJek1ESXdZUzFrWkRrd0xURXhaV010T1RKaE1DMDBPRGc1?=
 =?utf-8?B?WlRjM1kyUmtaV1pjWVcxbExYUmxjM1JjTVdJeU16QXlNR010WkdRNU1DMHhN?=
 =?utf-8?B?V1ZqTFRreVlUQXRORGc0T1dVM04yTmtaR1ZtWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXpNVFUwSWlCMFBTSXhNekk1T0RFeE1EYzFOVEl4TkRNNU9EQWlJR2c5SWpS?=
 =?utf-8?B?WVRWUlVXVXBuVDBOeFRYVmxNbWRxVG1aSlpqQkVPRXRPU1QwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUW5ONWJuWmtia2hJV1VGbVduSlZiaTlYTkcweVN6?=
 =?utf-8?B?bHRkRk5tT1dKcFlsbHZSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQlNuSnFTa2xSUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 062cae81-e08c-490e-f777-08da3fb40179
x-ms-traffictypediagnostic: CH2PR03MB5238:EE_
x-microsoft-antispam-prvs: <CH2PR03MB52388B25C7D7C44408D3910F8ED89@CH2PR03MB5238.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Eef51hLs7yPNRWYs+Q5ACRlg+ZIPPSSLTJHkBaChSzo21Z/0H/y+WWJk5MJt1WGDto9tNu+nBsgfqO6TBttI7Q1pnoOvZSeqDx4vNgnPrs1tCkNFhTZgkwFoSxvyAikPlPSxsyjJpRFsqem8y0/rzBVCelfAKwZ/yAaivm58eGlGUmlGyohs6AMbcPaqvPWrWknbDQ6sWp/ak9DoqSkjFJrXUShqW4DIW/yFYjIVoSs/PNldP5iiyH4cBfXVVgTDBa3RstDdu74W7T3tqWEYYBICNovVBtKX9B5VW1UVrXE18jIeHSX+QEtneUJotje/K81z3YgFtSw8FUCDcy5m3IJAyrnturnE//bQ91u9hXMYV94OEU14BiyrFI2qhvPudakUw7EhFGyRY0vLrj3bVsI77d9vmEkjENCTmtdqioHbyzSCactXrtSBNQVnosRcGiE1YpzPslYwq2HcE9cAecBWNYRywhmSF7F2FBKaJV12oi/oB4+NBs0DrVLdRjMVOKlN7z+g72BCdJ+aECK7n+f1PefXcFsOKKto32JrmaWeA1XLZqnuDzt7cFLoccP7DF1aDa2E0mrQTTPjHp3ilnNrbEKjotREYztc58/BPRTVD1qO02yfMskoTAJOTJFnBFxHzgMShdIz653luffnrObInXfVudZbcVGu7a10zDfPKKFAyLXSK/h7L6MWmSJVqGZL0mwf7nctGWp9xCKvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6246.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(38070700005)(4326008)(83380400001)(186003)(9686003)(7696005)(6506007)(508600001)(26005)(38100700002)(53546011)(33656002)(54906003)(110136005)(55016003)(86362001)(8676002)(316002)(71200400001)(8936002)(5660300002)(52536014)(2906002)(64756008)(66476007)(76116006)(66556008)(66446008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUtoMFFLdDljdDcyK2lWNGxWWHFQUk1xcWkrZmV6c0FkUTBVeUEwaWgxUW5o?=
 =?utf-8?B?RjNwc2doVWFkSkR4Qm5UMERrT0lyaWtvRXd2a0M2eHlsb1JMbVk3WGxsY1J0?=
 =?utf-8?B?blVzeFZrR21vaDZnYlV6a2h2L0NPMTBTMXcwS3ZoVE1GWEpxM1E3RWxqb0Jy?=
 =?utf-8?B?K3JJaU94TWlTdnk4dC9JazVZS0xqNTNKUEttcjFJcmFDSGxFZGdkdVVuTnVk?=
 =?utf-8?B?WW9IQUJObzNJV0o0d3BoUFZ6WTlGN3NMVWhQWE45Z25pc2tLSjN1TDN5Qkl1?=
 =?utf-8?B?YXhrOWRFcFoyTXQwVUgwejRLME11R1BDcTdycnlUc1pPc1NIQllXcnRyVFdu?=
 =?utf-8?B?RThzN0l1STRHcXFSQU1CVml1cHFiVzkvRCtndCtoNXUzYUtKRER0ODdlTzFH?=
 =?utf-8?B?dmdJb1VVMmZ2QkdZUFZFY3RKbEsvaVBGejVVNEtHWTl0aEk3VWxiSC95alZ5?=
 =?utf-8?B?bDdLdFhSYllTZm1Xc000d1lKbzNaR2xuZVhmM2pEYmFkQ0JOcnY5UDY3eVdR?=
 =?utf-8?B?bnM0R2hqbldnYlVTa1cvaVU4aE82bjBQcHdlZlM4UjBvRTlVY3VmdmxOQmpQ?=
 =?utf-8?B?aEJIVVZGTEx1UWNmV2FOUlhBN1ByeGR6SUhNRUp3d3Exb090ZEVYc0hDNWZF?=
 =?utf-8?B?a1VJTEtHcFRreGtkYU5vMGhzYzROUnpUTUFLanVSU3hGblVsYnJ5RGI1ZHFo?=
 =?utf-8?B?K3FrUkU0OEt3S2QrcTVLSkR3OFUra200NFM3Z0pSRFRUVHhtb0F0a3dzdDU3?=
 =?utf-8?B?Tm1hTGErMkRmOHJEWU0xUzNRcHhxQk1BU3JzUHo1ek5PcGRhRGlsZ2dOeHJt?=
 =?utf-8?B?K2JWamZTdlJkRm9jM0Fkb0ovUGFYZ2FJY05FSXQrVGVObjdobS9VZUxRaTRM?=
 =?utf-8?B?Ym5oWWhiR1NhTExuVE9RVjJWUDlDNmo2U2tSdnhlMjVJYVVyY3NBd2dUc3Fp?=
 =?utf-8?B?WVNvNDl6MUh2QmRPelBVNVlIcklwVllVREN1bkJqSUF2NHpXRm5qZnFWNDg3?=
 =?utf-8?B?V2wwTnhXU2Y2Z2o5YldnU2YvWmJtRE1PU2x0MENySGRlc3ZwbEU1Q083UGhu?=
 =?utf-8?B?Y1VvQXZPcDJjbFY0U0NoSkF4WTBlWTczb1F0NE5FZmxrNUtOeTVYZkJycnlP?=
 =?utf-8?B?cHQ0WEI3VUxCKytQaUpXSFBYa2RXT3JtSUU5allFeUxkdHVjWWphdUFQaE1L?=
 =?utf-8?B?WGRDNHEwYjBrTDFNRmg2bGxGWGx6YTV1ZlJKeDlIemNzVlFoOFpmS25Xam5F?=
 =?utf-8?B?YnpSempWTWI4dGVwRHAzR0RQWDJ6NDFINFFRS0FoNVJYTHA2emhDZitmWjdn?=
 =?utf-8?B?NkVqZGtnSEZpM1l6NzRac3gySC9jZzJ4NHpkRm5OTE9rREhoVW0yY1BPMHJm?=
 =?utf-8?B?blFTVFFRSUhxdGxsTmxxRSt2SUgrdFR1QVZ2OUFwMGorUmV5eUdKYzZIM0ZE?=
 =?utf-8?B?T0dMdHlIc0t4cjhGSFdHWjZuL1hybFh1alVnWFQwNzdJYWhIUkpEYnhFSGJ4?=
 =?utf-8?B?MW05K3NqaXQzVTdLTXcwQTliSEtNcDlhTUo1MXd5bGFiczVUcytKa2dzNnZv?=
 =?utf-8?B?dHJRQ3c1VjFqRWxXMnMvT0ZZTW5zSVQ2ZXdiVHdVcU9GYUV1eHY1empKc1R5?=
 =?utf-8?B?RFRPQXkzT0duWUt4ZW4zQ3dMdHZldnBtMGs5WE0vYUloTVZORmJiQklualFl?=
 =?utf-8?B?RFBJcnEwNDhEZFRNQ1RGaGhCT29VV2QvMGxuNnNwZE51RWRFTVpkS2V4aWZU?=
 =?utf-8?B?U2hLcWhEMHZDRjY4eHB6Y1Q5Z2Myckg5aExQUUxPeDYwMTZOcC9KUlRqWEhQ?=
 =?utf-8?B?L1BvaXBPNTFYVkIxWG9XVUkwbjJQaDdOVVdsUmV6d0J0VzJGS2x0TUpFSkdt?=
 =?utf-8?B?WkZOeURYTGR1UVMwQnd6V1B3VjhrczZITGVLM1lndHZtUmpkUjh2dE9CSjdG?=
 =?utf-8?B?bFZNQkpKMmlNM1N0VHFHcDFqVmdLSWtXY1RRak1BRFIrZ0t4TXpnenpTd0Jj?=
 =?utf-8?B?c1FRSWN1Z3h6UU03bGd1Ly9qSGxvYkIvQTJoNzZIWER5My9tcEl2eDVvS04r?=
 =?utf-8?B?dmJGSENzK0Y3Q2Z1Rm5maDdrVjBVVzI2cnJKS01XTUJuYTI3ZXZHblA3ZjZH?=
 =?utf-8?B?TXZXSFpkZUUvRVJYUFk3eHplVVRITHJ6U2hWYXdlelByUEFnd1Bud2RPWGg4?=
 =?utf-8?B?Ni9pVk4xSVR1ZWZaSU5EY2dDWldBdjR0eTRxOG52RERwdFBsZEFhTFlqMTdI?=
 =?utf-8?B?YVRhTnprNG1lbExOdWNIVFhhRU4rMGJTTGxRN01TN215OUlnZ0g4Q0g0YTlV?=
 =?utf-8?B?RjdDNnMxSmcyWEFmL29seE1BcDZKaDRWbjJNRG5PNTkrcXZ6VU9kYXo3OGVE?=
 =?utf-8?Q?17/XDWYtsOk4uECM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6246.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 062cae81-e08c-490e-f777-08da3fb40179
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 07:39:17.7310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwwG70zd26hBw98V7NNqdapFWlM+t8U0d/dDQ2j8VrisSlR/JUfTfputJqDikdXXOE+Iz96F0zu11m5M93vnrXOsqSddOg+fn1vvg36wMdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5238
X-Proofpoint-GUID: EEkD99UfhxpbW1oXTFMoaNBkB4VIkd_L
X-Proofpoint-ORIG-GUID: EEkD99UfhxpbW1oXTFMoaNBkB4VIkd_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_02,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205270038
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gU2VudDogTW9udGFnLCAyMy4g
TWFpIDIwMjIgMTA6NDANCj4gVG86IEhlbm5lcmljaCwgTWljaGFlbCA8TWljaGFlbC5IZW5uZXJp
Y2hAYW5hbG9nLmNvbT47IExpbnVzIFdhbGxlaWoNCj4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+DQo+IENjOiBsaW51eC1ncGlv
QHZnZXIua2VybmVsLm9yZzsga2VybmVsQHBlbmd1dHJvbml4LmRlDQo+IFN1YmplY3Q6IFtQQVRD
SF0gZ3BpbzogYWRwNTU4ODogUmVtb3ZlIHN1cHBvcnQgZm9yIHBsYXRmb3JtIHNldHVwIGFuZA0K
PiB0ZWFyZG93biBjYWxsYmFja3MNCj4gDQo+IA0KPiBJZiB0aGUgdGVhcmRvd24gY2FsbGJhY2sg
ZmFpbGVkIGluIHRoZSBncGlvIGRyaXZlciwgaXQgZmFpbHMgdG8gZnJlZSB0aGUgaXJxIChpZiB0
aGVyZSBpcw0KPiBvbmUpLiBUaGUgZGV2aWNlIGlzIHJlbW92ZWQgYW55aG93LiBJZiBsYXRlciBv
biB0aGUgaXJxIHRyaWdnZXJzLCBhbGwgc29ydHMgb2YNCj4gdW5wbGVhc2FudCB0aGluZ3MgbWln
aHQgaGFwcGVuIChlLmcuIGFjY2Vzc2luZyB0aGUgc3RydWN0IGFkcDU1ODhfZ3BpbyB3aGljaA0K
PiBpcyBhbHJlYWR5IGZyZWVkIGluIHRoZSBtZWFudGltZSBvciBzdGFydGluZyBpMmMgYnVzIHRy
YW5zZmVycyBmb3IgYW4gdW5yZWdpc3RlcmVkDQo+IGRldmljZSkuIEV2ZW4gYmVmb3JlIGlycSBz
dXBwb3J0IHdhcyBhZGRlZCB0byB0aGlzIGRyaXZlciwgZXhpdGluZyBlYXJseSB3YXMNCj4gd3Jv
bmc7IGJhY2sgdGhlbiBpdCBmYWlsZWQgdG8gdW5yZWdpc3RlciB0aGUgZ3Bpb2NoaXAuDQo+IA0K
PiBGb3J0dW5hdGVseSB0aGVzZSBjYWxsYmFja3MgYXJlbid0IHVzZWQgYW55IG1vcmUgc2luY2Ug
YXQgbGVhc3QgYmxhY2tmaW4gd2FzDQo+IHJlbW92ZWQgaW4gMjAxOC4gU28ganVzdCBkcm9wIHRo
ZW0uDQo+IA0KPiBOb3RlIHRoYXQgdGhleSBhcmUgbm90IHJlbW92ZWQgZnJvbSBzdHJ1Y3QgYWRw
NTU4OF9ncGlvX3BsYXRmb3JtX2RhdGENCj4gYmVjYXVzZSB0aGUga2V5Ym9hcmQgZHJpdmVyIGFk
cDU1ODgta2V5cy5jIGFsc28gbWFrZXMgdXNlIG9mIHRoZW0uDQo+IChJIGRpZG4ndCBjaGVjayBp
ZiB0aGUgY2FsbGJhY2tzIG1pZ2h0IGhhdmUgYmVlbiBjYWxsZWQgdHdpY2UsIG1heWJlIHRoZXJl
IGlzDQo+IGFub3RoZXIgcmVhc29uIGhpZGRlbiB0byBiZXR0ZXIgbm90IGNhbGwgdGhlc2UgZnVu
Y3Rpb25zLikNCj4gDQo+IFRoaXMgcGF0Y2ggaXMgYSBwcmVwYXJhdGlvbiBmb3IgbWFraW5nIGky
YyByZW1vdmUgY2FsbGJhY2tzIHJldHVybiB2b2lkLg0KPiANCj4gRml4ZXM6IDgwODg0MDk0ZTM0
NCAoImdwaW86IGFkcDU1ODgtZ3BpbzogbmV3IGRyaXZlciBmb3IgQURQNTU4OCBHUElPDQo+IGV4
cGFuZGVycyIpDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+DQoNCkFja2VkLWJ5OiBNaWNoYWVsIEhlbm5lcmljaCA8bWlj
aGFlbC5oZW5uZXJpY2hAYW5hbG9nLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3Bpby9ncGlv
LWFkcDU1ODguYyB8IDE5IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
OSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1hZHA1
NTg4LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1hZHA1NTg4LmMgaW5kZXgNCj4gZjFlNGFjOTBlN2Qz
Li5lMzg4ZTc1MTAzZjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLWFkcDU1ODgu
Yw0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1hZHA1NTg4LmMNCj4gQEAgLTQwNiwxMiArNDA2
LDYgQEAgc3RhdGljIGludCBhZHA1NTg4X2dwaW9fcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4g
KmNsaWVudCkNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiANCj4gLQlpZiAocGRh
dGEgJiYgcGRhdGEtPnNldHVwKSB7DQo+IC0JCXJldCA9IHBkYXRhLT5zZXR1cChjbGllbnQsIGdj
LT5iYXNlLCBnYy0+bmdwaW8sIHBkYXRhLQ0KPiA+Y29udGV4dCk7DQo+IC0JCWlmIChyZXQgPCAw
KQ0KPiAtCQkJZGV2X3dhcm4oJmNsaWVudC0+ZGV2LCAic2V0dXAgZmFpbGVkLCAlZFxuIiwgcmV0
KTsNCj4gLQl9DQo+IC0NCj4gIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBkZXYpOw0KPiAN
Cj4gIAlyZXR1cm4gMDsNCj4gQEAgLTQxOSwyMCArNDEzLDcgQEAgc3RhdGljIGludCBhZHA1NTg4
X2dwaW9fcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4gKmNsaWVudCkNCj4gDQo+ICBzdGF0aWMg
aW50IGFkcDU1ODhfZ3Bpb19yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkgIHsNCj4g
LQlzdHJ1Y3QgYWRwNTU4OF9ncGlvX3BsYXRmb3JtX2RhdGEgKnBkYXRhID0NCj4gLQkJCWRldl9n
ZXRfcGxhdGRhdGEoJmNsaWVudC0+ZGV2KTsNCj4gIAlzdHJ1Y3QgYWRwNTU4OF9ncGlvICpkZXYg
PSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gLQlpbnQgcmV0Ow0KPiAtDQo+IC0JaWYg
KHBkYXRhICYmIHBkYXRhLT50ZWFyZG93bikgew0KPiAtCQlyZXQgPSBwZGF0YS0+dGVhcmRvd24o
Y2xpZW50LA0KPiAtCQkJCSAgICAgIGRldi0+Z3Bpb19jaGlwLmJhc2UsIGRldi0NCj4gPmdwaW9f
Y2hpcC5uZ3BpbywNCj4gLQkJCQkgICAgICBwZGF0YS0+Y29udGV4dCk7DQo+IC0JCWlmIChyZXQg
PCAwKSB7DQo+IC0JCQlkZXZfZXJyKCZjbGllbnQtPmRldiwgInRlYXJkb3duIGZhaWxlZCAlZFxu
IiwgcmV0KTsNCj4gLQkJCXJldHVybiByZXQ7DQo+IC0JCX0NCj4gLQl9DQo+IA0KPiAgCWlmIChk
ZXYtPmNsaWVudC0+aXJxKQ0KPiAgCQlmcmVlX2lycShkZXYtPmNsaWVudC0+aXJxLCBkZXYpOw0K
PiANCj4gYmFzZS1jb21taXQ6IDRiMDk4NmEzNjEzYzkyZjRlYzFiZGM3ZjYwZWM2NmZlYTEzNTk5
MWYNCj4gLS0NCj4gMi4zNS4xDQoNCg==
