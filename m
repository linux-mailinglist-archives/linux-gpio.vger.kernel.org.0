Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675DA410D14
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Sep 2021 21:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhISTXc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Sep 2021 15:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbhISTXc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Sep 2021 15:23:32 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4B6C061574
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 12:22:06 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g1so58278817lfj.12
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 12:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CH8DwOwnIGHSkB5nKKVKkQAHmId2HsN8vh9sXHZxrPo=;
        b=BH8+H6l1iUx/CI+PVcyDds9KqNwKLaEzSfSAk//k2LuIDXF7BkSz1+HEVaZPDAKGu7
         RLHVjrt/i9kAPephXn5/+wWTGe9BABxEnDHNp0TvT3yeTDbhI0GCT9LmNN8Fx7tpTkxv
         lH6X3o8mNbkQHLci4+H5f2KZoZGCKObnGjcVKFekgmBCU/ZyU4OOC869n34cfAQdyJX4
         XLq2maulUfJJ06th7uU9vj8RlsohCcB6RdRtUf0RvLpnURpLc8z+SLwiypy+Wh+SZoEK
         XffmRxcVu5AqnvU/NhYNCnvS2VoXZNXP8fXRotGaKe9EnvMK9i/ZyhEzBjy2xyE9CoBx
         a0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CH8DwOwnIGHSkB5nKKVKkQAHmId2HsN8vh9sXHZxrPo=;
        b=yzOdtNuQsi6jsl33iCMTy5n4kKiBQq4XoqN6P+r4/gWM0rnm8xlD4kKefW0oQdhQT4
         F4Ema1iEsy8x3XYX4M+2P0GTjbCY72BsoRZDPNhW1f1hnQw1qOhyZstwEPpbo7ciM/sw
         gEToPIhy5sdN9lGXyQleKAsS+/4pA+oknqruVlaic4WvnHzbShSmAG1bGphcjbnDUkWE
         b36uBIil7LtoRAMammSdBqSkZ/x1kcXXir/NbgCGqEOcBSlQAlCJsbDNP40OLFON5OK+
         jY+dLnx5Dox0KZh2lsxD7oHatCqCuPKqy7kCkHO/nv85r7Dw3GFVnabnszSHsh9EJNbP
         Tnyw==
X-Gm-Message-State: AOAM53127NrnqaZdzmgDGll0wUPK9gXD6zQ9F81PmNe6IwrgjnCwOZvW
        BNELweTnTky9gS4KXr+1Epop+DZcfEkHqP5/+Nv4Og==
X-Google-Smtp-Source: ABdhPJzr4tyUvZgmKO2c5C9N+5I5jJAUX78bMULYezMhuCRrFomneyQnUNao2ZeDeGVrd/DzEflXxP4DICFv4ZE+GyM=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr16253201lfu.291.1632079324351;
 Sun, 19 Sep 2021 12:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210916135543.0193a30a@thinkpad>
In-Reply-To: <20210916135543.0193a30a@thinkpad>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Sep 2021 21:21:53 +0200
Message-ID: <CACRpkdY4Ciu0OpSHiY+vFTy1CA4--V+DtAPXBHGokpHvCSgGAg@mail.gmail.com>
Subject: Re: A37xx PWM pinctrl definitions still (maybe?) not correct
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Patrick Williams <alpawi@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 16, 2021 at 1:55 PM Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> Basically what I am trying to say here is that when user selects the
> "led" function, the pin is controlled by PWM. There is no way for the
> user to set "tristate on 1" setting but keep the pin controllable via
> GPIO subsystem.
>
> What do you think of this? I still think there should be only one group
> controlling one pin. But maybe someone will need to control the LED
> with "tristate on 1" via GPIO. Should this be a separate, fourth
> function, something like "gpio_led"?

There are two ways to do this, either as Qualcomm does and have
the GPIO mode be a unique function, or implement the
three pincontrol override functions on struct pinmux_ops
that makes it possible for the GPIO driver to just override
pinmux entirely at runtime and mux the pins into GPIO mode
on demand, and it seems that am37xx sets those?

Yours,
Linus Walleij
