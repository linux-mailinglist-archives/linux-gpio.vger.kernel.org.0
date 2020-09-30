Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEC327E3EB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 10:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgI3Ii0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 04:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgI3Ii0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 04:38:26 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E4BC061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:38:26 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so1129042lfb.6
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=abOoDQJ0/sKiOBVIFY6wCFerTXB/Q9XBjrmQHnpcYh8=;
        b=Ss8bDq8yX/Ssw3M91BPR3cT0NQTIbu4s04flH1V3zjVAHyLShsXc8oXK+CcMds1Gkm
         0+7Ktr6f4ZbKsREon0Ur9pBGkGBGT0PBK8Xty9Pq39P/vfmAw+ZuAsI4JjrCWb00mGx3
         5G2YLmXkBEnzBYBOn9sqCSLs1IbMr0hlVw8M8SljDVyYWPtiGlKqbyIt9rSwjGAZHKXH
         rI2x6VeBkaE+M4EOPqsQpHK53mE54ICspP5h6m1DnMZudK6SL3R4b95E/hnjkgzqw8SU
         lGFTlMSkiFjyoYQSJ+Gi8NplEA2k03G+tshg70ntsG2PI9N0eEelS22ry92ZFo/atVnE
         90aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=abOoDQJ0/sKiOBVIFY6wCFerTXB/Q9XBjrmQHnpcYh8=;
        b=YkzrfgwcPDnce25WNxc+rpopklr52/oXDJIXLM90DhUgybeGpE3dao1gOs74oQLUEc
         zi2yNiI6Fw6+2S2f+II3rgKrptTNGjlK2oohwU0BLk6yIGHQSPuOxSptPrLBtjYzu0q6
         RfrFYjKYwxOEWcAyzNFnnvTBdjqhBS4oe0LEKohLrS/VPIQbu0FT9mDr+vJVqlPRbMHh
         b2xDH3wIGWlwCcZ6AIsdUVIvl+bSfIbNznawXK4Nr+qZA4ri7hLEC7fm79mUKjVqgBnk
         fPSEMc7HvuBVwSu5yTTbmM4DtGhZcXl/w7SL0qUfhj5Yl+gCRLxMiHb7kmVrntCFateu
         vPnQ==
X-Gm-Message-State: AOAM53300Y7AMRkkA+yluxBTy6zV1mThLxmrHnEY1RYSdujqcyMs+l4u
        zhvSfGcVm4/dglApgsCn/Bu34vVUpMZdAHpiQlIqPw==
X-Google-Smtp-Source: ABdhPJwbE0nuDuIrHeUYVu6c/TVrY5zaEkNuDBuZ75a1nBDcadvmYts3OOwWTPEUNh69LppZiaJfcwW4p7jmARUJlGQ=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr466913lfb.585.1601455104600;
 Wed, 30 Sep 2020 01:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200926202342.31014-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20200926202342.31014-1-rikard.falkeborn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 10:38:13 +0200
Message-ID: <CACRpkdY5m25aFoYqWq7jQNtAAD++0DEmKKk0ztW8tX62=UCnEQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: npcm7xx: Constify static ops structs
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 26, 2020 at 10:23 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:

> The only usage of these structs is to assign their address to various
> ops fields in the pinctrl_desc struct, which are const pointers. Make
> them const to allow the compiler to put them in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Patch applied.

Yours,
Linus Walleij
