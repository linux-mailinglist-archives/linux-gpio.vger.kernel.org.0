Return-Path: <linux-gpio+bounces-17494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FBDA5DB86
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 12:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74DCD17858E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 11:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9122E23F394;
	Wed, 12 Mar 2025 11:29:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88AB23F38C;
	Wed, 12 Mar 2025 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778940; cv=none; b=KzfvP8mBmbTfPEmh9OqNzZhjLlgSbuelj+1gsu4OORRWzdGQm2ZNqkpjJdt9QvHObpdq/0kyc97KRSh6Trg3RJvri1ozHPf8QIwRiJBbL4bvsFqYoCT4j1I5XAlWpzVVH9hY6IQBqk5S3j7Ab7aEdq564ZJcqoisnqxb+hBwh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778940; c=relaxed/simple;
	bh=X5+GB3yUeu0AMb3m1p/GP6GJgAjCm9u72uZGthp/DlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+i8CYa7TpQ3ZLNs5AKBpKP/BCGxuFGr+SS1czHQEYOcZdR39pR5fv7bWjKGTlWrcKzTssFaI4ugvLZpOsSYXRYIcEsZqlNV+Bv+rZxcVKi4OnXeinQmEpob3Vmmm56NQuCnkx+rar5tDf38A3scevLIbm/SchQzGejxKigxM/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25A46152B;
	Wed, 12 Mar 2025 04:29:09 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 962C83F694;
	Wed, 12 Mar 2025 04:28:55 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:28:52 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z9Fv9JPdF5OWUHfk@bogus>
References: <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9FnZzBQuZ1j5k3I@bogus>

On Wed, Mar 12, 2025 at 10:52:23AM +0000, Sudeep Holla wrote:
> On Tue, Mar 11, 2025 at 11:23:12AM +0000, Sudeep Holla wrote:
> > On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
> > >
> > > So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
> > > created earlier and when device_add, the below logic makes the fwnode pointer points
> > > to scmi cpufreq device.
> > >         if (dev->fwnode && !dev->fwnode->dev) {
> > >                 dev->fwnode->dev = dev;
> > >                 fw_devlink_link_device(dev);
> > >         }
> > >
> >
> > Thanks, looks like simple way to reproduce the issue. I will give it a try.
> >
> 
> I could reproduce but none of my solution solved the problem completely
> or properly. And I don't like the DT proposal you came up with. I am
> not inclined to just drop this fwnode setting in the scmi devices and
> just use of_node.
>

Sorry for the typo that changes the meaning: s/not/now

I meant "I am now inclined ..", until we figure out a way to make this
work with devlinks properly.

-- 
Regards,
Sudeep

