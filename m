Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBDD5812E
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 13:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfF0LLe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 07:11:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46422 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfF0LLe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 07:11:34 -0400
Received: by mail-lf1-f66.google.com with SMTP id z15so1245117lfh.13
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2019 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sCSEYBRzMbpAwHcX/a8Pm9HRgNx15iTEthxNyfijwlg=;
        b=HOoUIo857t6R+JHYVh9YLWHAmEnYgtscOC93EjjHS/tW4k04MLBCZOwsSIA9hOLnSh
         jg1c/fyNjP9bi3Y7+WRP+QE44PkTJ46izSZUsOwBCvc1xNHIYM++2CynVm8gznz06smH
         WZAkad1yp9oW2YVxnOlCN4eWAkoX0H09dQna+IvUsd5lx9SksFmP3HYrY8tIvkxYrQ2/
         cFagJ2aEXg6KEPkPNHprywjmpPgqdNT3lOF8hr5mrABnVbMGFDBCgLhQgP96AzG4WUe1
         flszJJbTQWfEhlSquqTFiOLOGEtbzvCGNBVbYLvRvEUMYeknOMA+uhi9Tcg3sWLPeRvL
         CfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sCSEYBRzMbpAwHcX/a8Pm9HRgNx15iTEthxNyfijwlg=;
        b=C4G5BaNapRMdBnxMJ7hczaBO8ylueQtn6vF7ECrDV/n8GpG7qoWbDv1xsxmSxvf+D0
         Rw+9QhSbWRMD3E+irV6ElpB4RYgNjT0xGXFyc35wFyVG9G59wSh918Or5D7gifjdCW16
         DoW3+dQ73Dcyoxlk6HPNlQUPUaCo6ROoij5y3RiGfflPXhrRZBrPZi1C2vG9SU3zxCTK
         tk70jPWsuW08Zlx2E09sZRC/67yD7wp8ThuAzkK642DfcK0CIB07CaB9/YTBpRrytqwg
         rPy76xzdEnA3KUNl7rUApCkLgu5pZXzCzJc0B5oGabhLwRtT/1vG3QLxIYqN04JM3q28
         SuiA==
X-Gm-Message-State: APjAAAXqJS8sJAPka8BMlFGUwXiSmDQsWjr9A6PT3A3U/SbMxi75STjU
        yfOLms5QDvGZN8Lcv05t5bIqlHT+P6bWNYx5phUoMDVTgNE=
X-Google-Smtp-Source: APXvYqwuLXdp+goyQiXclCsYYyc1IErzdG08aXVirfB+H9yYBWlz1uzdiV6XW/EmVvfRLlxe6mN1vBchhzJ6IebKPfg=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr1712677lfn.165.1561633892155;
 Thu, 27 Jun 2019 04:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <1560948344-6543-1-git-send-email-harish_kandiga@mentor.com> <1560948344-6543-2-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1560948344-6543-2-git-send-email-harish_kandiga@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 12:11:19 +0100
Message-ID: <CACRpkdawgYCPh3yBVix_sf51_+jt4_tcKWu9s5T+s+wVbUOZXw@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] gpio: inverter: Add Inverter controller for gpio configuration
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Harish,

second pass, I think the DT review is the most important thing now.

On Wed, Jun 19, 2019 at 1:45 PM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> +#include <linux/of_gpio.h>

Please don't use these old interfaces.
Use this:

#include <linux/gpio/consumer.h>

I'll show more details of that.

> +       count = of_gpio_named_count(dev->of_node, "inverted-gpios");

count = gpiod_count(dev, "inverted");

> +       while (index < count) {
> +               gpio = devm_gpiod_get_index(dev, "inverted", index, GPIOD_ASIS);
> +
> +               if (gpio == ERR_PTR(-ENOENT)) {
> +                       devm_kfree(dev, inv);

I think devm_ i guaranteed to free any allocated memory if probe()
fails.

Yours,
Linus Walleij
