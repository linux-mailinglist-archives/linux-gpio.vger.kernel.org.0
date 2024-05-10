Return-Path: <linux-gpio+bounces-6298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 754848C27EC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 17:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF377286B82
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 15:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABEB171647;
	Fri, 10 May 2024 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJpfdeW2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E22412D219;
	Fri, 10 May 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355396; cv=none; b=pqhsQYKl8CpVMYdtg87T+dFTopuubTSRXmIJUCjF5AoJiOfSBtHwVFfJ6Y+1RL+9uV3vxhIoyjfEaGBL+JKbbpmOF9HZwdEICpZdS5IskIaJ7c9MOILHtOlXBU9AykYNMwmNRbg86++ntkKwigeaOYVI7Gwk+RGwcAVMJMBg6X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355396; c=relaxed/simple;
	bh=jusqEtCH2MeZgBnEZ4naprhjSbb5YN3aQHvO10Zh+k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4cghKqpZq+Wrc94yDRXT4C/qvzGuk9nTrE19rrk/O0kaiOSCuAd/MYl/csnQuRST11B31//KdjbLCtsPSGXFC22I/Od9CQevGRELDIDcVSEsaKsahyCWUsGImDvp9nwzDSJD4bhUjsWRq+1jwvyiIVmLumYzADXLBMLw722P0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJpfdeW2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2ACBC113CC;
	Fri, 10 May 2024 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715355395;
	bh=jusqEtCH2MeZgBnEZ4naprhjSbb5YN3aQHvO10Zh+k0=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=qJpfdeW2AR0DRk1zbhAnDwFQmgaTBReSjzj2nf4221jqJAMMS0Hgk4XEGYzkmlFEj
	 1bhf/LQupGMX6MSYcse8pedAXMfRpwANjiS6YBKZhM4kUOj/M59Wz5KKUNuj5dcSL4
	 zU2oYWCCYbzYpnyubfwAmve1R5l0JbbPVVF2quUlm1ORnVSidSpMB97d/UcKpUfA7D
	 foJqU6stmbb6S1Nb4Kb2y489oZU6qmpimoedrVikBMYP8vf1QkXm4S5uT+GfwKgrDG
	 DNsBXeI6DpQ+ETxSryRUwCxeOuQvGaZCmsYVkTGGwYUu9qFydRSmb1fHXXj1XqgzJD
	 I5bA0S6mAuhFg==
Date: Fri, 10 May 2024 17:36:29 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v10 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240510153629.bd3gkfm4he2rybui@kandell>
References: <20240510101819.13551-1-kabel@kernel.org>
 <20240510101819.13551-3-kabel@kernel.org>
 <CAHp75VfdSqRbhek3eCPtdPtrv2FJyhpG0XvKFMfT9yrDsCjY2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfdSqRbhek3eCPtdPtrv2FJyhpG0XvKFMfT9yrDsCjY2Q@mail.gmail.com>

On Fri, May 10, 2024 at 04:41:20PM +0300, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 1:18 PM Marek Behún <kabel@kernel.org> wrote:
> >
> > Add the basic skeleton for a new platform driver for the microcontroller
> > found on the Turris Omnia board.
> 
> ...
> 
> > +       err = omnia_cmd_read(client, cmd, &reply, sizeof(reply));
> > +       if (!err)
> > +               *dst = le32_to_cpu(reply);
> > +
> > +       return err;
> 
> Introduced here and "fixed" in the next patch. Something wrong with
> rebasing / squashing?
> 
> You will need a v11 anyway. And you have now much more time for it,
> don't forget to update the kernel version and date in the ABI
> documentation.

It would seem so. I will send v11 also with the GPIO changes (to use
__set_bit() and friends).

Marek

