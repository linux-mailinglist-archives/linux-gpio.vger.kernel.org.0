Return-Path: <linux-gpio+bounces-25653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA6B450FB
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 733AA1BC5EE3
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 08:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8D92FE584;
	Fri,  5 Sep 2025 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjBIK5wn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68A82045B7;
	Fri,  5 Sep 2025 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059923; cv=none; b=d1JUY/kkaeGLxA/Nbro4m+1W5mSOpg4v98fnV1izpOLWk9Fx5EUhWJhKfkEWOpWSv4WL1108L7c3RviB/JkTkUHnxAj0zUG5rsdjyrW0UOI80vKRi+t/gSL7nZrrFA+J4IxLIsxFaQKw6eFV6FE6I0I17846dhbPHTK9RYutOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059923; c=relaxed/simple;
	bh=mNHu3Dq59LBMQxbgLxMaQI+8a9Nh6j71J6ILlJhwpkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZY21FQ2nwIw39hFrH3Jjs8jrc0rWeok4VxLyN4jWImp4eYEkTXRaJC7y/5t23bDsNVU2Aekb0uzpCbNYEEcQSHhSUKSLwDQyRpy4V9ubclhajcWiAZbzM+C5fG0uT97hqvKleEhsG1/CGSpZ9U6lTeTyNAwVc2wHoW15vV7rM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjBIK5wn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0666C4CEF1;
	Fri,  5 Sep 2025 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757059923;
	bh=mNHu3Dq59LBMQxbgLxMaQI+8a9Nh6j71J6ILlJhwpkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjBIK5wn6f7pd2b8kgpHsnktswpp0jsDZKR+mzoJkrpRqXsGOQ8Hq09cIY3lkFHJg
	 nzUh8vJeVvCdy9sg3kNocvcU8WKjE48Xzke8Ix1mGA+L6jOujXWlGqEKQiScJzXtiT
	 5hu0HdszSfr9/RVGP78AH7xeJ5J0/kP61EnA1qETBh7gigujUy74ck5aukJnDbbpdo
	 ceEGFRzCva4VFLytCgA8BZFa31Uh77McjxyDjNeh9C9WbrRs7irDuQZ2wO9B2dsW3q
	 R4hHdZ5RcHXuB6vVQasltt21cL+OyQihQpV+b/IXU6ogkDBDmcHSHfmCi11schly5c
	 SSVP5k2l+rypA==
Date: Fri, 5 Sep 2025 10:12:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linus.walleij@linaro.org, brgl@bgdev.pl, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 0/4] Add pinctrl support for AST2700 SoC
Message-ID: <20250905-rough-notorious-leech-dd7a0d@kuoka>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-1-billy_tsai@aspeedtech.com>

On Thu, Sep 04, 2025 at 06:33:57PM +0800, Billy Tsai wrote:
> Document and add the pinctrl driver for AST2700 SoC.
> 
> Changes since v1:
> - Update pinctrl aspeed binding files.

Anything is an update.

Really too vague and some time ago I am sure I complained about this to
Aspeed.

Best regards,
Krzysztof


