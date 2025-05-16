Return-Path: <linux-gpio+bounces-20256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D5AB9B44
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 13:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 888614E396C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 11:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A036B23817C;
	Fri, 16 May 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJHzXnHw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3E1F4CAC;
	Fri, 16 May 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395739; cv=none; b=D0tvO5HKXcf+E3+nO0/I0GSP189krbvZ0xbyXe7FjTNpxCR8BnvwyhaBYAR5DX8uJpR1kByRebch58hpMiTTMHYr63JzWqeXPxNoXxoE15rne8Rhqwh7urXqoTM1E8WlLp7+JW9TX4AfyQ3v4ZIKuS5LkUB4g+SQY7mYXP6kghU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395739; c=relaxed/simple;
	bh=NPHC0ic8l6NpY8iIFGNXCN65LKobQsqxUCVsfo6w8UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfmWCbl2obPMZbNdx5gqYUaltC3qAjm/Nn7BHGsPmUOI6R1NnBVKIAAtsoSAml+zqC8KVBs4jPjOOcfXwxISNBdSzWebyJ/QfkQcTyRalXq39/u4rf2+C87bNFEW4wPebkgeyt/kiTkEUTklNnT0DLAkgTd0s61nCMg8z9mYVXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJHzXnHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26650C4CEE4;
	Fri, 16 May 2025 11:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395739;
	bh=NPHC0ic8l6NpY8iIFGNXCN65LKobQsqxUCVsfo6w8UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJHzXnHwl9HXejhu2XtnWkcevcww35CF+wD/W5nggbhlZZxZA/ltTpM4ncD7mqmB5
	 EmJyxQ9simTWwc1eRFhad0qNj3KEYxDILWlxEzITFGY9TUuL4CcOqAzNC7YXRqDlMm
	 bsr3Ai4Q5lzofRcbeqWFrFIZiUxBpIbw9Sz0H7hMqpHAKUBq8NiEkpHUJovU+rauH4
	 QFfsH3TAUOtZ3Co88WaLw9gzgwroEya0Bv5sT60fzxkomPsZMJqAIZoiqV/68a9Jp7
	 ODD1N08URdOaP3hzN4fofixSL8KQ/ZdMyQ8GoH7M/X9kVOTcTjfgKi7tqGom0TSRAW
	 Zrfvw+gbFCBkQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uFtSB-000000001qQ-3PmX;
	Fri, 16 May 2025 13:42:15 +0200
Date: Fri, 16 May 2025 13:42:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: add missing mutex_destroy()
Message-ID: <aCckl9cC8fCBhHQT@hovoldconsulting.com>
References: <20250516104023.20561-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516104023.20561-1-brgl@bgdev.pl>

On Fri, May 16, 2025 at 12:40:23PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We initialize the data->mutex in gpiod_export() but lack the
> corresponding mutex_destroy() in gpiod_unexport() causing a resource
> leak with mutex debugging enabled. Add the call right before kfreeing
> the GPIO data.

No, there's no resource leak and it's perfectly fine not to call
mutex_destroy().

You can't just make shit up and then pretend to fix it...

> Fixes: 6ffcb7971486 ("gpio: sysfs: use per-gpio locking")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Johan

