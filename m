Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A286365D8
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 17:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbiKWQaZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 11:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236601AbiKWQaY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 11:30:24 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1951C1007A
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 08:30:23 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id i131so21440319ybc.9
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 08:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5iELkw5vCNW3WN6W/KE81SmHIlacrKw4q765aXBAO20=;
        b=tTLNv2bAOnB7ruAP0FieQk5nhcnM9w5MvIGKuS2eeFv5GxUWmZgiPOla5vHARrehwl
         f0+zCJ6Wy3DqR90+tAUJax+39S4d0133XUQ2uTLLgarT9uii3G55M6yhIwb+rwwFjLNv
         iGtvoGAu5QJjSYXISID/c7z1cQRVn99PfPdO5eMzDIkpNr5rFo235fEEKXPIO/djpuXU
         0nWHBee7m9clhF65j4YuzyE8MphVJIfc9YwzaPUJNQOW5qzl0H1/T/wrVN/uSBWUPTi8
         /Pl3elslP+a4NovJNymfyRFv0I5DozgKm2dz7DpWaBxHksYg8SsGlsdzEgrcrFfejJ6J
         UyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iELkw5vCNW3WN6W/KE81SmHIlacrKw4q765aXBAO20=;
        b=iWqwEDO3yE+uBmAiQqOtM/q8G2DydNo6/DNpQx7QpgsiDsi22G87y78s24KbKe6n9h
         OAl68iGF/Y3sYRjhO3nLc+yXsQgmnuSLJpQqcCMzVtPNHLo8R9BcRLptenWjlEpxCsuN
         yuFrFA8N0adIHHNHf6KmLJWEwz6M/DObatkUzlGXOSjFSQrKHmIjUDL0foSRZZ0l7oPV
         ikJ/PD5NzJ+aQlhotbvviyStBa6G4Esspkxp/avKJ6PVpLvQ1+sjZ6dkV3t82NYzKwUq
         xkaRUb78s+UgNr+9gg3vwXl2nsPVyDI03Q5UdAPTNzaw5goWrdiQGwgY9lxbgb/MPZiy
         CyAw==
X-Gm-Message-State: ANoB5plL0jFBWAeO50aGf9Zww6UCULYg3Ms93ICi9zTbQmOI0bypJXXZ
        v5YF8IJUIYSp8q9RcKb6eI4HLlTXTyeI/CYTSaz93w==
X-Google-Smtp-Source: AA0mqf569QCE+MWM0v1v+JM5Zq53zSxeY91vaYogzbrr/hmgBDIQZD2oWK9eWbXoxV8jHkiVQmtNTCS6vUhvZ+osmPk=
X-Received: by 2002:a25:73ca:0:b0:6d2:1a07:d35b with SMTP id
 o193-20020a2573ca000000b006d21a07d35bmr8768692ybc.518.1669221017651; Wed, 23
 Nov 2022 08:30:17 -0800 (PST)
MIME-Version: 1.0
References: <202211232331.BVAg4Q0c-lkp@intel.com> <CAMuHMdUuyGPDDE=xZQd3_Ne1DbiU+1vEXB5XuicOz6zM73tvPA@mail.gmail.com>
In-Reply-To: <CAMuHMdUuyGPDDE=xZQd3_Ne1DbiU+1vEXB5XuicOz6zM73tvPA@mail.gmail.com>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Wed, 23 Nov 2022 17:30:06 +0100
Message-ID: <CACMJSetN2_0o0jdxrCPSdA=51iObKnhfcFTTKPG0FkBQs-gXkg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 56/58] drivers/gpio/gpio-max732x.c:613:42:
 warning: initialization of 'const struct i2c_device_id *' from 'int' makes
 pointer from integer without a cast
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kernel test robot <lkp@intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 23 Nov 2022 at 17:09, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Wed, Nov 23, 2022 at 4:49 PM kernel test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
> > head:   3687a82b1db1c827cc4b367e3efde3235f68d9f6
> > commit: 95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc [56/58] gpio: max732x: Convert to i2c's .probe_new()
> > config: m68k-allyesconfig
> > compiler: m68k-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc
> >         git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> >         git fetch --no-tags brgl gpio/for-next
> >         git checkout 95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpio/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/gpio/gpio-max732x.c: In function 'max732x_probe':
> >    drivers/gpio/gpio-max732x.c:613:42: error: implicit declaration of function 'i2c_client_get_device_id'; did you mean 'i2c_get_device_id'? [-Werror=implicit-function-declaration]
> >      613 |         const struct i2c_device_id *id = i2c_client_get_device_id(client);
> >          |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
> >          |                                          i2c_get_device_id
> > >> drivers/gpio/gpio-max732x.c:613:42: warning: initialization of 'const struct i2c_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> >    cc1: some warnings being treated as errors
> >
> >
> > vim +613 drivers/gpio/gpio-max732x.c
> >
> >    610
> >    611  static int max732x_probe(struct i2c_client *client)
> >    612  {
> >  > 613          const struct i2c_device_id *id = i2c_client_get_device_id(client);
>
> Depends on commit 662233731d66cf41 ("i2c: core: Introduce
> i2c_client_get_device_id helper function") in i2c/i2c/for-next?
>

Yes, already backed those out. Thanks.

Bart
