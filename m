Return-Path: <linux-gpio+bounces-35909-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GiUG19G82kMzAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35909-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:09:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B22134A297C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D85BB3024103
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F103E639B;
	Thu, 30 Apr 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HJSEkqc6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d59wBRpf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C923B0AFC;
	Thu, 30 Apr 2026 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550826; cv=fail; b=TApxMnnQIALsyggoZiksgJLBwKpNkyAv4B5BY9tEaHXmXSOSiaru41jLzzVuOw0Ovfo3kmZlKbnqutif4ECTXxRfRwT9nVria2vXygL6WFV2AvVFhZ6LwNe8tQWVbh5qWMhknp9K205jOUu6zeRpB7ZXdLQcRjSSSNHZK4ys7LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550826; c=relaxed/simple;
	bh=CMkKZi0BMcftQIcd1CDqgzWv2SCLLM3GDHHz9Qb404g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWd6XaqLsIxVS22wbfG/vziEsynosBcy9WPZpcV8RIwadpjqbsRrhcUmRd1RvsxR1KXEeKQVe6xMlbeKLPklKJMxvXhwK5+9+z9+YyKqeXjaBgfR0MSADerVEPmi/8OkfEx0RyTxunfMzNBipvr/h+HRYGxgXiWzB5KTZXX4TFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HJSEkqc6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d59wBRpf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U3pXSS2717378;
	Thu, 30 Apr 2026 07:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Oy+jbG5jUngr4/0kCc
	RGoTw6lty+Anm78fJ1QC5s4Ts=; b=HJSEkqc6y96ry3Utm72u2ROIi5wJ3Bu9va
	IOMRhYDEPgBylPzehBOmWpjux31XVf+KLYXyvZCYKAchhZJtNIk7EumfzRTheBG9
	SJg1gNhw7hXg1/Je3sA7pcUbmxE/5aqm+jv2NL6AS+b4yWw1XweWGozBqEPB/qlm
	buKFX5A0OdcCPpZVrQdvsYa78V0qIj5nhGZ1RXyn2+7GNVSqAnZLxGEzsgdhI91j
	U/T4nObnTbkFpBLC4bVViL+q7++Jw8Y8pKJZEkn4V2S/KnDHoIivyoOBr3nAlIkk
	Q81GyiVori/2EG1rR3IYts83yFjVnJFNSHHCdzeEBr/7uKyEJe/Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020105.outbound.protection.outlook.com [52.101.56.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10ekhc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 07:06:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5h818cpUaXVva6MNyUmA2ftaCLPc83dLf+A5vL9tgWEQiBd01FTDjLCpyemJcT9IasBXWTlSp3t1O+cyNewDcVTTBo0+/CORWPO6AtiTWxStF16dbay244k9SkaTlbmIUOCF6WBg35qALZpxGX5+DBjic1O1rgaRIgBDI2wBzvZlI9mAdIDtBbyjdcLMEgUWddLyCDbjmijcyfsbGWvooj1i+u0G8f+2z7YcG5DdjzGA/1Rhos/4dHPvtbVBSQU1TI1R6C82jFY9VsGOhoXE3wio3eo6OuM55aFC1hb7WKBfy3BlDfj4Rbw6pgP/t5FGJtnWwNhJ76Io0vNK+eLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy+jbG5jUngr4/0kCcRGoTw6lty+Anm78fJ1QC5s4Ts=;
 b=AFvebHzb6KZzirVuhMSdwc7jNwZEvu5kE9b34yxYL5hYMp5IkDL8k7P+R5Xy5hMSx+a9teidYO8R0TO9eR0W6v8zvYkL0Aux6wcFu1DJGh+HA0EI9Zbt961vup0F83xSuHxI8WpkHoWkAFCiCw7X0eAvy8hekObE2rjioItM5wi0OSoN12zX67NHsM83KH2OiUOSTqnCXtgSH199A2lZzOKhmASAIWm7bjeT0DT78VE/9Q8rY6okRCFPRx616p/u2XiHKbl7LEKe8a45zOvC4uQoFYAiqLJRftSnjPfZlZiPd23uSw06hjnLOReNOfNaA3BU95cRXFSmf0H4ag6vCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy+jbG5jUngr4/0kCcRGoTw6lty+Anm78fJ1QC5s4Ts=;
 b=d59wBRpf18uNXyHbQcPcxLpz1sVQiLq0pGqjgLdznjUnLjb9MEkcdvxJw1P6fd4FDVdwcopeUdoR6adPI/R6M/HzpXj/10mGHpqOjYJQzQ7tk1/jUVaiWBKp14MBVD+oZB8bxjgxjFkKW5MkXd+39ETjhjkeIddnLYs4p14TV44=
Received: from SJ2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:a03:505::6)
 by EA3PR19MB9568.namprd19.prod.outlook.com (2603:10b6:303:2b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 12:06:55 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::dd) by SJ2PR07CA0009.outlook.office365.com
 (2603:10b6:a03:505::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 12:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 12:06:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 73F2740654A;
	Thu, 30 Apr 2026 12:06:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5BB7C820244;
	Thu, 30 Apr 2026 12:06:52 +0000 (UTC)
Date: Thu, 30 Apr 2026 13:06:51 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>,
        "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: wm8994: remove dead legacy-gpio code
Message-ID: <afNF26Vffan919G1@opensource.cirrus.com>
References: <20260427143437.3059210-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427143437.3059210-1-arnd@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|EA3PR19MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be58cb9-d4f5-4406-218a-08dea6b0f87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|7416014|82310400026|18002099003|16102099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9K5RJqzSZ0qhPB7xRkgJ75uzSx6eYMluapv18Qxsan68RtqLCA/d4Z2oRFm95Q+k/X4aFNPimy1JTdotiyq9xdSxx1Up0eAL1vq9vSPe1Z79OMeFN1HEi91868gp20CwJJJ3XVQjpxJIK2RRYYcYDeFB5a9jU0Ce/CUFBmoQCt1R5KLsSrL0a3DpXV9U/PJEdo7STgfSUBSEOQbYpvr3JH0/OVDH4AFB6HAm3H/TWM0w5O89ISYAZuTzO9Zx0c0hPBufVEmuVsReYomGtjmI3fTpYj983encWkkA4jKUIMPXM2sLOIElcoVob12iwQM1nxNmGImh2HZIOjnU9Af0PyZtHxvgaR3/EYPf8eYBGA7YI5j1eN89+WNxVMzu6Un2QY3vJUD0T+jSAV8g+fKi8L1QpD1lJ/UpZskHraHNFFCHMTVf9FDf54kpjnkPxdXueCFw2F1ZRfUUy9Nx79OsDgx7C7wJ1LVpBE5rz/lQeFAGaPlGS0DKu+v3pORXC7DK9qkUqUTaRa4iqgUfexL1iP527rJdOKidTjzyhllZ22BrmH/pyCJ0dG9sE0qEhsChAJipbzlatTEuc/gszDGAELNirEa1sPdj4EEyKeGGfRY9DqhOmcZOVulSepZUA963so58ShS6qDkX0yZ+A4j39kNwnWVbhLru4war3XR0tkHk1zvp6wAe+6Bp19qeep6VBM6G488t0V9LIWOh0wsNFiaVzduPpdDpAhIzCsOV+M6oKGWueGyRUjiXsnWH0gIKd/F0SE4CJUqQ6eNsF+Peog==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(7416014)(82310400026)(18002099003)(16102099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SKh4UHbJJLsK/CHFP5C0b1J6cTmNBXwGSbllDPqjRjSC9DqzeQf4EAtV4smeBnzc0aLsgmm6HmB9je0iLQ3KJmcWCIALW9iYZzKw344Nrr/vAXZbRwB4Lu2W4jo5R84+BhoEWRMtHkamJzmnj5q48EyBSuqUMmVWDXAHdiirYhWn+TnFGuohNU000XRHesnLsNg9P3m7Nis2/VqegK0XGxAHZDwHWvXw94XXn3y0hKN3+qoY/HBMLcfXedjPXKsLzDJfmBuk/2VLESG5fFc8M4jMQpfbVSyQhZKyttH1RU87Mh6HpEuKi6Co2+FkozJe2JNBar6OcVOs7RYit7bsYEx5jqabicTpWsqSnLyeMgFL/VPhMzGz7ZjyrgDOFuVNo5zp633x2aYGpIpVZ9d6V5MY1LVPPhCNoPiyjMtb/UjVLJBDQdRhdcJCbKozldTn
X-Exchange-RoutingPolicyChecked:
	SgaQSBNVORQ8yG3rA2sM138ZWbDGuxQqDniEV0GfM+3MN1OC0GvfBNrHjMHMYIrWP+fHg/APQyTnpX9BcQucYtlmSDov5TDuvJe8EW1gJtroZlcxIpDM7s8j2MUkp7oEOGc4KSofl65JfC90/HXvHfYXIpv/Fgp/IhUL6fLosYD5DZQ70spKsf+6R9LQlQXUR3+gp14bhFy3rWAMZsPquB84Giu+On9yhx2nYaeMyLUxs3RreGRmwcwJMprstQEun+PuTu8ZcI7pounoEmLUHf9PoRxG4BmWPVRxu6gmvlk5FxlnDjmS7GW+OhLHK9kzmuVb7p4yQ1EFPPE/SDhjwg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:06:54.3442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be58cb9-d4f5-4406-218a-08dea6b0f87e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9568
X-Proofpoint-ORIG-GUID: hfjaBkOYjICeVi3uhk23o1RIuw7wVOhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMyBTYWx0ZWRfXyqZVB5WuY73N
 RhZg67eZoDg2qs5SzhB+aAwiR1kdouuVBQb7zWmTZtob1nblj0kPfFnNiKuHYa8e/98Q7iSmhzi
 EC5JKS+4Zb/Hey555BVUT73J5F2niPK19o+Kdx0CkP9Y5SV7VRr9zeIgYzGianLq4Piqo1bszTv
 FtDUPxoafkiY+drjlaMPZ2ngUArmt0IMw38b2ZXSoNnIy/suW3U6FnHCvR1GtvVf7PmU2z87gvQ
 z+lxyc518nWh+YxL8ZjsNBDoUNp5yIuktbEH/BQtEAIdxW+/Ik+K+h23wKhv3YFbZHpcbTFfTw2
 HzNKUvC/HFFQl951Z1Io1V2KBHRDimvJHWPuZXtBFWOqWTH0zOjoeOU88ThaBbf0I5YzB9j81bE
 V80lxmsIElupAAR+V5198bqRCp1U66YNlGSCTzTcAGNMUQc65SeWvVdm0WYH1HtAYh55Tw1iz6I
 tuDNhsRbWq8QkPGFZIA==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f345e3 cx=c_pps
 a=aEMvDn7b7fLO9/K+yIGWpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=njcF9bMTF2qjovW9GhUA:9 a=CjuIK1q_8ugA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hfjaBkOYjICeVi3uhk23o1RIuw7wVOhM
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Queue-Id: B22134A297C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cirrus4.onmicrosoft.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35909-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[10]

On Mon, Apr 27, 2026 at 04:34:27PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The old-style gpio handling in wm8994 came from a commit 7c8844481a1c
> ("mfd: wm8994: Emulate level triggered interrupts if required") in
> linux-3.11, but nothing in the kernel ever set the 'irq_gpio' member
> in the wm8994_pdata structure, so this was always dead code.
> 
> Remove it now to reduce the dependency on the legacy gpio interfaces.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

wm8994 predates me a little so not really sure if this had users
out of tree or not. But the part is probably old enough we can
risk it here.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

