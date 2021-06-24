Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7F23B39E2
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 01:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhFXXzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 19:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhFXXzL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 19:55:11 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D3CC061574
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jun 2021 16:52:51 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k10so13181253lfv.13
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jun 2021 16:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k3uL9uUsNColE6ZbE0jQCntXxYrV1I0UHZeKGGm8+Jo=;
        b=N3ZUZieEySpiWkuxq1uCc5G3O96ZDMOq2SVmvQAXPsIyqPaZltKhh5UCcx8J19fz+e
         QuF3X2GPsztEf6Bb9YuToC4ybUGSewUJU00coVUwVuWEo+J0HTnsQNroKSQmksyfSoJH
         luk98GIj56tJjF21dlAkEhWR0GZJP1Wy58gE5yCHUdO4LWexYiKchVAPGzaVg2c/Ay1R
         HSoKUJN6j+uPeVGMH0cDYRhOm8XYXla+RnnOoIP5XyLbGEEiDYPsZpYDtQMWvHttq0GC
         SXIC2sblUzh5WNUUUXlQDDKLzdZIQ82AoquWn6YfFiQjdxqMp+IJ8DY/yr95nk3TKuSp
         Pj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k3uL9uUsNColE6ZbE0jQCntXxYrV1I0UHZeKGGm8+Jo=;
        b=bcbdwbGqpwqK7pMb9WnkqgklfhxZ1pQrOuHCTZFyJU5dOFhuNfoj+Xw/PgfUcap4rM
         ndx9uAXCRt7q6+6jPUyoAYPJXayrj7aTj2UwBg9mjBIlE7/tYiSVMAUD5uBD4cCgiYnZ
         PUV529HEXXb7HyiWMK4I46hHZFw50kT8m3wmaQT+Is1DDTUeADHvUVl945w1NS4CHDcs
         Wv7zU5Uk+m86HyFtlSyhGWQuBi86z3FexJywqKEJAugSp919lOmuql1ujwHpXfcidKAj
         B5SlOauA/zGPea1DaPElb0PDLhBlGOSSevYGpIEMxdiojlesRTwb8hLO8ssZXq1/gqEY
         YYBQ==
X-Gm-Message-State: AOAM530ugQwW4oWQ/mwlbDyC13XTBo79N2PFpd64K9LY5FlOC7JQE2sG
        tfClp22xSr7kbkVQyob4ApVR9P0JWdr8+/CcK900oQ==
X-Google-Smtp-Source: ABdhPJya0UU35aIqBdB6oQEoLdOlL/Q6P5BYrz6alkYk1ULvJsJMbZSY++MpFbGyHC2W5fN0FRMM7kSGyg+/4FhkHos=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr5719898lfn.465.1624578769560;
 Thu, 24 Jun 2021 16:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210615145903.634565-1-linus.walleij@linaro.org> <CAMpxmJXqGgPiXqR1kq+nts-=HBkxSP_7Cqzn=N5-EmKWADh0CQ@mail.gmail.com>
In-Reply-To: <CAMpxmJXqGgPiXqR1kq+nts-=HBkxSP_7Cqzn=N5-EmKWADh0CQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Jun 2021 01:52:38 +0200
Message-ID: <CACRpkdZwcd8jznvzEvzO0rmF7ug3o_TxC=xUeCPYgfhg00rEQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v5] gpio: pcf857x: Name instance after dev_name()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 22, 2021 at 2:58 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> This makes sense but the i2c names are often not very descriptive. How
> about adding a DEVID_AUTO/DEVID_NONE like mechanism to GPIO labels?
> Nvmem has a thing like that precisely because labels can repeat.

Yeah :/ it feels like the subsystem should name the device properly
though. Like we're solving someone elses problem.

In this case the other patches provides .names in the I2C
board info so that the dev_name() ends up something
like "i2c-u2" and "i2c-u15". The u2 and u15 are common
names for components on a board so from an electronic point
of view that naming makes for good topology.

Yours,
Linus Walleij
