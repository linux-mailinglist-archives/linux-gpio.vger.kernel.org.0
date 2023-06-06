Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811DD723487
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 03:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbjFFBcg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 21:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbjFFBcf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 21:32:35 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A72E8
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 18:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/TZEfsQ+zZlJk74WlAF+eNdhnaEPi23GbUyeKjCEhHUkXyee+IKCpnykRJnzLZwth6N+QSH4ZAx5FqAtRDf1h22HtPBt5FhR3nIwp3HgXKffrnAJoZyyMIGsinwmPxyKwQBxVqSgsgSwvRzGPgVkpknpYZZEdKS+ZOnBA1xaVIOXEvLcqVWD+gACeTRfIrse/lrEA7pn9QbhRKvzl3w4PPn0eifYzKmBLkRC5f2UvjSItxTgpZAyzgK1/rER0vR441riSfWaoheWnnz8E848oTBRlfXCCpab5xrre2X7CEi6bDNX4Oq7dAfk8xYwfOonZWDx++fWP1fPepmuWy8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMox4pyLSWBLr9RVeisF5P+PhzqDcyK0/yRMQbKIhyw=;
 b=E2o/J99xvKx/epNPiPshWIjR7YcEw3NZpn43mx3yG49Q8mmhw8etS1hiHGCaClvLiIrY93kIPbBSzlysJHSeLmT9KT7Lyww/PVLbv6Rkk9Dn5lhiOZJTe4ueTeAZHS7T/6qOIrJ0K1E0brmQRNkQ1RCMT/lwISJm0D99GS5jxMKF2gzLwEe9JTOjqqlJclQtPThvpDsw0mgXXdOZs9v3qpOHEeLXJAjhbLbSmhSPwGDNBSsegnlo5BJxrpSTQsPPitOX8+OSDcgkoo+ZpcMBpPD6LitCoZbGr4s4I11r4UUkGfs9neceTQqjDli3fhFAcXDbbRd0hOx4oPWeHb1WcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exfo.com; dmarc=pass action=none header.from=exfo.com;
 dkim=pass header.d=exfo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=EXFO.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMox4pyLSWBLr9RVeisF5P+PhzqDcyK0/yRMQbKIhyw=;
 b=tjSi0PZKiZFtDJZ6yx9ce1PecRtmg/3PExIxHV5acyVf296MMz2WvRnuVaIbKD7vHo+0eBe/8IgG1TtSf+DTNrRM4aP8CMt72pPQ4+FkyjwAsQ/UoKU/zJQoCdPiXE7E5ea5iNRqUr3nvj1Z2bMNIMcjrZt8Rqp66ZNITLkpIUxBQQ48q95ct72eMoHxp4Xbj6tXYTBbRrx3uyrZEK7bMcwAMpgE1CQ1mbZtWY4Uq9naLf2FPYlMQj3aT15WwrNxAAqUeBZsGAS6Rp2vz4UeU1vDSdzEUHv1bfU/NVtXqIWbYodO36qtuD585ImUWB6a2Nrtcrdo8oIANSfsFYu24g==
Received: from PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22)
 by CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 01:32:27 +0000
Received: from PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::a8d3:958e:258d:309b]) by PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::a8d3:958e:258d:309b%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 01:32:26 +0000
From:   Gabriel Matni <gabriel.matni@exfo.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH V3] tools: gpiomon/gpionotify: add idle-timeout
 option
Thread-Topic: [libgpiod][PATCH V3] tools: gpiomon/gpionotify: add idle-timeout
 option
Thread-Index: AdmYFHtBprVgGok5QdicC3e7gPxKeg==
Date:   Tue, 6 Jun 2023 01:32:26 +0000
Message-ID: <PH8PR11MB7142857DBF772D017D8148778652A@PH8PR11MB7142.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=exfo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7142:EE_|CYYPR11MB8360:EE_
x-ms-office365-filtering-correlation-id: 4c3f74cd-9f69-434a-a85e-08db662de25f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8JED821yCYWm1HN6tV/MkJmkGNGeU6cWASA8nhLNn359BsQu/DeEHyrYtLFGsQn57gu9Cx1PRr5BjdbBktVnFstef/7apOa/gt4LsZbzRUF3i1s29ebBXci/lI2gDZrvduAIr2lOLZxFS7SQ0ChBwyekaiZd270DzdnGggowyLXPjH5bMNYb2IdJlGVj/v42676pi34nd8u6b7QJnGkYo6GiBUGtcFLhyGoXVMlVgHEfkBHP90UqGYCzKtTg1HHuFb81n8FYUZyhG5W6iTc51rjpurdRkiEcAGMZCL13SjFYzNSaRdK0AhJMzY38YzWmF3DQBgDfFHPzihetgwo1X7bT1eWXT5dq7p4Iivf4cCoJ+W36KnASAzPW9talknqPSeLVmNn1td7M6zG7ShZh7cN83/LCLhfrHuLbrfdIqLZKst/sGbkk8J/KZRitYz1zhZDvupV8PXI3oM35EXUw1fZ4nQT9b1S3VctGiN62w4RzbH/wyJj9yrJStk99PjAKKO+z/24PK8lK91zH6PNZcSarLYmZ3KNeWSQZtrusTNDyCD4FKnnU5xfssakv5fwC3iQnjCD1yNdwk2tc8w0zEE4fKTnruP+dwCYkz2/VebTXXmurdjAOjy1vaUc/9Iuj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7142.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199021)(8676002)(66556008)(6916009)(4326008)(76116006)(66476007)(66446008)(64756008)(8936002)(66946007)(5660300002)(316002)(41300700001)(52536014)(54906003)(44832011)(55016003)(2906002)(478600001)(122000001)(38100700002)(9686003)(26005)(6506007)(186003)(86362001)(33656002)(71200400001)(7696005)(83380400001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gXBf84x+HykZ7Gx3d03DMpZfyijgMxE9uXnUKO7drSNDU+7LtGlnTXTYh+k/?=
 =?us-ascii?Q?e9F0NZWGO/boeWcBQ4WReVcQqvALilLVTcZdYRI9ZTwZFTndvy72N0t1pFzO?=
 =?us-ascii?Q?yW2JVmq4XHIoo+//KZYoSkf9DTRNTNeW22Dy8vZ1RGHSGflmAUzjbH2vUFrL?=
 =?us-ascii?Q?pQayCm0dNKuUtfr/R6g+U0DaW+9LlXioCT16RQjaTRXxg7W0fstoOJvK9EC8?=
 =?us-ascii?Q?zoFdssrRvbr5zhiJ1+1XTFqEW6OfkGlNe6HKsaOWK6dDWx+BwFzJ+IfyHeP0?=
 =?us-ascii?Q?o6cts39/9+zKWcklcJNXf0R4PEjTn/KA/WhVf3mmL3BiUsgNoQyTWpP9xfe3?=
 =?us-ascii?Q?/HQqO0zKv7ZE+Xw7meVrLDhoNhqD7sfO/KZfgMq4C/y2n6a65ox4hdx56n/7?=
 =?us-ascii?Q?lfruPuy6jcOAa9fvoQZWxrTFiRXq8JB0kj7IyhylbXTo4g9/4zt0cf/1h9vl?=
 =?us-ascii?Q?FXEofjTw/bFVfjSdEdAfdaXe6I1LkOOLWFcrhO0kf9DHm4KqbQkQauf34GnB?=
 =?us-ascii?Q?xr2t/fdqTXE5Ubgre+fhgqeYNBGgicDuDatLqVZji0kXlkdrw74zZg4o4e86?=
 =?us-ascii?Q?3A5W2RRrJT/uvYb6SmLDkLhh3JiiyTFMCC8SyYOgnpwwnZbCf+c8/jyiihg7?=
 =?us-ascii?Q?AK1dW5jTPogFiZzcEV1cHlGm7gubiXhpIcAhjfpCANPzm6KgVem1aBx16+9D?=
 =?us-ascii?Q?leoHPpjyJA/Ib235/RIIe9sphTEKh8UQ/mN1m5BFhAL8eAJt8lVn+fn77UEz?=
 =?us-ascii?Q?P13Va9CPViKZSBquXr2Epk7zTHj0L9onxvrIfe+9I+Pg1nyEeJ/X2nQ0qyQd?=
 =?us-ascii?Q?BItYy3xouNBaFppZvDEDSej6zDS8qcB0HI74A/MTVhloG2f2aTo14QAnkMVv?=
 =?us-ascii?Q?NHtqwVwGkOZzXAU+IyKyxTqxCnD8I/jRNS2ylFcyAXJGJyzMvv6t25OLtpzv?=
 =?us-ascii?Q?jG4sCRT6lmsUz2/AEPjmZ/Y55ZtrKub5POiyOL61U34v5/vrYih86nQQqhst?=
 =?us-ascii?Q?ecLJhn3uK0bkYUsmh5zUiH1FREnQmXgpfKm1pTBwFRPXSlDzTdMt0so3VvJV?=
 =?us-ascii?Q?1FjdPBpTfAy71c+2x81oqy9nwhbnTXgAJOEzViMLIjdaRreLapsvx7u4074t?=
 =?us-ascii?Q?YWzaRr/eWNsi8D44n2xf5iaGefEHw8+uu9oaBcmSCL7quWiHJ5pwmHbc4iA2?=
 =?us-ascii?Q?hdGvt7+DpjYGB5dqj6oLGA1ifNktlxsbCoUyaoArTk7mh/WKaaUmijFxTK6Q?=
 =?us-ascii?Q?mNGMSZt0kP3yMWNRKCu3nHN/ioT0nW+uZZNvHmWpiweI2fG/B8c+dFoCF6uS?=
 =?us-ascii?Q?WkCG2TDGcffVju6FiX8u1e1zxF4DCzxe8ye8ImaJ4Ej/OqYhcUh5eY+86eze?=
 =?us-ascii?Q?gXR8OvqpXeLtKMTivnzvT1bM+ujTBJ8GOGA991G6yaJQqC5vUltF7SQfzrGe?=
 =?us-ascii?Q?FAckJGC5h7ACnbI/FEiwbWKUVmvnbhDcnzH0By2rFLASg/7XEHXplrPiVvE1?=
 =?us-ascii?Q?0R038VKIQ//yVKCgsGbDgm5sB7XELbzr1QbbeCDisNnWRrNStiY7FYsFsfr4?=
 =?us-ascii?Q?Pv38YvB8PL1Yrp7j1tdRSlqNx/dBLKGKKzupCIsu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: EXFO.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7142.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3f74cd-9f69-434a-a85e-08db662de25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 01:32:26.0513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1c75be0f-2569-4bcc-95f7-3ad9d904f42a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvVIU1oqRNxX7Uxkj24oWyco/Aqu72cj3bh6MfGYCqsMFKVdZFviZgBRSWwKhVW4LFk1PneZiPNYbMHjqONT6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8360
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Gabriel Matni <gabriel.matni@exfo.com>

Add an idle timeout option to gpiomon and gpionotify to exit gracefully
when no event has been detected for a given period.

Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
---
V2 -> V3: Addressed the following review comments:
- Simplify the commit message
- Clarify the help description of the --idle-timeout option
- Declare ret variable at the top of function for gpionotify, not required =
for gpiomon

V1 -> V2: Addressed the following review comments:
- Renamed timeout option to idle-timeout
- Timeout value is now signed
- Reused print_period_help() for idle-timeout option
- Added the idle-timeout option to gpionotify for consistency

 tools/gpiomon.c    | 14 +++++++++++++-
 tools/gpionotify.c | 17 +++++++++++++++--
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index c2684c2..e3abb2d 100644
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
+	printf("\t\t\texit gracefully if no events occur for the period specified=
\n");
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
@@ -445,9 +453,13 @@ int main(int argc, char **argv)
 	for (;;) {
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
index 990ca04..2c56590 100644
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
+	printf("\t\t\texit gracefully if no events occur for the period specified=
\n");
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
@@ -362,7 +371,7 @@ static void event_print(struct gpiod_info_event *event,
=20
 int main(int argc, char **argv)
 {
-	int i, j, events_done =3D 0, evtype;
+	int i, j, ret, events_done =3D 0, evtype;
 	struct line_resolver *resolver;
 	struct gpiod_info_event *event;
 	struct gpiod_chip **chips;
@@ -413,9 +422,13 @@ int main(int argc, char **argv)
 	for (;;) {
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

