Return-Path: <linux-gpio+bounces-10338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE797E352
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB31F1F20F5D
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87F6626CB;
	Sun, 22 Sep 2024 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUHs+3ts"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889C1482E2;
	Sun, 22 Sep 2024 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037874; cv=none; b=GC9dCvbFkOpeATebEOPpN/eA8FLSuqG/+ji85/5MDp0yCzOSJkg7zTHNcBmDM/6fWyRjFSx/BXHw7Bjy/GBDFpzLMKa3c6oImxnRVN8RmxSLus7O8ZuaW83cP5FqIoP7Dex5RpDjPv95Of6RJjlftbpO0AmuR6mKQwBi5UZ1EqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037874; c=relaxed/simple;
	bh=R7ncfsffcQjj72ADhC6DpP/Uj3RZmlwh1bpnhSOWXLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMFKuhr/ZjNwq+0Z+RQVZsn3RQvdjoGtgcMtEJmXmbQdej2yXRDHxu5LTlC4bOAJTwbQIFvrbxQBhz7xJlU0Jug/rddJatbveQiTtY+4ckk0IJyGjTipyMIQUhf1HNk+lg0BbHIPC39O7shbwOmzBVT5kBWd+PExpxmdvqtsX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUHs+3ts; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDA4C4CEC3;
	Sun, 22 Sep 2024 20:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037874;
	bh=R7ncfsffcQjj72ADhC6DpP/Uj3RZmlwh1bpnhSOWXLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUHs+3tsmD6Q48o7LFYLRraPtGMRoFFe+I0rT9ogVfEkRXGtfa2FmTTvWo+PYfubA
	 Wt3iQ/J3Hr21vJR14VVPqJqmR1oapOBuWCc9lqgYL/2cqYdKJDdrmTV+YWmB2FLYDj
	 TSgkxaeHHhpdCkOU7mCV7AQOG4412MPAgD/hBtwrjZOhhKU0lqcMOws4Z8786cY1k1
	 77y96vBxF52DevdnAaetqCuqaBzaYedlZeEEpRh575kftlaqeTHYIb6AzddCMhjJHD
	 +Oi5vvMl3HSoN1/A9RG+nH7oS+qxpdpyFu3GJQqtQv8gQ3m9kQHtNOewESC0fhVPWO
	 4+sBsgiyODiZQ==
Date: Sun, 22 Sep 2024 22:44:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
Subject: Re: [PATCH v4 05/20] dt-bindings: arm: apple: Add A8 devices
Message-ID: <qwwf7s6uyemtwjczj46drjzqmnxremz5ydho5ymo37yh72nvsc@hqagxupaxblz>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-6-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-6-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:54AM +0800, Nick Chan wrote:
> This adds the following apple,t7000 based platforms:
> 
>  - iPhone 6
>  - iPhone 6 Plus
>  - iPad mini 4
>  - iPod touch 6
>  - Apple TV HD
> 
> The remaining HomePod is not supported as part of this patch.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


