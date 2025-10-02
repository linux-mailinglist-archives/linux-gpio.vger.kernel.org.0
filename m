Return-Path: <linux-gpio+bounces-26758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A306EBB2A23
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 08:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66CD716E2AC
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 06:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB79F296BA2;
	Thu,  2 Oct 2025 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzDn4AtC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6787A288C9D
	for <linux-gpio@vger.kernel.org>; Thu,  2 Oct 2025 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759387210; cv=none; b=pRaLQTb0dJFm46fBhDzfzJt9zT60NdGBly5h9VOU/suTTVqoza3f8x+QAUyw5txPLQQHBBjFPb5d5XcUg2aEW7e6pwIazA1sZpYDcRDH08Z3rG4OO3ACKBDSuQT5YqJttwrD2k6mCstqXU8LzWIaAhhL2aFArSNftg/EPe4TS54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759387210; c=relaxed/simple;
	bh=oWqwEWx8zwWItcJwZ8fd27r7w2elRRbG49uTkJHmkqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8YeKu/NziIUBKRAiJkkPlj+zRgC00zHe8QPxEorm8CvrTeDuOCqWSJ8wLE95xeSeXPhLi8/zXXaCAyVmH1RTPCicUDzv06HCcs4zJZGUG4SzrMWhYWYJ5ebsM2fsZtnh4XmY8Tr9ZU+Q/M2Q4/7FlL0Tp0Yclt98C8VcoILYNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzDn4AtC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CD0C116D0
	for <linux-gpio@vger.kernel.org>; Thu,  2 Oct 2025 06:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759387209;
	bh=oWqwEWx8zwWItcJwZ8fd27r7w2elRRbG49uTkJHmkqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mzDn4AtC2Ak0PN7B6O8MxMKFWwSz9A02wgLegDa7b1MQ3AVaECRJwrPQWl1RTB62k
	 NgCt+eINqYMBcnmSZxoab7OPdNxEOh/+5yoZiVZV0Q4UdbQomBhHkVCjsIzIIY2oSe
	 Ja6uIYNCbksgVmHPR/fGMSdCtmAP/PsFwYhZKjRT6+yKEcq+NTPSKJEPg5Pk4OwhS2
	 wVc1KyTi4Hm76BJWviu0tPBabg6DjgCj1eGjY43Cj1k7leLo6zk8IDPGB0vLBsWJdl
	 50lRsmFB0eKyqjbdZ/p93SyfWH/+0u+KxaLhosocZSKeNgmTXbXlNAhzLaMJnAbrjh
	 VVFztVjIA+5BA==
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b60971c17acso614292a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 23:40:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUySvvb1r1QjH3Zgue8uqboNQBtnKGrIGARaO2qSrHDv7QEmjpfyavAVPu0iRLB7+pAMPN9GqKI5PkY@vger.kernel.org
X-Gm-Message-State: AOJu0YwRgk9NwiBo7qPKfuVMobXBM4C1fN0kgAVGZ26fE76p//GVPoyv
	gEuXgevJ3C5sntXGfV5FN/BvcrY9jXuSyFP58R7W/F6t84g54mT7LyYCbJT1iRVaG2PwKtlkoBx
	O9KdqmJb0zePYlJ1874vh/QoWJRaua1k=
X-Google-Smtp-Source: AGHT+IGdtzOpvUYdPLtelHaB8zJ6rwGT1VrlFmtzCJU8l7UzsZsbFUnbb5aDI8NKj4eZKGgGJDmSr+LU1AO2yz3t6r0=
X-Received: by 2002:a17:903:32c9:b0:270:ea84:324a with SMTP id
 d9443c01a7336-28e7f328b47mr76608265ad.38.1759387209439; Wed, 01 Oct 2025
 23:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2@epcas5p1.samsung.com>
 <20250901051926.59970-1-ravi.patel@samsung.com>
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 2 Oct 2025 15:39:57 +0900
X-Gmail-Original-Message-ID: <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
X-Gm-Features: AS18NWDO2eUChAY4_CCzuKLny2cYJfsAdkZKqOgM2dKZNuIdZKWV3kyYmcxtbLo
Message-ID: <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add support for the Axis ARTPEC-8 SoC
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, 
	pjsin865@coasia.com, gwk1013@coasia.com, hgkim05@coasia.com, 
	mingyoungbo@coasia.com, smn1196@coasia.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Sept 2025 at 14:42, Ravi Patel <ravi.patel@samsung.com> wrote:
>
> Add basic support for the Axis ARTPEC-8 SoC which contains
> quad-core Cortex-A53 CPU and other several IPs. This SoC is an
> Axis-designed chipset used in surveillance camera products such as
> the AXIS Q1656-LE and AXIS Q3538-LVE.
>
> This ARTPEC-8 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
>
> List of Samsung-provided IPs:
> - UART
> - Ethernet (Vendor: Synopsys)
> - SDIO
> - SPI
> - HSI2C
> - I2S
> - CMU (Clock Management Unit)
> - Pinctrl (GPIO)
> - PCIe (Vendor: Synopsys)
> - USB (Vendor: Synopsys)
>
> List of Axis-provided IPs:
> - VIP (Image Sensor Processing IP)
> - VPP (Video Post Processing)
> - GPU
> - CDC (Video Encoder)
>
> This patch series includes below changes:
> - CMU (Clock Management Unit) driver and its bindings
> - GPIO pinctrl configuration and its bindings
> - Basic Device Tree for ARTPEC-8 SoC and boards
>

Pretty useless cover letter since it doesn't say the damn most
important thing : dependency!

So this went unnoticed and now mainline (Linus tree) is affected. See
Linus rant on soc pull request

I'm very disappointed, actually mostly on me that I picked this up.
Your future patches, need to improve quality and probably you need to
go back to how Git works and how maintainer trees are organized. Read
carefully, really carefully please maintainer profile .

I'll be putting artpec 9 on hold, till you confirm what was wrong here
and how are you going to fix it in the future.

