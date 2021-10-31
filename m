Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC60440E88
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Oct 2021 14:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhJaNJO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 09:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhJaNJO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 09:09:14 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E30DC061570;
        Sun, 31 Oct 2021 06:06:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u21so31047045lff.8;
        Sun, 31 Oct 2021 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HnA4agtvoe5bY8VDS5ihdFhbJWN6EIjsWlUJf/KpvEg=;
        b=CmaQHx6bEFgb0QO4CmJHd/SgHy+uYvlYGANFpzXePelKTbEdOMj9dxnaTIXbb4w4ly
         +KEsckeR2tebik7NiuQtUcq0kBK9VOQF9VbU1KhgoKr4HXDvrNUSeCoB0prE2BUCRXF3
         Wf3M94WdTNZdQpaoJu/HF2oNrVJ0l7ZhX0V77B0sNQiFFWAjdxQYJLuTe4j5Z8XCOObq
         bnPrFfyt0OnqjyQiecblcjKF8PTWaiOsfGJDDpCgIb8ZhS9efRuol12zcDM5Q/I6z3uA
         mr5BhOtIocvA4LVOu9YaHaGOg7m5JvJuGD0Bl0TRDLQP1Dm/A8cri2IH+8L/6tYB4uxc
         r2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HnA4agtvoe5bY8VDS5ihdFhbJWN6EIjsWlUJf/KpvEg=;
        b=ui+PwBWfwBITTdHFwos5BHxcuntYWU5Tat2ItzCu0wvXqA8N3Xg6tg99aaXMCaYgyx
         HluFojxe4bNf1L0cekqK5tVC3FbkujCm3gzIE7NTqc9ZWGxMfPApfUmACq5luG4I+P2m
         VED2XQnAaREdC0fzbKzrXxjGFoqmR7sEQSIeZ5BO+y00V3xUcqW6ZZTtZ4N7iqyKJNPm
         6pXDuTPoR81bbgxg+/xMfQcLi7/9HxwIcnWqb91qPN1f4jkp9hli06wV2kmUWOxAj0Wi
         VIZEYmsZMNZ0ZIL+/XsHSn3yTq5lleRjFahN7VutjuV7g2eNsDJJnoWnOilib/6lyTNl
         4Rug==
X-Gm-Message-State: AOAM532+cdd1dWL/pcN0WCb9zxYLSsziqywfOlEOkPK/OQAiQlXCEmxz
        ZIJ1gBGMZTHPtnjNMGZE8A5oRYmeNux5NUVbZZmeKQqTB9c=
X-Google-Smtp-Source: ABdhPJye681stA1OkK1J5HPFPb/3HDU+gJAlfKObEtPg9qAInOF1LWCXpQyhtpk28xb7ryeb6q65WrH5U+kKilaUpF4=
X-Received: by 2002:a05:6512:260e:: with SMTP id bt14mr22723388lfb.129.1635685601025;
 Sun, 31 Oct 2021 06:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 31 Oct 2021 15:06:05 +0200
Message-ID: <CAHp75Vf12Lx=demULkNhgP=YpnfdH15Y9T5C7PUA4uo=0J15ZQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/4] Drop ROHM BD70528 support
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 28, 2021 at 12:18 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Drop ROHM BD70528 support

I am always for the code removal, but the Q here is do you think there
won't be similar chips that may utilize the code and avoid duplication
in the future?

-- 
With Best Regards,
Andy Shevchenko
