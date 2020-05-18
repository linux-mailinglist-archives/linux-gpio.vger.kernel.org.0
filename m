Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E5E1D71A1
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgERHRv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgERHRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:17:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C22C061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:17:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u6so8653808ljl.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tb7Pq3a3DqBCN315tf0GNAMFRd2sHNKLG40cW/rGNes=;
        b=O5DDjzKJoqI66plQi1OKBYDgceGQiprpDxyR86VyS4k5+Yri2+GQjbDgzqflb5clQH
         r+CdAwgjx5gEjamL/2rIq2qBYiJCMF/sKFLNbadlSz16lNd6iN1gVmv3Ylo1tDzCasO3
         O9jfoPPe4+2vGOHk9b/xsiX9U6GrX1LLy+qICDUs2kH6jFqOLjFXboA+m8tR9uN/jME2
         kX5gOHzqyEC/nTFjxi/eyWtz5OHHNyBCTr7bS1ypMKma6OnstPQg3daAP1ODuneVWYf5
         cLFCffWXRBFJCDojJ6iNa8+9D3NduAeDpIDq3F1mTqT9KxoxyUFwf0f97HxDEnokDctO
         a2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tb7Pq3a3DqBCN315tf0GNAMFRd2sHNKLG40cW/rGNes=;
        b=gvkwIaC3ir7CTEXz8Wwwn1yvQA5puxNpmmv8SCT/+RMYpjwN1IsBe9ObnbSwh4vUh7
         7Q9Olbml0L45yCiWK6uevfyeDE00uJU6fCCsHWxPaXbdIit7MMSCcIxSKYDntlOzseLg
         +NMNtphAdU46OA4/lAzYM5jU63RDwU8dkhhNSjnXLaOWScGclK8NDX6po/fWyN0gkIJx
         dWp6LtG+AwnWf6BINgYxIz4YmnSKxjHTVhxC/jADCg7D55q7BHfthNC8zEAOVRIMplUo
         rPfQc6sLA2m1RaeSfnr+65lGOyeXaHPwn20DkZ/Ey2foJ53KowfTD/rs/IbjNbYzEe1j
         tvug==
X-Gm-Message-State: AOAM53078awRLWB4Cqrpa7WP55e9n9GsYrUUpselC7o2FfIqxGj/O9fu
        LQZZkViRPxMa5ixuvyEQe2md4emgpkijHiHB4cXfOw==
X-Google-Smtp-Source: ABdhPJy3fvzVD6Vr1x6E0eSqJWuGU/6qWItr3bLMwnRlHER5FhL82nt8iSQgmnXWcdoKOkGraypfhV1W8VptonsieeU=
X-Received: by 2002:a2e:b609:: with SMTP id r9mr9358200ljn.125.1589786268915;
 Mon, 18 May 2020 00:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com> <20200512182721.55127-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200512182721.55127-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:17:38 +0200
Message-ID: <CACRpkdbxTgPbQeybnsH72DEqx=m2TW3AmWK6n2t23=G_4Cr1qw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: xgene-sb: Allow driver to be built with COMPILE_TEST
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 8:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Allow driver to be built with COMPILE_TEST for better test coverage.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
