Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFBD1F1878
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 14:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbgFHMHj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 08:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgFHMHj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 08:07:39 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED437C08C5C2
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 05:07:38 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z9so20107344ljh.13
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D/qQ2HQfxTsoJ7dED6Ll4k5xtZ49R0eYt0PrrCkdekg=;
        b=dXrNihZHxrlgg0ZVuh5iDRdS0PSRlGxUmjyOhMdSGaLuoVb0KJE0CRuSvL+qX2IrdZ
         4iH/i8b9Q0hzPOnJg0UGhJzw+DErm+DVr+GuTUY3usetzQakc5u9GHIzF0xDM7UkPYdL
         noFc+mBbYVtHeUhPCvN+elLUjqoGkRX2W9rMxZLQwdVZHw+9mdsvaXlWmrCi83RpKmKl
         OAczotPNGkMGD8D1Ho6tevZf0BVykviuzMO2yo5h5r9g4XHmh8//uzx65WS3WSyQcd5R
         RhF2Q+1jsykqYXUwWJ91kBuirXP98vxB+8FoxesFhPy3/tgI44tH7Q2WyLgUz1W5l9N6
         AGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D/qQ2HQfxTsoJ7dED6Ll4k5xtZ49R0eYt0PrrCkdekg=;
        b=KZIb2uzr8RBRRrrW8g2tGhrrrq5qYuKNhtNydwndVxFP/9HZPjQfMvsk+q+82YkaKh
         lKr7pQsxbD1xrn1eb8GWtXwKj/hv9kM+ann1lki4AhJSdT09ipQFydFhCltnKtht+Z3u
         WToYTIs6S1peByRJEY5a5vH/9H3Nf7wOwHMCGebUg5TibiDu0NFcaSpZ7F1hz4VIKq+0
         7EUBDYb55TCcWfB4xjbMdg1uqnsN/uYb8Ny7ocdXo4mWxEZW35BMLnx6hEdc7Aehky3v
         WUud+EItroo0FnAkLEM1zuzOxCtJHz3KUT9HRecFYDIbJ7NAtG21TntA5m74/2VO8FUI
         y3UA==
X-Gm-Message-State: AOAM53010zsavLb1QMLDRmgPs3dajACbNEZlDdkompPNF+ePCwJGq45u
        rJMibrWuTz7ysueNEhogYa9GNE5jkIUyR5aWAm5LDg==
X-Google-Smtp-Source: ABdhPJxcmxiJOb9LbDnUYMHnqR3xGRyWKQQ6MvgFlurSgSedWuMdM4etCtorHwAIdzEHNlnCb2Kgpp9dI8wCD0bjVkI=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr11746949ljc.100.1591618057076;
 Mon, 08 Jun 2020 05:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_77C7CDDE75557AA90115A0DF43576105390A@qq.com>
In-Reply-To: <tencent_77C7CDDE75557AA90115A0DF43576105390A@qq.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 Jun 2020 14:07:24 +0200
Message-ID: <CACRpkdYMHWWuuH7rNGRhtxA5tkZ=ktsbeo=FTJ7YnpYAFgPsjQ@mail.gmail.com>
Subject: Re: gpiolib: Add some warn print for easier to debug
To:     =?UTF-8?B?5LmU5pif?= <mnlife@foxmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     bgolaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi mnlfie,

thanks for your patch!

On Fri, May 29, 2020 at 4:57 PM =E4=B9=94=E6=98=9F <mnlife@foxmail.com> wro=
te:
>
> From d25875d0a6808713f891fa5bafc313d50f317a52 Mon Sep 17 00:00:00 2001
> From: mnlife <mnlife@foxmail.com>
> Date: Fri, 29 May 2020 22:02:55 +0800
> Subject: [PATCH] gpiolib: Add some warn print for easier to debug
> Content-Type: text/plain; charset=3D"utf-8"
>
>     when I get gpiod optional failed, I am Confused for a long time.
> finally i find because of the string con_id is too long,
> prop_name be truncated.
>
> Signed-off-by: mnlife <mnlife@foxmail.com>

This makes sense.

> - char prop_name[32]; /* 32 is max size of property name */
> + char prop_name[48]; /* 48 is max size of property name */

But your patch also increase the allowed prop name to 48
from 32.

What is this name really, why is it so long?

I'd like to ask the DT maintainers what a proper length
measure of the *-gpios property may be.

The warning print is a good suggestion, please send a
patch for just that. And another patch for extending the
property length.

Yours,
Linus Walleij
