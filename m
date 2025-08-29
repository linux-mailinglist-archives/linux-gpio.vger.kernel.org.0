Return-Path: <linux-gpio+bounces-25202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771FB3BE67
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 16:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBE895848BF
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 14:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9980322DA9;
	Fri, 29 Aug 2025 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBWlsPsR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91C7322DBA
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478667; cv=none; b=DwxGIWAavtfDTwiJjer2LnNDsBHvQWQ+fBZ5utg2CM1gnok8uE4hmB6zLuTIjmIz4cUg/aj64SWAQ0NJgcDJhs7xCkIGZkl1x9z3dG761CSAIyNj0TA/AUWkHaq1SYoJXsXjD8BapIOJmQC8RJhA95yNrgmaxI3aorchjtV68Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478667; c=relaxed/simple;
	bh=KZPlYUe+o6QHf5RBQeW7oNZlHwAnXFJ/WayhGTcCMZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MB2WAHuL1nwgHFlyU4Mf8K4ujnk3HljxSlAR0ySZItz0vGJiUuKTSufY6kIlngeNU3qEGtEU6vYan78F7ku1FRKW8e42cCZJpTSe9qvuozhjAh0L6nepiCy8L80U3xQ4tOTS3fT9Q3TAgAHvIB+y05Swp1ZGyIGx7pPrcTjSYRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBWlsPsR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AC7C4CEF5
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756478667;
	bh=KZPlYUe+o6QHf5RBQeW7oNZlHwAnXFJ/WayhGTcCMZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gBWlsPsR/uGinsuGz040CVsk3zRonW+SX49yUANDiVhXx6SsXNzhzlvAPKPXphn6I
	 s4BAlS1erfcpoUtc4k4XQwSugTka4uXjEX9/sQQLvceQbCin1LOcdS1CL74ub3PZVh
	 +cU3MG43UNpPN343CJm/zgKkaZYVCJnytYSqqlnq9Pp9BL8D7dIzrP6N0g5njrVUCA
	 RtuTY6lBtMBbpNVCU8nc4ab15aOTpoMS5ymcgPUSZGxda9Q05naZX6Zav3RRCWgcqE
	 oYCiC4NZLxDfGHL8Hegi4LzdJtU5MKBO1TprTUkSvUT9ZlJLCgaqTM7TkbfT5wrITs
	 y1gmD0+K34QKQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61cb9e039d9so4117124a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 07:44:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTV2lwnaMc+ROJmcBbOHpiRZC0JhS0dmUroro8a3k1h32ITtfjYUWj7ZXY8gwt0IMhiSN2uxlX/6rY@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOb8SuYZ4bgB8sjua5SOk2lNXxBpyY15oY/8ICMCAx0hs6/ml
	8Fai/voNd+rskq1AwpdQqzItYfpA40cFDF+VQnxWWIaw+GelQ/UD3p4UCRgh3rkbXpz4zaKDNFF
	MS5UC/uUsoi4fRDy2ezwVDo/tATl4YA==
X-Google-Smtp-Source: AGHT+IEno5x9GuuARS9EWCxWBkhImsK0HYEJ03r0E1sOjEu46DRsy+7+6ixNighsX9YoWaGpmsK1T1bavzZnz4Q5qFU=
X-Received: by 2002:a05:6402:51d1:b0:61c:e1d6:6bf6 with SMTP id
 4fb4d7f45d1cf-61ce1d672b2mr5357308a12.7.1756478665699; Fri, 29 Aug 2025
 07:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
 <CAL_Jsq+_aYAM8V7UmhCP-74BRpwv_vfzHeFrWvxmc=TLT+7oQw@mail.gmail.com> <CAMEGJJ1gOMhe3-+6UD=gzPOqCpbuXmA9aSpytJ66JbpJ9w3fvA@mail.gmail.com>
In-Reply-To: <CAMEGJJ1gOMhe3-+6UD=gzPOqCpbuXmA9aSpytJ66JbpJ9w3fvA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 29 Aug 2025 09:44:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL1wrN32WXa6qP+hVvxtnkaxqbbf-EP=pKCOkzTzmbgMw@mail.gmail.com>
X-Gm-Features: Ac12FXyf4Qv9KLq3KsavLspQKteqplK_xpbPPrJW1RFXCkdle7zRGOOSxpoidLI
Message-ID: <CAL_JsqL1wrN32WXa6qP+hVvxtnkaxqbbf-EP=pKCOkzTzmbgMw@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Phil Elwell <phil@raspberrypi.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 8:35=E2=80=AFAM Phil Elwell <phil@raspberrypi.com> =
wrote:
>
> Hi Rob,
>
> On Fri, 29 Aug 2025 at 14:25, Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Aug 29, 2025 at 5:37=E2=80=AFAM Phil Elwell <phil@raspberrypi.c=
om> wrote:
> > >
> > > Hi,
> > >
> > > A Raspberry Pi user recently asked us why I2C wasn't working in their
> > > custom kernel build. The primary change they had made was to trim the
> > > number of enabled drivers, make them all built-in, and to remove
> > > CONFIG_MODULES=3Dy. The end result of this is that the pin muxing
> > > required for I2C to work was not being applied, leaving the interface
> > > talking to thin air.
> > >
> > > I eventually traced the failure back to this change:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e79d46efdf89=
306be99f3c8824cf58e35f6
> > > It introduces a requirement for CONFIG_MODULES to be enabled in order
> > > to get an EPROBE_DEFER in the event that the pinctrl driver has not
> > > yet been probed. Without CONFIG_MODULES, the pinctrl requirements are
> > > waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows the
> > > probing of the I2C driver to be deferred, fixing the user's problem.
> > >
> > > Is this requirement for supporting modules reasonable?
> >
> > That's not the requirement. If CONFIG_MODULES=3Dn, then we only defer
> > probes until late_initcall because after that point no more drivers
> > are going to load. If CONFIG_MODULES=3Dy, then deferring probe is based
> > on a timeout which can be disabled.
>
> Thanks for replying. I'm probably missing something here, but if the
> pinctrl and I2C drivers are both regular platform drivers, what is to
> stop the I2C driver being probed first?

Nothing, but it should defer unless you've reached late initcall or
you've set "pinctrl-use-default".

Rob

