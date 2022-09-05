Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9335AD419
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 15:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238010AbiIENiG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 09:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238030AbiIENh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 09:37:59 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26CC4F193
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 06:37:48 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id se27so17152888ejb.8
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jUSHPPZJyk4AqbZfhLsRsVlNREiAJwnY+UFqpbkWYQk=;
        b=bVwbhl4DGDsrKPcHLrlN+Y+zRp/Q4iW5APcmRJzf2hTU3EiUU1S6afBLdb+FJTIheC
         koBCr5QO8AFpzm0BgmnJZ7eI1mdAghJts5Na6GIDZIgVtG8l6UzaYFQpHw4pnZAwiSZI
         DcGtbNV8dVu/pgExmrqxZLNrwA1r6q6AWpqLks1RvrGFkz7tX4EoUGgEce0UtzjgpSiH
         QFDl7VfHezx4IPIDrHhAU41NmTeYVAB3ZvrOFNGYIYI+AUHG5qJBOkQfK9b6f1Ca9h0g
         k8I1hoMhOQygJDtFcozJx5rv2KjwyxTnNgAbDzK5fIjBhhtHBowMRXq6f2vXBQBuKC1M
         b0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jUSHPPZJyk4AqbZfhLsRsVlNREiAJwnY+UFqpbkWYQk=;
        b=rtJt2241FyNRLthfuOZ2x+DquUFE9R+qq8IYdEnInFC/1ukkLN8zagD4HDyxc6sGue
         eLTRJx8aU6GD9qf4p0sWV4/PRbEre9Z5VF0hF+IaCZMmrIXqKpY8gJxtTTcOQXp0qLiK
         dCADFarMrKXG05ZrIhUr8Bfvcwi+OzBHD0zH1gQyLWc5K3ZBBbHEwtgdUxarY/piwXvX
         6Zn6NlG13tYmi+e7lzDyimbaL/ye+SZVwZ7FJxUHB2TrXieqiSOonq5CFhnDRjSi/yA5
         nF/bEgW/sc6hGxq4aIVJzIC8QV08GpGdpJCL2ueKdRSVrg+MSceAGwf2kaCzP2Pbccw0
         2VhA==
X-Gm-Message-State: ACgBeo3iUsioSRhbfHRFLfwPI2W3j88/tRv5b/cxrxMrJA7EhnnrNOY1
        cQgd+YjeP6Ma4pJ8kfrGyzWL6DQWrkhulSMEFartohfYlu6QGg==
X-Google-Smtp-Source: AA6agR6gu4r2UyRb5PCcSdXUxaMjxKAvdrgNrYAWn2hGazZH0RPMoygCTKbJZmw2RBlM0CjOnpaOUH22adSQrOJGOL4=
X-Received: by 2002:a17:907:a420:b0:765:70a4:c101 with SMTP id
 sg32-20020a170907a42000b0076570a4c101mr5495789ejc.526.1662385066002; Mon, 05
 Sep 2022 06:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <202209050605.fezJUgFH-lkp@intel.com> <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
 <20220905133040.GB6496@francesco-nb.int.toradex.com>
In-Reply-To: <20220905133040.GB6496@francesco-nb.int.toradex.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 15:37:33 +0200
Message-ID: <CACRpkdYKQt8fJ5FaTQgoNgGH73xnC877pQhek5Df1zdSE_c3=w@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] drivers/pinctrl/freescale/pinctrl-imx.c:260:9:
 error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and
 later do not support implicit function declarations
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
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

On Mon, Sep 5, 2022 at 3:30 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
> On Mon, Sep 05, 2022 at 02:36:21PM +0200, Linus Walleij wrote:
> > On Mon, Sep 5, 2022 at 12:25 AM kernel test robot <lkp@intel.com> wrote:
> > > >> drivers/pinctrl/freescale/pinctrl-imx.c:288:23: error: use of undeclared identifier 'pinmux_generic_get_function_name'; did you mean 'pinmux_generic_free_functions'?
> > >            .get_function_name = pinmux_generic_get_function_name,
> > >                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >                                 pinmux_generic_free_functions
> >
> > I don't understand this at all, tried to look at it.
> >
> > Francesco, do you have ideas?
>
> Maybe the reason is that before my change the dependency was on
> ARCH_MXC that cannot be compiled in test, while SOC_IMX8M dependency is
> `depends on ARCH_MXC || COMPILE_TEST` leading to all of these.
>
> The trivial fix would be to have the pinctrl dependency on SOC_IMX8M &&
> ARCH_MXC. I'm not convinced is the smartest way but I think it will
> work. What do you think? Should I send a patch or you have a better
> idea?

Hm:
config: s390-buildonly-randconfig-r001-20220905

S390? Yeah that is indeed the problem.

But I suspect it is because S390 doesn't have HAS_IOMEM.

I would add a depends on HAS_IOMEM to something under
Freescale.

What annoys me is that the core pinmux/pinctrl part should not
depend on HAS_IOMEM... :(

Yours,
Linus Walleij
