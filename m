Return-Path: <linux-gpio+bounces-10384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A497EC01
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 15:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B47BB21B47
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 13:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E921990B5;
	Mon, 23 Sep 2024 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m8QL4xNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63A21953A2;
	Mon, 23 Sep 2024 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727096735; cv=none; b=B7PNMjHOU2MlRhHygATaE4KKuAMIptRA/mgQXPGTiSV4WFpujSPZCXELP96GtfORmmcfztynEkm4LYUKrQd2dTvdvYZZ119tOEit++lakQEwFPFnYEY1B1DaOjQNrJUY0LAhZI50up0yr5TOGY/da7bcDhkhxFjYxXMfc3yiSVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727096735; c=relaxed/simple;
	bh=meekL5zD9+/6PQV2CmuWOotauS+bNeLzgG4BtQ5Fv90=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtYca/1yCIYS57BJ3nv66Esp26by6xBfcutenkJztXhtkKLsKfB9y0WjFJwAZBQdJSVB/bIlh8i5mcE/PDlMusSeXxyFnMgC7Pmn9Qci5lFGOHtmNDiWDt1dpTSYcraBirOsPW+brxAn687ScMxxtYK1Qx7uydNWfy+/8J7U9iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m8QL4xNd; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D2CD1BF204;
	Mon, 23 Sep 2024 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727096723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeI4tNziRNKT4XSSBsHgctudkzya8tkzP+xhzWFTNaI=;
	b=m8QL4xNdswVqiFo19vk+J12JjEpdhaQKihSAkDJH3XnCJC2wOcScSWfxDxdO37aiCO6AUD
	hGdjmO1CPWETCixTqFaOzeamZ55NQZ9aQ1klJH8UJLa1WEzxoFVS3Hq6ZDW8VOxMtKfDMq
	Hx02WnJNCly+VOObW+BQJhm3frJ6ESbkOghFSeQs29WWtivPqeq5paU3vYAcuequ96Hvx6
	2ii8T/mfSussGfe27oPVgCkqWt756hWf1DWZHewssuWO/O4zsGkTfSndrMRYt9vpXHUkBL
	x82ZVSPYGpGlw6ELSAokOiKku0Q6x8E50i7RRWHrYhAW+t/FY1SA7jdkA9AtJA==
Date: Mon, 23 Sep 2024 15:05:22 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/2] gpio-cdev: Release IRQ used by gpio-cdev on gpio
 chip removal
Message-ID: <20240923150522.66b418d1@bootlin.com>
In-Reply-To: <20240227113426.253232-1-herve.codina@bootlin.com>
References: <20240227113426.253232-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi,

On Tue, 27 Feb 2024 12:34:23 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> When a gpio chip device is removed while some related gpio are used by
> the user-space (gpiomon for instance), the following warning can appear:
>   remove_proc_entry: removing non-empty directory 'irq/233', leaking at least 'gpiomon'
>   WARNING: CPU: 2 PID: 72 at fs/proc/generic.c:717 remove_proc_entry+0x190/0x19c
>   ...
>   Call trace:
>     remove_proc_entry+0x190/0x19c
>     unregister_irq_proc+0xd0/0x104
>     free_desc+0x4c/0xc4
>     irq_free_descs+0x6c/0x90
>     irq_dispose_mapping+0x104/0x14c
>     gpiochip_irqchip_remove+0xcc/0x1a4
>     gpiochip_remove+0x48/0x100
>   ...
> 
> Indeed, even if the gpio removal is notified to the gpio-cdev, the
> IRQ used is not released when it should be.
> 
> This series calls the gpio removal notifier sooner in the removal
> process in order to give a chance to a notifier function to release
> the IRQ before releasing the IRQ mapping and adds the needed
> operations to release the IRQ in the gpio cdev notifier function.
> 

This series is obsolete.
The issue is fixed by the following Bartosz's patch:
  https://lore.kernel.org/lkml/20240919135104.3583-1-brgl@bgdev.pl/

Best regards,
Hervé


