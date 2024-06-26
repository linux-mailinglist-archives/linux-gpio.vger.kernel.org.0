Return-Path: <linux-gpio+bounces-7694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F878917551
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 02:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67D5C1F2243E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 00:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B267D79F0;
	Wed, 26 Jun 2024 00:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GBDrRUCV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2074.outbound.protection.outlook.com [40.92.98.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA0A92F;
	Wed, 26 Jun 2024 00:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.98.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719362699; cv=fail; b=T2dbViBB02sBcTYEeN1DWGYR8CxZIP3E8iMecdMpN4YmADUZaTxfC+PC4oBUtINDFigsZoA8zJlvbdB+XEemNfmX0mujauVJv9nCxH9y+8Vgd4GVJgShOqo32e68NvF6Zskio0xifqn8Txx++Soi+Iv5pGtXYbyXxgPPt1b8Nzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719362699; c=relaxed/simple;
	bh=o9hJBArEsKcaaJGlfH5WK76MzaIHg4QWIbw5++T8E80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QNWEQcPsAJYawrvTqqMlK0QyvAMd6kcShvxFeD3Gfuwu0FvCNA1a/movYrHK5fsg3uwDswzOZ23ZAFGex2ij0K8MkKiD8923p/LqFQe9rYEMWlCDlkywb3mbS45Io8WRtXyd3MRtMCZ2xa+0ztYq/H7XbTiA/YNFTrlSodoNx2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GBDrRUCV; arc=fail smtp.client-ip=40.92.98.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feNJOCm545qgXPm82piwF8oDPtlg+R6mW6cbyK04n1ewAfj/MqpIhUpevYh1vp0eZJO2+vvg1kzPzIi5H42zaKT6waW/lU7UA9hxzwIkbtQW+J2nyI8rjRT1K+IQdQ3QgIZ2rc/FoyM2fJ+M4oU35jC1wFtNTtX0YiWLdoMF5ro9Av9k7D+DtpJOVz430614VLJ+X2LjRQKGGKkFv4T14GcjEQpj6D/nzg7XbA1rl5yEJ6AGjEmrU1c2G8B5zLqzkP8I+MQ1/gv2NzxeOCmuUSNGomwIrVVYHAYxhP+A9Igie2RhBV+sBZMAspQPDo9Yl+oraLSZ812u63PRyIicqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR1kDcoZnFsRR+PxWpOJlJ2jM5tPHPYWT0x5PeykVNY=;
 b=IpitKo+ruMhDjS/4Gc7REegDVWs7zHMwdLRU495KWrXyGkQPE9tYN7sc1quNuvJR7jthQM/U9tupKkTP5PpwaWqjMSjE9Ig+6kJ8PsA5RbCHlq0RJkMvcI+iE+UIHcquAJkGrb8GrQYHLD8iTzBzHd+ZR/aoGk55CnuvMsskigtzmq7NkUEY4XOhgXtsE6Tv4wz1P0dyLFbdhdQ9r5YtltjwDhZlDB+86cizkfU62ArU9iiAlDbH6J+mefOPn2rNOts8CjmbLF4nKLGLdoPXIIuPFm1/nPhEZ1Vr9mRF1YEtP+LaLfeLKHVtgB7Cvyl40pY6topj6+dAJ6S8WSZTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mR1kDcoZnFsRR+PxWpOJlJ2jM5tPHPYWT0x5PeykVNY=;
 b=GBDrRUCVMZr6g5dBpxQ3V3/FP2CFd2VTDyzQYU8ndeqm+FKFQHvrwHI9aE+4BuUpxlssTvUq0Ny+WuIWNsCLdN0o9lVU+0UPfPn6+nLvLrNJzOFo2JfMiz6rhZeDGSNGRRg/S9ktS4JwiIgVPRBnPC3anlQJjWfFm3DI521RTl0D77r+rHaa1lTHqiQUenDBmz9Q+TTQFitjVbLwBfbv9/F7+F72x2Ic04aR6wJhy+9CUc8I+BW/R8eTOe8YW2Pm4ud1f0xwf2MVGW7kpKaUoSjWSp1vxufkGNKp2cZSyRvpzfUBfnza74QtcYjWpkBQLPUMV7UdgG0k46R1XRKFqA==
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:77::8) by
 OS7P286MB3743.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:238::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Wed, 26 Jun 2024 00:44:54 +0000
Received: from TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c]) by TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ad5c:3146:bd0d:f17c%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 00:44:54 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: jonas.gorski@gmail.com
Cc: albeu@free.fr,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ath79: convert to dynamic GPIO base allocation
Date: Wed, 26 Jun 2024 08:42:24 +0800
Message-ID:
 <TYCP286MB0895E5D272723AB55F9F4043BCD62@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAOiHx==oBMZiVaZ_ra0ren-sea+D4znXQA8wq-dA+5sC0dav5w@mail.gmail.com>
References: <CAOiHx==oBMZiVaZ_ra0ren-sea+D4znXQA8wq-dA+5sC0dav5w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [BkyHorDHliiAeJxF/33XK8WXPKNqjR3u]
X-ClientProxiedBy: JH0PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5c::19) To TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:77::8)
X-Microsoft-Original-Message-ID:
 <20240626004224.4702-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB0895:EE_|OS7P286MB3743:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f2ebe1-ff0d-412a-4093-08dc957931c3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199026|1602099010|4302099011|3412199023|440099026;
X-Microsoft-Antispam-Message-Info:
	DfYyFADQPogU8BVL7y6EVQ31sjf1TrNr5mFRYS8XKSixtCgVNlngdeX8FociQ8O28OJ3TCSMzAMDo7egWUFbsbH5ggho5+PuCPQfZMncwSYwmd0fZ+cqFwe3NJ5fnWgWMNtlztr2h9sMrS7cEG909Dt8YhGaNbXft7tb398vyNkMbR95uCTbXOGwJ6bvSWxNlAvYUBN8gFjawbWQDYGf5tf+8ThaFsSc5w0eBNk35HtZt4/0crd5gCRLJuCBZac7TgVhQBaNhZoUZFzpq91LJiJHXHvp9g0u1JWLvybEoNc7XUyJupWMxR8oigUHFXZHTkLrqx5nXIzxLnuNRcFCbcTwRXIkQm23zdErzQ2TtOzirqbcn/vBCjPAvAeykYp+O30HujdH3h69t1J012W1ElHMlN85MMsiu6gR/UwZi1KWAyKDCnS7WJXlq57m6GnCMe+xAfSxmo198y6MePmHgAzNYYYpB4aXERwBH8uWwtDO/8XaCLrHMRzVxjq+dI6k4NaBv5PHsFzYbrWYtf2jmU3gG42aRM0U5b//jFNHQQJklygZj6Af4Wa716njcWq4rmhL2G9LryDyUNPLF+GfrIp5lYKb1LZ4cQo2ZPr+NFUQkaoLAUMtWo40jy8jsocaudSWzzHZxuKu+ySPQFrh98VbCf/Jq82jnHUiApwx3ifqi6W4q9smtJCn6K7diGCh
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dAeylYeMQTBRJ/hKmBaP+kYub9IT5Nn0yfqEvcktyhmd/V3JjhI+gUa2BXIx?=
 =?us-ascii?Q?g2f3juHnh1ws841Nv5wEfPTMjfo+uEMdBiV1cSJIayRzYPrWjgNulpAZlns/?=
 =?us-ascii?Q?tKZ1efX3dv7rlaM+TAbUnHrRczA0fa93XSdJ2jN54BWFa+/fYq1+zio1HOhb?=
 =?us-ascii?Q?h96iK5TF85YZC65KTAeIjw5roy7kqlunGdLi1apremrTZ31adjnYO3B4WWJ7?=
 =?us-ascii?Q?VYPJjR9Zdmjo+sCg8ELcbBeEJFjuDjnC3hd/OwemAbIMPLAqhYgTnnKalDCT?=
 =?us-ascii?Q?A0eZ4dFUm8Qi4r1o8Y8amdilB929zNl3UzKSrow3nSksPwRD6ljYEJQeN0K1?=
 =?us-ascii?Q?DKb8eG96Y9F8NHim9S9Ktjy2WcsVk4ep/iwYZsBiMlwNYspaRsI3H735yhcN?=
 =?us-ascii?Q?qhyFO4Lf84LA7ajpwaoPMT5GrwzbiAGV3pID93m14C0XKHplL/Oup9+ljPOC?=
 =?us-ascii?Q?akk5Jf/HVh7mNLQfTNQdl/7zT+AzbgVcR3rQsJFHiY0uNAQ9C1M8cpGuxe1y?=
 =?us-ascii?Q?GhP+bW1n08jIkhOjlYYZKfvRV9OlO+qpiBM8XZcBtnVvR5wWVUJjyc+d7GzA?=
 =?us-ascii?Q?Zqd3rgXTP52myWABG79vBiCMKCdTI7KanLhZo/XJkotio8zijp6R1Hxb2p5U?=
 =?us-ascii?Q?sycCbxnSe0JWnRd1IliLd9fRu97/xgjJCwEokI6vx+c4kA4qJlnaeVONunuy?=
 =?us-ascii?Q?Or+iVxe0wBSjF2NwNtXuW5aJQg3eMh3PDtH1bct3XAwpzSlRhnYwzqoWkfr1?=
 =?us-ascii?Q?lynCy7vwpWjTLtvgUecH8EfbHEPRuYBHsr+O2oDF/AEEPOZEiBtxD2B1H11i?=
 =?us-ascii?Q?PzK4JoGdWpCelkyNpsvNDoIQPmgsdnAVNUmE6x1B0eA3w3j6hhMhKhBBZD6I?=
 =?us-ascii?Q?LGHqZe7pEYUTfgo0GzTuCxfp4IWi+OLGPIr4wlUXmss6YLjR01LfFSshRfAA?=
 =?us-ascii?Q?AjbI8RhSHBUuz+wnRK5QFIsGrsb/pIadPGvpnbGcG/zOCNHaqI+FIdpNWhjv?=
 =?us-ascii?Q?cZyLJGlLuK8ego2NxJjUKkYH5PbVVF6T0AZJYXnr2TyAHnf06CyWNFUVp1M0?=
 =?us-ascii?Q?hCmL3PQK/rx5BsuXB1YzM9+p3NnHgHcCdyP8JAkfY0C/H+7LpvfEyOIxrRY4?=
 =?us-ascii?Q?4qdYT+sDBaKMPg5Jnej0JbhFu6Qe7g+LsFHXz4/0I0NP1ErGWjVkZBJjaal9?=
 =?us-ascii?Q?fwaHdz61BtY8A89EomKyLDuxWJlLMZH157KN8OBleoADVRT4NYwz7q+0BEQq?=
 =?us-ascii?Q?XZKmr5UeZT2nQ9ZOrFzd?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f2ebe1-ff0d-412a-4093-08dc957931c3
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 00:44:54.3844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB3743

On 2024-06-25 14:16 UTC, Jonas Gorski wrote:
>
>> -       /* Use base 0 to stay compatible with legacy platforms */
>> -       ctrl->gc.base = 0;
>> +       /* Dynamic allocation */
>> +       ctrl->gc.base = -1;
>
>bgpip_init() will already have set gc.base to -1, so you can just drop
>the assignment.
>
>Best Regards,
>Jonas
>

Thanks, I've updated it in v2 patch:
https://lore.kernel.org/linux-gpio/TYCP286MB089598EA71E964BD8AB9EFD3BCD62@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM/

Regards,
Shiji Yang

