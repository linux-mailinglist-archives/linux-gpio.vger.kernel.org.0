Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 781985F3CB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfGDHde (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:33:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44409 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfGDHde (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:33:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so5117885ljc.11
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5nZlyonaYBcIHFs68w4W+bmgmZLAi4DVNEFkxYXC9bg=;
        b=ly2ZB1RacvoXgtBZuxppsAKpbjRSfhQ8AdBwb59ZI7CcTPAY1b3+VAeo9SDLy3CvhX
         NErHZ15uZn6Ui9j+6+th4cMMXPdKCoDyxmdwWuuy5tfhlvQqFRHhSdtzBGediN13vhQg
         ltkRmZPytPiNO1j6j96DMn2FyHsaAg57+T7wMNLrUzRhGGk+MnbAtjEi5HuvEI/lFLdR
         pbrUYpGK0O8kY6JjOxnLdhffIFMFuFnUYi0npgFV5QL5gdABcvOnBBKyK9tW8UKnUTr9
         NchwHX5TsqNKMwWVk9WGT3/5wDsYuqYktsAKmDS1iOpCpm/BQN4/Woo2HrGv6JUS5dgk
         LcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5nZlyonaYBcIHFs68w4W+bmgmZLAi4DVNEFkxYXC9bg=;
        b=fuq2SQZSuqEY+Y07Mya6N/xfIBy7iHDPqRlzz/GRlCtcCFtDzshO8Tebd3Kl/CkYNw
         QTRT+QHFQUNKUqiBU0h3z3Bjrn1BaXNW/sUmONdYmH5MXUmhtRnCMSDjn4dPweJSOtNy
         BhyofOVmlgnXbM+VHlxacYIHQiGESz/HoeQqx4J0Rh4LUCqhXl4xnr7+b8edadCPJkgI
         WOTNNNk/3GL5Xl1cwfLuBOQsbI+/6PHGUuFc3tNMby2fmrEtV6ErpyGogu0NhvuPdf8c
         dLy60CyvOlZIhB+UiZqNIHMjbM6JEgiWwHDvSXTgodOgWGRRNdSdVGLO3tNqH/b46BaF
         T+Tw==
X-Gm-Message-State: APjAAAWhZSOiUqqEJ5tr5uLk87CW31HsQz9Au8kHK8VFqUnU30RztGI5
        3SWMftDsHDsKJ0DRIELClaDLhJZ0wlRg/fwX87D1ag==
X-Google-Smtp-Source: APXvYqx26V0oB3KzDPNa332FvmrdU9YRFQjWa+Pf4/6aOydVvuHTShaMCf9kZhWzOw++n54b2Y94ETsphqlWJxoLR4E=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr2092620ljg.37.1562225612626;
 Thu, 04 Jul 2019 00:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190701141005.24631-1-geert+renesas@glider.be>
In-Reply-To: <20190701141005.24631-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:33:21 +0200
Message-ID: <CACRpkdavvUR3G89_5DpXvgfpJ7LsxWiLyjFS0hSXVwAgaRFM-Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: Fix reference to gpiod_get_array()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 1, 2019 at 4:10 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The function is called gpiod_get_array(), not gpiod_array_get().
>
> Fixes: 77588c14ac868cae ("gpiolib: Pass array info to get/set array functions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
