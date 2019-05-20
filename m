Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4732400D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 20:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfETSIi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 14:08:38 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44184 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726966AbfETSIh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 14:08:37 -0400
Received: by mail-oi1-f196.google.com with SMTP id z65so10681040oia.11;
        Mon, 20 May 2019 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
        b=exguTriKwXhXwUBPk3DIYIZn0UebJYIvgkrkUlVQK5eyPslKrHvRJJWZsZZatGDf7+
         4biJjehsUg4Ao2EK1c7Zi8EuvyBpW5eu/Qrh/u1rJrkaSLquZzh3LiB5MOZAHOSzvfJq
         VSu0BLM7IBjWMQm5W7ne+ljo3VCj+ac1NbOYEvqWm/3ezx9EcRD2/+CtLY4YxoxAJusD
         2+aV8oQtf20iAXCAbcpAgCX5EijMQxXPL8yYmSeJSzLHPUWAydKBv91uKdFKttfmLCL7
         ib5bxijAzY1xDT+7Waq6mF1LwTJ7YtobSc3QHW3h0QkQq5wSq8YmbgIzjHAbE9RmZUSW
         mhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7G1MGSx6nHwpQNyADoCOs+yAwPJeVT4zKxuY01zrPw=;
        b=ZE4u79g0w/LXUGq2dk5qe1CaY9y/iCdDrIpkB5AhyAG76EvOcqHn7vx8Yg+2fF2MO6
         PeDZsZgwEU0yYvGjN9ECOtz8orI7mlytBh9eN1dW6Pxw5hEqZ4RXrj6zHBmJkSrUrMZ6
         HYtm4cH9Xl4n00Cn4tBmDPy/FhPRwwVw8KTmntjc0AAY8h1Di9icgElvdeiIUCE8ZriW
         syl9OrQjcP7J5sNGO8zTFYMAv+uTYVLiHqNOGcY+LOguyOHFeU8wapQhke1m8i50I63q
         5QJ4YgNYhmOQgRF1Z/yk+5RKqdTaBogugpSmOJS10JTMX36ibGWvfUdAqi0u7DcaQvbC
         kOJA==
X-Gm-Message-State: APjAAAUaQtJKaeTC9hI0edhuAj4TEvcoo9uBFBvOnTx2Ccz2jAtT4XfY
        WrBKpd4T9d8Kjm878Ly1nCOVmmNq8TBHTv5CLPo=
X-Google-Smtp-Source: APXvYqwewLUxYADIoBcBQRX4Efzf+CAd/saoxxujYidpsFC28B6J5rhGfQ7a3JNH5kkvVoDjcNeNoCcZHPEX02AayQI=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr318362oie.15.1558375716877;
 Mon, 20 May 2019 11:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190520144108.3787-1-narmstrong@baylibre.com> <20190520144108.3787-5-narmstrong@baylibre.com>
In-Reply-To: <20190520144108.3787-5-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 20 May 2019 20:08:26 +0200
Message-ID: <CAFBinCCFbKaz=dVkF--sfwRag-+N6wR-6ePsNSGnLXu=N1mbkA@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: gpio: meson8-gpio: update with SPDX
 Licence identifier
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 20, 2019 at 4:42 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
