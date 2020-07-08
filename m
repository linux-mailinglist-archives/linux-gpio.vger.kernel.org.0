Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB4D2180A6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730177AbgGHHSA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729825AbgGHHSA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:18:00 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F60C08C5DC
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:17:59 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 9so52887784ljv.5
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cAFIrZ8F/mBJqkJAYIueoajWvUWkQCtRnV1fgyx+lWQ=;
        b=aq4/cPjLKxizsfEDEFrsZ9DGzsV8/Xzod02YigHVJC6RddJnaepE6YlWiJY9FFJpoC
         54aDpJB5eued3sHz2mnYw22r4dsoPVbdRXnUuhdPiqFAYguZh3C6B2Ideqix5JIthSS0
         PlpC1PCg6Wpltv0HD/zgILAzRytUTjKO/gr+Kyic5mSyz0EIpvQAd+p/xK5CE3bMh26O
         b7cdMK77tPPi9Imv+wDRBZTIALJUzVSkNKQSx+9QaJASHLFc8IW3LVLarMFs3dUJWc68
         dwtTUUpKJcA2BwQ1sgaZDbmvzkG6jQkIv0iMDa7BmKGEBohIAFop4idQonc4huMd/wzd
         /PNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cAFIrZ8F/mBJqkJAYIueoajWvUWkQCtRnV1fgyx+lWQ=;
        b=MZ6CorEbx55SNb2mUF6QM3YB8QsJXGe4W2hitF9KmiaOIAYFfj37nA7H/IorQxzpvr
         3mGV4LPJSrxHRh5DSkQ36aAOLo8tfQy4sXQ+4fzbkaZoMQjwJnIQjVO47L6Yje1eejII
         q7dZZCmWW0ApZY4fd4vqrWUiWnnO6SiLgYuVTzWlcI8Def/AjSRGpRbTDM89g+N9ApYk
         35RYD+vBCpRQjVRh9AwDn7zsWVQuafKTA3XHOB/Uui6fjq09cVlRhBGyiCEtn8YAnBNL
         5XNnX5nuDUHlaBJ9ee+z2jzXOLuyB9N/Y39CHmqqdt7skJEWEC5K7tzl41uwUYYM3yAi
         TycQ==
X-Gm-Message-State: AOAM531ETaUJ/BJJxogdLLmcViRh6O08YBW4YulhUXyH1Y4ZsnwV00u7
        rEDoHkiaosXKI6mKAjrFtKbVuTjdy54rmrlL/5sd5g==
X-Google-Smtp-Source: ABdhPJylJBqgZ7fRWLwWIlGt4A5bo/2LK2Oljqk21UeArICbItF5N+VoFDh+vaO83CgV2n/EdrLLeJelnkHFnIetLCI=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr18618352ljg.100.1594192678178;
 Wed, 08 Jul 2020 00:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-6-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-6-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:17:47 +0200
Message-ID: <CACRpkdaUQkS5vfkQ1GsssWY7gGgz8N1-Ng6_HugGWMxuQxSysg@mail.gmail.com>
Subject: Re: [PATCH 05/10] gpio: gpio-sama5d2-piobu: Demote all kerneldoc
 headers to basic comment blocks
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Andrei Stefanescu <andrei.stefanescu@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:33 PM Lee Jones <lee.jones@linaro.org> wrote:

> No attempt has been made to provide proper descriptions for each of
> the function arguments throughout the file.  Simply demote all
> kerneldoc headers to basic function headers.
(...)
>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Andrei Stefanescu <andrei.stefanescu@microchip.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij
