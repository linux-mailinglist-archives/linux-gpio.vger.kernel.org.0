Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE7A22AFE8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 15:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgGWNFz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 09:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgGWNFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 09:05:55 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA354C0619DC
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:05:54 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id j11so6247080ljo.7
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/FpACHDz7a5nGjx+ioBPQb3KC4um/vnAQ0sQ8picRFg=;
        b=jNJoSElRtW6TRlUUAFLNiJvnE4zx/7OVBF8askmtfvQai1P2CRuqKVL3nnvucgi+5H
         HFVnsBZ/G6+iTn37mqkSI0eMY6EdEbdMLlapOTRqEIS6Of3vUMx/DDQV8yFX+sdTrRTF
         pd5MdqyhstCYcD12CgoaEIYQqe4uvK3pdUeJ3SG8SjKiS8mm/Vwip41YPCPzU/VBaQJA
         IFDNqD4Hidhu1QyWhwZVUXvW3v46OWczFvre3KRVyMM424JwG/kuzXg7BOjwHaG9cANk
         fFGsKPUjcEiE2w/FBMPE8awwpczCqy2L9obZ7CVgOKEKMA+jBmrJIkwNmgRwyQAQtZYE
         oCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/FpACHDz7a5nGjx+ioBPQb3KC4um/vnAQ0sQ8picRFg=;
        b=QN0Gn25SUsgBUN5VVu09FKOo9WphP+o1k4PnRMPrWWo+Z3PfOx3lZ9ynW7OSfdEI65
         cGEHSZ7QWgJeR3iFM09GFArIHRyVf1uz/VOQP4BPT0vdOSPC+Z77/xg6PEBSJ8IeGcq0
         EFarZ8XMpDe8AFlxM1iqZ5rIGJaLDR+ETf3bZzl4Mx735+Wszqv734/v7NOplcAPeXjB
         6Jt0UyIPaDsQdGfbYN6VyBP/i98zVhyp4AZSELUQsDJAUXGSNcedVyfJBGrDdzgSdp/o
         dwLl3y7Mjg5+0oVzuI6PzYOEDvkrJMf7gs+8x2pyNNc44Iqg9KOd44mAMkfZd39feh8A
         NRzw==
X-Gm-Message-State: AOAM530rRI02NXFjIPrGgA5ZKICLci3jFViZRxYUStY7rj8Y8MJiEfJB
        pmuXtyydsFuNkbLtrA0zGbz8pmH3K7zwz3FGChkpRw==
X-Google-Smtp-Source: ABdhPJxfHkQizZ37pEG7DjUxGsmLG10G2QP4JxXEoZC9O52R1JG/5dcJH9zenEjR2Bk7BSxv3j8ALDBTNQ4lV7d6Kf0=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr1802676lji.338.1595509553155;
 Thu, 23 Jul 2020 06:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200722120755.230741-1-drew@beagleboard.org>
In-Reply-To: <20200722120755.230741-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 15:05:42 +0200
Message-ID: <CACRpkdbqW4FkHx0sBrYEyvpUwrDnyEaMHT7hBbKzSa6URKhA8w@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: improve coding style for pin config flags
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 2:09 PM Drew Fustini <drew@beagleboard.org> wrote:

> Change the handling of pin config flags from if/else to switch
> statement to make the code more readable and cleaner.
>
> Suggested-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Patch applied!

Yours,
Linus Walleij
