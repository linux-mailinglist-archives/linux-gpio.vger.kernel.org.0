Return-Path: <linux-gpio+bounces-7772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996891B16D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 23:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3AA1C20E26
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 21:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ABC1A2C1C;
	Thu, 27 Jun 2024 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3IuhCPB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25F419A2A3;
	Thu, 27 Jun 2024 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719523149; cv=none; b=X5JzSdUWMCQK/1RcGcKOcnqmdvCKQqI6Slw82pEEpdBg8Qlh2rKvTu3Fb/5AeLYYBEeGXfL4KkcM5HNRsRZAxcl9ene+VjqXRHCOorGO93oHBc1Oxio18J0E+Le5adG8nMaMUZtnXtECmYjS9G9HZltbP4CbW/4ZEh57JB76Na4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719523149; c=relaxed/simple;
	bh=cBwoSZIppZrvQlV8nXUx4lZE5BKZKNOzCgNv+fE7Sy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpCfCe1RWApMQiyd9kM/2Sd9bLM2+WNzgWoNSF2593HJHlrrA2d6uVDi2As7SqF4DqbKenhrfCY1V0/gicuzhgVKQuMMc6YITxBVl+OSon9tIIR+/Q4782dMVTG5+uraGqsIaW5oThjNM0TTivQDUYbBzB7I4wDou20m4iSVu8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3IuhCPB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D98C2BBFC;
	Thu, 27 Jun 2024 21:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719523148;
	bh=cBwoSZIppZrvQlV8nXUx4lZE5BKZKNOzCgNv+fE7Sy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3IuhCPBRvZ1P86KYL9tK4tvuvmvqpRt6HzZF4TyR5jobMRtrseXzj5q+ECjtVR43
	 M3ZrAy3/iVp+VtYcwujTv34L9BeIrZTHcL/qjjh0ZTgBUwV9HUmWXhS8QouA2kjvHb
	 dvgEqQneTDECScgjMWPcMXvPu1cY30x5ddlyDCYVt5aSB9yC2Eggsybv2MvUlntLu4
	 Rq70CeomCl3CQqRhJD5MwSr55DnVLx+AbbA8Yj/tzrZuQzxzao9td1nf9Iv95cz/AP
	 JxQh2/1DPih8uoGZIdGvcK8xPzSK6yAGHGqzwXYxZYcLfpWaWwoYmFujDE/kMNVvmk
	 rU3zFYUz2e3pg==
Date: Thu, 27 Jun 2024 15:19:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Tony Lindgren <tony@atomide.com>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-single: fix schmitt
 related properties
Message-ID: <171952314469.580933.1301134384656547237.robh@kernel.org>
References: <IA1PR20MB4953D5E7D7D68DDCE31C0031BBCF2@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953D5E7D7D68DDCE31C0031BBCF2@IA1PR20MB4953.namprd20.prod.outlook.com>


On Thu, 20 Jun 2024 07:14:47 +0800, Inochi Amaoto wrote:
> The "pinctrl-single,input-schmitt" have four arguments in the bindings
> but the driver needs two. According to the meaning of other properties
> and driver, it should have "enable" suffix. Fortunately, there is no
> dts using this property, so it is safe to correct this property with the
> right name.
> 
> Rename existed property "pinctrl-single,input-schmitt" to
> "pinctrl-single,input-schmitt-enable" and add the right description for
> property "pinctrl-single,input-schmitt" used by the driver.
> 
> Fixes: 677a62482bd6 ("dt-bindings: pinctrl: Update pinctrl-single to use yaml")
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../devicetree/bindings/pinctrl/pinctrl-single.yaml        | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


