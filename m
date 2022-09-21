Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC65D5BFD9F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 14:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiIUMRw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 08:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiIUMRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 08:17:51 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E5990182;
        Wed, 21 Sep 2022 05:17:50 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id jm5so4468248plb.13;
        Wed, 21 Sep 2022 05:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yQEQl106UxCLNDrRU5Ec0fakVuZzSSZ95YXKXbXMwDI=;
        b=llHpFpWMl542oRidTrh3Q2V8sA/X51X4hBZgSGBcG232OBZw+DHDbnSTGqGnJ9W+64
         wx1uWlASvDfG7s0ytLl21nMhBXc+Rj0UZCH8hfwTmrfeZIYJ7CRsWoEAcfmMVkvMorUg
         Z9CrNO6Zg63Yfs665u84X0FbZ+gkr7bz2BGsNVioV7x4iMB/XOmVn3X9Ta1O++4/J+qu
         EzfgSW1HTvoqTkr6f4/u1D2BLfAH0YP3/NTNqHerktA3Ama/SpP2+qhWglius5/548QZ
         6WyswJx+oSXwODejaHtfQffQv3c/OjEXyPWidbUunoj5doSvEk7DYna/Bxjk/HqF+FLQ
         tr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yQEQl106UxCLNDrRU5Ec0fakVuZzSSZ95YXKXbXMwDI=;
        b=1eZuQ6a5E9fENpPT4ihJTdhtts53aRM2+tHkJ1G1OauNNczkhTT/Vzh8ZB0BG5UGZ9
         rT1M7nhpUJtFak58CHES+7vO2YfiWpBA/NaUy1g7Bw/h23ise9KIoOd0Sph85ccXou40
         jM4PzhOM8pBoCALAHqaRhoP8Yz2807wCw/Y86jlP2ccx63CQhnAaoM75iMiY2NvVj4ct
         aO6QedB2xaKGgey4DEldPdKMYclRFQn6YFQX98Q9NSSt+J47dyV2+Cuszq3RWrI7kDJE
         UkMZmt4kSurB+KzarNFrVtt8BL6D6qmMrSgYQkeJlJC1j0CrWNV/gVdZqVzD8Scw7Ats
         TS1A==
X-Gm-Message-State: ACrzQf2i0r+peDiiGg8S/oJ709GDiFWOUPOhCuDPPbTO5rXfbxYtIW11
        BtLLGTfZZbu5wPQmcYD2JCa+nbg4YgkmIvf3yFo=
X-Google-Smtp-Source: AMsMyM570xNfwvPtv3OXPugB5tTGKMp1/BSAJewVFxjd/V+wkejWeW5hiQ5/qDeiHxpn0b3C50gG2EHCDx7GLqsFtAg=
X-Received: by 2002:a17:902:eb82:b0:176:c0e0:55c1 with SMTP id
 q2-20020a170902eb8200b00176c0e055c1mr4497109plg.168.1663762669881; Wed, 21
 Sep 2022 05:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <632a0af0.170a0220.966bf.0c66@mx.google.com> <CAOMZO5BCGpKVr75qDncDW4-eVLWeDJoPZft5Lh4_ikVHGLb1wQ@mail.gmail.com>
 <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
In-Reply-To: <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 21 Sep 2022 09:17:38 -0300
Message-ID: <CAOMZO5BObC4MwcA=XdtRVmhtZdH4m++vLRoerDhbdw18KNnA+g@mail.gmail.com>
Subject: Re: next/master baseline: 539 runs, 389 regressions (next-20220920)
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "kernelci@groups.io" <kernelci@groups.io>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Guillaume,

On Wed, Sep 21, 2022 at 6:18 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 21/09/2022 04:48, Fabio Estevam wrote:
> > Hi,
> >
> > On Tue, Sep 20, 2022 at 3:48 PM kernelci.org bot <bot@kernelci.org> wrote:
> >>
> >> next/master baseline: 539 runs, 389 regressions (next-20220920)
> >
> > Does anyone know which commit caused such a massive regression?
> >
> > Looks like it is gpiod_get_index related.
>
> There's a bisection report, does it look like it?

Sorry, I missed the git-bisect results in the original email.

Just noticed a fix for this problem on today's linux-next, so we are
all good, thanks:

commit 8b10ca2f7551e024b60ab5e27d3e3630c029000a
Author: Michael Walle <michael@walle.cc>
Date:   Fri Sep 16 13:01:18 2022 +0200

    gpiolib: fix OOB access in quirk callbacks

    Commit a2b5e207cade ("gpiolib: rework quirk handling in of_find_gpio()")
    introduced an array of quirk functions which get iterated over. But a
    sentinal value is missing. Add it.

    Fixes: a2b5e207cade ("gpiolib: rework quirk handling in of_find_gpio()")
    Signed-off-by: Michael Walle <michael@walle.cc>
    Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
    Tested-by: Conor Dooley <conor.dooley@microchip.com>
    Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
    Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
    Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
    Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
