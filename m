Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB4348FA09
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbiAPAtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiAPAtW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:49:22 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CFFC061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:49:22 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id l64-20020a9d1b46000000b005983a0a8aaaso2348645otl.3
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6p/O50RxDfDXj8F2gSC4MowoUivvHCS0e3BL4NSTAKw=;
        b=Nqgh49Px5R7DO0fvkf4emRtIOPPQB1ttBHl54nYcwmBVbUpKe7zRYYoEOON3g2eQPv
         QJOJItR3O3Dc+BAkBVkFgpFYEBSupFrLgugavxkviSYjapY90x4yxiPniMP4TsU7ItsM
         P2Jfc6yQwusXu2K+yPH3ShITezD8pC5FidTndQN/5MHwQZl8Sxh56IHann3//4D3Phgp
         KifPPZDSt8Of2hhf/y49TMj2RTdZWeWz9x0noEmw9TSBoDfyVUX++qf/tlx+EQwGKV4/
         uhinoC1O4mN8heUYf240pRmcE3Jq7LY1bJ7l4hAxYIKBNJkfdY1WC691m8M1M7zG29Qr
         KrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6p/O50RxDfDXj8F2gSC4MowoUivvHCS0e3BL4NSTAKw=;
        b=OSNutmIuWUaj6U5WEIQKsfemIDN7y1NCsWTvJMsKoflM6v8fSKaiwjiVeMH15SOn0a
         hNA+TAohpRcoq8ozCnmTnB+/2UmNPvN+P/cY6qpB3k69Ru4nODWTgbVWcz0KIk3/YCF5
         ItGVKeRD73pjNU+P8jIypBCEtgrsULmw9Tu9e9EgZvOwCC7fNc2eI/DGpI2XrV7gU7vi
         H16O9vkbPNbtpoXX7/kUf9iz430Nvr8BHkxP6mR94tEv+YiTnjzm7RDhe0iZmq87OwjJ
         U6vRDcwKjMFRE7Mwi6GPyL95N04CO75lGZqfSKmibFJRp4iaQ0b5ppx6JT54wPN4McsE
         wEyQ==
X-Gm-Message-State: AOAM533ATdpKlNnlDg28GO6tJwIKCjUMKDcT5EHgOW6xyEC9203epHC0
        /aMo5Dx36AeGB5TTrGrqGLTYruzamifsBupCcbnUMQ==
X-Google-Smtp-Source: ABdhPJxTODp48xHCKhFaUN9ucAxJTdT/iwAFvpUSSRbtaQ4yeE5aXxbrG02X11dyWHsA3S9x2XjGL7EAntPOyAudiKo=
X-Received: by 2002:a9d:465:: with SMTP id 92mr11681452otc.35.1642294161540;
 Sat, 15 Jan 2022 16:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org>
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:49:10 +0100
Message-ID: <CACRpkdZCtEwZiVwoW+QNL4nTf-10fBDRfGkwVJavf1n_w-8q_Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: mediatek: Fixes and minor improvements
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guodong Liu <guodong.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 12:22 PM Chen-Yu Tsai <wenst@chromium.org> wrote:

> Here are some fixes and minor improvements to generic pinconf and the
> Mediatek Paris pinctrl driver.

Looks good to me, can you rebase this on v5.17-rc1 once it is out
and I will queue it!

Yours,
Linus Walleij
