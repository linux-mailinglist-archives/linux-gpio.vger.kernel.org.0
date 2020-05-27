Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABF01E43F9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 15:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388221AbgE0NkJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 09:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387682AbgE0NkJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 09:40:09 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB25C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:40:08 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z22so14526229lfd.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ie6NOHCa1poH7EW/ogXr/c84zLzvDBlvrt9l7/yyYEs=;
        b=BeSFXXgG4Siu4RTRVh+jSKpUzYSDbamWVy4bjssp19a6QVDjXD/bvW/2rj9Xo/0voS
         InKLPtwICtDEXk6ukE6a09PtYrjdNyna4I6L4SfFltqNWMzPE/mhVpiHeSsmI44usH5T
         +KB69qwdrqPSlZZeXy/pq1JKryqXLDyrHZpwfL9kx58ZJCmMMocXXaMTkZ0GURwzz9ec
         4kfMnTCk7ub4y0yvQz6lbVGUMxFG38JWxYrzuJDcOcS9C3lnbanC4ihn3vMBXP6dlyik
         P31YbstFc7l1uYyEbYynm2Glza9NEQXGKG8Cmoh5mzKUTWs1yIVVI66m95NAL8/q3mEg
         ILGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ie6NOHCa1poH7EW/ogXr/c84zLzvDBlvrt9l7/yyYEs=;
        b=G+x4/MzPKgDe1G1an4ZuACi5DFLgXIhtm0GSBMHID7QziL5bmIvlgSs1v+6uuawCxH
         j9uM4PdG7Nt5SBxbLWjdT8nTNzjSVC3o9DcyjaYDIEMBzQo91rSMBqI65Z+nglKE3TCZ
         e3AaD8TfivAasUdKJpaW2BJMIoZBpqXyQEyBSH8WCVJWuPq02Lu2i+E2PaM2dO7cX4Vg
         kz9DeXPANNf9iKnXbesMXRCAOLACo6YhFKMqiPzNEjsHe5BeNv3xaKhAko39QjUjnXwg
         lLr0eoDktCvV8cSAkwwN4wOI4C7AOlAU6urdsfe4+zVxvWvlz9/V+k9HbzFlc/ygXDMI
         2euA==
X-Gm-Message-State: AOAM532U3PSo4j3zbWl+cWLgX/toHsozJmapkU4bHEV7nM38DfSSGqm9
        bl2JaodA+Yt9imXHwFi9Ps1slE4IkEo22H7pEKYWMA==
X-Google-Smtp-Source: ABdhPJwn8tazLmrNM0H31gPygDYk3oMpRFUICrUDhBWSYzgiMnAEpzOuKGrLhDJRTz6EssBVLwj9o6OTrN8YFhHjWY4=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr3136510lfn.21.1590586807308;
 Wed, 27 May 2020 06:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200527094302.6235-1-brgl@bgdev.pl>
In-Reply-To: <20200527094302.6235-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 15:39:56 +0200
Message-ID: <CACRpkdb6dXJGUZPx1PMMd=VKF-K93VPWcmYfBwoSCWpXXAqWyA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.8 - part 2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 27, 2020 at 11:43 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Here are the remaining patches I picked up for v5.8. Please pull.

Pulled in to devel, thanks!

Yours,
Linus Walleij
