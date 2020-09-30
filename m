Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBB927E550
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgI3Jip (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Jip (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:38:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B01C0613D0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:38:44 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x69so1334768lff.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ep9z0ZZ+f7tQIzGMJ7yrHFUOye3w1O3ldVwgOl4L0AU=;
        b=q+wVFBAQ+DJ86rabJ6hidB5LHLOVJ/FpPbFRrmPEA6Ghv2/tJ3txRvJUgIRPgqQMqA
         XYyg2kV2FRp/+/c5xNjeENhej8MWmZ9FpG/Sgf/PZfl/U3q6wLUatt5aX8DnjkmWRDqo
         q36pJ3jRmKrm8Hi3Uokxg1JMwxhGcBEfB5xVseNHpq0WON3tcAwHDB9WTNAWWhiRivH+
         MoiVMSBdK6+2csK9RBWVE/TntSrrGPB+BgbIQ7zdMcNqC9YENKPNGnt5v1C2LMYd/zJT
         yMB1NdyIBA6iEWwfwARQd5sRToVdKeE4UiVuHFHYeYSpsrpnNeXrCCl00k2X4PZplMM2
         YnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ep9z0ZZ+f7tQIzGMJ7yrHFUOye3w1O3ldVwgOl4L0AU=;
        b=prJIuBS0AcH4g6t/beN4TZTK8aqqbxZA3dtak4VyIljZzFLpvVf7aCXRKJ7ZxorKEm
         Pmy2/Qr8kTrgYHJKm0jfWIU38PimedyoKIGmzT4TdEJItZ11LvQhsv8sNVpXElsrfQJv
         dOcWH+wXs0aDhNfM3IewgnQFCLnZYzr0mgFeTkWkbpaX42ME00Y516t+1CSLmCVfO7O3
         4g3yKTJ3t4DHboYUp/dxoYQngFff1tror+viG6tKXbzlT+xLClve8p1akaXP1dE1FwtT
         h97x14+DHAmvFuUe8FxSRryX2cB0LyLHmwk4PuPlKsQeSdbkI8S9yUgIK++V8FlKIHbp
         huKw==
X-Gm-Message-State: AOAM531kDCzlg9apUSL8f8KpdlIFZfDHFpXzkthwBwyKT0tInUTr7NmZ
        2aqr3MW4RqdROciVo3RLRoHvKmtbWeYtbKFbVnY/ow==
X-Google-Smtp-Source: ABdhPJznurOWOD+F9cHQcbYDkYOLhWYNUjf0OBW3ctQQAUoKhKXiH80CBcd0UKXsezJVXoG8eqI6pA5xjJ5Bmar4wak=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr538082lfb.585.1601458723300;
 Wed, 30 Sep 2020 02:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200930092426.9559-1-brgl@bgdev.pl>
In-Reply-To: <20200930092426.9559-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 11:38:32 +0200
Message-ID: <CACRpkda6KttZYm1d55XpZizDAHgZm_2dCt403_j_K0FgE9qB9w@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.9 - last batch
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 11:24 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Please pull one more fix for v5.9 release.

Pulled in to my "fixes" branch.

Yours,
Linus Walleij
