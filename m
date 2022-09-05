Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7115AD333
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 14:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238157AbiIEMm2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 08:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238295AbiIEMmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 08:42:07 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1524248CB
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 05:36:33 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id b16so11198947edd.4
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=900qLev0HP2fBH7rq575LnJFZP9jyPqICwWUhKfzk+U=;
        b=y1JfjI3xJ3OCyS31b8gIKIU19z+rKq7VQH1FHcnAULKSopUIS4K9cwKzPg8qtXMyml
         qsXU/5UoBTYbc6ZoPeodmzhT1zCnJkv9V8R/33XqmE6eXG9SxAeuXiyU8NuJQVymb1GL
         COKJL+9MPKIN2pknhJMad3dPzYbp4DEYsu503JfjNdE1FZd5cGRakisitFmdPsWTjrHb
         JrO8uE4zj9JreLLNneTSzuuuD0OM3ojs8udWihb1BvbDs9uTsIjJnu1UMAWRiwSV+lwB
         WahO29XKp16EC676NMqm0iqWYlqk86lGVS6ckV/MQWLncJLqvIVI/yyS1+e7pXOHfa13
         RZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=900qLev0HP2fBH7rq575LnJFZP9jyPqICwWUhKfzk+U=;
        b=7QVM32gZMN8ws6sZ2xQ16q2ZQt2/HfX/sfxYdtjQR313SKZEypQpiEA7q9frdMKMYY
         9+kF2oQaZR98KT3LhmfZSyT12m8nP7Ord+K0m9uLJ8vCzvAHP8WazGYNsPRE8HS/IjO2
         X52Smor7dWRUjgmQoprCi0PMuOGAqj/xLkrX+AGnX+KbfbmK1N+RtO+PPjo/Tmobha1A
         dBYkE53/l4egd17mXlTDDyS6wC6MgaCuAkYSUrxGu1RSXurJZyd7wz6g7Gzfa2ej1dBx
         +/ZvMhv8I8rR+woun01Z7cHpE0D/lct569omV4+FOFzuAE+eijRtTzzWBmybYeKmfdfa
         rsog==
X-Gm-Message-State: ACgBeo1kr+Ry4TQ+UlLJJS4omNj/OtROux2dmcmT4fKTltEWadfZGzdx
        yfknqHBGtjlOssdfqkeImalTlamfY/BO4HAxbqBYZBrHs8s=
X-Google-Smtp-Source: AA6agR5cCLDRgOKuhd4hgd5RaH7+P8RYaBOTkQOYqiCq+Ki7426Pt4njNv60Bl748xkUzYSiDI20q8VRfWs7AkPoZm8=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr42938602edb.46.1662381392019; Mon, 05
 Sep 2022 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <202209050605.fezJUgFH-lkp@intel.com>
In-Reply-To: <202209050605.fezJUgFH-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 14:36:21 +0200
Message-ID: <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] drivers/pinctrl/freescale/pinctrl-imx.c:260:9:
 error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and
 later do not support implicit function declarations
To:     kernel test robot <lkp@intel.com>
Cc:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 12:25 AM kernel test robot <lkp@intel.com> wrote:


> >> drivers/pinctrl/freescale/pinctrl-imx.c:288:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
>            .get_function_name = pinmux_generic_get_function_name,
>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                 pinmux_generic_free_functions

I don't understand this at all, tried to look at it.

Francesco, do you have ideas?

Yours,
Linus Walleij
