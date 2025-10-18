Return-Path: <linux-gpio+bounces-27276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B48EBEDCF6
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Oct 2025 01:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B91019A34C5
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 23:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772F7284B26;
	Sat, 18 Oct 2025 23:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQMHFoai"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E552512E6;
	Sat, 18 Oct 2025 23:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760831074; cv=none; b=L5OjxOnba9lFnQazgoeWWgvHfkFSIChyqngIwTqii/cRzoG2qK5p1MYgr71/VpnIAfrH2DOaPegGaL6BCKS0ROyuB6ObAdtnITdUB7stU4oxpNdH1nkycGhdAvWJkxgZu07oaT93/7Xm4KGs/AWDd0bdtYc3slfCaFAYMA7OOBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760831074; c=relaxed/simple;
	bh=35VEjtJG+w3mU7d4N1pbsg3mXXmtqZ9kwr9H4K6Izd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHNW4hHdTuMpfim5NjgC9MDr66cFMtDIJ03NyH5mTxCZgO033WOBO2vFXobRYry6+kq2PMaQjvSS8raJMUiTsypfFmiClbq8y/txE86RTObk4aL2mqSr+imiNnF/R7mK2Y7tmH5STuN2pXig3pTv1LoeNu1CVM0MqCq3Y2Hq8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQMHFoai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6B7C4CEF8;
	Sat, 18 Oct 2025 23:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760831073;
	bh=35VEjtJG+w3mU7d4N1pbsg3mXXmtqZ9kwr9H4K6Izd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQMHFoaiTIgSh+HKLZbQjCPMk1pIIO3E0YcELV/2lZGKfCk3XAwiZDCVFCSR8M1dC
	 VVkzyYgqqNoJlM5vHz6bIZ/ZrJ+99cgdzJsN618gK3bTgKvOQVzFX/EXBaggMtjTzH
	 At/I/91lyQs7vrCwlN1+qf+zoFmbAASD9ut6A6hrxyaIzCTQXWsNypQpteL2mABjFa
	 opNIkvkN7YTIyAs5hWe6r7mAQC8vDg2aSkRX4uzUZwbbUouby7+oaohWXGmjmC5TqU
	 f71rH5H6RvEEnn24CNcnqN9ZVW7BGRSwO+e/rrjp6AV4lbkZqXx4CN39LZRsXDcD79
	 VZd8s2TvoKvfQ==
From: William Breathitt Gray <wbg@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] gpio: 104-idio-16: Define maximum valid register address offset
Date: Sun, 19 Oct 2025 08:44:09 +0900
Message-ID: <20251018234411.34877-1-wbg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aPPj22GL56sP1gOK@ashevche-desk.local>
References: <aPPj22GL56sP1gOK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=wbg@kernel.org; h=from:subject; bh=35VEjtJG+w3mU7d4N1pbsg3mXXmtqZ9kwr9H4K6Izd8=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBlfVF93+yVfjKjO+Rt53+L6wV5u/p9cnC0ekhm1bge+l S+SszXvKGVhEONikBVTZOk1P3v3wSVVjR8v5m+DmcPKBDKEgYtTAC7yl5Fh1Zk/S1ZN4A784+cb qJ68IH1p9rsTfBFtj9PnsTtYhXgnMjL8Mnglc/hl7GmPx1t2BjyYxsSxX73ukPHGJUn7eX7O1Zn PBwA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Sat, Oct 18, 2025 at 10:00:43PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 17, 2025 at 09:58:01AM +0900, William Breathitt Gray wrote:
> > Attempting to load the 104-idio-16 module fails during regmap
> > initialization with a return error -EINVAL. This is a result of the
> > regmap cache failing initialization. Set the idio_16_regmap_config
> > max_register member to fix this failure.
> 
> > Fixes: 2c210c9a34a3 ("gpio: 104-idio-16: Migrate to the regmap API")
> > Reported-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> > Link: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com
> 
> Link --> Closes ?

So that link points to a report detailing multiple bugs, but this patch
only fixes one of those bugs. Is it still appropriate to use Closes in
this case?

William Breathitt Gray

