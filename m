Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5485D2EB577
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 23:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbhAEWla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 17:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728427AbhAEWla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 17:41:30 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B94C061795
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 14:40:49 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id x20so2164284lfe.12
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 14:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A9uJ+mRMwMNCjTDA7H/Mm7rI4bw9j4iKv8gt3pZkI1A=;
        b=Iox6T65sT6cbzUPZGs6r2WT1UcGm50nonReKeZ1J9nPB9NCFRrTteX4vpPI+xFbO5l
         DyJRrwiNFFCbY2XIBy3K9qn3WvApzDXm1+kiDGRu5h/EGoadlZzUNz3BD/CFOc8WTXEz
         vPdh6UWNFEgHmXg4bZNO3U9Ka3Nq2kFEdazHzEGZywA0RGy1DE5NVGloXaV3mAg2Ci0y
         WT6ZnmvP8TLpc5Aqr8jJWsz0EkjwjZGg1azMyix5WFrmrIoyomnN14DFpNfvrk+APLTw
         DLLRg6m2/zNcpCXLQYOZrTiBQ91ZhMLBFoYQnf7H2al5YY6LENFsEZFLDFTQ+mOq3eqr
         6i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A9uJ+mRMwMNCjTDA7H/Mm7rI4bw9j4iKv8gt3pZkI1A=;
        b=LnYJHfCcvXKHHtkuE7KyJBSbt07rxkvlZOJDf4hRb5YOUJ/acuLCdpwUZpATYKaVkd
         Erixl2mCfYZ4Isf7nUjn//JkDhzH4NOpdBUpVr5JivHmXpjuCWWjOLqe6gHhUCYFq6Li
         c7tb8pkAK6tufhcK6txhpkhIlCVBgRaBWToqQdGdXTFb5NokvdsHVLg/jdTouVr4aGyI
         LC5sFN5YzbKRSq58W60iSnq5pps97LI8cWwdot8Ih5anOE9s0uLLq0o1E0OPOvUGzivt
         eYUk0URM1VKvTcEwokTuOV3c5w/JSyZ35w23Whs/ikOEnnHgRqO/4Bn+yMGq3NrFQ4L0
         eJ0w==
X-Gm-Message-State: AOAM53090xXEeISj9hRmX44PZXw6B9jJqK6P0sa7iYl3/SJLfZlPhqKm
        VRVWSndM6LAh4SpC0N2nQa+6ENiEykVjy3l3ag54QH8jPKc=
X-Google-Smtp-Source: ABdhPJyrC7fldffb5OLrFw01LwrgpdXzjc/LW2OSxOLTM/0TxS5i8SQmbP+5jZ1/YeIQPTX3gsunWenkiAOIokiJrt4=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr563643lfg.649.1609886448380;
 Tue, 05 Jan 2021 14:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20201228090425.2130569-1-hsinyi@chromium.org>
In-Reply-To: <20201228090425.2130569-1-hsinyi@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Jan 2021 23:40:37 +0100
Message-ID: <CACRpkdZpGd0qVLk1y7y01K8-rrRhNFSYuCzs-GGnN5_tRzKfOQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix fallback call path
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 28, 2020 at 10:04 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:

> Some SoCs, eg. mt8183, are using a pinconfig operation bias_set_combo.
> The fallback path in mtk_pinconf_adv_pull_set() should also try this
> operation.
>
> Fixes: cafe19db7751 ("pinctrl: mediatek: Backward compatible to previous Mediatek's bias-pull usage")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Patch applied for fixes!

Yours,
Linus Walleij
