Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1BE151029
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 20:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgBCTOy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 14:14:54 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45738 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgBCTOy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2020 14:14:54 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so8285407pgk.12;
        Mon, 03 Feb 2020 11:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=67RUo5VAnS1jBw3z4FN37Al3dch59aGvRyUe85Cv560=;
        b=TBnue5Xkro016MiGvqjzc0hHNwZWXwY+MgkHMb3vOaVAfkNYCa5JhYLLleLaESeOCz
         QQ083Bb3X1OLPoK/dBvnNvVx8QD3a/Rm+/xSguDzgQ2kYSa8cCb0KCLb2QVcoLl5IwYw
         jf/S+OtHSwsrJHvykAWYBQNLXFbVOC0vd8XNaYhcXFGfBphFJjs9R3SKiFFNOd/68PBU
         TpS3UcGnIKHuIE76P/Omr6GS2pkUdkzX6bLcBMyjL8HxmLpIarzZYwhs1LpucEmyEGhu
         jsJjdchFuHKTPgn/mf/c4njdF/CdcHW056D8Ht4IRexYYhQGAOlPHEZdQnkjJ22Cqx/r
         aG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=67RUo5VAnS1jBw3z4FN37Al3dch59aGvRyUe85Cv560=;
        b=oWcNZE5njVTdgGD6EP7FIEMcB+VQdkFzXQpnmX5es/4dnEQosWsd5HLdyE7gcmrM2A
         HVeD81m1+ouhOnbWCMcW5gRcvyQtkFCtfkwmf+2JWgAtWv/f28FvwiVmyRVfO3rgdP1w
         glO/inx2jDX6AZsUUaWlU/uoNkQYpHrdes7S2bmOyLZYUub6UBAtVtQmwzOhtEi1vSyt
         /HYpyVZkUcWl2bb+GIV1wuQC7t5Ue9lNnatHYZEoxa7F5KKf9qUtNd78Vq20Hwv3p/iX
         /O8qYdd3SHzzTnEhKWS01UFqG/it4NxfhHgquRxamWvg6NzsOHIfTbKkgpDQR+4SqmVj
         MaMQ==
X-Gm-Message-State: APjAAAWHqiq4KggHSj6qld8Xu60fcxdpJ4FjIKL7ALfs7f1WfzGNtc5w
        4thgFf4NPrFFefRTXgDIzd8=
X-Google-Smtp-Source: APXvYqzEPul7LL5SneMmOTU8FN7i4ZYHUNJ4hG6G22GrjI1FlxrIf7P50Kydlnzx8BmmP6zBK+y9aA==
X-Received: by 2002:aa7:86c2:: with SMTP id h2mr7490957pfo.45.1580757293734;
        Mon, 03 Feb 2020 11:14:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f3sm5820108pgs.36.2020.02.03.11.14.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 11:14:53 -0800 (PST)
Date:   Mon, 3 Feb 2020 11:14:51 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/3] gpiolib: fix a regression introduced by
 gpio_do_set_config()
Message-ID: <20200203191451.GA19076@roeck-us.net>
References: <20200203133026.22930-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200203133026.22930-1-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 03, 2020 at 02:30:23PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> These three patches fix a regression introduced by commit d90f36851d65
> ("gpiolib: have a single place of calling set_config()"). We first need
> to revert patches that came on top of it, then apply the actual fix.
> 
> Bartosz Golaszewski (3):
>   Revert "gpiolib: Remove duplicated function gpio_do_set_config()"
>   Revert "gpiolib: remove set but not used variable 'config'"
>   gpiolib: fix gpio_do_set_config()
> 

For the series:

Tested-by: Guenter Roeck <linux@roeck-us.net>

>  drivers/gpio/gpiolib.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> -- 
> 2.23.0
> 
