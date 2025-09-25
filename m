Return-Path: <linux-gpio+bounces-26576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA110B9F19B
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 14:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 860B33A33B9
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 12:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB0B2FCBE9;
	Thu, 25 Sep 2025 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSHIvLNU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21927FB3C;
	Thu, 25 Sep 2025 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802422; cv=none; b=eI71X7j5jzfjFJ9SdhVWkY6zVQkW2e/7Ps5+xjMAfOU9X7xBB479EPQuwFvCcvTZdENM3KdZSDim8E8KU85Wgm3FE+0/ikupPbmKqfoksKzPb+E8DcPYSH3rXqIMujj68noW+LXYQ5p5k17I2ayXriwb3qIkqyaPZBotqdkGuFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802422; c=relaxed/simple;
	bh=x4hykr+7b0LZx0aQ1vPKkYsF+/Q7Wa44o4IqH+7AIko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E05goKz4wg6w5Oyq4lBKbsKojBQJfDga3iKblnSY13jSz038nnqH3DNPod7lku4C1hhisfJohB+sEqi8jUXrqenPIdoZ42I+l7iTEr4pVsDDgNpVYQWhLR+doYNhViyWjrUPjRwW2VWyH9alB8YgdEJRu+/IK/8vV1YVQP2JNOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSHIvLNU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537CBC4CEF0;
	Thu, 25 Sep 2025 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758802421;
	bh=x4hykr+7b0LZx0aQ1vPKkYsF+/Q7Wa44o4IqH+7AIko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSHIvLNU5BEbi1YK63MIvdthg17Lv1lCQgB1HpkcYToLCA3dUiU8JY91WaMIFFWJ4
	 Sw+G3rC2vY7CZrGhIyYq/Jle0/fnMJEArEXCOEmL13TBACLrzDB7Zr/RThhn569/OS
	 ewn7Gp88FFs1+NMdnErz7XapfoAnZt4I+shu2LFm0NVgkDIklrm+s82iKyFRBXYyGW
	 gqazHPGNUSO2vI8GNtQqRcqUHIRQhTtVIByNrn4SCARgwNJ8x87TbRaLM9Q3b5K60O
	 JGt9y/CZZFDhix0Zc+OLnHKIdK/Ta5PwoGSyd7wQfG0ttZAiI5KcUPe37+2ziIlD+g
	 a0eXuIzybUIBQ==
Date: Thu, 25 Sep 2025 13:13:36 +0100
From: Lee Jones <lee@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v5 04/12] mfd: simple-mfd-i2c: keep compatible strings in
 alphabetical order
Message-ID: <20250925121336.GK8757@google.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
 <20250922142427.3310221-5-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922142427.3310221-5-ioana.ciornei@nxp.com>

On Mon, 22 Sep 2025, Ioana Ciornei wrote:

> Reorder the of_device_id structures so that they are in alphabetical
> order.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v4:
> - new patch
> Changes in v5:
> - none
> 
>  drivers/mfd/simple-mfd-i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

