Return-Path: <linux-gpio+bounces-30664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38424D32AFB
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 15:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6033630C5C90
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 14:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEBB392C53;
	Fri, 16 Jan 2026 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b9jzi+wC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4193392C4B;
	Fri, 16 Jan 2026 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573879; cv=none; b=irIK6zq6FiL4Ea7Lc19Kd4LaY8KhPB3i+dLwwVmMelGRw1LNDUT9XqA6fsevF6m9zsjh7hCBW/25wMrjb2TU1wOnzTcgzNd6ohwd4kKLOb/4A78S/RM3uywK/MYa95ie3EZ9ZOWa+W9m7ykb9NhF/Tn2glg7om3m6AFBw/UZimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573879; c=relaxed/simple;
	bh=KDNG/2wpJQZeq8S5TLu0NWutXi3Q9wLLPog1R0POves=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGXbFiBd0eEeh0Mn+1Zs1owxA3b5nqf56aqmn5fzfeflKDCsXewgGMjelbK/PnaF+EVZ9eJGCsTosG/TSLE8/YouqcY0Z986ptF6SFSGaltDSc2lEsHLCJk6TZ1dU52eupHQOGiT+v1EB1HDVP0zcTJEzftN6wG4/t0GG14pmW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b9jzi+wC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A47C16AAE;
	Fri, 16 Jan 2026 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768573879;
	bh=KDNG/2wpJQZeq8S5TLu0NWutXi3Q9wLLPog1R0POves=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9jzi+wCWQlxiZ5Mq7Ke0erqf5WTaAuABFSzCjtxFvMJ+HwhWYt6yB+YyLxcszCMX
	 /9igWc5SBermqeswACuqvT+lf9ZWNJnSoh0zJuD8vBfp5+GOnRhKQGUKKsqbzWL0p0
	 5CAVW3/NN95ywqTUd2+X68PhGl6uzS8DDuJQ2zUw=
Date: Fri, 16 Jan 2026 15:31:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] driver core: make pinctrl_bind_pins() private
Message-ID: <2026011609-jeep-eatable-1d36@gregkh>
References: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108125237.28092-1-bartosz.golaszewski@oss.qualcomm.com>

On Thu, Jan 08, 2026 at 01:52:37PM +0100, Bartosz Golaszewski wrote:
> pinctrl_bind_pins() is only used by driver core (as it should). Move it
> out of the public header into base.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/base/base.h             | 9 +++++++++
>  drivers/base/pinctrl.c          | 2 ++
>  include/linux/pinctrl/devinfo.h | 6 ------
>  3 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

