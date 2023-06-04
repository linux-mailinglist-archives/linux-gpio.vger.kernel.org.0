Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 527B9721798
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jun 2023 16:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjFDOE1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jun 2023 10:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjFDOE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jun 2023 10:04:26 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E45890
        for <linux-gpio@vger.kernel.org>; Sun,  4 Jun 2023 07:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBx822iBJWOTKvh6kWAzo4jmhHauWE0S02kKdiJF7yzi0sRZAt7ExamJ1OWon1phSeVHrPxcHFx0SNnpZIhal+upBvyVkdarIocB4BVYdF3LGmAOyyFqNphiVermrfpnr1odhTbMEgVbg+6yDp7At8NBqkVYJr+LxIRIWU0g+GDPZDKo82gQAcw+utLogwTpFZfmJfpfvTjwm4afhRZ4mOJDs6AeSt5irQRD8BPIQiS9ewB2KLe8PGsn1GeeIBrRG+BIyOkDWwIMvugdGrWgpDB6ocd6zlHSp17PeQwbRQ9TZjEviYwXGCf+o9Ok+99038ifiLhQMlijOEwd81nxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nh+2L7SzBvaqu86MlVaRbgSTiqdypKiHHVQn57SntXg=;
 b=I67i/jZ0mbS2Mb1pvbLh6uKRvDVOIK+DAwkAJvfE+QPPGjA+H7mOgdGeAJL40Fi+wj8MNhngRe/rbcp4bYLihRuOld0GcQVASl3mEcE4CaGh5j7L56Y2xhzdgW5rX3eXQHiZ8cbnSAOypoZPeDC+P/krjXDbuDhwfGupBtesK12AlQ5vWaW938KQAsIwckJKKOx2J/kwNuyiCwKFEi2SXwTtwnzeqATHoP73sIPidgRauqOdHhBKNZjcaRxmdPHgu4Saw3FuRGCe9xQm/FFuzlMayPmOksvZvRW1kxGz2xatY+ILiL+Vd5eG04L3dErbexCPsO6GVjsWD1RhQNNF/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exfo.com; dmarc=pass action=none header.from=exfo.com;
 dkim=pass header.d=exfo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=EXFO.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh+2L7SzBvaqu86MlVaRbgSTiqdypKiHHVQn57SntXg=;
 b=gFRw4XWrFv+FL4PFvbgtjPpWudjcBk97j4YRvi4TMJCoolIK0ciC64oh2wluDusqp/y3Fcn8GTCBwl0lfLjg/2V/IOWO9Cz4BpNu3TmFLFwkhzM02RPvXYx3kBMdEdQDxFaDq7wBpnt9FkrHFUeYJoVLKrbQLqN7UZmn8+vJsVZ87vYkroKhlvymL8poGKFqKy58FTjaJdrpLf/JMoRRztskFpTbDv3Fy5io60mQo0gQNdc95cpF9YFkZU5LKSjGgiT6BDVE4tpbWHHhKvBrFoCBRU7WEk9J8ZpXkUz9OmMBt2+JtbOGjrqsOjkDv2Q5EChPzW692ZEQ0365UIQzsQ==
Received: from PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22)
 by SA3PR11MB7485.namprd11.prod.outlook.com (2603:10b6:806:31c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Sun, 4 Jun
 2023 14:04:21 +0000
Received: from PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::a8d3:958e:258d:309b]) by PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::a8d3:958e:258d:309b%6]) with mapi id 15.20.6455.030; Sun, 4 Jun 2023
 14:04:21 +0000
From:   Gabriel Matni <gabriel.matni@exfo.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH V2] tools: gpiomon/gpionotify: add idle-timeout
 option
Thread-Topic: [libgpiod][PATCH V2] tools: gpiomon/gpionotify: add idle-timeout
 option
Thread-Index: AdmVig7FIBzQcSM3TsmEdfksS5C4aw==
Date:   Sun, 4 Jun 2023 14:04:21 +0000
Message-ID: <PH8PR11MB714268EC29F5D6A1C1CF6B8A864CA@PH8PR11MB7142.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=exfo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7142:EE_|SA3PR11MB7485:EE_
x-ms-office365-filtering-correlation-id: 904f577e-c3d1-498c-6cd4-08db6504984c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFX1d4eoHgDstel102DbFkdRFuqESZjsQMwdCoYCFarVaqOMTi6KTFF6P6hl+pGlkzRDCaaq86C7jEFgbcfHNbyL+sKnuxZ6r9O7AwtnQrcE6Ng4d+BFu1zGgiAg5XOiFWrvt0CICxCmIeEcqSczfe8GRI0Ku+Xh2xanuFbNtTw3slJNq+Azj4AcAnqQHiqRcs93V7V8b5QnSc6NMq02REnPlmttQHHol9plX4TBnaF+80fbLIo82/6sJPys305CmLt1RciyJnLi1mmSDZucstfxO3AmCGFcN3rswCSq6AOAqlGt56VKxRn7r7MPHItTj/aDcTPwsMP0m3W1Si+lI4pShL9bS2tKUdk+p4II3eZR2zVyiVvM4gpG2KLbiqdAFIFiiQPdLHWn85zxZXtSaSXlOVjYFlfHG9ehfWEHWfkVoysZxDD9RNVNZn93YB5i4+/bbTnIX0fNEbOBRFSDw/oWrpeNLYYZh1H7U0TkrAEKIURuypcHvJV4MbcVVaCxFLIlUboX3ZTXxioSTXtv9Ez78vDu1/PNDwHOlzcxLDTAiFsHWIZlIVZQ1BhN2y/3GDP8sCQaoQM/7mlTEhaeFUqKFokEHnRWzNdbaasnlrkKRdxoZLluxh0mDiMEuBGP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7142.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199021)(2906002)(478600001)(41300700001)(316002)(54906003)(44832011)(52536014)(5660300002)(71200400001)(7696005)(66476007)(6916009)(4326008)(64756008)(66446008)(76116006)(66946007)(66556008)(8936002)(8676002)(6506007)(26005)(9686003)(186003)(55016003)(83380400001)(38100700002)(38070700005)(86362001)(122000001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sK6Ucdr8IRjc4ACv7oo8o2KYNQWX64qT/FiSPfrD9Ao/EwLP0ALB6kD26ngQ?=
 =?us-ascii?Q?oBcHW3CdrVZc2lvayuYpOkZPEb64RkKd1xsYvEVfxdCWYvWyeyt5JWyCQ0xl?=
 =?us-ascii?Q?XxWfwh+0HWAdtn8sCNmWNrMMXQ66FG6+uE1iP0EIbQ7R2zptOkMtv8VH/RK8?=
 =?us-ascii?Q?xwnphovW7RSa4ZpNbUUwastF4uXVHSfwU2X/ICCxFaYpgi8XQDduQ/zqEHRF?=
 =?us-ascii?Q?25B4hAoJUZBo96tfZD+fyJ7ux0i7D8f+Nh99IdJYzNNdxbxvyCbh+gawsd2v?=
 =?us-ascii?Q?qKdm9U17CxO8k1R7C4+GLYq4GgngiR0jMIUASakeRgI7B1uxYecLTF91vjRq?=
 =?us-ascii?Q?D9imKOSCRwLnQhZ3MHiXBVrkztNAyPgtYvOA7R8w3opmMQ8v9ESaPGEjNrDz?=
 =?us-ascii?Q?1CciV0I1MEqTfP1ouIPrXYyyoC1ftjdEV+uu0K2O0EEeS9i2VAFKlDH0F+MB?=
 =?us-ascii?Q?9DsOhQ9jOsflgyQ2x5lS2RksGhx+aKU3f50wIYz3r8hwVKWklRhwqLuEHkxy?=
 =?us-ascii?Q?HTm9RNsyGyJ1zHFPRcODfgL2N5uAcNDeYbwHODFfjU9Im+7UUNOEKWPm7xYY?=
 =?us-ascii?Q?7TPgWMMP08CTyw+d0IQ3smQ0RpcGEB9WixVbmMx/FfiaRihg87zt+edWnEFK?=
 =?us-ascii?Q?C5Fq65Uodkn8wLtzpZu/ZXqtZpPi6+RA9vwoOVWkyiDc3lSPVowZCriFVaHp?=
 =?us-ascii?Q?kYXQksUdqq7N4k8DJ/qRsS/StX1wp/QJ7gqGJ1Y9veYA878pTJxdk7Duz94U?=
 =?us-ascii?Q?BKBwuwqfMP7M1xKb8ZHutsJIZ/1LxEkcHCHmIpO0VxBxyM+QF/ApA3gPMrXY?=
 =?us-ascii?Q?hHhow3auAnJaz1EEEM7dVozpK4Ef70XbqekAhm+hZtI6bLb9PvLpCOLENSux?=
 =?us-ascii?Q?72BNFyqG4FVgnUpaP55TJ9JDEpJOSh/kXN/BfoCgu6D2a8jZeNGKnfTyD6QV?=
 =?us-ascii?Q?KF+cjZGQM5aAjhIK5xOBCUgfoIQ2ncC6WEtcKsuEfsKQ61dAzu0j7i4OalcI?=
 =?us-ascii?Q?AskOV309i7M/8ted1JHON/834/GSv1Qu9Djq/QYCWdXyokuoUUTBVIiEgesb?=
 =?us-ascii?Q?DNOCNjf4qlkCJhj968jALC2+GWUvpTbOr9eWq5B6wVcSLDtcX10V391wWSKJ?=
 =?us-ascii?Q?MHThON4YVCx8YWFn873oYxETJKqLzKVZdju/XMGu0c2cyZ9lVFYwXnvPCH2h?=
 =?us-ascii?Q?wXv3xT3+5RxerFT+V4xaY/G3se3DKSf1eiK8agL4VzdhE7S0zz5FVUeYPll5?=
 =?us-ascii?Q?b2GgbbgtcFIWhQ1YFh/BrIB4pJWe3SY+kGQarJw7BXVGbXwrHKp7XNOTOpLy?=
 =?us-ascii?Q?tobUDQ18FgDwXgmXPuBK4t8K64/a6fdjUWDwCTZ3jTkyH3AepmdTzxIQ5xTL?=
 =?us-ascii?Q?yNrPS4HTmHX58fYa1F2GnctG8Gccaxoop2Lrbxa0uSOI+To/4/ATOZyqtPKJ?=
 =?us-ascii?Q?TvBPIJ1B8NdiAPCWfKgHPRQ6PLOMVpr4IktOWQ4bGkcMVTkuHRTsgsrWbD+U?=
 =?us-ascii?Q?YgB0icHhjI8QqZEK67g99U+6M0GQFGFG81Df22o8l0zzgos/KuggVkAUgoWN?=
 =?us-ascii?Q?DeBLHz3H9rHaAxK0cBN3ullFSV5WEHt5fFwr3EZE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: EXFO.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7142.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904f577e-c3d1-498c-6cd4-08db6504984c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2023 14:04:21.2424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1c75be0f-2569-4bcc-95f7-3ad9d904f42a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gWn7/D/EwUfkj6Qk9r5Nnj/anGOkE5kVGWhz84nT0TLVGJ7J8YISMxEKwzUIiSrDn21uZnbZSPgwOjcn56NtyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7485
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Gabriel Matni <gabriel.matni@exfo.com>

Add an idle timeout option. It allows the tool to gracefully exit upon
expiry.  This option is handy for scripting as it allows the developer to
take an action when no event has been detected for a given period.

Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
---
V1 -> V2: Addressed the following review comments:
- Renamed timeout option to idle-timeout=20
- Timeout value is now signed
- Reused print_period_help() for idle-timeout option
- Added the idle-timeout option to gpionotify for consistency

 tools/gpiomon.c    | 15 ++++++++++++++-
 tools/gpionotify.c | 16 +++++++++++++++-
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index c2684c2a4dd4..91e602cdbb5e 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -30,6 +30,7 @@ struct config {
 	const char *fmt;
 	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
+	int timeout;
 };
=20
 static void print_help(void)
@@ -57,6 +58,8 @@ static void print_help(void)
 	printf("\t\t\tBy default 'realtime' is formatted as UTC, others as raw u6=
4.\n");
 	printf("  -h, --help\t\tdisplay this help and exit\n");
 	printf("  -F, --format <fmt>\tspecify a custom output format\n");
+	printf("      --idle-timeout <period>\n");
+	printf("\t\t\texit gracefully if no events occurred during the specified =
period\n");
 	printf("  -l, --active-low\ttreat the line as active low, flipping the se=
nse of\n");
 	printf("\t\t\trising and falling edges\n");
 	printf("      --localtime\tformat event timestamps as local time\n");
@@ -123,6 +126,7 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
 		{ "event-clock", required_argument, NULL,	'E' },
 		{ "format",	required_argument, NULL,	'F' },
 		{ "help",	no_argument,	NULL,		'h' },
+		{ "idle-timeout",	required_argument,	NULL,		'i' },
 		{ "localtime",	no_argument,	&cfg->timestamp_fmt,	2 },
 		{ "num-events",	required_argument, NULL,	'n' },
 		{ "quiet",	no_argument,	NULL,		'q' },
@@ -139,6 +143,7 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
 	memset(cfg, 0, sizeof(*cfg));
 	cfg->edges =3D GPIOD_LINE_EDGE_BOTH;
 	cfg->consumer =3D "gpiomon";
+	cfg->timeout =3D -1;
=20
 	for (;;) {
 		optc =3D getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -170,6 +175,9 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
 		case 'F':
 			cfg->fmt =3D optarg;
 			break;
+		case 'i':
+			cfg->timeout =3D parse_period_or_die(optarg) / 1000;
+			break;
 		case 'l':
 			cfg->active_low =3D true;
 			break;
@@ -443,11 +451,16 @@ int main(int argc, char **argv)
 		print_banner(argc, argv);
=20
 	for (;;) {
+		int ret;
 		fflush(stdout);
=20
-		if (poll(pollfds, resolver->num_chips, -1) < 0)
+		ret =3D poll(pollfds, resolver->num_chips, cfg.timeout);
+		if (ret < 0)
 			die_perror("error polling for events");
=20
+		if (ret =3D=3D 0)
+			goto done;
+
 		for (i =3D 0; i < resolver->num_chips; i++) {
 			if (pollfds[i].revents =3D=3D 0)
 				continue;
diff --git a/tools/gpionotify.c b/tools/gpionotify.c
index 990ca04519b5..863c5d046542 100644
--- a/tools/gpionotify.c
+++ b/tools/gpionotify.c
@@ -23,6 +23,7 @@ struct config {
 	const char *chip_id;
 	const char *fmt;
 	int timestamp_fmt;
+	int timeout;
 };
=20
 static void print_help(void)
@@ -43,6 +44,8 @@ static void print_help(void)
 	printf("\t\t\t(default is all events)\n");
 	printf("  -h, --help\t\tdisplay this help and exit\n");
 	printf("  -F, --format <fmt>\tspecify a custom output format\n");
+	printf("      --idle-timeout <period>\n");
+	printf("\t\t\texit gracefully if no events occurred during the specified =
period\n");
 	printf("      --localtime\tconvert event timestamps to local time\n");
 	printf("  -n, --num-events <num>\n");
 	printf("\t\t\texit after processing num events\n");
@@ -52,6 +55,7 @@ static void print_help(void)
 	printf("      --utc\t\tconvert event timestamps to UTC\n");
 	printf("  -v, --version\t\toutput version information and exit\n");
 	print_chip_help();
+	print_period_help();
 	printf("\n");
 	printf("Format specifiers:\n");
 	printf("  %%o   GPIO line offset\n");
@@ -89,6 +93,7 @@ static int parse_config(int argc, char **argv, struct con=
fig *cfg)
 		{ "event",	required_argument, NULL,	'e' },
 		{ "format",	required_argument, NULL,	'F' },
 		{ "help",	no_argument,	NULL,		'h' },
+		{ "idle-timeout",	required_argument,	NULL,		'i' },
 		{ "localtime",	no_argument,	&cfg->timestamp_fmt, 2 },
 		{ "num-events",	required_argument, NULL,	'n' },
 		{ "quiet",	no_argument,	NULL,		'q' },
@@ -103,6 +108,7 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
 	int opti, optc;
=20
 	memset(cfg, 0, sizeof(*cfg));
+	cfg->timeout =3D -1;
=20
 	for (;;) {
 		optc =3D getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -125,6 +131,9 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
 		case 'F':
 			cfg->fmt =3D optarg;
 			break;
+		case 'i':
+			cfg->timeout =3D parse_period_or_die(optarg) / 1000;
+			break;
 		case 'n':
 			cfg->events_wanted =3D parse_uint_or_die(optarg);
 			break;
@@ -411,11 +420,16 @@ int main(int argc, char **argv)
 		print_banner(argc, argv);
=20
 	for (;;) {
+		int ret;
 		fflush(stdout);
=20
-		if (poll(pollfds, resolver->num_chips, -1) < 0)
+		ret =3D poll(pollfds, resolver->num_chips, cfg.timeout);
+		if (ret < 0)
 			die_perror("error polling for events");
=20
+		if (ret =3D=3D 0)
+			goto done;
+
 		for (i =3D 0; i < resolver->num_chips; i++) {
 			if (pollfds[i].revents =3D=3D 0)
 				continue;

base-commit: b10c5b769978412e315507ae07fa554b09ca189f
--=20
2.25.1
