Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E98214C918
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 11:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgA2K4B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 05:56:01 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42691 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgA2K4A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 05:56:00 -0500
Received: by mail-qk1-f196.google.com with SMTP id q15so16530915qke.9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2020 02:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R2GfLE1YBPy2zxLc6xgpWp5jwd9zTP6iHYDWoWRsFu0=;
        b=doI1v6YMwfdi9cRvhIFdzf7HUa1YU4MrhdiNjQCdEPbWbLksGPj2h+Rc0l6/VQ1pGV
         hmYV6/b8jlR/u5kQkTsh5Eohr5oXCQTGPY0xbBECFnAR56vZYd2SzfkFpbDcHmo8dZHy
         GV9SJGYOEj9lNdahm6/dTl478+a9XSkBTnIwQLyrO7B0PUC5gcGLRmgHxMvvvBitp5ca
         l8Zkfk9UQPTmN2h29+lLwxxr4L61h9rSK7Yu7o0PrjzRKuYt7YIGZAva4Z64ATrmpUj5
         OaF19XHq1cwdmR7gWqqtngPNYHPWQ+j7Rii4Ps0/jCVZbMnOzVPkBlI6vUgJtoX7NK3y
         5R7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R2GfLE1YBPy2zxLc6xgpWp5jwd9zTP6iHYDWoWRsFu0=;
        b=MmRr6rbyVOJLzNFc2n8tKhmaDvULQIxKU6lnGuaqUs0wVEuUQOvBQls/wxUNNqSS6U
         +5hnnaVRSEiDITC0kB2vbEjy9jU0zLYIEzruNR+AjxkTi/ZrLVlOmw902DQk/VyS8u85
         0prLibTLxsMYYQVqiNq2G90gSuMvfHYnGGY1nOuPay9GGl7NsdlPy3B3K0nXMZCva+PU
         LUDNmaitng7v92MdTGeH6c2Qb6ioauXFBnKui4hmzp18Oe7gxicCObGLJjvjM8KfqRZm
         C6fW+mwOrPnSgtEcO2EoQZLMrDnEdVMAO66Mw3FSYZARuMqnXN0hZNo7WRKorwMW8m5L
         tmEA==
X-Gm-Message-State: APjAAAXR/px5iRoGwmEIPVifoB6eHv+ZkU6keHDRbsY26/Sp85/G0M7M
        ppUG3xwzpfYoE5hKVaaLdttxHku/pK0lR6nG9dmKpA==
X-Google-Smtp-Source: APXvYqxjw5pzYeGQTcVIqA7M2WTCWfxESWh8wOs2gTBNL2Ml2I9qClgT2H4h8+alnweWKSpamykEjDKmbAS29n/vhj8=
X-Received: by 2002:a05:620a:12cf:: with SMTP id e15mr27629723qkl.120.1580295360011;
 Wed, 29 Jan 2020 02:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20200120104626.30518-1-warthog618@gmail.com>
In-Reply-To: <20200120104626.30518-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 29 Jan 2020 11:55:49 +0100
Message-ID: <CAMpxmJWCwtnuB4T3_no59cVvPS5gy6QwOBV3i4FU4N6hmYugEw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: remove unnecessary argument from set_config call
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 20 sty 2020 o 11:46 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Remove unnecessary argument when setting PIN_CONFIG_BIAS_DISABLE.
>
> Fixes: 2148ad7790ea ("gpiolib: add support for disabling line bias")
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> No argument is expected by pinctrl, so removing it should be harmless.
>

This doesn't really fix any bug, does it? If not, then I'll just take
it for v5.7 after the merge window.

Bart
