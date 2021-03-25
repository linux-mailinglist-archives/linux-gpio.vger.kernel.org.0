Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FDA349879
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 18:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhCYRmY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 13:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhCYRmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 13:42:07 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAD6C06174A;
        Thu, 25 Mar 2021 10:42:07 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E011531A;
        Thu, 25 Mar 2021 17:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E011531A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616694127; bh=eiOqmA3QMARsyKoWBIDtLBhFPqBFbGL9lEPOum8H/+A=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=J3IUjt03Ktv7CZmltrnGS4GiVujKI94bLWicfh5XP4u+HgyeiZ0D4MKrVTG0tvJXs
         Dz/qZCCevl7UYWA1NF4afgWjyRnWv1oyYvEqsxJK23xm8nHxq2WeXOKjjCFgUN6p+9
         PUarYlLE31Ev5BqCmzCyQfG0PMeMX721Dw2X3njVUy+07/I0JkyvkIJPfULeftWYaC
         bbu0taHiz0ySyUtFPG+zi8isnSvsyINs6PqLXOuavAVk7iJE66suJwkzihkh3+g4TU
         syisKOpz+g9UHxfi6Z9HA95Jml5Eu72DMXivb1J4ckxGc7HK+BOqiciLESjHJ1sC/O
         NKtFxoJnNcUow==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, trivial@kernel.org,
        Bryan Brattlof <hello@bryanbrattlof.com>
Subject: Re: [PATCH] Documentation: gpio: chip should be plural
In-Reply-To: <20210323145509.139393-1-hello@bryanbrattlof.com>
References: <20210323145509.139393-1-hello@bryanbrattlof.com>
Date:   Thu, 25 Mar 2021 11:42:06 -0600
Message-ID: <875z1f2kr5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bryan Brattlof <hello@bryanbrattlof.com> writes:

> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
>  Documentation/driver-api/gpio/intro.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/gpio/intro.rst b/Documentation/driver-api/gpio/intro.rst
> index 94dd7185e76e..2e924fb5b3d5 100644
> --- a/Documentation/driver-api/gpio/intro.rst
> +++ b/Documentation/driver-api/gpio/intro.rst
> @@ -27,7 +27,7 @@ What is a GPIO?
>  ===============
>  
>  A "General Purpose Input/Output" (GPIO) is a flexible software-controlled
> -digital signal. They are provided from many kinds of chip, and are familiar
> +digital signal. They are provided from many kinds of chips, and are familiar

Applied, thanks.

jon
