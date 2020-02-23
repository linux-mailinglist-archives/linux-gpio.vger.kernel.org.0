Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 089261699E7
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2020 21:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgBWUWb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Feb 2020 15:22:31 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39406 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgBWUWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Feb 2020 15:22:30 -0500
Received: by mail-qk1-f196.google.com with SMTP id e16so4169996qkl.6
        for <linux-gpio@vger.kernel.org>; Sun, 23 Feb 2020 12:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lVyMdZhCk+sORVIrUQaBVSmaLB9ffzyY3HC5ai8Eoms=;
        b=hDP5rY8TIoLw6Jo6H42eHUp9TSa+DpqwknE0lBMKpV5egFdFq8VKo71g057hDFfAkQ
         z44PkvJJYcbkFwPkHGZiatzUXFV5yhSDDHrMru0Z98EtNsKe5SmXAGia76o9EAegKUGc
         v8acKrc4K/7mV3p6BXQl2j6/np1XIuvYLc7rqckAsx2xWBXYNfaVq4kTyGkRnK4w2RXx
         je4S7tHExunR+6aEpQxSRh0XYrm36XTsssugCKONyCHXk2gLrBUW7gdyciZhl8tcLNIB
         JczKJG97toLd/VYICNXHXAT7e607XOTenDr3cuKtE/hLrrpNtLSbEQbdYVRXd4qTx3se
         u7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lVyMdZhCk+sORVIrUQaBVSmaLB9ffzyY3HC5ai8Eoms=;
        b=duMewRJtL7X18/Lu04W6K9fg2jIJr5IOnZ9xWRYKE7V8WJNFug2UCNdemUXYrKIXNY
         9gT5OvddsEHNv0XP2JlctUJbuvN1Nv9AD3jaisl773lS0p2UBqzEtiCyF5n2LTAToeWD
         wqsX4WwQwtatRBUEATI/G//bmshwRg3a+1zkbyQIkHHoPfqauizM4rqRWvsuPVph3EPQ
         UFVV0PSv29Q61wMArfhNLPJ5WDVnG9OviA82+Lg+izUt3yYqCkfR0Khzg2gO68gbwiPQ
         caGU1mGj2NYn5TT2AiV0mZxU/oRO+TF2pNRdobpRxe6EJ8nyRjls1S7aKOW6joYF1glD
         vexA==
X-Gm-Message-State: APjAAAXGH0x3Bsodj6NNjmWcLS6AcN1I/ax30RLEiqF5EMTXJxyw8x1v
        k5rXtQnjerWJuzwTTwCFmv65YxsxQmeC8bnjJadCVw==
X-Google-Smtp-Source: APXvYqxW2o35WeeSHbRu9o3bme64N+2sQl4PTvPjNiDoHlNHfcCUAX/+j6mq1xRGvd3x1xws7ROQ+jm1IesYZfOuLVY=
X-Received: by 2002:a37:9e51:: with SMTP id h78mr44838191qke.323.1582489349108;
 Sun, 23 Feb 2020 12:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20200220100141.5905-4-brgl@bgdev.pl> <202002221921.euxJGwes%lkp@intel.com>
In-Reply-To: <202002221921.euxJGwes%lkp@intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 23 Feb 2020 21:22:18 +0100
Message-ID: <CAMpxmJVmp-=WiNQXu-dQzP+9D5ipv6muSd-auwzeZSV0e9+jgA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] nvmem: increase the reference count of a gpio
 passed over config
To:     kbuild test robot <lkp@intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, kbuild-all@lists.01.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 22 lut 2020 o 12:54 kbuild test robot <lkp@intel.com> napisa=C5=82(a)=
:
>
> Hi Bartosz,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on next-20200221]
> [also build test ERROR on v5.6-rc2]
> [cannot apply to gpio/for-next linus/master v5.6-rc2 v5.6-rc1 v5.5]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/nvme=
m-gpio-fix-resource-management/20200222-054341
> base:    bee46b309a13ca158c99c325d0408fb2f0db207f
> config: sparc-defconfig (attached as .config)
> compiler: sparc-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsparc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/nvmem/core.c: In function 'nvmem_register':
> >> drivers/nvmem/core.c:352:20: error: implicit declaration of function '=
gpiod_ref'; did you mean 'gpiod_get'? [-Werror=3Dimplicit-function-declarat=
ion]
>       nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
>                        ^~~~~~~~~
>                        gpiod_get
>    drivers/nvmem/core.c:352:18: warning: assignment makes pointer from in=
teger without a cast [-Wint-conversion]
>       nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
>                      ^
>    cc1: some warnings being treated as errors
>
> vim +352 drivers/nvmem/core.c
>

Of course I forgot to add the stub...

Will fix in next iteration.

Bart
