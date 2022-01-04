Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6B6483D39
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 08:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbiADHwo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 02:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbiADHwo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 02:52:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18073C061784
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 23:52:44 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o12so80012753lfk.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 23:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O+ZiY6IkcBRjtAxU1nAyJ1fPfCkxiGNTSP08edC/EcQ=;
        b=BNvys0x2/vXxzmavJQNBxAzMHyClqYXQeAkuW2nJDxevmDjxG5lN8RRDgnKOxV39Jo
         y+2PNlqnHQzUS8oErZ6UoWWwIqtNaqN7Ofon1U+nFKIby4A4RRdK+bJmZ51dFiKSL31b
         xpu5QwFJ7s6KFUV7awhqMxZGtGQNWVX66A03c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O+ZiY6IkcBRjtAxU1nAyJ1fPfCkxiGNTSP08edC/EcQ=;
        b=2+HKLCUl6gdYYkwoAS9+QsUjzBPy8AH1vsEeXXa74PNZzmdauT2LPLExp/xzIWDEUt
         Cdjl9zk9OMaFWC3z9OgNNajE8oskCQUoxj8sS/KUG3K36dR4V5UCTNi6CXADeeHoKxJF
         HMtUd/9uewm1qYDyFfBQ6S80b+vEzIsuSus7ZYnGDvmq/INFCiDF9qG3kSy5+Y8v7QsO
         7o8lAUjNN3Jvfyg+tPUBmzqXzA0pwwjDPXjYAK0s9hSBfQexokHbL5dbHYXvSrdVaEH2
         vXFWRRCxNGW8P0z9rCQIDsaTRVrb3jBNsRWixdJWLxdiMwkOinQkwBpP23lNig9Uac9W
         OPBQ==
X-Gm-Message-State: AOAM533c1QrsbLEVTmQ7mkuIdDKAzx1e3OZd7l0ZACTvo6CQTlV3Xpvi
        l9yodEckLxHMoNC/bT8iHeiseFX+aA85Pqtsfsl2kA==
X-Google-Smtp-Source: ABdhPJwvhKWuzdV52kSDSeheXXWRNnZjCsdHKDUDU7mBKaCvcXcXmZ3ie06zTYAu2zIfqnXzLeAAfRbz+zv8z4Ac7Pk=
X-Received: by 2002:a05:6512:1320:: with SMTP id x32mr43433548lfu.597.1641282762440;
 Mon, 03 Jan 2022 23:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com> <20220103101855.17350-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103101855.17350-3-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 4 Jan 2022 15:52:31 +0800
Message-ID: <CAGXv+5EEU4Kg4pgGBsAgN4TFBc8X-Euar9aMzM_0it3chGasKQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: mediatek: pinctrl-mtk-common: Simplify with dev_err_probe()
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Jan 3, 2022 at 6:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the dev_err_probe() helper to simplify error handling during probe.

You should mention the additional comment you added, and the error message
you fixed up.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
