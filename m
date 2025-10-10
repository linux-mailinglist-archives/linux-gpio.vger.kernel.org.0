Return-Path: <linux-gpio+bounces-26962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAFBCC291
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 10:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B118352551
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 08:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10592620F5;
	Fri, 10 Oct 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="lOLFKV3P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED925F797;
	Fri, 10 Oct 2025 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760085402; cv=fail; b=IklLhEv1boALqr35j4HvAlnwFGrIeTp9UDR1Pf3pyTNFHlGb6N/u3zxPbu9U7Fw7gYssIxZ/qnaBh0E0n7Gs5QDJ7p+jPDbUD+WSs8yx2BzJ7FPWHaUN0g+8Pwq88zIvck/cYaAihnoeTdqptuUz7UIHvhSo8qQ0ZRzR4v0ol48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760085402; c=relaxed/simple;
	bh=+4HTTgsxuHP9cCFtXmBvuKcCuWWXHmb+n6uqo4Slvyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggDmxMsUbXZujOWZ3oCWF5a5XzFkmWEN6m5l/uEonjWSIsJnjXUFq23GsGc8PHs+ZdgM9Y18H0RAD/zf4dvHxfPsZ8ewdXZRwaiu9eSLsyyVdNNHR00cF1lgkdfJQR1jzVtP/Mt9C4HzUyM37o+r0cKf/yKIMZUxdFWe26XpaWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=lOLFKV3P; arc=fail smtp.client-ip=52.101.46.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcTopfJeGO5TcChkSiA44TLdAb09x4qWL8SH9BEMO1Wogp19Yn7ecP3sLTexgwkhbg7s+FSKYzqCMK91CIGe7cfg1q1CSLccmGEmm2yAJIyDIBuQzTTAPQZ512baASb4tXt77UZp2/j/p/ySJ8YLTVWA2rm6ts5Sq7nIM1ldSX9pk2dgAduxOTewYaiZM1srycGRWAnRsgEh+e2SZuj1AsLCUEZLrGiBVDjv7XyGseMD/+FCwbEqPD4kOqLSfGzBb4Nd4Dy5r8p3GL3ncbdMt1A2TGDoYqM1+jFggiBeQoLJylZkGfNv400NTTDTlHM900CdxRu65O8b/h1YIo1roQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUCG4njRykTADGV4Pc8IVGbTOAmtWpllVWCd4zCZS2Q=;
 b=m57ACh43CDVecGj7b06At1n9I8FMv8PGocGhnaneny+fUv7Zpipxz2XfkUjwt5e0Sd7aM+I2uN8g0lTB93xFmcF6UijhRT7A66O5LT1E2kCAdQEpt1ISUGQV8q5HZ86gSPRYr0KAyv54erUJ2wq1NkYRgpmXxw4RbHgUs493C93JBwfODOSqx7Y+pUh3OLAlPLDEEDcF8kNfioS/+kjnPmsoufs2mOe0M7/bmRwRpDjcjdgfP22TPyIhLgpGsXh97/TZ8UQ4Tp6K3KIfhvIY+ZW4jDMrsjowGixPMB9BwP8hlahQXkWlAYP0ivSKZ68uvELI0LhbNxcl6uHzOExEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUCG4njRykTADGV4Pc8IVGbTOAmtWpllVWCd4zCZS2Q=;
 b=lOLFKV3P9ljXrBOFiJ5OH+7H77/QH+Lv6O3VfepKKOOyzGkx74g8WZ1eVFmemQUhmAASveCYOXPoLaCjZ73tiNkzfxCnIDbQQ19mh4zlc8EEFQ3BfVkQrTDpp/XR5f6RTCu7PeaEn9kS8VBYzBWlTVS31v11ROzNxpvEbZx/vcfzis9I51n3kLZ7BZwAnWxlqtaf0g66QpKDaeAc3QSXDGV89oQGSgIwKqMBiExc5fom6rQV7Hr269V5XQTqmkT4pn7XwSDPmvDnf4DRGPol/dVEc/b6wODRfxRmC8risXqH2+tcvhdK44G4upuY3QKlCWCs2MfK9IzXB/QM5BUnpg==
Received: from DS7PR06CA0003.namprd06.prod.outlook.com (2603:10b6:8:2a::27) by
 LV8PR22MB5149.namprd22.prod.outlook.com (2603:10b6:408:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 08:36:36 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::d1) by DS7PR06CA0003.outlook.office365.com
 (2603:10b6:8:2a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 08:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 08:36:36 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 510DFD04D5;
	Fri, 10 Oct 2025 11:36:33 +0300 (EEST)
Date: Fri, 10 Oct 2025 11:36:32 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Francesco Lavra <flavra@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Potin Lai <potin.lai.pt@gmail.com>,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	Fabio Estevam <festevam@denx.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: enable latch only on edge-triggered inputs
Message-ID: <aOjFkJEQqRLpngky@zeus>
References: <20251008104309.794273-1-flavra@baylibre.com>
 <CACRpkdYDMRZMb+bDUgK5yiKU1Toy=S_ebo2_4WRasHxCqv+4xw@mail.gmail.com>
 <c75a89f8-9eb7-4300-979e-e11159dc6888@collabora.com>
 <02a02848044c32e78cfc806a3b95c1cb0d93d7fc.camel@baylibre.com>
 <aca89e7d-421f-490f-8c3a-c2d9567dbc26@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aca89e7d-421f-490f-8c3a-c2d9567dbc26@collabora.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|LV8PR22MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbaf445-dd59-4ed9-0e62-08de07d8200c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|30052699003|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0ZvNFY2U2YvM0pZUVhYSVE5MDZHTVR3ZFczQWx5WHJGKzlRUS9OQlJ2ZmRu?=
 =?utf-8?B?cGd5ZVFIQUw4djRZbDVnMVVnRlA5MkhCNmRNR2NYbEM3cy9HaUpud1pvNFE5?=
 =?utf-8?B?LzgvYUhJckRRV28yWkZob0xSeEdEUHpaVVNGZ1ZGWXJlSWpYbGJHVTVSYm5Z?=
 =?utf-8?B?clRYVnE4R0UybUt4T3ozQWFwaEQ1dm5YMzY5UDZTN1ZnZ3NOUHBCMGpSZEs2?=
 =?utf-8?B?aDRmbVp1UnhkQ0JKeTVEV2orS0p1TDNERnkyTXM3anRJQ28wMjl0ZjVIZWMx?=
 =?utf-8?B?Q2FFaWc1NU5TTkwrS3RHbE9zbTNYNFZQUHpZeUJSOUZhM3BDNFhCblRVUkVj?=
 =?utf-8?B?ZlFEekVxQ05kNVJCZUd3d1Z2UE5CV24wYngzQzV4UEhLSEZ5YTRKVnpIRkNv?=
 =?utf-8?B?ME9KNFpBTnp3S2ROWGpkUnp4c3lHMlphNFoycEt6akJERzF0N0s5QXBscHlT?=
 =?utf-8?B?TWozNnV1M2VORHNCTjlJV1dnMG5wclpFQlNNRHN4ME9LRys2K1ZXYXdTTTVq?=
 =?utf-8?B?dkNPZWNMY3oxaE8wZmYwOFQ2bzdiNThUSlNsK1VBeDZkYTNtUFlXdkJqSjh1?=
 =?utf-8?B?aVhCT3lOTk4ybmRoR2IzRG15aWlyWmxRUkowZ2liTHBQamZmekc5R0pUUWpu?=
 =?utf-8?B?MDJWanRDbU5WWElnOUVuT1RaNmtLYWJmVFJLTnc1cVJvTm42Q25nRkhuOEdK?=
 =?utf-8?B?UE5xc3ppVUdCOC9iTm5haGMrbThySHJZZS9FRi9UZlF5dUpvSG5TOVhlenNQ?=
 =?utf-8?B?TmhoeTVVTitYd3l6NkZSTHQyUC9nanJaY0tKZGlyUjBzbEJVTkM2U1FJSmRR?=
 =?utf-8?B?YzN2ZzRsOWFDZWYyTnppTkVFL2NzY3lGZ1BLRHZpd1cvTzErVFdjRWl6UkJt?=
 =?utf-8?B?VEVOcy9KT2drOUdoeCtNcGczTXQ1Q2FnS2x6SDN6U3RXY3gvZXFjT0pJVml2?=
 =?utf-8?B?bmxmUldvZm1iVUsvNFlXM3JWRjA2a2FVTlZqYzNlQ1laK3h4WC9Ob0RyQlNt?=
 =?utf-8?B?QTNkTVEyTU5aS0FGOXdldkk0bTlzeFh2SDYrYWpiejI0c1NJRDJMalRIU0R5?=
 =?utf-8?B?ZDB1d0NMbys4U3k0TE5DUjNGNmpRaXJVTnQzMSs4ZG1PYjVnQ1hMbkNlTklM?=
 =?utf-8?B?QlJpUFJKN1JOK0NibUVWUnBiL0t0WUxETTU3QlYzeGJuNnU4U3FMV2lEUStx?=
 =?utf-8?B?TkhkMDRzbDRjbW45SkZRdm1Oa1hFT1JVZlVSU0JVbHVnYWMybzBISCtvalVN?=
 =?utf-8?B?T04rWGc1K1drM3pXajk0WktiU3djM1hNWWk3TFlRcFpJQ1pzTHJqZEMySm1W?=
 =?utf-8?B?TkM3aHNjNkxFRHZMTjFxTWJqbU56WUFxWVdaYjg5ZFVJaDVBZWFSU3RzY3dX?=
 =?utf-8?B?UnhRMGNVS0FabFcrSndwdnJOcG5JRTZHWkhreU1CYkhNNHczRUFZd3pjMUtl?=
 =?utf-8?B?L3pzZmluSmRSRytlR2RaNko5QUVOc1Q1ZExGRm9tZTRSd0R5NHhrRGhRRHVP?=
 =?utf-8?B?bU1iT2M4VGx6U3JGUlVXK0w4c3YvWXlVVUE4c2hDSXA5R3VTbER2N1cwZCsy?=
 =?utf-8?B?RXdzZVZHTmw1dmRMSGdDVDNPdHN0eWJZejBRRUxDRmF2aUtVenkwNWdjYmVI?=
 =?utf-8?B?bGJZU2xXK0N0ZW8xVG5mNU02WUVaWEh3bkhpaTNMb2tUb2Q2a01sWnE4aUhT?=
 =?utf-8?B?bklZUm82M2pOTFlkRmNJMTNIRS9QaVJQeU1hWklXTXhrVHBjc3JDTk5jazBB?=
 =?utf-8?B?c0JlTWlZc091Sk5RSFJaWjJwSnNvcFc0QUVoTVdqNi9kbWtCSFVBN0o4bjJZ?=
 =?utf-8?B?TTU5ZkhOSGYwU2ZqK1EyVExzVER4L2JKVFNIUW9FU3lmNWF1V2FaWWJlamhz?=
 =?utf-8?B?Q2lCOENwNDJPV2RIT3FXV0ZKcElSOVVDUU5CMlBQU3k2VWNEN0NiYmhudlV3?=
 =?utf-8?B?TlZablpqWlhLQk5ES2tYRHZEaXB0SjdmNU1QL2dCN0FEaEYrUThDU0tRTmVl?=
 =?utf-8?B?ZzR0Z1RjV3d3YzM5S2tMWEJGcDZkdFM3UDczZ1hDWmlpRi9EZWZ0UnAvaFdk?=
 =?utf-8?B?M1RvVFRmTHMwbTJzUzBuOTBmUjVRWnRkUzNQcVVmcmxKZ2xqRDhSN3Vqdnps?=
 =?utf-8?Q?/Mj4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(30052699003)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:36:36.3161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbaf445-dd59-4ed9-0e62-08de07d8200c
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5149

On Thu, Oct 09, 2025 at 11:24:28AM +0100, Martyn Welch wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On 09/10/2025 08:44, Francesco Lavra wrote:
> > On Thu, 2025-10-09 at 08:17 +0100, Martyn Welch wrote:
> >> On 09/10/2025 07:03, Linus Walleij wrote:
> >>> Hi Francesco,
> >>>
> >>> thanks for your patch!
> >>>
> >>> On Wed, Oct 8, 2025 at 12:43 PM Francesco Lavra <flavra@baylibre.com>
> >>> wrote:
> >>>
> >>>
> >>>> The latched input feature of the pca953x GPIO controller is useful
> >>>> when an input is configured to trigger interrupts on rising or
> >>>> falling edges, because it allows retrieving which edge type caused
> >>>> a given interrupt even if the pin state changes again before the
> >>>> interrupt handler has a chance to run. But for level-triggered
> >>>> interrupts, reading the latched input state can cause an active
> >>>> interrupt condition to be missed, e.g. if an active-low signal (for
> >>>> which an IRQ_TYPE_LEVEL_LOW interrupt has been configured) triggers
> >>>> an interrupt when switching to the inactive state, but then becomes
> >>>> active again before the interrupt handler has a chance to run: in
> >>>> this case, if the interrupt handler reads the latched input state,
> >>>> it will wrongly assume that the interrupt is not pending.
> >>>> Fix the above issue by enabling the latch only on edge-triggered
> >>>> inputs, instead of all interrupt-enabled inputs.
> >>>>
> >>>> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> >>>> ---
> >>>>    drivers/gpio/gpio-pca953x.c | 7 +++++--
> >>>>    1 file changed, 5 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-
> >>>> pca953x.c
> >>>> index e80a96f39788..e87ef2c3ff82 100644
> >>>> --- a/drivers/gpio/gpio-pca953x.c
> >>>> +++ b/drivers/gpio/gpio-pca953x.c
> >>>> @@ -761,10 +761,13 @@ static void pca953x_irq_bus_sync_unlock(struct
> >>>> irq_data *d)
> >>>>           int level;
> >>>>
> >>>>           if (chip->driver_data & PCA_PCAL) {
> >>>> +               DECLARE_BITMAP(latched_inputs, MAX_LINE);
> >>>>                   guard(mutex)(&chip->i2c_lock);
> >>>>
> >>>> -               /* Enable latch on interrupt-enabled inputs */
> >>>> -               pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip-
> >>>>> irq_mask);
> >>>> +               /* Enable latch on edge-triggered interrupt-enabled
> >>>> inputs */
> >>>> +               bitmap_or(latched_inputs, chip->irq_trig_fall, chip-
> >>>>> irq_trig_raise, gc->ngpio);
> >>>> +               bitmap_and(latched_inputs, latched_inputs, chip-
> >>>>> irq_mask, gc->ngpio);
> >>>> +               pca953x_write_regs(chip, PCAL953X_IN_LATCH,
> >>>> latched_inputs);
> >>>
> >>> This driver is used by a *lot* of systems and people.
> >>>
> >>> It is maybe the most used GPIO driver in the kernel.
> >>>
> >>> So I added a lot of affected developers to the To: line of
> >>> the mail so we can get a wider review and testing.
> >>>
> >>
> >> I don't have access to the relevant hardware to test this anymore and
> >> it's been a while since I thought much about edge vs. level triggered
> >> interrupts. But if the state of the interrupt is unilaterally returning
> >> to an inactive state, it sounds like that should be configured as an
> >> edge triggered interrupt, not a level triggered one...
> >
> > I will try to better describe the problematic scenario:
> > - a device has an IRQ line that becomes active when the device needs to be
> > serviced, and becomes inactive when the device has been serviced (e.g. by
> > reading a status register); this is the classic use case for level-
> > triggered interrupts
> > - the IRQ line of this device is connected to a pca953x input, and this
> > input is configured as a level-triggered interrupt
> > - the device IRQ line becomes active, this triggers an interrupt in the
> > pca953x, the pca953x interrupt handler is invoked, it reads the input
> > state, then calls the nested interrupt handler
> > - the nested interrupt handler services the device, which causes the IRQ
> > line to become inactive: this triggers a second interrupt in the pca953x
> > - before the pca953x interrupt handler is invoked for the second time, the
> > device IRQ line becomes active again
> > - the pca953x interrupt handler is invoked, it reads the input state, which
> > shows the line as inactive (because that is the state that triggered the
> > second interrupt), and as a result the nested interrupt handler is not
> > invoked, and the device will stay forever with the interrupt line asserted
> >
> > With my proposed change, in the last step above the pca953x interrupt
> > handler will read the current input state instead of the state that caused
> > the second interrupt, and thus will correctly invoke the nested interrupt
> > handler for the second time.
> 
> Thanks for the detail Francesco.
> 
> To me it seems that the latching is more or less required in the edge
> triggered case because, as the hardware manual for the PCAL6408A at
> least states:
> 
>      When an input latch register bit is 0, the corresponding input pin
>      state is not latched...    ...If the input goes back to its initial
>      logic state before the Input port register is read, then the
>      interrupt is cleared.
> 
> So the hardware doesn't retain which bits triggered the interrupt
> without the latching.
> 
> For level based interrupts I think you're right and it doesn't make
> sense to latch the value.
> 
> This change seems sensible to me.
> 
> Reviewed-by: Martyn Welch <martyn.welch@collabora.com>

Makes sense to me.

(Untested as the hardware I have access to does not use the IRQ
line.)

Reviewed-by: Ian Ray <ian.ray@gehealthcare.com>

