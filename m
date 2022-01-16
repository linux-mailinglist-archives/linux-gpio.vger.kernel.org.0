Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B7048FC8E
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 13:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbiAPMNq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 07:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiAPMNq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jan 2022 07:13:46 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28240C06161C
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 04:13:46 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id m8-20020a9d4c88000000b00592bae7944bso13051567otf.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 04:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UO8vyFXvwX7SYghDbHUuZM8heKAVpRc2v8cLwYWVW4o=;
        b=DjeVuuDA0KdW/nC+q7IdYmQb9nZIn8j7wxygw5t2/5T4newz9evcma+miU7y1/p/0I
         eXwnj1nfNhOiiI4ws48ScbwqL+cXjT5j8t5aCZ4dgEanylNdJ7FR+7u1lg57iT/+tAVE
         ysgkLMRcOs5vvV74olBjf56f8WxLVe9FVgQg/O40Xz+7ucN2n0Q+oP7MDD1x99ondwqF
         FFR8ITiPDvE015UKgutcCc7IxeocpTcQC6JUQiAcB0xbql2rVXF+UXffzyY9kEj9M7Lo
         zQqsczhvBg5Fs1mCgIbWyUbeUHz3G9DwbuEofmpHMITCk8GEQNe6eSYW5JSp5PR1+a3O
         6sOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UO8vyFXvwX7SYghDbHUuZM8heKAVpRc2v8cLwYWVW4o=;
        b=yIdc7MzgMlsELlLYoMUluOYdb+Bo9ilVh29aZF4zzgHKy6H9fkQE5xSpxL5W6ccMNH
         QOB8mDUi7wy/m79lc05TkXVdOuKqZ0xSUGt00Lg78RORtkIuobbLoM+daEQyGrVmduO4
         4U3Lec5nwRPtojRaw29WHDGUMAokP31v9CWOUxkabKXx2EMpT5o613uk4ywGcfa9q6wp
         UWHqdqacM9OB5y2AF0pDt9sA0snHqsnb5mtiI0ZlBqcx1JBqLNkKob6OnA1HrA4XDJ4a
         M1ZIhfdRPBFLzTbOfoVJD42yhWSebQ9AN1+bTOq19j9yMJbB2geVzs1UjY/LtVCtDTeL
         Xd6Q==
X-Gm-Message-State: AOAM530nLjZ+7Ysjokv8r4iyHnyMJexy7OMW/Jcz5/TbNC0e6NcO+y69
        60SG5JzRfy/tm6H3sNYB4bIgc1kPpMCwjoPsAAbrvg==
X-Google-Smtp-Source: ABdhPJzdicsKDrKNgLtStCnnhN2DtxD7a6BfPYtUCC55jkQfRghWaCtzmmu1EZ0JbC7fzfUIvqyXnGrAUYFMDAGTJy4=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr13252447otg.179.1642335225538;
 Sun, 16 Jan 2022 04:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20220114141507.395271-1-marcel@ziswiler.com> <20220114141507.395271-3-marcel@ziswiler.com>
In-Reply-To: <20220114141507.395271-3-marcel@ziswiler.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 13:13:34 +0100
Message-ID: <CACRpkdb+62jojDXTjEXjgMrpo6XkZy8AZg+jDdhqt-7w6nVQig@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: gpio: fix gpio-hog example
To:     Marcel Ziswiler <marcel@ziswiler.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 14, 2022 at 3:15 PM Marcel Ziswiler <marcel@ziswiler.com> wrote:

> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> Even if this is no yaml yet at least fix the example to be compliant to
> later schema as e.g. found in gpio-pca95xx.yaml, fairchild,74hc595.yaml
> and gpio/fsl-imx-gpio.yaml.
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
