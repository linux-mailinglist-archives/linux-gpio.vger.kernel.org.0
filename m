Return-Path: <linux-gpio+bounces-21545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB385AD8CC9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 15:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E39916EAE6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 13:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660B08632E;
	Fri, 13 Jun 2025 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E5znlyp1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F3E3595A;
	Fri, 13 Jun 2025 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820080; cv=none; b=okeBUGphRiRG2UpelZMd/ll9pNIv9h4hhfqhHjrYvebfh6p8sw/9A2U8GsisO+dM686b9++v5eQbPErH4eislCS9DcQWP6UBvw8anq+cbnuxmsKYaIU5zWNG66lcBWxj21JnOAZRjHOsayYcZ4ncQ8l7nkawx2UlOUGdITnc/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820080; c=relaxed/simple;
	bh=rtychsqz4b9aGmWoQ2Cv3JTMD17+FvibZTjfMu3M+nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dz+nVq8xVbBJONuN3JhIJauMMyPHdDAUPnk82TkW/EegeBEtdMWuFxG7SCyzstM7kYuZJLBPykRzqq5V02BQA5+IF/hg5BhkwzUAfIdUymcet0vZfB9p6DFbCPCw4X9BtZi9t/oEXu2T2PcuZG7Hxd1UL6bKHmo8ON/aBW6f0yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E5znlyp1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70BDC4CEE3;
	Fri, 13 Jun 2025 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749820079;
	bh=rtychsqz4b9aGmWoQ2Cv3JTMD17+FvibZTjfMu3M+nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5znlyp1oii/MKYWWT61lHFnq5WKaQ84AFRBmNuETuxIlvlhdSnbuhAxUZHhOIN00
	 q+aJi6ojNyE+F3rPf9/l2l/OwutwrOelOpapnXQq8/FjchmMznLan/Dm3vZuXLGfM4
	 MQG5tYSQ/OYit4aFAPuOUQzAxD6B4Qwy2vk85IXkDOA4udAEMFspCr69nS+nPR3thV
	 VZGML054PAT/OYhM9ZQlD/TImxqHtHFrSc9PPlBAuJ/sv0XDedrBNO8g/p3waOPeh2
	 J3d7jfoNuS+PcONakH2S3LvcixHLXQ/trfVJR/FOZ/ICucfWb5LIsEIp8AYp8MS0ga
	 XQJ7yB71x8nnA==
Date: Fri, 13 Jun 2025 14:07:53 +0100
From: Simon Horman <horms@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux GPIO <linux-gpio@vger.kernel.org>,
	Linux MTD <linux-mtd@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Felipe Balbi <balbi@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] Documentation: treewide: Replace remaining spinics links
 with lore
Message-ID: <20250613130753.GE414686@horms.kernel.org>
References: <20250611065254.36608-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611065254.36608-2-bagasdotme@gmail.com>

On Wed, Jun 11, 2025 at 01:52:55PM +0700, Bagas Sanjaya wrote:
> Long before introduction of lore.kernel.org, people would link
> to LKML threads on third-party archives (here spinics.net), which
> in some cases can be unreliable (as these were outside of
> kernel.org control). Replace links to them with lore counterparts
> (if any).
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/driver-api/gpio/driver.rst                    | 2 +-
>  Documentation/filesystems/ubifs-authentication.rst          | 2 +-
>  .../networking/device_drivers/ethernet/ti/cpsw.rst          | 6 +++---
>  Documentation/usb/gadget-testing.rst                        | 2 +-

Thanks Bagas,

These changes look nice and correct to me.

I am wondering if you considered also addressing
the spinics.net links in gadget-testing.rst.
They are the only other instances I see under Documentation.

