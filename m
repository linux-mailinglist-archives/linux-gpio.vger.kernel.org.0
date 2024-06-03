Return-Path: <linux-gpio+bounces-7080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C58D85A0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 16:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B5E1F213C0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 14:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C9E12FF71;
	Mon,  3 Jun 2024 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oIge6/o9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CABA82D8E
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717426762; cv=none; b=AF5SIoSF3AeTcK7C8/X1GrOh7FBgCQMooACPKKpWknoYoOrTj99+q1IvGlrkBNfxqgzCBz//4W879Ebr7sQt+VvGltwG0uMKW06T+8OtWE8fH6y4UfjLfTtK0WO76KYU1WrVPFIJrkjdHGAQjWlzp7zRfy+GdgZb6n2Tq9JoOmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717426762; c=relaxed/simple;
	bh=kCVIi3Yp/B/DyyTVdHTFF3wCyzr7Kn4Zo5sQd9JKS5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIJYRcrafWxZO2r8ByrZRJQZSuO9rfgssmz4qEWyTyKXl/SYpNk8Ytx2VrOdE/UXxEfSg1ROKZ35gvFyVDTOJ+z4PZZACPu5yw6Y8TODooFfrZfjAvIf/yO7ludmHNwWN8oKU49kiir+xEVlgLNFf/FFTTe/Bzo14D50XvluoVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oIge6/o9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9E2C2BD10;
	Mon,  3 Jun 2024 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717426762;
	bh=kCVIi3Yp/B/DyyTVdHTFF3wCyzr7Kn4Zo5sQd9JKS5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIge6/o9gaRyEguPaAHvjouwoa4x5mJI8TmULfnPdPOufthf9zt85T6w+eG3/e7s4
	 WlKJQRqSI7UkSQz0P/iFbQ7eghUEVyXzjjtxJu936KOcA3GrtmrxDeSRPXJQfGO95P
	 UG7wSQhUMQQS5F2NMZ6brHTMjB+KCGXtETdGZd1o=
Date: Mon, 3 Jun 2024 10:59:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/8] tools: tests: fix shellcheck warnings
Message-ID: <20240603-swinging-maize-bullfinch-08fb19@lemur>
References: <20240531134512.443850-1-warthog618@gmail.com>
 <CAMRc=McChxEY2cnbzmHY1LAwSAxT5+irRWtbv3KqW8anDgfL4Q@mail.gmail.com>
 <20240603104308.GA95478@rigel>
 <20240603105914.GA97042@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240603105914.GA97042@rigel>

On Mon, Jun 03, 2024 at 06:59:14PM GMT, Kent Gibson wrote:
> Can I confirm this is the format you want:
> 
>     Link: [1] https://www.shellcheck.net/wiki/SC2145
> 
> cos that makes checkpatch.pl unhappy.

I suggest you use:

    | Link: https://www.shellcheck.net/wiki/SC2145 # [1]

This would make most tooling happy.

-K

