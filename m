Return-Path: <linux-gpio+bounces-11009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F6993E8F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 08:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE84B1C22A82
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 06:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA861419A9;
	Tue,  8 Oct 2024 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Um5WrAkA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.149.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C6813D250;
	Tue,  8 Oct 2024 06:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728367356; cv=none; b=Q654oAfDhddGIIsEdYboEtbWW4uzvFypitEYPfFNefmwIMFZ3LecJh2QB4YhTsJN+vCsu7biDDBhE20N8pjflplYGzCAmtw4nyfFjRpUoGoyArsfRzXrBbmRNKJDSuVGmYF89WHjGqHufJj15RYJCfk1Gv3ZaIkxrccKVZ92fNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728367356; c=relaxed/simple;
	bh=SBIkhXRb+howfpCEH6gtSLdYH169fnh6Q1siVLjUwFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5Le2AFKQ6fbrpksKsV26fcc1XPwZ4ZEFXwkjhBqobMKqdF9iCgUuOOS6CE+VH4AdaOM2ORKZ8m70QBPow/636zB2olEG+WrphIrRwd7c9washofG/Ft14aEFfowJ6Tk+gb3S46O+iHKxpehQasfNrMPbytc9qIIsLjaNmfV9Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Um5WrAkA; arc=none smtp.client-ip=67.231.149.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Received: from pps.filterd (m0048275.ppops.net [127.0.0.1])
	by m0048275.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 4985QSsT003436;
	Tue, 8 Oct 2024 02:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=outbound; bh=1
	yGYyZ0+jiHSQO3Sl+l3tqeTZCwx6SdYlckmINxiIeM=; b=Um5WrAkAybysE9oX/
	+WALkhTrIVQXoel4ZxDtWQpMM5HrzKHnYW5Cncl6aLeOumP91XSTfrYrx+QThmMf
	2uVU3Lyx1OId4ODdMeHXsntBwA6BVLreIHwJkkCRo0wGj65M/mSZ+lnuVX8rhv8H
	RsMsNEpu1upVDBXvf21hZjWn4W47XhTtQGgzKeVof1DDILRXcW7QvecUBcHOWoH/
	Viv/goRxnxJpW5Soycw95NYcT3sQFurbg7CCMpS4R9C+uCi5bIiVqN0oR9D7yfGW
	sCbwuKI4u7WcqqK0xqtkGpWylnX5eeuHRzbkO1I9dGmjIa/QHYzAs9bygaXbNGq6
	DYKkQ==
Date: Tue, 8 Oct 2024 09:02:12 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Message-ID: <ZwTK5Jip2YJrSd8L@f642ec5a18a7>
References: <20240620042915.2173-1-ian.ray@gehealthcare.com>
 <ce0ac1bfe2fb54feb10dc06827091caea57b7a19.camel@suse.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce0ac1bfe2fb54feb10dc06827091caea57b7a19.camel@suse.de>
X-Proofpoint-ORIG-GUID: 2W3k1kxgcy8b0iXnZUQ7_EgqndcIVagC
X-Proofpoint-GUID: 2W3k1kxgcy8b0iXnZUQ7_EgqndcIVagC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_04,2024-10-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410080038

On Mon, Oct 07, 2024 at 11:16:51PM +0200, Jean Delvare wrote:
> Hi Ray,
> 
> On Thu, 2024-06-20 at 07:29 +0300, Ian Ray wrote:
> > Ensure that `i2c_lock' is held when setting interrupt latch and mask in
> > pca953x_irq_bus_sync_unlock() in order to avoid races.
> >
> > The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
> > lock is held before calling pca953x_write_regs().
> >
> > The problem occurred when a request raced against irq_bus_sync_unlock()
> > approximately once per thousand reboots on an i.MX8MP based system.
> >
> >  * Normal case
> >
> >    0-0022: write register AI|3a {03,02,00,00,01} Input latch P0
> >    0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
> >    0-0022: write register AI|08 {ff,00,00,00,00} Output P3
> >    0-0022: write register AI|12 {fc,00,00,00,00} Config P3
> >
> >  * Race case
> >
> >    0-0022: write register AI|08 {ff,00,00,00,00} Output P3
> >    0-0022: write register AI|08 {03,02,00,00,01} *** Wrong register ***
> >    0-0022: write register AI|12 {fc,00,00,00,00} Config P3
> >    0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
> >
> 
> I have more questions on this. Where does the above log come from?
> Specifically, at which layer (bus driver, regmap, gpio device drier)?

Additional debug, with manually added commentary (sorry for not being
clearer).  The debug was added to drivers/base/regmap/regmap-i2c.c while
investigating the issue.

> What do these values represent exactly? Which GPIO chip was used on
> your system? Which i2c bus driver is being used on that system? What
> are the "requests" you mention in the description above?

GPIO expander pi4ioe5v6534q at I2C address 0-0022.

# grep . {name,uevent}
name:30a20000.i2c
uevent:OF_NAME=i2c
uevent:OF_FULLNAME=/soc@0/bus@30800000/i2c@30a20000
uevent:OF_COMPATIBLE_0=fsl,imx8mp-i2c
uevent:OF_COMPATIBLE_1=fsl,imx21-i2c
uevent:OF_COMPATIBLE_N=2
uevent:OF_ALIAS_0=i2c0

> 
> I'm asking because I do not understand how writing to the wrong
> register can happen, even without holding i2c_lock in
> pca953x_irq_bus_sync_unlock(). The i2c layer has a per-i2c_adapter lock

Given that pca953x_irq_bus_sync_unlock is part of an interrupt handler,
IMHO this explains very well why locking is needed (but I did not dig
deeper than that).

> which is taken before any bus transfer, so it isn't possible that two
> transfers collide at the bus level. So the lack of locking at the
> device driver level could lead to data corruption (for example read-
> modify-write cycles overlapping), but not to data being written to the
> wrong register.

Based on the observed data, the hypothesis was that pca953x_write_regs
(called via pca953x_gpio_set_multiple) and pca953x_irq_bus_sync_unlock
can race.

The missing guard neatly explained and fixed the issue (disclaimer: on
my hardware for my scenario).

> 
> As a side note, I dug through the history of the gpio-pca953x driver
> and found that i2c_lock was introduced before the driver was converted
> to regmap by:
> 
> commit 6e20fb18054c179d7e64c0af43d855b9310a3394
> Author: Roland Stigge
> Date:   Thu Feb 10 15:01:23 2011 -0800
> 
>     drivers/gpio/pca953x.c: add a mutex to fix race condition
> 
> The fix added locking around read-modify-write cycles (which was indeed
> needed) and also around simple register reads (which I don't think was
> needed).
> 
> It turns out that regmap has its own protection around read-modify-
> write cycles (see regmap_update_bits_base) so I think several uses of
> i2c_lock should have been removed from the gpio-pca953x driver when it
> was converted to regmap as they became redundant then. This driver-side
> lock is still needed in a number of functions though, where the read-
> modify-write is handled outside of regmap (for example in
> pca953x_gpio_set_multiple).
> 

Blue skies,
Ian


> Thanks,
> --
> Jean Delvare
> SUSE L3 Support

