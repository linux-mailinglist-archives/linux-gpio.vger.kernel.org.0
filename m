Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFFAE6B03C0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 11:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjCHKKR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 05:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjCHKKN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 05:10:13 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C9991B5F
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 02:10:10 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id x1so10828625uav.9
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 02:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678270210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DrvKmTCpE7uAoJEWZzCKuE16mqzvlemJ+qfB2OaWpQ=;
        b=uo5zMLDW8IVqMOU19c8BccS812bA9YFxpC+yCwRZf8M+YJ+MNbGaQCSnGDC9mVwjT7
         5afcfY2+nwtltph3jCiSUyk/BEy+DFl9SnJl6Oxe6zDFtmoG+ge6kFeCb7QO/0VSy2+r
         Y1T99QhCih5qHf88s69KFz7Gm4FPJqU5K6rQiAnvJUD7zGu/+EowHPxqzYAR3fkytd6O
         RuW3arWBGs1aSfEOqJRhASBiRarzY7MjvFF5vAibLF9TlsxawMXC9QSn53tBkHq18EVr
         Wq+/nM1EPLOJLJvSV3OBmmVwkpBwAfM83lBqW4xl6h+EX36Sb/WFlIoIDqzk5Taw118b
         An9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678270210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DrvKmTCpE7uAoJEWZzCKuE16mqzvlemJ+qfB2OaWpQ=;
        b=VZqT4Vgfs5G6/Qst51lVDyi0A4uvvLKa4dnHI265j6tAg3GQeKpEfc+Xm0SWPXMedX
         8zZUywhsMSp9ed34mrlbvHFEOhk4mUNCBXPSBwGouvzfNkeLsszp1qvFgAiQcWpILueR
         7k11G+/qs0cfTZHtbvs22A9yxbEOIFXhslDeQt0qjapV0o4T4fnUf1PWD0BtZBwVmNOA
         csQjYdzbmYGvp2zVBZcuTfqEPjGNUkaeTuiPDLu/lvu7C06EwKQ6OhWjIVmAZRxG8X0S
         ZEWO2/HYLfpO1i3O+SuMVhYVvcp3OyOpVULlwLy/gcJChc60HYGP3dqQukTHCqajP/zE
         mn9A==
X-Gm-Message-State: AO0yUKWlzxk2cAYpvdCHa4SYyfBmMCj8Rb4WZBj7Y+4chTRZBfjfRxcl
        bh8YrBfTLblskmlIVHSBJP1q812HyaxpL+H2F5/fZQ==
X-Google-Smtp-Source: AK7set80ncXBnkSgplb9fymQmx/uYA0e8uVA+kFihVtOPyIs0aaa2pZS87ljjf1cK4XbOcxaRsknSxbjhghhCTbdZLg=
X-Received: by 2002:a1f:c847:0:b0:411:ff57:d3b9 with SMTP id
 y68-20020a1fc847000000b00411ff57d3b9mr10188701vkf.2.1678270209897; Wed, 08
 Mar 2023 02:10:09 -0800 (PST)
MIME-Version: 1.0
References: <ZAc7VMQouzAB/Sk+@black.fi.intel.com>
In-Reply-To: <ZAc7VMQouzAB/Sk+@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Mar 2023 11:09:58 +0100
Message-ID: <CAMRc=Md42eZt7YUBuVajBVLQXP7M-J5H9yQ1jtYirASwLc9J8A@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.4-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 2:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO maintainers et al.,
>
> Combined series to clean up headers in the GPIO library and drivers.
> Along with it, drop a few unused legacy APIs.
>
> This tag is immutable, enjoy!
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git=
 tags/intel-gpio-v6.4-1
>
> for you to fetch changes up to 380c7ba3923c6e471aff0f951a6cf42e8dec2c79:
>
>   gpiolib: Clean up headers (2023-03-06 12:33:02 +0200)
>

Pulled, thanks!

Bart
