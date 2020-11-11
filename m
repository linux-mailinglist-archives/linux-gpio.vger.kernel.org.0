Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41222AFB1A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 23:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgKKWIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 17:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgKKWIW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 17:08:22 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BF4C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:08:22 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id s2so1690667plr.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 14:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g7RpFRytjES/bc6AKTo9nRj4iH9D2kDE835VJPCM1iw=;
        b=km/PHc5F3S8v671eYMGdDgkd+fYS+ocPnRTJNAQCJZX2wKgtDMrmuVHjOax69StYTb
         q6d/UQZ1MlxJyt0LoGCEMlmWoZmmYBwkDpL5sRfbTvBkfdbxD4lC4r6Xy9xI7smePn/z
         RCk/UBI7VKK90fXK+YSWI/7+aCjpRUMOLa6EiDIB3Lt+4VIbFrE4pxmO2E8aUJbvWg0U
         hauW6pZGxOb2CqNF4Zwjqzl0Djztq49vdvECI6brr9j+U44WzyniZWjAJO7EzyN9nvAK
         IFxXo48oplr0/o84LtB6KAgq2D3pq0cdPviFUoVoR4cU4dD2iiwGhsdlBtBvbMzh4vl/
         icSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g7RpFRytjES/bc6AKTo9nRj4iH9D2kDE835VJPCM1iw=;
        b=qVYnRZ61LCvQBC1f0zYACxOOgck2e0gEVAiDiycr9TlAfVr0q2Fqi39iqOZfQwdI81
         owfPEtatZZInc1xyFYATf0vyiefkvvSOVgL5RFh0Hbgn1IxSHHV/uzazo5HMSSloTLlY
         se7x33iE69FVIdGZB7M0gUvPRZDD/XkwDP7ihYn35db1Ru+3ZmUxUHg5uOO/rcaUK9n/
         v1200JV6O9VtkqbRIlOzT1ZSo21KPOWKl2BWw01q3UrQ3BGEZkselbzk9bdteN9fZ5QT
         7Rf85nhELJ1WVJ+9WVTR+Knu+uX8iVpzciVy5c4Jw/U4u3AhpIG5y2YrEq/9uMaSgkjn
         30lQ==
X-Gm-Message-State: AOAM530dOdo7DhDah8wGlcKOEBdWzM51eAOoKXASrTBYlX2fnfINFyuu
        i3MqiPXVtHBP1tKWKAv8fz+SwL3IiOgsbNkYI8U=
X-Google-Smtp-Source: ABdhPJws6JYaFe+MPtFfBUnAsyLfFdj7nLvgb9PFv39b898p4jcmgoLtxzNLnAQAF2CClLQUq5Av8vEdSF3Z7Ggq6d0=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr7164840plt.17.1605132501538; Wed, 11 Nov
 2020 14:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201111220559.39680-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 00:09:10 +0200
Message-ID: <CAHp75VdRFciyYcDymfCGx-_Zx+6rtsArecFHRzBD+s8P5_P9aA@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] gpiolib: acpi: pin configuration fixes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Vasile-Laurentiu Stanimir 
        <vasile-laurentiu.stanimir@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:06 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There are fixes (and plenty cleanups) that allow to take into consideration
> more parameters in ACPI, i.e. bias for GpioInt() and debounce timeout
> for Operation Regions, Events and GpioInt() resources.
>
> During review Hans noted, that gpiod_set_debounce() returns -ENOTSUPP for
> the cases when feature is not supported either by driver or a controller.
>
> It appears that we have slightly messy API here:

Please, discard this version, I mistakenly sent shifted series (missed
first patches and extra in the end)

-- 
With Best Regards,
Andy Shevchenko
