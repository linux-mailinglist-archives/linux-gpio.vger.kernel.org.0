Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452CB1BC139
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 16:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgD1O3U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 10:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727108AbgD1O3T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 10:29:19 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61196C03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 07:29:19 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d25so2136152lfi.11
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qS5tY9fAedmAgcO273Iag/IA9q4/QmSGFPGhwHpMWTA=;
        b=w1FB1838aQaTDk66cwscIV59dGjWZ8MVaSwqmCv/pVrtq07SOUllZPBvlpNeHtrIxH
         yJtuPa9svMu1/GUIK09nWsiDqE2E7F7P/+Tk7AxpYlJlIkIPDKNJP6WxhWOXM+Osvm/z
         cgOq/4YzcrUwwjLmwoifmElMQ5s7jXIl3a935e8CojPWRkc1KGL617jsqgT1l9gAwK5f
         UzWL1I2VScsfgwrKDnzE68Pk486p3si1gf30wZO1nR8Y2zcyh4xG3nh6KSoXparUjWNO
         V/kL0FWu2t9qXt5oJ+COdOVdic09dR8aJbCkWumZOQQpGumdTx6LdmPz+2/UfOXCvX7s
         zzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qS5tY9fAedmAgcO273Iag/IA9q4/QmSGFPGhwHpMWTA=;
        b=hrgOJNZqelmEqflbAp33N0GXzssnSBIUKPjaJu+W95dRyE6lyZZs6EMF+Lc1e9u0oJ
         EVd8FYnPQRNL7BiOHiwFo7aENAok92+fkfIh1goG4vHJ3aRUkc1Dehl8KrjqXkCV644V
         GsfkY/tAYxVDYnHgv19i1gpYxSn70fd53b45CXWJ4jMDl5NoMRyz92L12o4A8lOUMgUz
         ywNtRpX1K0QGy39jTEERiXnzruNEgQlEjFmE4c1oPsdeuYWKPasEIah3j8wK2hTk4gep
         UgMcCLtIeHroFrhI4YtDAT00/56y0+bMMrZAnW746vk+GdMWMNN6oC/mpSqq8Nu0I0ue
         1b3Q==
X-Gm-Message-State: AGi0PuZO/DJPU2Z66PMIsvmVhnK7EuN0gu5fUjm2o1MaTKHNqcF1Y+y4
        hqqskdsaOR3tI8w1X7u/QBRd3xZZwaKmAEIao+mIgA==
X-Google-Smtp-Source: APiQypJy1nFXdOyU7tbuE06RQb3qNZN5Is1YT/V/+ngWM9Tr5SJIp9t6PPr4c/l3OB1pzn1fTcc9dgNCFk9jVjw0qZ8=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr19638888lfp.77.1588084157886;
 Tue, 28 Apr 2020 07:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200428115543.33379-1-yanaijie@huawei.com>
In-Reply-To: <20200428115543.33379-1-yanaijie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 16:29:06 +0200
Message-ID: <CACRpkda6gd+7mUDMShgWfGRQ+P1w8tpThr3-BzSMifx7m2pGXQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add pwm37 to bm1880_pctrl_groups
To:     Jason Yan <yanaijie@huawei.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 1:56 PM Jason Yan <yanaijie@huawei.com> wrote:

> The 'pwm37' is not added to bm1880_pctrl_groups, which triggers a gcc
> build warning:
>
> drivers/pinctrl/pinctrl-bm1880.c:263:27: warning: =E2=80=98pwm37_pins=E2=
=80=99 defined
> but not used [-Wunused-const-variable=3D]
>  static const unsigned int pwm37_pins[] =3D { 110 };
>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Patch applied!

Yours,
Linus Walleij
