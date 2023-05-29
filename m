Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A94715071
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 22:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjE2UUy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 16:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjE2UUx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 16:20:53 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3826FDB
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 13:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJxonlkbG91Ujm+h8AfpFUgpE9tt8g4drY3+meJsZGUgNzEI6S/peBtOHx6DTeexIyFyce7t9eXJCjg+z6KjKfXe8cBHaxVINByYZlRzKkWe47ApNZYO3nN0d4nwhT6me5eUpAeg2/sBgUraxzDy1T+v58KtsKkbYFylWiiUp86CAj2xm0MHNM1VRkOp0XMA6U6KR0Ku3eGIv6Ic3AEzS7sI3LyWrk2otpG3pW1r7Wq65AbSNpuGU6obx7sKQD0aRHjoU6xHCXsniqLB08ZDvOzt9ymFBuyY2EGyrC1qrVN+XqMK53q/rFAbDk+gzfXyaoIzXR4ZkVJRkax/+MkFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ckb9bJuoZhS6tXEJjf6Fb9/AVLnGevNSBeHI8IMhJs=;
 b=KjmBond5O9HuESAp65ImCT76loFsXk/u0acX1Ch9JqXiZgXHamFbEV8L1l1ayeQUi/zcsscOkUs+26ux0glQWg6RgCz1DW/lbluy8+VD5PBM8rR6kpFbzRPkIZ47kn6DpX6iJ/1O69DROD0FArLBo6UM8avMH48vcaTUPEuUvv3z+wIFFrJv9u7d9pCxtEu6dtGVHiNwLdxmYGPEkcP+sAWc9ZafHdxup5j33d/07wj/e1fbSNgEsFBeB8A8KH4uySiC3+45J8W+YYDKUIrZ02UtZ1j4bUdwy/91b8572l/FO/q6zAY87zjTmaVHlJoRUSBjz3haEAt9DBvMPPAQ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exfo.com; dmarc=pass action=none header.from=exfo.com;
 dkim=pass header.d=exfo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=EXFO.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ckb9bJuoZhS6tXEJjf6Fb9/AVLnGevNSBeHI8IMhJs=;
 b=tyrXeULcsb1KsLLTdIYGSfXgSBB2+RYiUkv3t5TpfL0pwGqpkyMYuuqi/LqNt7BZndQCus4SEIsqp17IBjd1VYtW0nBSZ0kUris2/9rJrDOYrIuRHqJ97lGxZe/blzGaOXtYrbKsLNgCozrRNpHRW5B80CxrW1zIaOHuprSwuQga7mnEhCzpjAF/ST5W7mp5VsImjRN5IyGyNEKBjgYEIUeY0WKmCyivwnsG+B7ImOlbY4NiVi+ZGXmxARChoMZTNzUnpyFo5BAssYAM//+VOZYbtck96MgPYH88sM594/A4KljNw8T7mdU+tzRrjLQaS/37dRZkNOJkZuXMG/XObQ==
Received: from PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22)
 by MW4PR11MB7079.namprd11.prod.outlook.com (2603:10b6:303:22b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Mon, 29 May
 2023 20:20:45 +0000
Received: from PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::a8d3:958e:258d:309b]) by PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::a8d3:958e:258d:309b%6]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 20:20:44 +0000
From:   Gabriel Matni <gabriel.matni@exfo.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [libgpiod][PATCH] tools: gpiomon: add timeout option
Thread-Topic: [libgpiod][PATCH] tools: gpiomon: add timeout option
Thread-Index: AdmSWu+Yp0PkN8UmTbOZdoj4tQwCCA==
Date:   Mon, 29 May 2023 20:20:44 +0000
Message-ID: <PH8PR11MB71425AE7A35F6E651A5B3425864A9@PH8PR11MB7142.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=exfo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7142:EE_|MW4PR11MB7079:EE_
x-ms-office365-filtering-correlation-id: c762b963-7df3-42c2-0cde-08db60822ea7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yRWPn5uDOF9d8wMSXbGbgG742k031lA3s8zK9O7bS0530aVdsabfgHgdnPMUsuKJDqW5q9opI+jQTU8CQ1TS9x7t23KKZtkLyoGo3Je59dWjEeNBTPFJuastnBqPl3unizPpu5VJXFSdZ24YI9u6CTsW6eXyb3ly6OMLkluDXk3MK4SHDisznT01wcoVnpGsDHdMO8WqupgHEkIbcsjqps4vpo9otMJ4DEBFsnhpJw8gT5j0vih9BeOO03nK+NQdmCHtCqgiE95M6ay6edLfTtfZPypFVUvqtvu9WGpF5BdopDCMIzukg3XxwZbpOC1e9ceTKgRxmfhbUb/iAGb060nInmIOmr4h7X0lSm1qvz/lpvbJ5pls1pZlwCT/1U7VPxVxj8bjF/ihcF3Rchmh5B8caKSq++RN1FiY6E6q+5sfR1pqFCYzGTbrozQ41Io2StWVAdl5giJR6jBjTTQsWCLpBeYLrWUrzCtFndosnreDCoQ9RWysA7tHLcyEzEDG3GW+UX1laub8ZedGaziFy/7PRpTjG6tUc5/1WP6NhtHzmRDLysjmMXPNwtfmtjJUEBHGvVOPW/b+2iHfvKVoJpfvJ+DN3378w47ax5pK+bf74UQSXhsIOIKyf2u++bC8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7142.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(366004)(39850400004)(451199021)(122000001)(33656002)(6506007)(9686003)(41300700001)(86362001)(55016003)(186003)(26005)(8936002)(8676002)(44832011)(38070700005)(52536014)(83380400001)(316002)(76116006)(64756008)(6916009)(66556008)(5660300002)(66946007)(45080400002)(71200400001)(478600001)(66446008)(38100700002)(7696005)(2906002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e0RQsSOHBuXjlzlHI1ypqSz011+WIrBA3i7G81q89/e42ithz1oTIUiAtWYK?=
 =?us-ascii?Q?uamWq3rhmwlzhCwIXJUOjzA9A00W9kJxxF+QW+2Iz3o5Whr0uvC6LTPxnWyf?=
 =?us-ascii?Q?HLEEE9v1nR+3GHb0ewW/okj96uw95OPmw4u++c+vhDNx0eXnlG8kUcfqNxE0?=
 =?us-ascii?Q?HodGbbGlVci7OGdtBkli1IelVErdlADB/5X4tqm1/maCbFwVLAauu5Cg9Eiu?=
 =?us-ascii?Q?66HWFJmu6Dg97VoInhbkPJ5/rb8hU4/VsuNL1o9LeQZGMi5TXturg+y29X+R?=
 =?us-ascii?Q?FmWzVypoLLRAEmLe2ASqsxtvOU4eWxxNrq5kvbak1LW4iRy62WxGguRMQtjS?=
 =?us-ascii?Q?Vf8prIfeQL4+NyA2vqZccs/uTZexah4ddbFbzBOpuZorZetGICI1oqlm688T?=
 =?us-ascii?Q?HSMGlplf+ouUDkoMA8qxi2i70ekOJ8z5r1tGvrOvJlpGqsNDzEezOLXaivpc?=
 =?us-ascii?Q?IiEgYay/2kYMSDjXBmOJHRKl3mbdf0tE8+9sEcZ1yk/m1E636V+JtUzlnToR?=
 =?us-ascii?Q?dU2aFJqmZvyKA6SjrOJyZJzA3zpdcny7uYWvi6SEwsoomxo28rG08VSOR8Rr?=
 =?us-ascii?Q?8vskxIQOFfQITrI970T83XFxhUlZtoTNkMQYxcwsUkRHZHXklEU+2cM/Zbnb?=
 =?us-ascii?Q?NsFKTasIhVxXL32p6bW4ewW1aNU1pjyBcvGRcMvLQDWiIGSjiY/mq3scuxyn?=
 =?us-ascii?Q?H7iM1jfJUHQ2khi7QE4TUubO7aMOpMHHAHYJHDAnxGSV3SRX98Xuv+sw2M3z?=
 =?us-ascii?Q?isI/dFY99UaI+/Y3aDdqBeaJIrYt2wC+Oa+Wy/Burihkg6ouqSisNPcigNqm?=
 =?us-ascii?Q?tKkvkH1vEnWydUV306/E0gHIzcLVqzH24ptN1HdNeIBOscbiukXHqma8tu5i?=
 =?us-ascii?Q?hHhlKkYw9FhLtFhdu0ULB1dPAio4uZw+vt1l/NxLD2+rVhwgKHuXRYuoUtP3?=
 =?us-ascii?Q?n7ml/+h4oc4CY8e+y+AiLbBruaJqEyTi60OjeQeIOz02FLJF9Q+osvxIm4WM?=
 =?us-ascii?Q?cQKu4nUFDFv0y4OxiNpnhQmOxK92j5Ak4cVo4k+QQaqPfoZd/l4MQTJ3mCMc?=
 =?us-ascii?Q?068XRQhbjQzQA5aKRw0cPrsOFzZ5XnLuV1zlBIib4fiOWM04vFuqgzpgcKCt?=
 =?us-ascii?Q?mHl3b6zxa/F2lHB9XIOt9wx1OhlE4x/vj9nf+RKBhGmMHWSN7MbF0tCF/YMU?=
 =?us-ascii?Q?Zgpar28HIm93F503hIbbOtWZ9mDKWoIhLiPETdQuS6qbzwHw5jMf0QXUz6cQ?=
 =?us-ascii?Q?x5CYXe5jbvspmArSNU522rPQJOmoN6PbGnimJhVnZX1fHB8Twk0jDEELP0Wb?=
 =?us-ascii?Q?FBVZnkYpm4t+8JswEGc5M3Y0ZoEHdzp0Ws5GkPEuV/oHUk0b0+p8LwQFkzFq?=
 =?us-ascii?Q?sSkzlIF8teq81prDpI71H3ayHKGJSbDe1cxwguUdv9BzreGqhZnHskd4hf/g?=
 =?us-ascii?Q?p60vIlH2xYCoWTlDZWWJMsz7hWV9ekC7RR52Ldo+Llpda2WiRc7gmZxVYcWc?=
 =?us-ascii?Q?nraSleK87is2cOdbaIdDXwlp5DBiRQES9BrrN3Igdca/gsiZabN1PzFDjCNG?=
 =?us-ascii?Q?N7L1YkKfULU1LGWMOKWbH+PJg4cPNO6tfGmE6QvT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: EXFO.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7142.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c762b963-7df3-42c2-0cde-08db60822ea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 20:20:44.7207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1c75be0f-2569-4bcc-95f7-3ad9d904f42a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qlugOgrSqWHEwY5DxEwHBUot9VvLQNk7XhApM2nYh1lX5xXtRrrEawsvKMjb5OXu/d6iKdElBgblzYqj+F4jhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7079
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

Add a timeout option which allows gpiomon to gracefully exit upon expiry.
This is handy for scripting as it allows developers to implement an action
when no trigger has been detected for a given period of time.

Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
---
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index cc08f17dd2b4..7ef35fa69b1d 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -30,6 +30,7 @@ struct config {
 	const char *fmt;
 	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
+	unsigned int timeout;
 };
=20
 static void print_help(void)
@@ -68,9 +69,12 @@ static void print_help(void)
 	printf("  -s, --strict\t\tabort if requested line names are not unique\n"=
);
 	printf("      --unquoted\tdon't quote line or consumer names\n");
 	printf("      --utc\t\tformat event timestamps as UTC (default for 'realt=
ime')\n");
+	printf("  -t, --timeout <timeout>\n");
+	printf("\t\t\tpoll timeout, format similar to debounce-period\n");
 	printf("  -v, --version\t\toutput version information and exit\n");
 	print_chip_help();
 	print_period_help();
+	print_timeout_help();
 	printf("\n");
 	printf("Format specifiers:\n");
 	printf("  %%o   GPIO line offset\n");
@@ -109,7 +113,7 @@ static int parse_event_clock_or_die(const char *option)
=20
 static int parse_config(int argc, char **argv, struct config *cfg)
 {
-	static const char *const shortopts =3D "+b:c:C:e:E:hF:ln:p:qshv";
+	static const char *const shortopts =3D "+b:c:C:e:E:hF:ln:p:qst:hv";
=20
 	const struct option longopts[] =3D {
 		{ "active-low",	no_argument,	NULL,		'l' },
@@ -128,6 +132,7 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
 		{ "quiet",	no_argument,	NULL,		'q' },
 		{ "silent",	no_argument,	NULL,		'q' },
 		{ "strict",	no_argument,	NULL,		's' },
+		{ "timeout",	required_argument,	NULL,		't' },
 		{ "unquoted",	no_argument,	NULL,		'Q' },
 		{ "utc",	no_argument,	&cfg->timestamp_fmt,	1 },
 		{ "version",	no_argument,	NULL,		'v' },
@@ -139,6 +144,7 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
 	memset(cfg, 0, sizeof(*cfg));
 	cfg->edges =3D GPIOD_LINE_EDGE_BOTH;
 	cfg->consumer =3D "gpiomon";
+	cfg->timeout =3D -1;
=20
 	for (;;) {
 		optc =3D getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -188,6 +194,9 @@ static int parse_config(int argc, char **argv, struct c=
onfig *cfg)
 		case 's':
 			cfg->strict =3D true;
 			break;
+		case 't':
+			cfg->timeout =3D parse_period_or_die(optarg) / 1000;
+			break;
 		case 'h':
 			print_help();
 			exit(EXIT_SUCCESS);
@@ -442,11 +451,16 @@ int main(int argc, char **argv)
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
diff --git a/tools/tools-common.c b/tools/tools-common.c
index a0080fcdae1f..12c350aa8a48 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -188,6 +188,13 @@ void print_period_help(void)
 	printf("    Supported units are 's', 'ms', and 'us'.\n");
 }
=20
+void print_timeout_help(void)
+{
+	printf("\nTimeout:\n");
+	printf("    Timeout is taken as milliseconds unless a unit is specified. =
e.g. 1s.\n");
+	printf("    Supported units are 's', 'ms'.\n");
+}
+
 #define TIME_BUFFER_SIZE 20
=20
 /*
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 434e5ba5d271..2ee8f51b3c7c 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -92,6 +92,7 @@ unsigned int parse_uint_or_die(const char *option);
 void print_bias_help(void);
 void print_chip_help(void);
 void print_period_help(void);
+void print_timeout_help(void);
 void print_event_time(uint64_t evtime, int format);
 void print_line_attributes(struct gpiod_line_info *info, bool unquoted_str=
ings);
 void print_line_id(struct line_resolver *resolver, int chip_num,
