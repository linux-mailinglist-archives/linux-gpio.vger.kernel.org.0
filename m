Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F9B30F425
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 14:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhBDNsE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 08:48:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:49262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236332AbhBDNrq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Feb 2021 08:47:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CAD564F10;
        Thu,  4 Feb 2021 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612446423;
        bh=9Ehsbnk5YKiuuZlVYj2HP71i+SsiSDDQUCHfr3hsUEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wa34LdlgUs61/nt5WPh+wuAJg36qADW0I0RSzmDhyCLssKz6AGY0avfG/+rrXPIzb
         AQmdypt4RKTk4Cgsq615vTkCgPLeWBRZH+l3+sSTiHDgVsO6L3a3uZHbOKtCtiKFqc
         zSW+HuZJN2HiFmPsZV+i4nPI5Y7VEs62Sa8x0Xb4=
Date:   Thu, 4 Feb 2021 14:47:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: uapi: use the preferred SPDX license identifier
Message-ID: <YBv61eNnVksYq9mr@kroah.com>
References: <20210204124357.3817-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204124357.3817-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 04, 2021 at 01:43:57PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> GPL-2.0 license identifier is deprecated, let's use the preferred
> identifier: GPL-2.0-only.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> Hi Kent, Greg,
> 
> I started working on making libgpiod licensing reuse-compliant and noticed
> that the reuse-tool is telling me that the GPL-2.0 SPDX identifier in the
> GPIO uapi header is deprecated. Since I'm required to copy the header
> verbatim into libgpiod's repository, I think we need to fix that at source
> first.
> 
>  include/uapi/linux/gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index e4eb0b8c5cf9..3e01ededbf36 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */

No, there is no need to convert the kernel to the "latest" spdx level,
when we started out there was no "-only" nonsense (hint no other license
has that crud), and "GPL-2.0" is a totally valid summary of the license.

So please don't go changing it all in-kernel, that way lies madness.
Let's finish fixing up ALL kernel files before worrying about what SPDX
"version" we are at.

thanks,

greg k-h
