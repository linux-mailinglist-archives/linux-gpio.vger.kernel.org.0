Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C556B24D493
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Aug 2020 14:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgHUMCP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Aug 2020 08:02:15 -0400
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:64315
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727106AbgHUMCM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Aug 2020 08:02:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3+yShEtlDjPxyUuDoiQtnDhfQhozL719gJa52FgHrNjMdHnERlfsL0qL+KQ44oG1BM/eLrFtN1aWd/oN7WnuVhrUNnyDxXNAbJddakI0SOXajhKVcWviQOHCjVkqCTYCHqaQhSY5skL8cqG3zKwvmWkkc+xihwEOBVTYDHNlcEDvm6zjXbHRQC4vfCwizShp5bwXecGoU7cR2h48tdIiTHQozmNy+Z5wjwU4UhfERcneZKJO3lyH1brYQfEzl2vIeYd+ILJgJf1KWY9ZizhO2eRpaGW6NGUgPZdbg4eNEeTYWbRC96ybL7MsJOtH9Phe1VizckO55EpRUdwWCV1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjXDUxnlgLV5Y2QCBXEO0qs6lsM2tuIeI2ZueMCK5Xk=;
 b=ZRqi4Z9ImMsIT8srbqco52mPZPHKqnGn62dnvxViraeqyIexUyDfT0MDFkPbMtCHkYk1RDl6TWiOOK1DQQMEzFHamz42sPYv08J9v2yBtjDISlqnQuTwPFgMCDME4jL6Urn14twOrha7no+8asMZlFZZfED4lmkfKLY8MR2LJwpcVUKm5pCL9+V/b/JfFXZdfcaiYihjcN0pHbkFISu+3UWMJvf15319u1x/fmtsRStto9UPKkkC7St+nn6pYH+LJooyobSWVulPe2A9DCOgnHvC/1d2t2y0Vi/6qbTtPUi5rsMCzS5NA8eXITjUVgStDbwzAP0ZYd8zzOBqhLvxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjXDUxnlgLV5Y2QCBXEO0qs6lsM2tuIeI2ZueMCK5Xk=;
 b=GQa5+DspNBBXmdgc/3OdIQvXkZW+YyLuT2OcKmdQutWMOYZg66w9ai8RnNOXxCWlu6HohMnks6ERXnZcULyhhBp1f9xGE2ZI9wUXiQhk7apZcNl1MZg8FqcJ3M2ei0mLZS5IlMxDCa44eOXwYnu7QrVe+Gy+nbrBsVxtA+RxQLw=
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com (2603:1096:603:1b::19)
 by OSBPR01MB3542.jpnprd01.prod.outlook.com (2603:1096:604:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 12:02:08 +0000
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::2cc4:7ed3:edeb:2576]) by OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::2cc4:7ed3:edeb:2576%5]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 12:02:08 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: rza1: Switch to using "output-enable"
Thread-Topic: [PATCH] pinctrl: rza1: Switch to using "output-enable"
Thread-Index: AQHWd6wxbSeiN5hWB0OTgz5d+/xho6lCdIwA
Date:   Fri, 21 Aug 2020 12:02:08 +0000
Message-ID: <OSAPR01MB21146DE11AEC049F47FA90988A5B0@OSAPR01MB2114.jpnprd01.prod.outlook.com>
References: <20200821111401.4021-1-geert+renesas@glider.be>
In-Reply-To: <20200821111401.4021-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMjEyZmUzZTAtZTNhNi0xMWVhLTk1MjAtOWNlYmU4Y2NjNTQ4XGFtZS10ZXN0XDIxMmZlM2UyLWUzYTYtMTFlYS05NTIwLTljZWJlOGNjYzU0OGJvZHkudHh0IiBzej0iNTY3IiB0PSIxMzI0MjQ4NDkyNTk1MjM0ODUiIGg9IkVkQmJPZDBtVzlzdU9MWHk0eW9wem5oazIyYz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dcb050c3-4e52-47a6-e5cc-08d845ca0772
x-ms-traffictypediagnostic: OSBPR01MB3542:
x-microsoft-antispam-prvs: <OSBPR01MB3542C17F7A38E9CA9E1AC3BE8A5B0@OSBPR01MB3542.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6XlIjVAG/gM00Smqr49/YGwtMDmhuz/7ZPkq+ValjG0+mL/fWBwBCvoYvT3jOdHr7STjEJr8CbQefbqDuhINM0wglfQCEhcCP8jr/e9PswqimRRPkXWHo1/aseaFztanZwJOHaTTKi3/1ofZ5muXTvhz7GSdzn+etM4t/TifcC1WJhqarpinBR7H1K4z3xCvMcPUMZanMRBsa45H9EnpEtWzc9PenT2vuAI+kYwQ6/WwxljVrRUlNH5MYUODaJ5jgHIhAsmk5G7yfJQzUZsozP3jwf9h38KNHlEfHv1T80n8p3el8UWvwWCAZfXOohIk2D4jwlf87Xxf0IIrZxkRlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2114.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(86362001)(9686003)(4744005)(66556008)(2906002)(66476007)(76116006)(52536014)(7696005)(55016002)(66946007)(64756008)(6506007)(5660300002)(4326008)(54906003)(316002)(71200400001)(66446008)(8676002)(83380400001)(26005)(478600001)(8936002)(186003)(110136005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 9C797pv3/x57ShZk3RF0LN7UN03B6mqVTbonR4s/r/+LawMZlijVB+dN+/m6lhElufdBE8a4wSB44hdT6Xgn6mmz7YzdZ8nPXnsD7MvI56oqSYFBxmJYrvo0+f00PIH7r+vuiZEoIa+8YM0ua2T42DuSylCow0u4aNlQ68EzxSdkIJPnuuoTqWiCzb6jKkTqrYXdg4Soz12PUSfWPbV+fbozTaW7m6G/KaAYNyfia+vwANOfJ+WTbBysI7BD/Lo8RKs9ReqYmEmm6DKITe45NmzKQhL2HJPEVhOZjrGjc/a+vPqe2+eYMLvIsjfbEb4b6AX3i+eExjMHuyc4/LYrWEhLcfrOGmyaS7K57XVvAPIFCnwHUeiSLH2I6r8F7/+aHD3mJmp1WbFwi4/D/Zn5KYxggf7VVJUztqhN636Jm+11MI9S9SKrQkFQC41ex+G45jprL41zq3PYeczuDQPvHILPQq/lI9bM+F/YT/5h8riCjS92bmpu3kbA/vcZqqhlTAyVR+z/2m7jCrJi5tUMVA/9Qap65zINufqHuTbJT8vrHYUd7xf6AZE0dT5BDbyYfRe4EJZIIAYj6UQbYgyFj5bziTzYetnurAZoNS+HvENOVpYlKUMGycTWv/ms38c/dspOGckhSu1ZChOGcTqb+Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2114.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb050c3-4e52-47a6-e5cc-08d845ca0772
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 12:02:08.0667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJO3MoJKoWc6trH5r7/Cec8fxSeLoH1YWH5Mfksee//uJJ3sZRAoi5oavwUHJSJl++U2wwUQcqMB1tpw4Mwq5bO9GQCW83WHGeHu4RPXzCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3542
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Fri, Aug 21, 2020, Geert Uytterhoeven wrote:
> Update the RZ/A1 Pin Controller DT bindings and driver to use this new
> property instead.  Preserve backwards compatibility with old DTBs in the
> driver, as this comes at a very small cost.

I see that after you make this change, the next patch converts the=20
bindings docs to json-schema, but you wanted to clean this up first.

Reviewed-by: Chris Brandt <chris.brandt@renesas.com>

Thank you,
Chris

