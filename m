Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30663304097
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 15:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405911AbhAZOjD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 09:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405923AbhAZOiy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 09:38:54 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1943C0698C3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 06:38:13 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id e18so1664801lja.12
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 06:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mKIVrzmqYUOvXvYljgTLycglNQxxvxzLssnCcG00JUE=;
        b=Z61ZcYoI1wrAA2mUhS9tDAPopdVOwoZrn8/a/Ig5EK6aUcGMd9YMpTDEIJAmlE938/
         SlHTZ44Z9lRUPUa9HCov9cqK/v7goeGYiErAp3Oy6y9UpyDz1rj94wfD4sObnMG7lcUv
         nNvw3EjqCRjrihEGHJMxhW8pERPsGBYOkQtvbaxKIvm3VduiCBjUdy5M52HaxkvFctne
         vSlG9iQpScJKexeKBHKtlEKi7kWTKLo0GP6ZHHz3ZlyBP00YvQ4qSELb9UxI0JrWITDr
         G1Em0wQmKjj8HNIYESfekCWlED0O01yIA3DXfBKzKSikOr6RMlpR42K4+U5Mfimf63/+
         eruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mKIVrzmqYUOvXvYljgTLycglNQxxvxzLssnCcG00JUE=;
        b=FzCsGXShW6nzTGYYDXeqk5b2CfOwnYHSmwBg6DRw1eUoj0cljCmyGRJhGqP8GkzUXc
         RupjZudSa7IE3Bu1KzQo87kUeTVk9ePfIjuBF4gnDlfCOK77w/ni9BBhPlcAJqmj40bs
         o+T53BsQsALrTVdV4pAPNV1oFMv0rZUlz3HJn/OUW4oglULcslw+Sea7+eLF0I6aweVA
         8sFy2rlB6Mj0JpgKtBuGpXh29qet05PTp6jnCth283GhLrRln0Vlhh1vVIgw2MCjA/Se
         rCJd0mRVMLRYUjTtmfynLP/tlxhiLgB2h+kCxyeSx/kiiioWxrIFF/780XMUyGoUNi7W
         jm2g==
X-Gm-Message-State: AOAM530D4liKu8rybaTCnaPV4R4foOWc5L6SVxUMdjlY1Csagw7eP4sZ
        upb+rY/f1x+apKddny1RDWZs+tMA96y2RV2eWMGh6Q==
X-Google-Smtp-Source: ABdhPJyemHxtbuIKrWt6zcfpiDcidxt1bc0PXtDRpoE+INHQ4W2AhKMrkiTsUyU018gju4xH9/T2mSZglBVVR+UVjYM=
X-Received: by 2002:a2e:b4cd:: with SMTP id r13mr3126644ljm.273.1611671892242;
 Tue, 26 Jan 2021 06:38:12 -0800 (PST)
MIME-Version: 1.0
References: <1611569954-23279-1-git-send-email-claudiu.beznea@microchip.com>
In-Reply-To: <1611569954-23279-1-git-send-email-claudiu.beznea@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 15:38:01 +0100
Message-ID: <CACRpkdahc-YuqFQR_EBqOw0t3GK=7R7FxYxgE51SOvmCnvyBkw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: at91-pio4: add support for slew-rate
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 11:19 AM Claudiu Beznea
<claudiu.beznea@microchip.com> wrote:

> This series adds support for slew rate on SAMA7G5. Along with this
> patch 3/3 fixes some checkpatch.pl warnings.

Nicolas/Ludovic, can one of you review and ACK this patch set?

Yours,
Linus Walleij
