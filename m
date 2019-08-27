Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 570629E4F6
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 11:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbfH0JzD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 05:55:03 -0400
Received: from mail-eopbgr1410092.outbound.protection.outlook.com ([40.107.141.92]:6073
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728806AbfH0JzD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Aug 2019 05:55:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSMdTn9Td1ky/cgEWPV3PP2wKemM+3+SPnyUpkug7mJeVVKe6UK8Qq3YbEPWVXj4cM5D2fDQ5x3NcpBkZlK9O/bRJcQuw3Zm7tfIYVAVo74Yi/WZZnnt4oaGFC9U6JwqNlHF/50g9ngHIUxDyHqQpHvwMNPkDypS6eqCODQ7xr/7ogyJLTnieWNTSVsQoc7RCc8gJT+NVi9W2rm71H7wXUVSJB7hT9cRCwby25pqRC8tzc6jMlbCFh61tZDPBtrSfUJXTXVOx6XGWsnXKio35+CkrpSPseO1YE38pRPPHZnGPNr8VBrZLl06cbq3tzTqqus2IGMiPbSWiFMmkV3yGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAnHJkPmIEkZXOFppTtxYHaRfVwRvkcxMfixMYt0w5A=;
 b=bUIaEzX4yqCK+z5+eoj3/8yqMoIU4rfU/0VMrinz5HTCx6JPaEJ+QQHJdFqxlva4POgXK7tiKPzqUPu2G70IIW/H6m6gv8RZXRG9mu9kdo+DMIil42oAJilvZvMfdGOwRzlGI5XEFNNjXdKpHtfSpm3ZkbBh4RC0Dxvxi4UD9W/O94isnn2YgGFmL6t8vPpMgZTzsrruiGdc7H3aoM9YbkMQ9XBrLTzMcmKcshLQvE/gxw1jqCwV+9brzWfP1oNII2I3/7lECQPQBP3b7NOQrvjqXUOYJTdIzXY5j5C46nrKhAP7gFwRkM0VYM327wPZw/ZHDtF44Gd1mDwyO1cv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAnHJkPmIEkZXOFppTtxYHaRfVwRvkcxMfixMYt0w5A=;
 b=Otv12T5xaNkvLtwWqliGerzXjXEYGdFjxawwbFry6MqJxWNwCvhyq6yEAdp+kC7xAtxLkM9NXgVKs0y2f9oUBRJfAJIDdXR0od29e2jD8aCJzpIHCVejttiDK8gEK6h+RpZkE+PN2sKdNrVBGFAbIyQjqA6jmojLR9h9IRx8xXg=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2912.jpnprd01.prod.outlook.com (20.177.103.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 09:55:00 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 09:55:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: sh-pfc: Unlock on error in sh_pfc_func_set_mux()
Thread-Topic: [PATCH] pinctrl: sh-pfc: Unlock on error in
 sh_pfc_func_set_mux()
Thread-Index: AQHVXLtgisE+/mhVkkyLWyOD2zng+KcOwRUg
Date:   Tue, 27 Aug 2019 09:54:59 +0000
Message-ID: <TYAPR01MB454438EC8C4F01FB5F0B24F0D8A00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190827093927.GB8443@mwanda>
In-Reply-To: <20190827093927.GB8443@mwanda>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4899bfa7-7a3c-42c2-af87-08d72ad4a008
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2912;
x-ms-traffictypediagnostic: TYAPR01MB2912:
x-microsoft-antispam-prvs: <TYAPR01MB2912A1C13C28664C92ECD1DED8A00@TYAPR01MB2912.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(189003)(199004)(4744005)(305945005)(66066001)(66946007)(66556008)(66476007)(76116006)(446003)(256004)(66446008)(476003)(486006)(11346002)(99286004)(26005)(76176011)(186003)(64756008)(102836004)(6506007)(7696005)(71190400001)(71200400001)(74316002)(33656002)(316002)(3846002)(5660300002)(25786009)(9686003)(8676002)(8936002)(110136005)(54906003)(86362001)(229853002)(7736002)(2906002)(4326008)(6436002)(6246003)(6116002)(81156014)(81166006)(478600001)(14454004)(53936002)(55016002)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2912;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: InzLyIPolrN75KHQ2a5Cy5uEIfUxiUIaGdXxDPDGWDX1AxIVMzLvqfBy0iBf9d9+MhpDw/4E8ouNiBcZiEsqMpxSI16f/HhBikxuepbx7Ejm0OlMqaq9+SytcdItdXNb8KgM2QWDO/LmhprstOgA6CCsRJMq0kBNKZF94th/VU9Eb+ulN1F7074i6XvEB65FubGmngUUhFUF0SXzg4ZtYlkDXQUYpAYsgl2rPhLCooW30wE9ZnxcsctmyZS1BNMiKgXUYUx7d8QcO0QymMqKakBRlXnoDZlPGxvNZMnwIA6zOTjMnkA852GUdtQWWy0iCnKlLV+/AAVGKnIGV4PbMY59bqorzpAw85uvIXqv6R3o1tfgdZaNCnmw+4F0mFfxoN/JiN+Vvr7R0vp2BWA9X+lzAj6v+YyijQF+cExZw5A=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4899bfa7-7a3c-42c2-af87-08d72ad4a008
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 09:55:00.1312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TU5eHA/DkkOzPry6mRt+kQ0YhuEbEsT45qxbXisP8OzZ0lN44l0elGEFOJcoc2XQTnN17GMZVSLwwMFvlFCz6HLglOR0NNk0c1Mr3YYM6YY3SmFQX9WecHTB+kbGrSuW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2912
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dan,

> From: Dan Carpenter, Sent: Tuesday, August 27, 2019 6:39 PM
>=20
> We need to unlock and enable IRQs before we return on this error path.
>=20
> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when t=
he gpio is freed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

