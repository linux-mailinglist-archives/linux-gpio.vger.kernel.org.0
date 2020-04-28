Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B631BBD4C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 14:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgD1MRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 08:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726634AbgD1MRd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 08:17:33 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721DFC03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:17:33 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l11so16706563lfc.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LMRN5qxFiZK7LH7wFWLeZOcUrBLsRhKOimHQVM7fOfk=;
        b=cpxZ39XBlCTINntejfucjY+fxwFnKaspaM3tU4nQp/hop/2uuOah5PTPJIVYhBsP0W
         lfbrOouP0K5/qArfU93epvXV9Y0O6xB64TrG2LalkHRUXMuhtF1VOGCuunlHRaSWlCvU
         UHkcTxvAalSafoniWBgo7ypiQQoQkfcbaM7lr8XOmc03Hs2/vYdnvaGbEYi7RwmhyLgh
         Ix0qkhnBs+3QBU4zUqNxIMJE9AGHOeu95Yjh4jGOIRVTbFV9eWhbfrJs5DKMZu0bEYCE
         nPaF6CiFGEo7dZEoqMb+u78l257RyVEql24fQGrFjpdihMl/nM+w9d0ScNBUeGpLfumj
         egvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMRN5qxFiZK7LH7wFWLeZOcUrBLsRhKOimHQVM7fOfk=;
        b=qhkFmHWWpsG4ASHTrJo8Q1ykDpHLJIu12pgZ4pywb7ss0z+dA8Eq2ruUuYd9GhM/a5
         Y/Xmj9DFOPgUejcQdfdtoRCvg5PKsGoBIxmWEcrWnFuOm+M5GiWvJAAxq8uQv3idL361
         nNJJVh+els/uj8eEULSweHVR/iIGp23ilyY0R1FloNboGbaoHZW+vSw9sX12zmsUSbGG
         IEHbqZ2s1+KuCQzTlku4p2QgNHSkCOhC4igq6MiHJ5EDufdnQFj4Dou8Zo782CxFNred
         HGj4rfA3SDMclvCfOUKSzaDnzlHUext1qsLY+Nla6RfGi/2Oqmt4Uj8YPIAXMLQFM2uE
         tvLQ==
X-Gm-Message-State: AGi0Pub1Kem8Y0od1uYMH9LGc8niwnwSxLlhP/8mNfTlPdzUiRhjTBUt
        ChWq1/tLRA0AVlUw+hrWqFPaMLhG0mUHQuKXDyuX1A==
X-Google-Smtp-Source: APiQypLWMYHDowDI3oIfEvtVytKcitjHf4lYdOHlnfwZ2JMiRfn25SLHbT7DdEte3F2EYP1mH2KagEeErbh4nPD3DbI=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr19256598lfp.77.1588076251617;
 Tue, 28 Apr 2020 05:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org> <20200423092431.v3.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
In-Reply-To: <20200423092431.v3.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:17:20 +0200
Message-ID: <CACRpkdZuMALENkGjOUuQqS1pTH2sXkj1Z59mPjOrBynnkAQdpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: Add hpd-gpios to
 panel-common bindings
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:

> In the cases where there is no connector in a system there's no great
> place to put "hpd-gpios".  As per discussion [1] the best place to put
> it is in the panel.  Add this to the device tree bindings.
>
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
