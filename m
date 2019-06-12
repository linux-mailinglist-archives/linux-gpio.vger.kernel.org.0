Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DACB741FA8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfFLIuY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:50:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41549 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407664AbfFLIuY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:50:24 -0400
Received: by mail-lf1-f67.google.com with SMTP id 136so11427030lfa.8
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vuhsj8ps7SoI8pHZaVFcrUKuy0qDciUA894xP8DRI1c=;
        b=lkw2vw781vVGMyosGrYdwEiUBnJCuHpUhii52spA1D374RnIXXcbWHhULpE9Cz5fmz
         jmB85H+7KSiCEmERTaGMa22EZKTl+3OYa8g0MsTQWD2uhjj/d5zIh3qg1+DMlc+4sK8Q
         mTgvWQZp4q10h23z1ayCPZIN3/NdXQys7b/IO4fiusknTFklvF1liA0BZAmhOCz3sFq6
         5Zah77HNqQZvTtXyZ2ccq5Eq8FftXW2Jr+J2H96Hi4sxFkZO9MjnuM0Rbc4Mr0Vdl8Rj
         9rXkL9rlg8PznPdeZHTFsQ71gEW2TvVtfPsHYmHcBeeSGoxKAsB+7Ke4HUnrh2Sx77Hg
         /DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vuhsj8ps7SoI8pHZaVFcrUKuy0qDciUA894xP8DRI1c=;
        b=MWT+tVjLk2XHNTdVk1XYLXoaX5RXqHZHv7N0rl9YCVG34IiSMht90oPghCt37e1vTq
         UlPj1WpAI54ucipmS/O1CSNn5Wi2Q4/UlujN/ITwy5kzxenXOeyMtvLSb9MAuukHK1cp
         1hEfC3C8Q8n50TxooC5/5koscFDf6hZ26ANW8pFHQ7mrzrENxga8ijx1L6Hsoq1iI0J5
         vyt574FbQZZcZhIAWBq+Q2cH8OimFqwP1BOvNmje5/jgqJ7JYnuF47yCQDHTqcx6SHpC
         NGcyAX0YCEHJznUT41HecopC61ta627rjK9PNB0zLglRf9dHe7zG5k75Y4wdJYgjU6hB
         h5rA==
X-Gm-Message-State: APjAAAULZc77mlQMAcAPwo5dRs0o5YSWu5tRLpm6DA2aIlqiWfmI5L5Z
        OZlexUEgFHSq6HaVLLwrBkVDWhUVGZFbe3CqFFc6ng==
X-Google-Smtp-Source: APXvYqx/Pz3jSzEmkSAKK/Db6SB9B240P45Yftu+HhZmeHD4XRNwcE1mRWbkkKG0GpZQ7u52u6oeOPXCKenRxEnY3+M=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr39731956lfh.92.1560329422587;
 Wed, 12 Jun 2019 01:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com> <20190610171103.30903-10-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-10-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 10:50:11 +0200
Message-ID: <CACRpkdYWjOx_=CTq0uHPD0eQhKytQSMwpkK7cFOC65v_ebPwWQ@mail.gmail.com>
Subject: Re: [PATCH-next 09/20] gpio: gpio-omap: simplify get_multiple()
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:12 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> From: Russell King <rmk+kernel@armlinux.org.uk>
>
> There is no reason to have helper functions to read the datain and
> dataout registers when they are only used in one location.  Simplify
> this code to make it more readable.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
