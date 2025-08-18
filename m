Return-Path: <linux-gpio+bounces-24515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB18B2B44E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 01:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118252A0C19
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 23:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B6526FA6F;
	Mon, 18 Aug 2025 23:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyenZzZr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372821FF3F;
	Mon, 18 Aug 2025 23:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558422; cv=none; b=fXCmQba2azNequYQva/N4iwD7164UfEZ5m+tsCh2e/MMB9QxB/OoJgjrXxhilaqLYvgl+StOh/5JOpKxdQ+uG0yimvvo1Jn1oqHTYfLPC865mvEbD3AX+3i9K+TvtzUgXLmIVaLyzQ3EKk8SCvN3ibEuJnfU0y3JHkHOm24NNII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558422; c=relaxed/simple;
	bh=bIrUDiP/86+DTmKlcbYBKHUD+iBOkrl7tWlWebsrONk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oBHMz0B9Xh4ydfXUGpHOKB4VdB88N2GFQz8y/Hwrg65GnJ9ZPaFfjTJ/mx17F8K2VJJT3Hi6ZOcx/6Tw2Tk8taqKpOdRiTesl7ltcFQ1jNVbPEbuJLPbks0aE/7oiAd8ISOG1AlUAGvdd3wVcSU9d1AincvySlwJ+uVHSjjSrA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyenZzZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FFDC4CEEB;
	Mon, 18 Aug 2025 23:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755558421;
	bh=bIrUDiP/86+DTmKlcbYBKHUD+iBOkrl7tWlWebsrONk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HyenZzZraU25GLPXdcpXfHpsQKfL0KuH2VzDTa0W0+BNQD29CkDvDoCNddU+PA7GE
	 KPRfBQDKtfbx+uqJQidU9QDVg9bZxU/n/90YH8C/3RZKxJqEzC4Yek16e6r9vKXrbc
	 SOm6e1vsDuJRIhNl/CFPwcsV9J8kVHMnavErgqrS9yY6aA7/bs5HVP2DPkZd0WPdhS
	 Ww8FUjh7TbgDmpIi72GeP5Kh52wM3WED1fFvaMSgP6VFVQ+t3sEeCI6jBDyr7q9kgT
	 jzfwB4gyuaeWwkA9OBoCeMDGVEWcPN4Hx6qHYFOdzS9O8zclqPsGIJ1xs9dgOj/uqT
	 SWlopoVjN7HtA==
Date: Mon, 18 Aug 2025 18:06:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Bruel <christian.bruel@foss.st.com>, corbet@lwn.net,
	bhelgaas@google.com, mani@kernel.org, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Add pinctrl_pm_select_init_state helper function
Message-ID: <20250818230659.GA561724@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZGaMf1m9UK7ai3KLJBSJtWJagzMMa6icMxEL04w7fkMA@mail.gmail.com>

On Mon, Aug 18, 2025 at 05:32:14PM +0200, Linus Walleij wrote:
> On Wed, Aug 13, 2025 at 10:13 AM Christian Bruel
> <christian.bruel@foss.st.com> wrote:
> 
> > Some platforms need to set the pinctrl to an initial state during
> > pm_resume, just like during probe. To achieve this, the missing function
> > pinctrl_pm_select_init_state() is added to the list of already existing
> > pinctrl PM helper functions.
> >
> > This allows a driver to use the pinctrl init and default states in the
> > pm_runtime platform resume handlers, just as in probe.
> >
> > Additionally the missing documentation describing these pinctrl standard
> > states used during probe has been added.
> >
> > This fixes a build issue for the STM32MP25 PCIe staged in the pcie tree,
> > id 5a972a01e24b
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Björn: Just apply this to the PCI tree.

Thanks, Linus, will do!

Bjorn

