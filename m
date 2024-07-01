Return-Path: <linux-gpio+bounces-7860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4EA91E5CA
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 18:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF335284AE5
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 16:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3975D16DEA8;
	Mon,  1 Jul 2024 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXaqE82a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C818635;
	Mon,  1 Jul 2024 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719852640; cv=none; b=jIEn20OQa+AEKvGV+e3UE9SzcC/jLvOUiTU7jToJJYpF8i74VTca4ZIAei9NOYtoqS9N8cQdX927slbK3ZT1zzOQ3l2tnxwNzFcbp4c88BrlIP4C+wCxf+SjcyLH9bnkhqLMtw9RlLNGoopdMhoPwh2gb0aHe404cZdJ5rHiScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719852640; c=relaxed/simple;
	bh=wznSPJpNjGWe+5kbV2ex8b2RYq9BCb5gMM/LsclbKPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i31+xlvXJSHQ91dnJjXfK7BUo5cjUDvCkTEmUR15hjzfKbzHl2wj6Ul0YQEJtsr/nisvSYw+zrvWoNGXEsWsi1adK1p8kmbs2xHv1ClJ49MPpUBFZDg5o/9k6xJuEI1KErOMTk3L/w5i4JmeghFZgZbt/c5wO0Gt6y88b2IcYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXaqE82a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DFFC2BD10;
	Mon,  1 Jul 2024 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719852639;
	bh=wznSPJpNjGWe+5kbV2ex8b2RYq9BCb5gMM/LsclbKPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXaqE82aon7a25xWroDSAp3gJ8swCLRyxoo9yoVdePkXDAmvVlmq9oc2/E/p9eYqK
	 04GntGQwY03LkAYNZQbSsWuViKpKTnps2rnXAN7TvaaPUOVdJ0uVTULNTkcUd7zUDc
	 ek5uHFG0PL0lHiZarrXjZ8BgPhv8sXyYJNhySb8epW9aho0pW9lwSYMGKGtYiib8CL
	 tgXnzpJS6Zqr9YicYwUib4Rs+ABqiySqQl/s7TVa82b4pzYj+lUlTNeYBpwl4vHc3Y
	 3xpXG1VdCfAQHuC+XrwJvNrjVPe+CZhfw7cS8ZXYFSyYnKk/UCT7BEGM5PdioBfoaL
	 1LfZB3BJavDBA==
Date: Mon, 1 Jul 2024 10:50:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH V2] dt-bindings: pinctrl: pinctrl-single: Fix
 pinctrl-single,gpio-range description
Message-ID: <171985263741.87483.1879777623519602279.robh@kernel.org>
References: <20240627150610.469645-1-nm@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627150610.469645-1-nm@ti.com>


On Thu, 27 Jun 2024 10:06:10 -0500, Nishanth Menon wrote:
> The binding is supposed to describe the properties of each element
> of the pinctrl-single,gpio-range array entry, however when we use
> "- items:" instead of "items:", it explicitly describes that there
> is just a single entry in the array.
> 
> The pinctrl-single,gpio-range property should describe more than one
> entry in the array. Fix the typo and adjust the alignment of the
> description of the entries appropriately.
> 
> Fixes: 677a62482bd6 ("dt-bindings: pinctrl: Update pinctrl-single to use yaml")
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Symptom:
> pinctrl-single,gpio-range = <&range 0 21 7>;
> generates no warning
> However,
> pinctrl-single,gpio-range = <&range 0 21 7>, <&range 32 2 7>;
> generates "is too long" warning.
> 
> This is just an attempt to fix the binding that is existing.
> 
> V1: https://lore.kernel.org/all/20240618165102.2380159-1-nm@ti.com/
> 
> Patch is based on next-20240626
> 
>  .../devicetree/bindings/pinctrl/pinctrl-single.yaml    | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


