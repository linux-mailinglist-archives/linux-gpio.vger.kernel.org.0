Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAE4120153
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 10:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfLPJlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 04:41:39 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:47007 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfLPJlj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 04:41:39 -0500
Received: by mail-vk1-f196.google.com with SMTP id u6so1418552vkn.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 01:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o8ue8WstBbTvZ5MD1WJHZz4/JEOmPpoYuv/nyxwH0bM=;
        b=rIcpVznsk/1j0LaDbixZPqNHMyoDhlKcn3OZjSxvp0A2Rm04ONdNGPE3FLzxTh4x8u
         6a2mD/ZYdnZHTkLaIJSe1tKHtyoMhMzi4c6PN2PsW2sPMD5WrfJ4Jrm7LTnMybQ+aC+6
         CFYvNscHt6AmFm3B9nYhdACkWrs5QG2Kv7bUtmb7RYxiDf7xAzW6pB5SubsKOW8OaI+Y
         77wnbkpkQZJV0lx6JOlCwkjWhPUgZnhggBOdSR02abGGL0MVGhhPA84tOu1MZ0My/ki4
         3+QnhWobbz8A/v0OStPJCydpG8qzlzzymfmuIKjouEcXuCALBzDZZrnIVpe4gubibCqE
         Q8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o8ue8WstBbTvZ5MD1WJHZz4/JEOmPpoYuv/nyxwH0bM=;
        b=uhmP30VyzxcEIJTZU/YHhoqcL6zQZc99dlYgBnxw8MLzh3/x+N7BHtcCWkUQtlnGQw
         0ja4MMgxLMXurNd+4bSt3PRujxNL8AX3HFOcRAx3XtcxmQ3reOtLCP6VFN/5uVXDcJVx
         ohr0VuTvW6ewWTcIZPIDqvJXYFY3psYpFQMKWSBKCb9cJBVoNW2NoAfcF/tovj4O4ijT
         Gob1g91E7jQfdIEY9x2BOgA3gB4mf7LCj9rG22RijtddKNSn+bH3Y1O6nAIeHcPZRoly
         7gqRW1/ZCbYQoQJUU0qxlmDlIUM0o4eG/I3qW6riHV50QTaQeRN/WTgUL4bRfuEft99Q
         HkCw==
X-Gm-Message-State: APjAAAWNtxnzp9sPiOOwOwKJZWIVGMQeNHXjN2oiB4KgE2Md+vMEeFfN
        yAlb7IMcnFPbwqzx7ycCLC1q5rZ700hdv46ETqFphD5P7iU=
X-Google-Smtp-Source: APXvYqw448b6MJHQ+1gYr0FxfBbs6P1M9wsSV57mWhOV4FjMYQ4aFlghp4Zw6XDTPza6CPDzXFY9U4a6hSt7qTc3598=
X-Received: by 2002:a1f:add3:: with SMTP id w202mr1646583vke.30.1576489298274;
 Mon, 16 Dec 2019 01:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20191212135301.17915-1-chris.brandt@renesas.com>
In-Reply-To: <20191212135301.17915-1-chris.brandt@renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 10:41:27 +0100
Message-ID: <CACRpkdYOXvWpAs1LkgeQFxZiU=HvnaUod=px+42qpJBrcKGCfw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: rza1: reduce printed messages
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 12, 2019 at 2:53 PM Chris Brandt <chris.brandt@renesas.com> wrote:

> Since this message is printed for each port, it creates a lot of output
> during boot and would serve better only during debugging.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I think Geert usually pick these up as well, else tell me if I should
just apply it.

Yours,
Linus Walleij
