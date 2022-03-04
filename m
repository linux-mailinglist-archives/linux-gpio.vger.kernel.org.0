Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6F0F4CD076
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Mar 2022 09:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbiCDIuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Mar 2022 03:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbiCDIuu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Mar 2022 03:50:50 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60126.outbound.protection.outlook.com [40.107.6.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FE519D63C
        for <linux-gpio@vger.kernel.org>; Fri,  4 Mar 2022 00:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9wh/pNz/rYy65QHdUjBjq7KJ/PffQqdemBf8q04yuMbYtxx/E3QdqzMlZ3AV7zlI72rk5PrACSd2yAf24cm+vF3o6dvuE/BntlU5Q3PBqOFPeTgwJhhlMkNKH2pRS/ETfERZKBDHk0sga5bKx+wtztb36wQGWUoq8lda8lsPY4UlMV7H7/A9hXf2vHYLyXwFV4wWq+Q7RGkWaimtEWLW+4QQqWXtnxKUUTSdIJKFuLIDQVXFGPdIKMTwLSVrUGLdAf4M7ureZT4vALUz16uuybFJ0poZF/WPoY+vqAiDBmG2hUq6t0EUtRcybuvnGOJxKAtEzmZxwsH66BrTQ4uxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+XJQMnUzy6taFOK5MI+Zd4L3Kc7zbXobg8EJIEBnG4=;
 b=EngeuNpsbIcQPOGcP3Ut/dbJbttmBYxVn5Fe7ehKExYYUyMK9MHzS4fHDhSr0HryMuB9FoIdSvV403dQVdFTMB65/wJQuKkxRGYT8tCL2oomWKZB6lMPixrAlZh090o9crntUPjSImm2VzNypx6biwoA5YPuQHq5aT413CBZnzbGGXKovpyjI+GQyht5I+wlKd+JxORW4cRYKG1KTPgygYqqFtxaBLJdCjU4dQbrORvme7T40CkGIGy5YOR21qPsvDDH7DCYkXS94pAMwl8b4Qi35CwLHP0vKRac1uhfhVBD8DjuNOLdXlsQvBMGwVeRuqEPQJHJkekph9goKpw+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 80.156.237.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=heitec.hu;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=heitec.hu; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitec.hu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+XJQMnUzy6taFOK5MI+Zd4L3Kc7zbXobg8EJIEBnG4=;
 b=lac38NgcU0C4a7K1R77BAQr4lZZWg/E15xVM1qCChQfHQaX5VNXT3xcRmZ6zi5+IkwK3+ixqvGw+DIKVp5LQOHmCnLqPfgKx528hDgV59f9gM2UmX51kRk7eBqWIZkYCHJl4dniOl+Sr2rIOzobDalyB/jnLHNXNhh960goS0Ktj5Qh5PmTc5KRcu9jSppTOW5wxs+hyBU/OTcMK113LbQwBzaJFfC2Nqo96VW9pLFoubh4+icUFOK/DBPw8RoNoRGJXcuHXX1x/C4kzok/87Tv0xgc/Oh20eIXaqLcXNytmHZlBjpVpL+JLWAaoGYE4xpsjsfeWB6H3VSVbJ7fo5A==
Received: from DB6PR07CA0057.eurprd07.prod.outlook.com (2603:10a6:6:2a::19) by
 HE1PR1001MB1084.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:68::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Fri, 4 Mar 2022 08:49:57 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::45) by DB6PR07CA0057.outlook.office365.com
 (2603:10a6:6:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.9 via Frontend
 Transport; Fri, 4 Mar 2022 08:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 80.156.237.35)
 smtp.mailfrom=heitec.hu; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=heitec.hu;
Received-SPF: Fail (protection.outlook.com: domain of heitec.hu does not
 designate 80.156.237.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=80.156.237.35; helo=ERLMX03.heitec.net;
Received: from ERLMX03.heitec.net (80.156.237.35) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Fri, 4 Mar 2022 08:49:56 +0000
Received: from ERLMX02.heitec.net (10.100.1.32) by ERLMX03.heitec.net
 (10.100.1.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.20; Fri, 4 Mar 2022
 09:49:55 +0100
Received: from ERLMX02.heitec.net ([fe80::f5b0:d2fa:410c:3e5c]) by
 ERLMX02.heitec.net ([fe80::f5b0:d2fa:410c:3e5c%5]) with mapi id
 15.02.0922.020; Fri, 4 Mar 2022 09:49:55 +0100
From:   =?iso-8859-1?Q?Attila_Hannib=E1l?= <Attila.Hannibal@heitec.hu>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [libgpiod] enlarge gpiochip label size
Thread-Topic: [libgpiod] enlarge gpiochip label size
Thread-Index: AdgvnwzuMt+uHMyzQq2LBfTSc51u4g==
Date:   Fri, 4 Mar 2022 08:49:55 +0000
Message-ID: <81fbaa1baa804df7a9d39faaff008f4a@heitec.hu>
Accept-Language: en-GB, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9b99bf3d-2e0c-445f-93a1-ddb2dc1111a0_ActionId=a665465f-db16-4bfb-8527-e694dc26b9f1;MSIP_Label_9b99bf3d-2e0c-445f-93a1-ddb2dc1111a0_ContentBits=0;MSIP_Label_9b99bf3d-2e0c-445f-93a1-ddb2dc1111a0_Enabled=true;MSIP_Label_9b99bf3d-2e0c-445f-93a1-ddb2dc1111a0_Method=Standard;MSIP_Label_9b99bf3d-2e0c-445f-93a1-ddb2dc1111a0_Name=Benutzerdefiniert;MSIP_Label_9b99bf3d-2e0c-445f-93a1-ddb2dc1111a0_SetDate=2022-03-04T08:03:34Z;MSIP_Label_9b99bf3d-2e0c-445f-93a1-ddb2dc1111a0_SiteId=abfab640-a0f3-4e20-8177-b6029012df7e;
x-originating-ip: [10.92.0.134]
x-olx-disclaimer: ERLMX03.HEITEC.NET
Content-Type: multipart/mixed;
        boundary="_003_81fbaa1baa804df7a9d39faaff008f4aheitechu_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8123958-6817-4b60-934f-08d9fdbbf55b
X-MS-TrafficTypeDiagnostic: HE1PR1001MB1084:EE_
X-Microsoft-Antispam-PRVS: <HE1PR1001MB108409A3D8D99616113573CBFB059@HE1PR1001MB1084.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1fKLVKI6746/q36mPYzknja+DJHkHuzBgUeFKgOLpeYmdUoLbaxNGU0wTqshFaFeFNuQtQNgPomwkG+koX34HD8wS4gh92XnlG/DYsFtRuhKCEY6ZQCfShW5AsRnMiJenH2X9FFyLxkU4MJiuSIIpIq1QzJTL3Y3Q4phpNYd353o/izqtzw1uRxKKHrSWQpNyG7n0GChW7lgxSfDmFLaL5rWRrVbGmPAsDOTMMr2uVk7aQ/p4Y4obo8rjKQWl/zFBK5YS+ot3lEKERS0AwE49IiTmzGUUugcKCIYB1mX6Y9dNhyqfL259PREJLUF02ix9qPZxL6NpAPlSZ/CF0OfhNAEVL2qmlha6k/be/XLDbIPMbrSnC9saO5EgTb8zYRqkzO3umaMTcb0xsME7pGlcrqZyuaFuZFoqa3IA3M6clxFEKl1IwwVchlHSCFv6sneyYQ/6VZnYyxJtfUukpyAy7X+iAMlc4X71D2DSIy1YFqQguxZeMFivcBhHQI0b4DEF6ALhOkEXSVax7H803xJ71qO+Z2Zy9BIUMl+e06GI/xJAqdyH+suAavGn02ziGq14ax0GXwfDh9FK4rHQub9lz/+bRYyusOGLcv7zoQ3LDg63gQnRwoeUWsIorP1eyObT7a2l0HPwcC8rs5AEvZMn3MvPYz9fglK20qF3fB/rErfxVVHfiQ2b2MeyL+kTgaNRGStTvytPCJQcZVJ0iUYhnMjpeuFG20qCZU64j/BC91f1pdeN/onw8X08IBwrnsb4gXVUQgOVcfjX16Tc9tFCVpn2vHnX4URHMor3Uj5zMD8Igxbxq9mblhEDiSJ7dcx27bTiD71BaTrwBLF3nIy/flnkw8rEBM7kEzpKcwPqd9Uo4l2UsIh11WqQfoq85o
X-Forefront-Antispam-Report: CIP:80.156.237.35;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ERLMX03.heitec.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(39850400004)(346002)(376002)(136003)(396003)(36840700001)(40470700004)(46966006)(966005)(235185007)(47076005)(108616005)(8936002)(356005)(82740400003)(5660300002)(36860700001)(83380400001)(508600001)(66574015)(336012)(186003)(2616005)(26005)(6916009)(40480700001)(316002)(8676002)(70586007)(2906002)(70206006)(82310400004)(99936003)(86362001)(81166007)(36756003)(40460700003)(24736004)(161623001)(147533002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: heitec.hu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 08:49:56.5985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8123958-6817-4b60-934f-08d9fdbbf55b
X-MS-Exchange-CrossTenant-Id: abfab640-a0f3-4e20-8177-b6029012df7e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abfab640-a0f3-4e20-8177-b6029012df7e;Ip=[80.156.237.35];Helo=[ERLMX03.heitec.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR1001MB1084
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--_003_81fbaa1baa804df7a9d39faaff008f4aheitechu_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Community!

We use in our product an Arria10 SoC where we place several Intel/Alter PIO=
s in the FPGA design.
These GPIOs are accessible using the corresponding device-tree entries
...
       label: gpio@0x130 {
              compatible =3D "altr,pio-18.1", "altr,pio-1.0";
              reg =3D <0x00000130 0x00000010>;
              altr,gpio-bank-width =3D <2>;
              resetvalue =3D <0>;
              #gpio-cells =3D <2>;
              gpio-controller;
       };
...

We use also the libgpiod framework to control the lines.
However, there is a problem with the generated label attribute of the gpioc=
hip.
In case the gpio-controller is instantiated via device-tree like gpio-alter=
a.c, it calls the common of_mm_gpiochip_add_data() function which fills the=
 label as:
...
gc->label =3D kasprintf(GFP_KERNEL, "%pOF", np);
...
That generates a kind of "top-down path" to the gpio-controller itself, tha=
t is usually longer than 32 characters.
As a result a simple gpiodetect call will print the following output:
...
gpiochip0 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip1 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip10 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip11 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip12 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip13 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip14 [ffc02900.gpio] (29 lines)
gpiochip2 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip3 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip4 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip5 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip6 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip7 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip8 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
gpiochip9 [/soc/bridge@0xc0000000/gpio@0x1] (32 lines)
...
As you can see - due to missing endings - it is almost impossible to determ=
ine which gpiochipX is which entry in the device-tree.

The 32 character wide limitation are defined in two places: one in the kern=
el UAPI header file and one in the core.c file of the libgpiod library.
Since this information is passed through the ioctl interface both occurrenc=
es must be changed at the same time.
I'm attaching the corresponding 2 patch files.
After the modification the gpiodetect prints the labels (paths) correctly:
...
gpiochip0 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0xa0] (32 lines)
gpiochip1 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0xb0] (32 lines)
gpiochip10 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x190] (32 lines=
)
gpiochip11 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x1a0] (32 lines=
)
gpiochip12 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x1b0] (32 lines=
)
gpiochip13 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x280] (32 lines=
)
gpiochip14 [ffc02900.gpio] (29 lines)
gpiochip2 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0xc0] (32 lines)
gpiochip3 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0xd0] (32 lines)
gpiochip4 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x130] (32 lines)
gpiochip5 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x120] (32 lines)
gpiochip6 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x170] (32 lines)
gpiochip7 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x160] (32 lines)
gpiochip8 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x150] (32 lines)
gpiochip9 [/soc/bridge@0xc0000000/bridge@0x001000000/gpio@0x180] (32 lines)
...

Do you think that it is worth to add to the mainline source code?

Best regards
Attila


__________________________________________________
Attila Hannib=E1l
Lead Software Engineer
Electronics and Embedded Systems

HEITEC Hungary Kft.
Kaposv=E1r utca 14-18
H-1117 Budapest

Phone: +36 1 551 5153
Fax:     +36 1 551 5279
E-Mail:   mailto:attila.hannibal@heitec.hu
Internet: https://www.heitec.hu


________________________________
IMPORTANT NOTICE / WICHTIGER HINWEIS
This communication contains information which is confidential and may also =
be privileged. It is for the exclusive use of the intended recipient(s). If=
 you are not the intended recipient(s) please note that any distribution, c=
opying or use of this communication or the information in it is strictly pr=
ohibited. If you have received this communication in error please notify us=
 immediately by email or by telephone and then delete this email and any co=
pies of it.
Diese E-Mail koennte vertrauliche und/oder rechtlich geschuetzte Informatio=
nen enthalten. Wenn Sie nicht der richtige Adressat sind oder diese E-Mail =
irrtuemlich erhalten haben, informieren Sie bitte sofort den Absender und v=
ernichten Sie diese Mail. Das unerlaubte Kopieren sowie die unbefugte Weite=
rgabe dieser Mail sind nicht gestattet.

Ez az email bizalmas =E9s/vagy jog =E1ltal v=E9dett inform=E1ci=F3kat tarta=
lmazhat. Amennyiben nem =D6n az =FCzenet c=EDmzettje vagy t=E9ved=E9sbol ka=
pta meg, k=E9rj=FCk inform=E1lja errol a felad=F3t =E9s t=F6r=F6lje ezt az =
=FCzenetet. Az =FCzenetet enged=E9ly n=E9lk=FCl nem m=E1solhat=F3 vagy tov=
=E1bb=EDthat=F3.
________________________________


--_003_81fbaa1baa804df7a9d39faaff008f4aheitechu_
Content-Type: application/octet-stream;
	name="0006-label-size-increased.patch"
Content-Description: 0006-label-size-increased.patch
Content-Disposition: attachment; filename="0006-label-size-increased.patch";
	size=594; creation-date="Fri, 04 Mar 2022 08:06:37 GMT";
	modification-date="Fri, 04 Mar 2022 08:06:37 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2NmM3ZGYyNmNiZDBlMTQxZTVmZGFjZmZjZTEyMTUzNzNhMWM1MDIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QXR0aWxhPTIwSGFubmliPUMzPUExbD89IDxB
dHRpbGEuSGFubmliYWxAaGVpdGVjLmh1PgpEYXRlOiBUaHUsIDMgTWFyIDIwMjIgMTE6MDc6NTcg
KzAwMDAKU3ViamVjdDogW1BBVENIXSBsYWJlbCBzaXplIGluY3JlYXNlZAoKLS0tCiBpbmNsdWRl
L3VhcGkvbGludXgvZ3Bpby5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2dwaW8uaCBi
L2luY2x1ZGUvdWFwaS9saW51eC9ncGlvLmgKaW5kZXggNGViZmUwYWM2YzViLi5kYTdhMWI4MWQz
ZTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9ncGlvLmgKKysrIGIvaW5jbHVkZS91
YXBpL2xpbnV4L2dwaW8uaApAQCAtMjMsNyArMjMsNyBAQAogICovCiBzdHJ1Y3QgZ3Bpb2NoaXBf
aW5mbyB7CiAJY2hhciBuYW1lWzMyXTsKLQljaGFyIGxhYmVsWzMyXTsKKwljaGFyIGxhYmVsWzY0
XTsKIAlfX3UzMiBsaW5lczsKIH07CiAK

--_003_81fbaa1baa804df7a9d39faaff008f4aheitechu_
Content-Type: application/octet-stream;
	name="0001-label-size-increased.patch"
Content-Description: 0001-label-size-increased.patch
Content-Disposition: attachment; filename="0001-label-size-increased.patch";
	size=545; creation-date="Fri, 04 Mar 2022 08:06:37 GMT";
	modification-date="Fri, 04 Mar 2022 08:06:37 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1Y2E3ZDQ2YTI1NDZlMGZiMGVhMjNjMWNmYTE1NDcyYzg2MzhlODMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QXR0aWxhPTIwSGFubmliPUMzPUExbD89IDxB
dHRpbGEuSGFubmliYWxAaGVpdGVjLmh1PgpEYXRlOiBUaHUsIDMgTWFyIDIwMjIgMTM6MDY6MDkg
KzAxMDAKU3ViamVjdDogW1BBVENIXSBsYWJlbCBzaXplIGluY3JlYXNlZAoKLS0tCiBsaWIvY29y
ZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvbGliL2NvcmUuYyBiL2xpYi9jb3JlLmMKaW5kZXggMDVlNWE0Ni4uMDc3
MjFhMyAxMDA2NDQKLS0tIGEvbGliL2NvcmUuYworKysgYi9saWIvY29yZS5jCkBAIC01Nyw3ICs1
Nyw3IEBAIHN0cnVjdCBncGlvZF9jaGlwIHsKIAlpbnQgZmQ7CiAKIAljaGFyIG5hbWVbMzJdOwot
CWNoYXIgbGFiZWxbMzJdOworCWNoYXIgbGFiZWxbNjRdOwogfTsKIAogc3RhdGljIGJvb2wgaXNf
Z3Bpb2NoaXBfY2Rldihjb25zdCBjaGFyICpwYXRoKQo=

--_003_81fbaa1baa804df7a9d39faaff008f4aheitechu_--
