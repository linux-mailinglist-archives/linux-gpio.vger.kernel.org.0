Return-Path: <linux-gpio+bounces-34705-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIMPGe+Q02mrjAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34705-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 12:54:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D33A2EB5
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 12:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21DB930136A1
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 10:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF4B32BF24;
	Mon,  6 Apr 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fbRMpxoE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401403090D7;
	Mon,  6 Apr 2026 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775472872; cv=fail; b=Nd0xgskB2iB3L44P1AHhaExMF2h6tjSv4nKinoJsDoT4gkSec8hs9ENh4XcZIKh5oLNaqWEcG4QmCyexXWFgFnuSHw5eUtUdht6ZFx1AF8tyVGDkxCMLoY9DmiLJH4CnFn9xyc9qQsygKKJhsZdw3CJsogcPW5pzAv2l8GXlw0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775472872; c=relaxed/simple;
	bh=4J5w7RX5HOXlLzu28vQ3HJ3nrRd+PtX6V3eZCeON0Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BYjOug7xCmJ42ckH8a5k59VLWoK8LKezU07rAT0Cm7l5b5KI3LEbytX8K52L9HJVVh9FEUW0YopQ//qu83C93o1NjxjbllPft2j6sl5T0ZXBYjjOuDKaLLX04WKbq6d96Wi7IhLZDTAsFA6VYXpNOErYInyyjRC7ItXaTcPexZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fbRMpxoE; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vf/IYAMqpc8T9jrbTR2qIRUN+mk6AZOQffi7KQyJi9GTW2ELhmMAuygP0JQp3Uugkku4BtbKU/B2QUrCniapBTfz3CWgQWI0SMZBtfB3P9SFZbN6BNijvsWW2xRUZbFoXZvGb9yrYSmX2tuLarhfGERylxlIV4fntD+LPYoSX8lpaZKTCCpC5KDb1bxXxFgFH7/riKqcJOP7nwQdA5N5DooA6sL/Royj+Y2iaAKYqS1gTB9z6NjUTvnm/ItIRElzSEUPLo6ME4kR0dKCblQ2RcyaSPNwXNKjm0JqUvCA9CEPA8FxAQqS4gcFKL6M/nIOjDyTic9xEzr4n5SPdJC7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXUzVb1vom1SWj9JpbO7wIGEIn6BnxEy2Nc9VVCJT3s=;
 b=o54qYRIB/3p2cWOiJVHhr3CW3fn+SbD27XtPHRWBLXZa+GhAmiOgxMDRdXbCRa5M0InJWyL0fgn384oqX0lSHgiBcAh6iY4bfrHLeGzkjr5L10KemgfaAZgEweQJey1t8PWLiwYOmkD8SiJ+viScDA5sdrSDQKPEkximyAIUWizBOuJ3mMwlcpymRiN6slbF6ZhWRiBPBZz2sf46atvVY08NHchFhH1ur0s7TxnzRbKG6evQ6FMynNw76rrgIcRcHBMbfoSY1WLGjJ/no4tCXYzfD+BIMNhAtRF5TMUGxpl+irT0PYU2ibSofq0+qOPIISdfYYWsEgv2dBh0H6kP5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXUzVb1vom1SWj9JpbO7wIGEIn6BnxEy2Nc9VVCJT3s=;
 b=fbRMpxoEdKI1i1W+WhLy+p7Nsg1MMfUbp95QZ5tetdnB4Czb9NrhE15ZwM5d3k1Y0nzIQwdeDwr0GR0ZfhIYYjwZPyiyhXH6+MvrePAQ6zvhovp2HqLupcfRaE5r6GPFP3hUW3O/IOjdkErEiR++zHZjvVjuucRcxsuuybbe1om4HdXT1orDSvtYJYzE6zYNYiDqo1i6Za4YEscBuruzV6jRQBDma7d+qyJm8MntJLy07/mVoX04DK68Qsyq1cdNJ13CHgMfJ5AphM+iuKV17Aaqe45Hm5/ND1XFLJt/kSJfktsvvR1yEI74kr3ZwIzC0MJlxulLwMgc6GL3MB8QJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8203.eurprd04.prod.outlook.com (2603:10a6:10:242::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Mon, 6 Apr
 2026 10:54:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 10:54:28 +0000
Date: Mon, 6 Apr 2026 06:54:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5 0/7] pinctrl: Add generic pinctrl for board-level mux
 chips
Message-ID: <adOQ2lFb7vCXcbfW@lizhi-Precision-Tower-5810>
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 82323fe0-6575-4820-b897-08de93cadfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|52116014|7416014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	P8ZHs89kn0gzyVnnDSij88KW/dTBJy3mmpSZzetes22arDEAVderGl770f5GMHJm/TYtlTGgIUoZvcH6F2j8FI9iQaULjAPxYizcfIIgE2zV2o5AeKupONfNbp6vezXjAL7E5gAZdBGbiKhHPRKXTg2DM8xwsLR/jWLA1AR6gsuREowvfS/7icQuVg66fCeY81HWWoUB0WrndNGG4/Dl9wf/zh/9bevDUtZ6nv9QZXshdHtEz4mvNmYkeZICi+UkJ7j81wsjlfH0bD9MKE8AVFdPhTtI27FiS35AA/eglsPG/v2DG3ag7d3+AUdPiWQndfefe40GSEx/xjiTmmkM9FRWtkbPd3mlRr81Q7Qb2dfL+jxEsfUK/0eEdABYknl2YiTqwjS6IyyZyKczI7xECB9zrR9Nq/nNN/xzOK16V3UXKlk0PxtTFFYyZcq5ZbGKyAdjeqFzlOTjQPksi/kYJLdrhtLrehaXcY8KQj+xwWQZhEDlcYuNX4AJcvSgz+GozJb376UdDHVoKuBWcIAY1CidK5KO7oY2TWv6/ZAaox5c+3KZmfhfO3hIt/Jk0nO6XQC1lUzq028jOYZK4ch4Wk9tJsTc2d2GsNp5HbCmU0uEJtlw7BYEdGTKzfbDKiOAKE/DhIwtLrdzRBqHq0U9X2T0pf1O3aRhPbCCRqy6Ixr1nQqb3aJG9uPY4rCwxcH69fdLtHPHCg8ysnh3sUbCWdeNo0zDIXxh67UIo5TftqCdYGpmWoschY/ltnTWKJO6JUPiU3jgT9LdZrIfUVnEnoeS7p/f6K8CGBcmLH3cL14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/z8YP3hBvU7UT2k/bsMcxRu31aXP1wXH8YHxnIuffTHKDEe1FuGgFo4bCnIt?=
 =?us-ascii?Q?Vk3P9N3EG6eJkb6v+92kQ3lQu/p6VopdvHG1luDinf2zs+nULL7blos1dYEQ?=
 =?us-ascii?Q?Ralsgol+1/3NN0A3NYOR1GerROw7O7fVZipW5yWfs26ddAzsf1w+gXrcv4YZ?=
 =?us-ascii?Q?kXni+WuAxDihk92zmi0sV0qrxKPbItpjHMltM+93AwPALairdb2KyyN68Prw?=
 =?us-ascii?Q?W1FkrRGLIUPHSUswHY2B2Ue97pVwTyV6sLEp6HI4wMgl6bSZ57rzoC/0DNde?=
 =?us-ascii?Q?x7KdesOe53XhNUgath6xzEF5Y47cV4Go4vspDuPYhoaiKoAGcF30gpCqBVEG?=
 =?us-ascii?Q?KLOaN1PT3ND88Zf2Y/5+McCxl8fd8hiSX3b65Lr2SgKZ1/nH7d07AXBu5A8q?=
 =?us-ascii?Q?xR1U46e31P1aOwqJoflYCPx/Gy1vfs00WCea0R/6Z0ZkKiRLKEd4/TTfuol0?=
 =?us-ascii?Q?MAmKhoV40arh4p9hW+CYmyfkZENKk+6FWo23xN8hY0nY5xs2kGVPA0yq+G5b?=
 =?us-ascii?Q?tGT3uMMnvsFBSOawZMjzi/UFqPh+K0+lD+lGs7kQV7GjzE3tWUfuMn/grpCA?=
 =?us-ascii?Q?GmYSI0RkYloLFznPXwYP/aa+5zwafFfuZq4M1VQNn/VyFW2dcwDM60V/4XoK?=
 =?us-ascii?Q?WOBO5B+wWxxmsr9w0ialC9BhhXLM8TCrclNWN56zD85ZwvvLiXn2i32mrVjX?=
 =?us-ascii?Q?URC3V8aHkJvhiHsvC5jpkaLmvwi8X2hoTwX4Ws1pKZI4GC+sx8oLYYThFGa4?=
 =?us-ascii?Q?7uef+hg2wr7fIJb7lBkO+KbjaC+WZbd26RZEczn1BjQTpHOQWniJe8DSh9Dy?=
 =?us-ascii?Q?z+hrNuxLaimgx1zw+zU2q0sbp+qyrWxWI7NiVzGXF+h4oeV2Ex4HJT/Z6Wha?=
 =?us-ascii?Q?ryZlcotRLU+tcNk77oJAAQETROvD49OnCDzmx8LY2FoWm/Yw37VEnxfwUcQd?=
 =?us-ascii?Q?kPd9H4vgmv5gC1iIKTvwBtN+0g75i/e733Zw7wD70/b0HXyeOmS9kfDOvGC5?=
 =?us-ascii?Q?HZu7KEfY9IGiFDKXtlK3IoOF8QGbhFOeJHeqdd1rMEmmaaLsemV9YaWE6CAX?=
 =?us-ascii?Q?kxSpp2Lc/0ANQ9uDpeZeGVtriCJg2ZKyS5kJnXaXW88kyCqucfUK9QVdXAjv?=
 =?us-ascii?Q?iX99Kifqd/1KsA4icZ4sYsz58FEcMlyrqJb+tea96hdaCDbxTiOf6yK71U2l?=
 =?us-ascii?Q?PptLFE7FAyX2O97fRHCWqE48AoNkC4ZTHvpuRKqHifr6LdYF7/DlR/eFqrgb?=
 =?us-ascii?Q?+E6UuSiJUQe/aNsd5QRY1dJh/2FZUV9/BjVco+r3andYu/Mxf+ChpZNOOlT5?=
 =?us-ascii?Q?dOoxnJMAKP8fHwH3ssx6XB6N/SEZn6bx9Z1fh93+zUG6++2WmUnL3142eX1b?=
 =?us-ascii?Q?IRa5bBkdefpANEexBGP+X85VnFihebApGi+kWS4/dLjOmdvS6OY/77aakYP5?=
 =?us-ascii?Q?sWg9GcnXdntuhqsvFzIPo68cbkXGvT3IBKAfrmrjuh7xE0e7NfCTiBgRDqSF?=
 =?us-ascii?Q?jElGfE+a353Wlum30JJnQIgOHgiQR73CkeKiE+FyaGxxaPfTP7oSueswqY4p?=
 =?us-ascii?Q?+GxXexinyH3MPedSMRj18EKylpXm7eG71euibh1nQeVqxCK29tcWmvgrcstB?=
 =?us-ascii?Q?MYCQGVpVvdUnYp3vIlulvVH4f5VjTtxZUUp7QaxONV4kTUp5r9BCt6BROBP8?=
 =?us-ascii?Q?A4XWpyc0vyzpw/FSr6kF6AV1V5cY4qnoux2j2rdkC8xXPbr4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82323fe0-6575-4820-b897-08de93cadfdc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 10:54:28.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JeGTmFuzC6FstPwDx50puctwhJKHca6XTAQq6SXQID93vbw50kCzhhz+aJEL8RUG6Lfmb3PvaOxvW+/I4cCYdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34705-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim]
X-Rspamd-Queue-Id: 130D33A2EB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 05:33:57PM -0400, Frank Li wrote:

Linus Walleij:
	Any chance to pick this for 7.1?

Frank

>

