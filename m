Return-Path: <linux-gpio+bounces-28855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC4BC71875
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 01:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id AA2A529CC9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 00:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246F41B4224;
	Thu, 20 Nov 2025 00:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osBQ/xhI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D029118FDAF;
	Thu, 20 Nov 2025 00:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763597857; cv=none; b=ENMa+YnakFF9Jo3atcovNhG9bAolqXLNJxUyS9tShTK/PQISeJpEctca5LgWNDpD6HHGBlqp6DIhqrVga6XhjjY/wtnxQ1Bp/fqvwDxgNN34c4DqjhEILaELb+8XTsfUfYwKabtzngNvhRtKP68u+/Mp5PBzB6+4uaCDlxPgHbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763597857; c=relaxed/simple;
	bh=1cc3DbrfxnW4bVEHX06DIBepzUwipjfMU4MlGRZWJG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaWqCa8Z8cZ+TM/T5EpPvumHU/Cy/R2TSht+c8GMaOYifLwFh3bMfLqGfcNqU06xWDBRKZuu9QQEk4mLeY8vCPGizByqLFPHuLCE/XRPHwh6d8Bplmox6ZhyXOKgdR4dKKQW6s5QTcSmpP0qpYqm7CutOQP3tDQTJcm7h8qWQOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osBQ/xhI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04C6C4CEF5;
	Thu, 20 Nov 2025 00:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763597857;
	bh=1cc3DbrfxnW4bVEHX06DIBepzUwipjfMU4MlGRZWJG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=osBQ/xhIbE0YvXOjxBfvLIcWf55uqJknH/xyCufQoAD5HqGHsoYR7xTkfpzM3WS93
	 AnbE4xsplw+aIjfxBnScQIqBoD5tMYR20opCYNNwgDP9arPFLB5ny3OxoinXDGZWtj
	 HrRRpuOliNNGJUrXvqZPyul92tpdl3PW1TjH8QpsuaeMRMNwHHh0SP3cS7jGWwK+Xl
	 rbpXPmpDJzsc7/L+aoVc7dow4FhYhgaGq6z4FWKW5nXvuGSgP1ufjLbSLrI+AhxaLi
	 wVxA6GspZDmXWq2SF+p7zB+DORkv8U8TA2THROjvL3goBeNfP1izbudphVHjek0A86
	 +OGbWOAJueRHw==
Date: Thu, 20 Nov 2025 07:59:47 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>
Subject: Re: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Message-ID: <aR5Z8-haM4NwhdPg@xhacker>
References: <20251119150049.13537-1-jszhang@kernel.org>
 <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aR4EEJO_PeXMKF_h@smile.fi.intel.com>

On Wed, Nov 19, 2025 at 07:53:20PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 11:00:49PM +0800, Jisheng Zhang wrote:
> > Fold dwapb_context into struct dwapb_gpio_port to further simplify
> > the code. Sure this brings a tiny 36 bytes data overhead for
> > !PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
> > gpio port number is 6(the berlin2q soc family), so this means we will
> 
> GPIO
> 
> *and I believe this is limitation by Synopsys in HW, but I'm not going to check
> the datasheet right now.

snps doesn't limit this. The max dwapb gpio controller number is 6 as
is grepped the arm/arm64/riscv etc. dts dir.
> 
> > waste 216 bytes memory in total which is trivial compared to the
> > system memory.
> > 
> > From another side, as Michael mentioned:
> > "The driver currently allocates the struct with kzalloc and stores a
> > pointer to it in case of PM=y.
> > So this probably has an overhead in the same order of magnitude
> > (pointer + malloc overhead/alignment/fragmentation) in case of PM=y
> > now."
> > 
> > So let's Fold dwapb_context into struct dwapb_gpio_port.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> > CC: Michael Büsch <mb@bues.ch>
> 
> Please, use --cc or move Cc list below...
> 
> > ---
> 
> ...this cutter line. It will have the same effect on the emails, but it will
> reduce the noise in the commit message.
> 
> > NOTE: this patch is applied against the following series:
> > [PATCH v3 00/15] gpio: Use modern PM macros
> 
> It's better to just put a link to lore.kernel.org or at least message-id.
> 
> ...
> 
> I have a mixed feelings about this, but if maintainers go with it,
> let it be then.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

