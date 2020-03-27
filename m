Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 551DD195E96
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 20:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgC0T0P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 15:26:15 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38945 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbgC0T0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 15:26:14 -0400
Received: by mail-lf1-f68.google.com with SMTP id h6so3053844lfp.6
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xyt/WUa2OD/knVIi601SFgcT1l0Zvp/CDfO2pM2aN4k=;
        b=IGaP7Mdp93QPDuqZ2364as99CykHs3PJ4uYKf6kPp4MEHCRvpSlBKK1Qz4NqpXAC6F
         jcs/JXuF1nLBhdGF1Gfkw12gMzmJM5qi8Hew8wMHVHPFn7QhLflUWGX6h8S1zZUgwGyT
         ZwdedZA3Dn3uw31OdZWSCHUvQ9C5JfKBWJ6IESHexoyfrt48U76swLir1qWsNWYgDKBz
         Umrm5nAGV4JXf72ChFK+JRjPexOHxC/o9E2BcsUkz3OS2rD419n45AlPLeHu98S305n6
         Vn9s3lQwR9CuCC+WQNGKtunP3nNeRTSmrM3aVOkwU64nC9v2VXIkLhIGnMW6fzq+KY+T
         k/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xyt/WUa2OD/knVIi601SFgcT1l0Zvp/CDfO2pM2aN4k=;
        b=mt03ETWDdG3hfHE6UrMB7tsIsEDQ0xWVCy5aa1WqWovNubhsLMHP1WKz07GFnOpj7w
         CV7A4kWEqpyVWppJJ1zb8uWrLbuvBMLbxXa9lXepJWopwRtugOacLS2gWxsu76BYCAGJ
         S8XjMzK1U4fucMNwbKxLwjwXG8Q+uqzEJMIsAFSBg/C5xSneUZadD0ZfvW0iUglHseH9
         5WbHjPubq6q7x4xImf84/+cOgmgIuWp8UMmTCia/F/Oeu1swaQMlLakY/HC0UKYmNHmO
         HflywJkAAo+F8rhVzKRgGnklO4IPHyGv5KOinFqIQyKOcc9pPFamYyS503ELOvQ/Pgzn
         wmAw==
X-Gm-Message-State: AGi0PuZU/pt6SDRamA7RTa0f1ayq9+tSVVeHjfxpvVNnoFQnVJle8Dd4
        yvatmkAfTzop7Svl2aHw8Lb+YLuyq4DVrYhNGx+PgD3s8mY=
X-Google-Smtp-Source: APiQypIDOmD/wk2tYVESxm4bIRP7LjM723EaFL/9IRPRsGvMcf3ygcQJnmmosTirkk89eivLqwScLbnLWxa4ztRvg0Y=
X-Received: by 2002:a19:ac8:: with SMTP id 191mr518366lfk.77.1585337170911;
 Fri, 27 Mar 2020 12:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584456635.git.mchehab+huawei@kernel.org> <51197e3568f073e22c280f0584bfa20b44436708.1584456635.git.mchehab+huawei@kernel.org>
In-Reply-To: <51197e3568f073e22c280f0584bfa20b44436708.1584456635.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 20:25:59 +0100
Message-ID: <CACRpkdY4_fEbsgX9vRHd5_8Z-1MbBDd3y-pVsTit4bDLW6VpoQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] gpio: gpiolib.c: fix a doc warning
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 17, 2020 at 3:54 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Use a different markup for the ERR_PTR, as %FOO doesn't work
> if there are parenthesis. So, use, instead:
>
>         ``ERR_PTR(-EINVAL)``
>
> This fixes the following warning:
>
>         ./drivers/gpio/gpiolib.c:139: WARNING: Inline literal start-string without end-string.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Patch applied.

Yours,
Linus Walleij
