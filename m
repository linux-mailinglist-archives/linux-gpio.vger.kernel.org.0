Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69AF328161
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 15:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236619AbhCAOwU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 09:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236626AbhCAOwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 09:52:14 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EED1C06178A
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 06:51:31 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id k9so6008045lfo.12
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 06:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9BnG6OcLz4MdkA8niW29Ho+/QnSajzdzvM6d+k9RjhA=;
        b=YdCqs+GMjIwYpuli9n6ChS9KcSVMisnjvmPMVhyTZr1+QgSH6aYWMXdGN7+BX+bC0N
         RUf1HL4pXH40LSezbd8Vz+YeBJ7BvNhLsUREpDjlwIF02U4C8/cEuCW2e9Aspgz5bkFY
         RibEIgSjE69BuZ+V0NH9HCiRyAN9/Ur02tR9K6zXnm21K0vf+DdTDJ8rovmSKE7iK4yJ
         bfxk7TUjcuYiXgH2nyPEGHs2DrOfjmefWHshsYBhF9Ypn74S2M8poDHQSjxLt6yhz5rG
         g3T8bHOGyMwokI2l2zqTu1bng3ENcQnuLNG8nvpnXGTu3xMVRVvEVWVfwcZoYY1JH8WS
         PLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9BnG6OcLz4MdkA8niW29Ho+/QnSajzdzvM6d+k9RjhA=;
        b=uIqGaphmC5o7vnbVWFwakB5QGwkiHtKf0/nWoT+ZpA0B13RLPvEYEOnrL2MWiX8h34
         PnpJGeDdyCg6diKAAUGUeO2+koGDNGqdFzfWdwXxkTD5nRX38Iwh1Ex4GfEBIR84CLer
         +XDC0GSZv+hz5SxmD3uNPLflWS5RAUupSLORK3ZndY5XYEHlpRKR6f19EN+Fe3Lkev0W
         Uu2TnfLrb+bQSsnhMtHeCcw0fR3bAsWwJzEKgmQpe64PClUjQ/kkb0ksu1/F3DEVv0jV
         8kuJvFuF4DwG86CJKjRaq+WNsnXzM9PDTPZNILjlEh85tOS/wZHuAkHZ4+uj8zWmKHP6
         oRXQ==
X-Gm-Message-State: AOAM530H4XQhZqKOhEAV3TMrkzkbLeQ49zmBcTSVPFAVfmXHdE++OB8X
        9UMDhcvbGMLjnpLrI9n4SvDJKXMLdQu/VppAh/CW6w==
X-Google-Smtp-Source: ABdhPJw2hltL6dqzQRsiwOWELt2s4pnYTKVvz2cutcRv4szIKBMeFXJwGheIGYaQTVosfai7/l6TGb0G57xQwMFnKWs=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr10180879lfe.29.1614610289944;
 Mon, 01 Mar 2021 06:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net> <20210208222203.22335-8-info@metux.net>
In-Reply-To: <20210208222203.22335-8-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 1 Mar 2021 15:51:19 +0100
Message-ID: <CACRpkdb5R+VQrv0QuKa+EYmAMkodRpyv4fV1QCWQ+vcEyd0sZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] gpio: amd-fch: add oftree probing support
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 8, 2021 at 11:24 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Add support for probing via device tree.
(...)
> +       pdata->gpio_num = of_property_count_elems_of_size(dev->of_node,
> +                                                         "gpio-regs",
> +                                                         sizeof(u32));
> +       pdata->gpio_reg = devm_kzalloc(dev, sizeof(int)*pdata->gpio_num,
> +                                      GFP_KERNEL);
> +       if (!pdata->gpio_reg)
> +               goto nomem;

I don't know what the idea is with this but register are not normally defined
in the DTS files. The registers are determined from the compatible value.

> +       pdata->gpio_names = devm_kzalloc(dev, sizeof(char*)*pdata->gpio_num,
> +                                        GFP_KERNEL);
> +       if (!pdata->gpio_names)
> +               goto nomem;
(...)
> +       ret = of_property_read_string_array(dev->of_node, "gpio-line-names",
> +                                           pdata->gpio_names, pdata->gpio_num);

And this is already handled by the core.

Yours,
Linus Walleij
