Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBD72FAB1C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 21:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437882AbhARUMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 15:12:34 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:48897 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394242AbhARUMW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Jan 2021 15:12:22 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l1asG-001txN-Fd; Mon, 18 Jan 2021 21:11:40 +0100
Received: from p5b13a61e.dip0.t-ipconnect.de ([91.19.166.30] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l1asF-001fBC-Rv; Mon, 18 Jan 2021 21:11:40 +0100
Subject: Re: [PATCH v1] sh: Drop ARCH_NR_GPIOS definition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <62a0fa2a-09f3-1159-ce20-176b445d309a@physik.fu-berlin.de>
Date:   Mon, 18 Jan 2021 21:11:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.166.30
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/12/20 5:40 PM, Andy Shevchenko wrote:
> The default by generic header is the same, hence drop unnecessary definition.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/sh/include/asm/gpio.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/sh/include/asm/gpio.h b/arch/sh/include/asm/gpio.h
> index 351918894e86..d643250f0a0f 100644
> --- a/arch/sh/include/asm/gpio.h
> +++ b/arch/sh/include/asm/gpio.h
> @@ -16,7 +16,6 @@
>  #include <cpu/gpio.h>
>  #endif
>  
> -#define ARCH_NR_GPIOS 512
>  #include <asm-generic/gpio.h>
>  
>  #ifdef CONFIG_GPIOLIB

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

