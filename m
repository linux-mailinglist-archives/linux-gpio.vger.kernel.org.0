Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2E3221E53
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 10:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgGPI3o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 04:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPI3n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 04:29:43 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F536C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 01:29:43 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c11so2833695lfh.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 01:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RIvYGgc3AWYL9t/PPjxEqzhf0Uz8qjsU9oD7id6FBrM=;
        b=K+2/WEYtBuq7Z4qo2jssKjLN0mwcrN3xN8nJGpXjrXSGVvrJsvHsZr5GrJemdGgk0b
         zW9SyOlOyJuuVPEsA2O66uPZg4RsArciZNomgnIOL3TyeWBi4mneipd1ojz6SDb7B61J
         DNjysH51FBrHzetwhgp0POlCgIop65RfW002wSPH1n76wxIsUWVeC4LQQdO1sWYydmd1
         HuxW3Op+Y4aGvcMgQt6sG2H+0q7MqjDTg2m8qgcgeD/fBXtv0iqGlvmp5XYJ8WlvShLV
         nixnkx7qC7kowxv5pW90Ah22KD205aVT9nVuI3gwwMsuNI8dyndO7bfSyYG3P3OSILZ7
         3LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIvYGgc3AWYL9t/PPjxEqzhf0Uz8qjsU9oD7id6FBrM=;
        b=h5JYG/A1un/hqcoDpFX9pLPDD6uzu16haJaioQivMetq0idx0os86iO7NWSNKizfSb
         Ry6FonJe6QXkgfE1A2W5TOc8UJw63Df5ZbfZljHt+0gKY/31ZzEgVvmGOY2moMHWcUUO
         ULtYdDTgh9r1sucQXae+0D2cFeXFP70kNpZPT8Trxg8TKwgyU/AWfZ92JT44jXgfGvRc
         7JMf7jQd3OMA3zq32sqBT3qhdjGrl5dr+E6XqU773HTnnevmpQe0x7kA3u4++bIH6hYt
         whHNu8uj9xrd/IJVZ3IGSXcHDOZjlyY02aBMpUnBNoYBCibHv4haXHT82JhakibPKO01
         lOXg==
X-Gm-Message-State: AOAM530ZHk5lFU2g+Qap8w5ahaABhos2LKeUApv7Js/Uf5buvzluV5pi
        JVb8LvHNXBnvqUPDEM0psVl/0j3eP376m7Ocwhrubg==
X-Google-Smtp-Source: ABdhPJyXhDreAzwgZFefGWPzmSbLqYRy79aNEPej7SonLuuPOD/YG4qmCbrYZANZGM2ALJgrHRFp44Krvi1Zl5DJUbU=
X-Received: by 2002:a19:70d:: with SMTP id 13mr1472315lfh.194.1594888181928;
 Thu, 16 Jul 2020 01:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200715213738.1640030-1-drew@beagleboard.org>
In-Reply-To: <20200715213738.1640030-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 10:29:30 +0200
Message-ID: <CACRpkdZ+Bm4MsyaJJ89q7_KfgmyQWyJ57SC3F38gxTbsOfwNTA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle pin config bias flags
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 15, 2020 at 11:37 PM Drew Fustini <drew@beagleboard.org> wrote:

> Modify omap_gpio_set_config() to handle pin config bias flags by calling
> gpiochip_generic_config().
>
> The pin group for the gpio line must have the corresponding pinconf
> properties:
>
> PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
>
> This is necessary for pcs_pinconf_set() to find the requested bias
> parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.
>
> Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

This v2 version applied!

Yours,
Linus Walleij
