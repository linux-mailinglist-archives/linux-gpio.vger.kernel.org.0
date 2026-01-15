Return-Path: <linux-gpio+bounces-30609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A83D25925
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 17:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0126F3012A73
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 16:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D782C11CB;
	Thu, 15 Jan 2026 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="topd3R6w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801D2BD5B9;
	Thu, 15 Jan 2026 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768492958; cv=none; b=oRfIx43iYuK2N9HcAEHdmhjTqTJ/FByKg1p1uCDmC+F9VHWpLlTJ5fn9c/e+piXEtmD+hPFQrdHTUJ7YZfgic69hIA3g7lvUKWZaXkfJALBYzlIqzplELpgTRDXjVBqov1pFLDCnk3ZSNzsF0+GjM+YfBzrxnRm3vzNwkM9wLj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768492958; c=relaxed/simple;
	bh=9jQK/KV36GdLIy4VOJJ7i40Wd+Nl5CXsDfIILMRvP5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMvGjytU/vkhExcLUbDIrqeIciUGjtg+e052o+KfHaYCi0jH2ENkrM1rZwoBb6vkWDizTFTPf1IgAt9XgVrFascqMkaax8cK0UlOkXBkHrb68gs6aIbGUKzt1XiF56k8HQt7zr/3ksYf8g3UdvcOg8VjQH+hOlPGyZLH2rC94Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=topd3R6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E9EC116D0;
	Thu, 15 Jan 2026 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768492958;
	bh=9jQK/KV36GdLIy4VOJJ7i40Wd+Nl5CXsDfIILMRvP5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=topd3R6wOUynel1xYRzH4WRx2OLdAR1bYlYlOzRCtqPc+Pc63QW3x5ob4So02xO/K
	 fe/xFZJ4GLcEyqjR1gsjJHiL5N8Bg43n9pYeeyhyNJ+caimEXW+qlxQnwjv1bL35w6
	 14pWcegAtBlbYkcvG1EqkokvHCUJF/YaWQQ5b23JV83jZSiQhNRDlcB8GT9bkefr+Q
	 byTx8/ANNkMdm2h80bp2KaUQ7ZFfaOOd4jE7DrCU2VMDV6+4z9qJMzuPY7PcpCG57l
	 NRYpmcbQvL9Ug5IFL4y6rWZGY+wphWmE3I+wUatyHTzHVcmsjSOkwdObq0t768XGyB
	 jA1WuTLpQ0dqg==
Date: Thu, 15 Jan 2026 10:02:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: spacemit: add syscon
 property
Message-ID: <176849295668.693144.16118634517088023109.robh@kernel.org>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-1-6bcb46146e53@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-1-6bcb46146e53@linux.spacemit.com>


On Thu, 08 Jan 2026 14:42:38 +0800, Troy Mitchell wrote:
> In order to access the protected IO power domain registers, a valid
> unlock sequence must be performed by writing the required keys to the
> AIB Secure Access Register (ASAR).
> 
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property is added to allow the pinctrl driver
> to access this register.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v2:
> - add `spacemmit` prefix in the subject
> - remove offset in syscon property
> - remove `spacemit,apbc` property in required
> - Link to v1: https://lore.kernel.org/spacemit/20260108042753-GYA2796@gentoo.org/T/#m2ab46cd63cbb1b110eb317ee5b9d540d39cbd82b
> ---
>  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


