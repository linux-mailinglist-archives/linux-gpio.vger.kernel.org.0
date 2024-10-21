Return-Path: <linux-gpio+bounces-11712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 351669A5E78
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 10:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE49B1F234AC
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 08:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC491E1059;
	Mon, 21 Oct 2024 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="IJFUSQsI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1055B1E1C39;
	Mon, 21 Oct 2024 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498823; cv=fail; b=S27CV2I0nTX1BIYcTQ6R9D9PjuHV/YYJzKBQ4XQPfriFInuAZ86W7BAS+vMOOgwG/0fJQBaChmE0/vrhWp6khhLVxWBKZ1Asyol7FEVjzeFMRERH6kge/ixzQJVcfymL0zwpxkH+BwVRGCqnxGq+N13kXZeonQvkHGCE0t2Bzco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498823; c=relaxed/simple;
	bh=ypzwJD+R020L9ke/wEgrf3AB6ZQMNBYCyRGwz4454YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcuWmS50yNtOxzpD5Pj39z/5OMP4z6ct2ApHNA5ApGIKUfopq49v38lAKuV1F6ltrY4TFH+R3fU6SuYTklQ4Ut2AiaBVEe7AVT7oDuf6m1DJtnmsWSxuH0rB6a+9eWqO3762OaY2pGz4MOElmcz4zv4w4Oi/0R0T6Z32yoAm2Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=IJFUSQsI; arc=fail smtp.client-ip=40.107.244.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdzrUtDRLzTl3NSq4NbJuXFc0sW5caJcwACM6P7BBUUYmkeg+fos6NA3mXrCO8GjCdq6ZZG4mgOlBZVOjsgG1dTkNUaR/iw6F7cuXkz5h2Bf1s7if3BTcgCeOr6Qjzws2WpAUgQQ58dQYIikBHpTq4h+sjy8fc/Y74T1IZqLP2j2zFUTU41Xsxd08W6rRikseSgHame3q9bkDoM7CTuNFt2q5eNs2Uus683iP3S39UqZb4PLZBo0M5OaBvlaCsh7hgVX4wcg73iGoa7Man0EpFkBvmz516biw34gP5Wgs9sEoiUFc/lTRTfL5Bra70+Ni6GFehRR+/YLcndbBvdCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prAtZWOoux0soeWaIrE6FDfqAkD7EuolHFZuMk1GthM=;
 b=gzTjiej5+cbfomky1I+y4UfCilXg43dtCoYzmjXv5bPJO8P8ALTnVwIZfrKXVvC+iRb865jZxdK9T0oWjXNIj82wZuQWlJ1FKEUz4x3sJ4/EYXKeTOvft6HyZtMuf332xwalb8wK+NLqiLAYkTiHR0Xl3rODPdIuXEljlvBzEtER38X2Fw2hpO11ZLflFVroTl+ibMJA4Obcinwu8Z4Hjit9VQwkM0EmOhG2R0uLw/rJ84h7qFqGjEu1DhS2jEO5aojPjvw5u6rF9sO3E55P0r6fcY26CU7bns13gKtqzZkgjeTK599mXTGYiN8C4EqB/NYSL7krhx5uNvuH4sK8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prAtZWOoux0soeWaIrE6FDfqAkD7EuolHFZuMk1GthM=;
 b=IJFUSQsIH2ZxtUI09J0reomZoQg4shAFxqG8Ax1bkK+BLIk0OTKkmQrKCEZ9az9VpTFXGfKQ8878HHlfdMThr9zX/Qty2pSb0wS4kG1EfHiyMxpN9/+ykOrmB09+m0ttImVcYPIynL4jzEZ6eYdq17AcY9AVuVuofvi/8YXe5IF2rGt99nak3H7EV3ybaBN3LA+fLF+c2MSmqbhbbXPO+ORAvDkwMRCu914Gu7EIuThrNwFyX0wp6nVy4ptrEwepzfqtMZEsuC68zyoqpSKIGzBhOf4qeCgLnYKZPol47gDruy7Lgga6gSot4sx3zrohoM2apwgXsfVKG7Q6aTtw0w==
Received: from SA0PR11CA0205.namprd11.prod.outlook.com (2603:10b6:806:1bc::30)
 by LV8PR22MB5699.namprd22.prod.outlook.com (2603:10b6:408:267::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 08:20:17 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::25) by SA0PR11CA0205.outlook.office365.com
 (2603:10b6:806:1bc::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 08:20:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 08:20:17 +0000
Received: from f642ec5a18a7 (unknown [10.168.174.111])
	by builder1.em.health.ge.com (Postfix) with SMTP id 6D0331A2DF;
	Mon, 21 Oct 2024 11:20:15 +0300 (EEST)
Date: Mon, 21 Oct 2024 11:20:15 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Message-ID: <ZxYOv67foIw78NrW@f642ec5a18a7>
References: <20240620042915.2173-1-ian.ray@gehealthcare.com>
 <ce0ac1bfe2fb54feb10dc06827091caea57b7a19.camel@suse.de>
 <ZwTK5Jip2YJrSd8L@f642ec5a18a7>
 <4f8b6f2d57abc5ea4ba1e755bac31d3fa3dc2e55.camel@suse.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f8b6f2d57abc5ea4ba1e755bac31d3fa3dc2e55.camel@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|LV8PR22MB5699:EE_
X-MS-Office365-Filtering-Correlation-Id: 7084ec84-f48d-4b4e-d432-08dcf1a9326d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fqMASU4mNbJVpvYdhVMPPo1smXkFR+EEikwM0AvIw+9idfXXPyCS6kdX+4CC?=
 =?us-ascii?Q?25NZPFiQkh0/SpfuiHfI3EOJnOeTBjQhnIUnyE1f8Inmc9az2u2C7oChpkN5?=
 =?us-ascii?Q?CSEHtY4Rjgh776jxeSzZGeOxqHMEIdavceZEv2iKN32jOBm35qf7KKbndIFT?=
 =?us-ascii?Q?wOnRNSUp+nmeU+kbJHTl70Ax/eEe3ExKIsaJpbyNOclQ/btAAh0VLJVYTzLA?=
 =?us-ascii?Q?gjZda7+nHAiD+DQbSQx7H3MkeajufdeZysAb9ngR8o9wohrc2k/P7E03PACj?=
 =?us-ascii?Q?Rr6YxLoChO3phuBBFDS55g5mPK7drAgvZrYMVrJT8TYdDIWDL66Zsh2WNOnW?=
 =?us-ascii?Q?XUaOXEUJtiUVPX2ojasDq8YzLD6N2EaGZsbJe/QT/yA8i6YaZitPwehy1Gtf?=
 =?us-ascii?Q?5MypHj01CEbh12kMpJ+Im43QDVXUmigmSkwlhPPQpNnmEyG8HgjLN/7M/fQv?=
 =?us-ascii?Q?X+8SmEfIw7kUHcVZUraoxMqpRSg0s6cB2mweYBJeXDvypjRBo6rXA84u/dyn?=
 =?us-ascii?Q?6tcJc1y1E5Th+SbLPIxpDuaTKLnV/WcK4bXXBgz9/OlmMZJAbl5II62x+ZiQ?=
 =?us-ascii?Q?vCwlWQ3anPFTmZVXliVqd7L63pwDOrosp/ssUBc47VFfuS0dI7d6X1/7Yh1b?=
 =?us-ascii?Q?vNRy2FfI+zFifLm6/nYa2fYHQYZsO7xWjEMaDFKucaQx8MnoJ/xyZ2Y21pob?=
 =?us-ascii?Q?yHMqc7tPqgM2UKRI6FpkoLT5f9rAOixvP18U5OOa+FUDIMYbKbvmZPQzQONr?=
 =?us-ascii?Q?D7XkdtPIixRCCxi7cbo18Jgq9CAUpjZCe0B1BBg4Kho836rZCGj4zDA2cQqL?=
 =?us-ascii?Q?p3YL/R6oQxzk0xYyTJjVIUbdBGS5E0SznPvswr/IjWp6ZJFoc6v+7kH1VjwN?=
 =?us-ascii?Q?9AwJmrwq3yXwWliecO0Koi0u3BdZaZ7SqgLYlJ5wzC2WZb31gxSegUA8do+N?=
 =?us-ascii?Q?+2F750BMWWgRBnttABZU9Ad07bEuerJ9DvRP/RW6gWIknphwiww9Bjx8JB+C?=
 =?us-ascii?Q?XOw5xJKkXswunBwpgPhmXv7qwfZHJGXOTWyzdU10IAC1mDp1TQ93bk4zxAzN?=
 =?us-ascii?Q?HuB4G1QPfDXHwRzi6Hrrm4+iU2fUWULL3MB0OmHIRk3dR6NdESfx5FRLeINi?=
 =?us-ascii?Q?IKQJprWgkBss1H2UyQD2D6+owoD09Zn5gQBJzVuwcFCXDolOoi3NKECf2A4+?=
 =?us-ascii?Q?IYszNninHmdJ3+WY5Xh8f+HMRGOQPT9QEVVO4peIrPN1U4MofNwv/LwtGVY2?=
 =?us-ascii?Q?j0MuWGqUeUpuo3aFIueTysEcSRPXMdAR13lw5F/jxk/t1erwHCVc/YwvDb36?=
 =?us-ascii?Q?jE++9P+znBIrtteFAo7i9DUI9AilUvzaJ5fLOIiaJIM4bQXE+bexLkW7pACZ?=
 =?us-ascii?Q?b6fPZ1SNAKI0HOe+SW7vl0k+iUVQ9AJ+fxDWLXryyf/8QFwUKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 08:20:17.4937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7084ec84-f48d-4b4e-d432-08dcf1a9326d
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5699

On Fri, Oct 18, 2024 at 11:26:54AM +0200, Jean Delvare wrote:
> Hi Ray,
> 
> Sorry for the delay.
> 
> On Tue, 2024-10-08 at 09:02 +0300, Ian Ray wrote:
> > On Mon, Oct 07, 2024 at 11:16:51PM +0200, Jean Delvare wrote:
> > > On Thu, 2024-06-20 at 07:29 +0300, Ian Ray wrote:
> > > > Ensure that `i2c_lock' is held when setting interrupt latch and mask in
> > > > pca953x_irq_bus_sync_unlock() in order to avoid races.
> > > >
> > > > The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
> > > > lock is held before calling pca953x_write_regs().
> > > >
> > > > The problem occurred when a request raced against irq_bus_sync_unlock()
> > > > approximately once per thousand reboots on an i.MX8MP based system.
> > > >
> > > >  * Normal case
> > > >
> > > >    0-0022: write register AI|3a {03,02,00,00,01} Input latch P0
> > > >    0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
> > > >    0-0022: write register AI|08 {ff,00,00,00,00} Output P3
> > > >    0-0022: write register AI|12 {fc,00,00,00,00} Config P3
> > > >
> > > >  * Race case
> > > >
> > > >    0-0022: write register AI|08 {ff,00,00,00,00} Output P3
> > > >    0-0022: write register AI|08 {03,02,00,00,01} *** Wrong register ***
> > > >    0-0022: write register AI|12 {fc,00,00,00,00} Config P3
> > > >    0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
> > > >
> > >
> > > I have more questions on this. Where does the above log come from?
> > > Specifically, at which layer (bus driver, regmap, gpio device drier)?
> >
> > Additional debug, with manually added commentary (sorry for not being
> > clearer).  The debug was added to drivers/base/regmap/regmap-i2c.c while
> > investigating the issue.
> 
> FWIW, I think regmap includes a tracing facility which may have served
> you. Specifically, I see calls to trace_regmap_hw_write_start() and
> trace_regmap_hw_write_done() in _regmap_raw_write_impl(). But I must
> confess I couldn't find where these functions are defined nor how to
> enable tracing...

Interesting, thank you!

> 
> > > What do these values represent exactly? Which GPIO chip was used on
> > > your system? Which i2c bus driver is being used on that system? What
> > > are the "requests" you mention in the description above?
> >
> > GPIO expander pi4ioe5v6534q at I2C address 0-0022.
> 
> This device model doesn't seem to be explicitly supported by driver
> gpio-pca953x. I see it listed as compatible in
> Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml but not in the
> driver's pca953x_dt_ids. Out of curiosity, did you have to add it
> manually? I admit I'm not familiar with these device tree node
> declarations.
> 
> > # grep . {name,uevent}
> > name:30a20000.i2c
> > uevent:OF_NAME=i2c
> > uevent:OF_FULLNAME=/soc@0/bus@30800000/i2c@30a20000
> > uevent:OF_COMPATIBLE_0=fsl,imx8mp-i2c
> > uevent:OF_COMPATIBLE_1=fsl,imx21-i2c
> > uevent:OF_COMPATIBLE_N=2
> > uevent:OF_ALIAS_0=i2c0
> 
> OK, so the underlying I2C master is capable of writing to multiple
> registers at once. This helped me follow the code flow while trying to
> figure out where the race was.
> 
> > > I'm asking because I do not understand how writing to the wrong
> > > register can happen, even without holding i2c_lock in
> > > pca953x_irq_bus_sync_unlock(). The i2c layer has a per-i2c_adapter lock
> >
> > Given that pca953x_irq_bus_sync_unlock is part of an interrupt handler,
> > IMHO this explains very well why locking is needed (but I did not dig
> > deeper than that).
> 
> I took the time to dig deeper, my conclusions are below.
> 
> > > which is taken before any bus transfer, so it isn't possible that two
> > > transfers collide at the bus level. So the lack of locking at the
> > > device driver level could lead to data corruption (for example read-
> > > modify-write cycles overlapping), but not to data being written to the
> > > wrong register.
> >
> > Based on the observed data, the hypothesis was that pca953x_write_regs
> > (called via pca953x_gpio_set_multiple) and pca953x_irq_bus_sync_unlock
> > can race.
> >
> > The missing guard neatly explained and fixed the issue (disclaimer: on
> > my hardware for my scenario).
> >
> > > As a side note, I dug through the history of the gpio-pca953x driver
> > > and found that i2c_lock was introduced before the driver was converted
> > > to regmap by:
> > >
> > > commit 6e20fb18054c179d7e64c0af43d855b9310a3394
> > > Author: Roland Stigge
> > > Date:   Thu Feb 10 15:01:23 2011 -0800
> > >
> > >     drivers/gpio/pca953x.c: add a mutex to fix race condition
> > >
> > > The fix added locking around read-modify-write cycles (which was indeed
> > > needed) and also around simple register reads (which I don't think was
> > > needed).
> > >
> > > It turns out that regmap has its own protection around read-modify-
> > > write cycles (see regmap_update_bits_base) so I think several uses of
> > > i2c_lock should have been removed from the gpio-pca953x driver when it
> > > was converted to regmap as they became redundant then.
> 
> I have to correct myself here. The regmap layer implements its own,
> configurable and *optional* protection lock. It turns out that the
> gpio-pca953x driver has it disabled:
> 
> static const struct regmap_config pca953x_i2c_regmap = {
>         (...)
>         .disable_locking = true,
>         (...)
> };
> 
> So it is expected and very needed that the gpio-pca953x driver
> implements its own lock to protect against races whenever the hardware
> is accessed.
> 
> > > This driver-side
> > > lock is still needed in a number of functions though, where the read-
> > > modify-write is handled outside of regmap (for example in
> > > pca953x_gpio_set_multiple).
> 
> After reading the regmap code (which took me some time as I wasn't
> familiar at all with it, I didn't know what I was looking for exactly
> and I wanted to make sure I wasn't missing something along the way), I
> think I understand what was racing exactly.
> 
> The gpio-pca953x driver uses regmap_bulk_write() which is implemented
> by _regmap_raw_write_impl(). The register map uses an internal buffer
> to prepare the actual hardware transfers:
> 
> struct regmap *__regmap_init(...) {
>         (...)
>         map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
>         (...)
> }
> 
> This work buffer has space for both the register address and the values
> to be written to or read from the device:
> 
>         map->format.buf_size = DIV_ROUND_UP(config->reg_bits +
>                         config->val_bits + config->pad_bits, 8);
> 
> During a regmap raw write, the register address is written to the first
> byte of the work buffer:
> 
>         map->format.format_reg(map->work_buf, reg, map->reg_shift);
> 
> where map->format.format_reg() is regmap_format_8() for the gpio-
> pca953x driver:
> 
> static void regmap_format_8(void *buf, unsigned int val, unsigned int shift)
> {
>         u8 *b = buf;
> 
>         b[0] = val << shift;
> }
> 
> If _regmap_raw_write_impl() is called concurrently without proper
> locking then the contents of the work buffer may be overwritten by the
> second caller before the first caller had a chance to use it. I think
> this matches your debug log of the race case pretty well.
> 
> I checked the regmap implementation for other use cases of map-
> >format.format_reg(map->work_buf, ...) and found it is being used in
> _regmap_raw_read(), so I had to investigate further, because
> pca953x_irq_bus_sync_unlock() also calls pca953x_read_regs(..., chip-
> >regs->direction, ...) which in turn calls regmap_bulk_read().
> 
> For volatile registers, this function will call regmap_raw_read() which
> reads the values from the hardware most of the time. However, for non-
> volatile registers, _regmap_bulk_read() is being called instead, which
> is implemented by _regmap_read() which reads from the regmap cache. As
> it turns out that the direction registers are not volatile and are read
> first as part of pca953x_irq_setup(), the values will always be
> available from the cache when read from pca953x_irq_bus_sync_unlock(),
> so no hardware access will happen and the internal work buffer won't be
> used.
> 
> Therefore my conclusion is that your fix was needed, is correct and is
> sufficient. My initial concern about the unprotected
> pca953x_read_regs() call in pca953x_irq_bus_sync_unlock() was
> incorrect. Sorry for the noise.

No noise, this was a really interesting study, and a good learning
experience for me.  Thank you for this.

Blue skies,
Ian


> 
> --
> Jean Delvare
> SUSE L3 Support

