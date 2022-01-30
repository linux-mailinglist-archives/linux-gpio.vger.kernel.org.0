Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F954A32E4
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 01:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245021AbiA3AiX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 19:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232643AbiA3AiX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 19:38:23 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC75C06173B
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:38:22 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id k31so29636541ybj.4
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 16:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kD5EeMfWUZCSsdRFixk1so34OOReUXkCj6tRRq5J/Uc=;
        b=O4Tw7KGaXWjdqt9T970Y8/kH7N+ViE2uO4IeA3UWwfb5LWDhLAgdQ13kGqqCFktiMk
         4Vv7jQT52fSqMz5OkdAC4KjLplOciEm3LyV6cOLM6+pAEnWGc4o6mZJDCbioWpGVOUG1
         2lHSyAOBMCN5Frc3Cdsg6bg7HxZ6b231c3GvytE0674ovgf2FlDq0ID6gg9gLJDi45+I
         pa7EYF80KoI9HtvPwgzfHMaG8Zw3WLlC+MOQe/xA8bSx8j0mMvs5X1TcC/ArieNb5T2Y
         ho9dk3Xhanq8jicrHV0bc2yPvangtdehWkknv7962AdwCimsA+Te/k139zwe+cHAzd0y
         wkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kD5EeMfWUZCSsdRFixk1so34OOReUXkCj6tRRq5J/Uc=;
        b=WjC+3gMABCEH2VWnc09+MDN4Ott0RtH/O3Ko3c+UObJ8I6ryGeIZa/rjlHApQDH6ep
         adn4RbLWzlUPajnMoF1F0zf5vrrGPxyWBftV/rNHxY6y4ewxVeyfyk0pbbPKC2V6ejw1
         OpQ5ElLxPSV3YrZQ6aIvqMcBWfQ7ZeV5zVEYD8RGZ6EQNrj10T9Xhveo96TAApQtkhr8
         D5OM7khKJFW7ErwuqUsjg/uIMijiCNW/1kOMYyMAiSIVZ2JTFMn9Z3hLIe89LQLKuXu6
         IVHb1If/Un0q2oVV6P0TdXSBS7yfrtTDcZaJzAAqAcOqlgHUbj0/f36X+98lHS4ICAze
         3Ugw==
X-Gm-Message-State: AOAM532Y4+Y/c/FquXVoVkDfLroKldTdIwOBFmQ3Jyb9QtmyXG0OM9He
        yhHaNlbPAVIfSfaoYK+iZ3Amww8ykFlsIZAxHOFWSw==
X-Google-Smtp-Source: ABdhPJxrsg7lw1QYllN4dx+IUpwLh8pIspc1kHtZgNyj3fI5O7+wptcqpiBXNZmBeah8UrGe2QSTVaJBq7sQALlEU/w=
X-Received: by 2002:a25:cfc6:: with SMTP id f189mr21225792ybg.322.1643503102047;
 Sat, 29 Jan 2022 16:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20220112114724.1953-1-tinghan.shen@mediatek.com>
 <20220112114724.1953-3-tinghan.shen@mediatek.com> <18f7a647-6153-6d38-dff1-727b9592b01e@gmail.com>
 <102ea6303dd16fdf9ec931d0a1845a93afe92545.camel@mediatek.com>
In-Reply-To: <102ea6303dd16fdf9ec931d0a1845a93afe92545.camel@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 01:38:10 +0100
Message-ID: <CACRpkdZ194_7+mHauDPwMHG3TeGnp2ENdcSDjZnWny1X4YTT7w@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        David Matlack <dmatlack@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        ryder.lee@kernel.org, wenst@chromium.org, chunfeng.yun@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 25, 2022 at 7:21 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:

> I want to send next version to update the CC list of this series, but I'm not sure
> whether this will break the conversation between you and Linus.
>
> Is it ok to send next version? or waiting the response?

Send a new version, I'll apply the v10 version!

Yours,
Linus Walleij
