Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0116F165FDC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 15:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgBTOlo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 09:41:44 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44390 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbgBTOlo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 09:41:44 -0500
Received: by mail-lj1-f194.google.com with SMTP id q8so4458501ljj.11
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2WHlji+P21Kboo5TQBiiWNfvaJqWviYfKbr+yK7daGI=;
        b=nfg9Y6Ya/mjmEh/GzbxiwCKmaI718Lx4GQTRMhezN/qmHQnRJW5dmO5aVAgatjhxHU
         YEOjXlidfsnh9QFoG+NSiL1n1Q492pfQSLOcbFxlwj5VNOzkN1718A9Q5pNBwqFywrYB
         RTopqCqy/uVOQMnCaHvH6/uVvmnfckQSWCy2JjDIKybxlOEevBtn7dP8Ty8ql27ILKJU
         YBgUsLWtDP9I55WgtlRCXnphieUnIwGnmcZbciKmKFfaTfsecP8NhmPvU8w/ghsPRsJ2
         H2NNymtvfDY/jGYOVNz5YPJ2aGmjrg8yuqisB6v/XYSGm4BiPObsXiJMcXMBOdKPDusA
         Ud3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2WHlji+P21Kboo5TQBiiWNfvaJqWviYfKbr+yK7daGI=;
        b=nLhhY4n286silWU4BAUSXbL2jxU+aaZJs3722wPEXbfSNTS+c7BfmPBlaH0yT2qIog
         PMw+L+ShfX5ccdwiN7BVHloBFoI1biwtbLPWJQDcU8WYZhpOV4WhPTZfHYtDQeMlwqXY
         Xlt4dNq9iU5wjpNAbaMjaKFAW8Ef9tgC9CG174v1WnXAmoBvV5c8FjNXEXIHK9ZgbGtp
         6U9UaGErw8nz85F8yh0zTqDXXEXo2uFoWv33q8bEu9r9fYy7lozz9c9/4o93Kpj7heNU
         QmQ09+dDA/vZdDSf4ocNZmCrMXC2HLEhvLzlF8y8J1fLQTM0Xg/FNLqalmJ82hMuf3cS
         Lklw==
X-Gm-Message-State: APjAAAWv1JBwLcdg2B2Q33+F+xPqHmQCf4A2hPHuutiEU/3/EJv1z5RS
        9nsENf1q+/XelBZ8DC7Cow8ooL9ocr8oM8+BFThMcQ==
X-Google-Smtp-Source: APXvYqxdFNDLDnJaghMfOLP10G1gDevKPVMi1M6I5zdGkYtLMParaXo3/Sybal+uTiumjcsJkqh9NDXzQpvCwf48k2I=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr19923920ljc.39.1582209700508;
 Thu, 20 Feb 2020 06:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20200210155059.29609-1-brgl@bgdev.pl>
In-Reply-To: <20200210155059.29609-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Feb 2020 15:41:29 +0100
Message-ID: <CACRpkdY5xJke=5uuB9hv36j6N=kDwpwWg-7_aYKTpCBGRjASag@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: coding-style fix
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 10, 2020 at 4:51 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> The indentation is wrong in gpio_mockup_apply_pull(). This patch makes
> the code more readable.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> This fixes another indentation error introduced in v5.5 that I missed before.

Patch applied.

Yours,
Linus Walleij
