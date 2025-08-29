Return-Path: <linux-gpio+bounces-25197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265ADB3BC7F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 15:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04127C05C3
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 13:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6641431A548;
	Fri, 29 Aug 2025 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsQjBi8n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A002E7F08
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756473927; cv=none; b=CaT/F39/mS7DhCeTlYGC+BbOJLqyKXnJmqxi8rp7r5b1oRTtyx3hJ9bVwwXPmmuhD5siDo4fTtbZrZ0oscLIHIxjJ+ezBk1Oy+0NSjTEI4ANWP49UvJeBxZOlJreEx2acFVNP4qWObGnjnIaFvH6plgz/rdLynbnJTZt5qntrlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756473927; c=relaxed/simple;
	bh=VpyEdagQKvpLwyPsd+b3mxVfo1yC+hXzvmki1rWbM5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3HgxARaVEsnBb/Q8UYybJmgok/NQqVDUnhGE/N14i4eRLso8liQ+qZYATUj50Fx0IvFwOp//D/erhHN+XQvNYP1KbZcfdQbpUQO+LZTSfXCAFjTcn74GIaqV17DcyW0JgIBneX7/Q1V8INBaFqu5GgCED2wlzoh+nSWSwuHPXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsQjBi8n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC45C4CEF0
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756473926;
	bh=VpyEdagQKvpLwyPsd+b3mxVfo1yC+hXzvmki1rWbM5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JsQjBi8nXW17r7OilOSMjTEGSU6hOqRffAJpijG90RSTBBamGPSSzVl2wKOqGhUx2
	 gR6J/xzPaMF//86KUGOWzRzhBB28JcB5gMWEDFPO2PQiQ1fltBsDnIHLWvJoJDqwlJ
	 V5mi58UcT+rp94r+3Pxj6K6OttVhhtpVa00C3QMS7H0lzzF5X6IHoEu57s0O3T3bWx
	 VL1BnMPFg/0If4mTB7ZpSVd+ZyjNwY0iXT1BCyK7+TyP3AGqZeJpJEUVKt1agGYdgd
	 pETIftrwqEDHO1KeKe+L246D8YUVMeUdb6I/Xum02P4sCQE0aTyKrYcyfZOA3hBR1f
	 lsNnKBAetaodw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so3925242a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 06:25:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiULeVowy+fTo2yTwWLrqlJp+XKZvpom9TtENky2kTZ6JXkdBlggRFlx2i9UH6saqGAFIC7mPQBzws@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9udCcUbaoG98aNmWSJnhyY1SgXfFCgoKTpnCgGCnPMs30nFa
	kuDVDEt7U7flF/izLQT8edrGWbfXqvc/W2VyMBtkmOZpzV1TfUGwf4M9iSKl9iRUVR2QGyWFCAI
	OSUq/CIpB7yUlK1YDvjJwDmgSVduDLw==
X-Google-Smtp-Source: AGHT+IHPaEj3opfX9UqB4fW2wOG7vlUVjJs0geD3kUX8Ctd7a0qICbd9RMc/pUFVW5wL+yTrDy7ziKg7Gco+gND+W0M=
X-Received: by 2002:a05:6402:51cb:b0:61d:13b:3c79 with SMTP id
 4fb4d7f45d1cf-61d013b49bemr2308891a12.13.1756473925097; Fri, 29 Aug 2025
 06:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
In-Reply-To: <CAMEGJJ06_3bgiWfPjQy3JRgtzq5vcr4FgR9JrzTFrGKOxTe52A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 29 Aug 2025 08:25:11 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_aYAM8V7UmhCP-74BRpwv_vfzHeFrWvxmc=TLT+7oQw@mail.gmail.com>
X-Gm-Features: Ac12FXza7qxPSy7SaidGYlNtD92AQYxBfOwYgR3HKQxxqRCv7mUIl_qluYDcatA
Message-ID: <CAL_Jsq+_aYAM8V7UmhCP-74BRpwv_vfzHeFrWvxmc=TLT+7oQw@mail.gmail.com>
Subject: Re: pinctrl, probe order, and CONFIG_MODULES
To: Phil Elwell <phil@raspberrypi.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:37=E2=80=AFAM Phil Elwell <phil@raspberrypi.com> =
wrote:
>
> Hi,
>
> A Raspberry Pi user recently asked us why I2C wasn't working in their
> custom kernel build. The primary change they had made was to trim the
> number of enabled drivers, make them all built-in, and to remove
> CONFIG_MODULES=3Dy. The end result of this is that the pin muxing
> required for I2C to work was not being applied, leaving the interface
> talking to thin air.
>
> I eventually traced the failure back to this change:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/drivers/pinctrl/devicetree.c?h=3Dnext-20250829&id=3Dd19c5e79d46efdf89306b=
e99f3c8824cf58e35f6
> It introduces a requirement for CONFIG_MODULES to be enabled in order
> to get an EPROBE_DEFER in the event that the pinctrl driver has not
> yet been probed. Without CONFIG_MODULES, the pinctrl requirements are
> waived. Removing the IS_ENABLED(CONFIG_MODULES) clause allows the
> probing of the I2C driver to be deferred, fixing the user's problem.
>
> Is this requirement for supporting modules reasonable?

That's not the requirement. If CONFIG_MODULES=3Dn, then we only defer
probes until late_initcall because after that point no more drivers
are going to load. If CONFIG_MODULES=3Dy, then deferring probe is based
on a timeout which can be disabled.

> If so, how is
> one supposed to get the pinctrl to probe before the I2C driver?

That shouldn't be required.

Rob

