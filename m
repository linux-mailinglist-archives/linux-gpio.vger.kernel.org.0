Return-Path: <linux-gpio+bounces-36871-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMTFCtM5Bmo3ggIAu9opvQ
	(envelope-from <linux-gpio+bounces-36871-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:08:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80767546EE6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C79F73034E39
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 21:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA473AB287;
	Thu, 14 May 2026 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f08jtb6+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85C390616;
	Thu, 14 May 2026 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792910; cv=fail; b=OGkgtOxiSKs4DJG39K8p8/sAlw7EZNu8nKfZKrB8uQ6kdkWWdeskpRrVIYElVjp/7E9q87BrWJkj6At+yBD+t4U5gkgyAQCW1KDW7WQE8DdeYcfLDIVg0LRCYmfn4cGgC/9YZvDT8nbObj7Clw6PUFZR9mVmDoQPhmD+RcACQ1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792910; c=relaxed/simple;
	bh=Car2ny5SpMx2ksDuPtZLBZ+jtx1bQIhiMFo+xtTlzxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oqvuEIKWbEpvGbJL67OW/G/EWW/QI5uQuoCKC0qn+yRGHqqtlXNSooApmkqyr/r/rj+vBKaWYt6XcUEJC8FHpNlqkbEps105VLJyBb5pecqr4vwouWoZ7Mqjmnj+S8quN/ZrHXtxdHgjhevdGKfF/Mz+821hr6JiV52v6QhVJgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f08jtb6+; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0c3XbW3Azcd5NEVdi4ogKtL6c9pqcZpuEw3PFN5EB5f870Kdh/lfeJ/M81k98roHZwrEWZExEpPUXz6K2KszfQ4PByNImxhdEn4+02ORA75coS7YlmhJKkZ4cLZhCc00JuGnYiqt/3Y5QMs3obDwVSCDoaf20bfPSLNowbn1AK9ak3J4hGnesu+qFx8qck/1hp+clJjy5bosxhBoXwMo4uY6H6JO6IcC+ejZdUt1ScqErxN7vK4SprHubRDiJx/961sln8uhugBO+2Yzqk3wGZVnbXTsUniyJIR4N88eDMeJvDnmOCjImmBhANHmWfhdkFsIducbpJtenHXCvtQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLqq2+IL170n2q9Q58UgBfoqKz1/fmJ/Kp44h5Tx/JY=;
 b=FOl+eKYH3qKZ1DZ/wrjx9sC6FMH/zkxQfd2c0LZoC5s042J8hRIhhREPBboAdqfhf9djYA4wZb1HeCSU2kpKY2lwM16zJbPNVd5BDnl1yUdFOkseIO6IL21YPVoNITlSJxe2aFZmZTh3VKsPpuZaFOv4nrKJgdjQl20Qj5AsOTE9brjXvODCvFj19qgq+Db8QR3GwkOAUdQbbvb+WqP0fLzFF//8jBhtkbAgvLPreXy9rZQ9cOKjZ/HdAZW7HIfXR8/24KbhPyS7DFEH8a7eSPmNRjFMRvW3xmaakXjL4tcT6p1pIWtpvXKDgmVSpcYU32Gy3G4zPRjJQl7WoDl9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLqq2+IL170n2q9Q58UgBfoqKz1/fmJ/Kp44h5Tx/JY=;
 b=f08jtb6+XIvpmRhsRKqkmtMB+Kkh3NQRLMU4kufwVDLqGCj85UDJq4ep7XWmEsrn4ZwE0EH/w+AFop4CL6XgLb3m/vyogLSgu3wULDfX4jysVDtRWvDs0gqkYAZQqNCdu5XFMsLCgj8S9tSdKOH15hoZB54sAqqyNIxr/yODD99CYOm0rqCn3jSHMV8NfwUJ6Z+m36f5bOtZpE3j268dVsRcGThq9MOjpIl6iJLSMMxXcP4VsbFfLXsXSP4hGL5npBcKMqfifsf+AdYgMQyQvNhlEIrM+rewcQSixBU6gh5k+pasLTH8NpzbwYekiupyFxZtbPcwCfeFJXUseQOwYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10705.eurprd04.prod.outlook.com (2603:10a6:150:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 21:08:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 21:08:23 +0000
Date: Thu, 14 May 2026 17:08:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: linusw@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: fix signature of extract
 pinctrl_generic_to_map() in nop case
Message-ID: <agY5wJtsBDh_dPbe@lizhi-Precision-Tower-5810>
References: <20260514-slum-sprinkler-8f858eb81faf@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-slum-sprinkler-8f858eb81faf@spud>
X-ClientProxiedBy: SN7PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:806:121::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10705:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a6d771-9c8e-4778-65d4-08deb1fceed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	oCDD0vPiieN6hDhmJ7sUp0mHNxkuSpQq/3UoYP2shfbSs6kTsohSjsUAZFwRmSZR2PrMdcUY6OmDvD8vUEC203Ex7WbtWpbqHVbxrurxZAa7NTG4rlQLYxgTfnRUqsSkPz9Gm3NMDOASWOCZj8jY+7KSvna5+Q0crVnIngufnF4D6YZQboGZuaPTM0we2s+2W0LQVm4HGYV89TJBuSG9/lpba3xc0JpGc9is5qgr/kT/Uwzk84pXyP7h2Pv3jN11f7Hmzc7GrxTRGC5RNayCj29vPM0TWjYerAJ8wbmCTm0+Gz5nOziQK5rn9lN9u/Yfm8aW4NcqvRiWSAgvOijpQ8yTjzanhQ8fxfp43rBd8zZhBby8J2LqGJnOo+flokmd0ewse/8iWe4Aam1rUDwHpW7S7edcu3A/G8DTmju0uSXTEiiVN4w/REZCNIVpkL4tlOL1DTn8NJcfNrjltfktE+7llOjr4KtMM8T7wpVCa/xXkGBrI5nFb2yt15livK0+Xx1a5BLUMt6S6yO2b0pMN/uvGQSh2lPY5T8Wd69P6fH0aXvhofnpWBKoljWBF+acwY8JKlX91y1BVsatgFqoNz47xR8PlWLNwMmYZ4vM+V2+AWJ/o5oeP+AcCa3m1GdgLwGKeZXofJE9z/W+UqqyVc5lmALVhJTtIH44TTiRiXGASaJZn4qBaDMCM7Fm7QiGhR1Ccc1Lg74gimTEGPeMT3qt47tUPD2+/iPr2XMSMILqrSQcnSD5t4V+O92VYMwl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q4Xd5EYCOD5LskBlWzh94igIUcqHhy34ZJUMoyKx6BHpLRJKgdloIcV/0Ppg?=
 =?us-ascii?Q?Aa5bynj9/TwC87hF39yrZDZxpkc7XgbJbzAsdb8I6cOESLYzdlxUSerkMbJe?=
 =?us-ascii?Q?fXoIpiiZ5wPd+GvpPSYxga/JvFs9DHb14MLo53/HkYFEla/2alH2setRxIV3?=
 =?us-ascii?Q?/WiywPgfwYXgAVguujUiD5JcY9/aOOfTvrFkuff4eP72WG6YksqdIhsLGVcv?=
 =?us-ascii?Q?k78NtjWRgig/+GDKxOso1CNccG1DX/glui2IJuQnqYRSz8ZaZWZmu9EcSEJO?=
 =?us-ascii?Q?i/otENmpC2fouNqy/v7zaayvmH11e6E3ZNMNjX0aByjXvDeUalToGABqQ1AY?=
 =?us-ascii?Q?PfIBSdIUESYcfy7x0c9htEZNwQBOkVf/+9Mk/VE1m5CzfHO3jXKEiC/Qjw1/?=
 =?us-ascii?Q?C5/n8b+Vbsb8vbLsGdHggtthKDb0WQhOM/AjHsdesJ1zXeKf19kQZym+WKj8?=
 =?us-ascii?Q?4ZjtvnOlOLyQTMZP0qsuSHw4fy3z6Xy0Pxyj2gQp9pfW8UoUymO7zgEa1nS7?=
 =?us-ascii?Q?w23d36FmHQn1XIDmnWbkVy/dcPVI+gx+QZpryRqfNzx3y1zP7qr050PdhMvP?=
 =?us-ascii?Q?a4cDJe/RyrfdBklq+md1EXHig/5aJUoGziqt7PHfTMAU4U1P4AwGkOJuAi7o?=
 =?us-ascii?Q?rzMdRNxu5BlR1DJKcMqFtFjZpaYdkGt03hY5FnSKIEjlYWu0IoYPaZTxTqns?=
 =?us-ascii?Q?t5e3bRZhvYOS2JOELMZmFvmzBCz8vRAQEv7vbkBesw3h5hUwRoJZ8NhsdYRS?=
 =?us-ascii?Q?wAVsSaK5a2gq+IlqDNxmopgYNUDD7ZxVLx4V1W+kHVVQghF/qNlyT11SE9jJ?=
 =?us-ascii?Q?vyt2G7NKRmjI31of9zCq8OLJ8dRlDSVJdHZpy8xI7OfguY/gSc/dl5SMp5Zm?=
 =?us-ascii?Q?3tfcQyGr7LFgfxrnxKT6zX72Xx4riW/ceglNGUpNTfFCOF44TlajGBwYzeBu?=
 =?us-ascii?Q?V2rN9JSDXC+C0GHr5Dk2hXUQd5owTaxQDZl1svbzTyI0JEefzYfxqtmIEwjQ?=
 =?us-ascii?Q?oxDsTc6Gx6OPVB40lqhXfS75PmwhhGd4InBv4mg/cYV4kSgnOzMEhySxLstN?=
 =?us-ascii?Q?r5IMMwX6oQl42OP8sTEix8Vjo18jfcCcTMorjyYmc+IcWqvGewUmeIhORpSE?=
 =?us-ascii?Q?PV5iM3d/7pnvgtw2Jnu2CPKHm9O8U1TZwVw276HB5PvYZoGf+iqKm1ApuU8J?=
 =?us-ascii?Q?vwQIricyZujgN8bi2gFM7TQt9XYiIEqLAhmhx4VnZxIpKkarwTHqT4Eopyvc?=
 =?us-ascii?Q?WY5apHJ+KiNx3NHKVD1CMSlZQYTiBZ6fJ31X3Ozz4LCvYuHDhkBVoH+pUymG?=
 =?us-ascii?Q?5wbrm/+kwXCa/I7lzvvsGqgIJw575iWQHrQjdXj4uNhsXegznjoZ5FGeRtNv?=
 =?us-ascii?Q?e4r7+aFG3lgjy3eHm8zriI+y9xmPus6vZ5Ab+55AKrP1Jph1Pb2ez5afpywi?=
 =?us-ascii?Q?2YLnpxywJjvB4FsCBV8T6nYyWMHEbZbfI44vFnj1cHivXsFI54KxQPMiuOaf?=
 =?us-ascii?Q?r/X0TRRpn3Xj0A3uaLPP4WxkYc/Gsf4RQ+W0G0ZPiVcWuczFRv1mMtfBrWmp?=
 =?us-ascii?Q?DAayJWbqaEdTRn4425hm+GwQnjkGle2xjCbcCBBm54EzuDabu66uxDKFVPXr?=
 =?us-ascii?Q?xjf4tmarQ6B9xDgCexxGJfbHjwhtszTX6HOKfVAVD2NR+J9Au6vOjB7LP5JJ?=
 =?us-ascii?Q?gbYPqEOkoeaC1aDN7N2UQ6PdVpQuYI+0B9YJAf0t4YA4bJcld6+a4DDiy7b4?=
 =?us-ascii?Q?FfJverhbGQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a6d771-9c8e-4778-65d4-08deb1fceed6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 21:08:23.1576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2glZuVZPxikIo4xaCjmPGhb3e2nVfyA2LBmdFxxD46n9P4aZ3xTW2Q48VBBX/Pwzv1OXxWQi5J5JVMQA1YZLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10705
X-Rspamd-Queue-Id: 80767546EE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36871-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,nxp.com:email,nxp.com:dkim]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:01:27PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The signature of extract pinctrl_generic_to_map() is incorrect when
> CONFIG_GENERIC_PINCTRL and CONFIG_OF are not enabled. Probably a
> hangover from an earlier revision of the patchset that was not updated
> that went undetected given it depends on OF being disabled.

Thanks, I already posted fix patch at

https://lore.kernel.org/imx/20260512144806.22447-1-Frank.Li@nxp.com/T/#u

Frank

>
> Fixes: aaaf31be04260 ("pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Linus Walleij <linusw@kernel.org>
> CC: Frank Li <Frank.Li@nxp.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: linux-gpio@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/pinctrl/pinconf.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> index fa8fb0d290d1d..9711d16c38b62 100644
> --- a/drivers/pinctrl/pinconf.h
> +++ b/drivers/pinctrl/pinconf.h
> @@ -195,7 +195,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
>  		       unsigned int *num_maps, unsigned int *num_reserved_maps,
>  		       const char **group_name, unsigned int ngroups,
>  		       const char **functions, unsigned int *pins,
> -		       void *function_data)
> +		       unsigned int npins)
>  {
>  	return -ENOTSUPP;
>  }
> --
> 2.53.0
>

