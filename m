Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A42256BB68
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 16:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbiGHOAY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbiGHOAX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:00:23 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD2315819;
        Fri,  8 Jul 2022 07:00:22 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31c86fe1dddso151735237b3.1;
        Fri, 08 Jul 2022 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BfjSNVqEOwnxfaGfNNXI9zb5JlYvwedHY1tJwv0387s=;
        b=KNE+EAvQXH8SpwABTIRkS7TzxcG8lp4KduMUp6MfzybCxQKoaYuqVnSM7QAyM+oF3v
         Y11JYItd3MVAK3lTuGlQf/T9vMrybnRbka/9SrsVMEKWBnvdOihtLP76wMONUf6nMUMV
         9tkB6m+txvoTnZcw+mGW06SKsrzQrNRSwJhwzpdH+ljVoyXfjpn3HwoX0RWiQq7K5aki
         9IJVlRWIsVB9wTj+eoKsxmGLJ9l23Fn6CHYRLS0epxmtgZpnUHaxHcx6Vq9tqVZ3P8L1
         X6oCmJeWrEfXMWAxnpI4fTWQCOiiAHJz/cObT/PYRzXEKFfeChpXdYcy4cDIdJOV7pVc
         sm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BfjSNVqEOwnxfaGfNNXI9zb5JlYvwedHY1tJwv0387s=;
        b=vgzFf+nN1hbH5nXpQKy3YBJh7DLn360mp354fy2/ybRewiNCQZw0VwvsLiLu6Qp1eH
         e2OfZjZQKOhzSKxKxIzBQRhgvsO9Bcn09yAoo1WR8U0JOLATGqYiC0UKnPQF9Cpn9COY
         hQRlcBNseL4mJw1FEtTDr4SEmzmoo2RXWALhV3yp68ngLhHdpP4osLL6rOF+5HNly/pQ
         p53Wsvr4jGt2fyQAzEa6KtXFcj5e8oP6ddhJ75JiNsK1f8ki5E2D0y4a0rmKVmcwwZYB
         toUY/Sjm09GzGlcXIcVm8qyyqzqQ+6/QwBk/YFk2X61HC/VuY7TphBvL4Jg/Kw0rhmvR
         XNCQ==
X-Gm-Message-State: AJIora9gCxrj8tjZwlXTGmHjqO1OpuK5e53V9leMf9bZBfWximaI5apk
        mp0bxHSjUATxIei3UhJ9OaDcbm1kKn3UdCakBfQ=
X-Google-Smtp-Source: AGRyM1uChV+08AKmeNTw5HjedSQflibghpvrWC1upoLdO0RZ1Ca3vAGX2Ol84yB3zw32neKQj9h72PiwNiW3AiHaKOk=
X-Received: by 2002:a81:108f:0:b0:31c:d7ae:9ff1 with SMTP id
 137-20020a81108f000000b0031cd7ae9ff1mr4068408ywq.18.1657288821898; Fri, 08
 Jul 2022 07:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com>
In-Reply-To: <20220708093448.42617-1-nuno.sa@analog.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 15:59:40 +0200
Message-ID: <CAHp75VfGvAR1+uPL3T96eGDCOeXrc7MTdzwPZ8GV6h61Oq=XPA@mail.gmail.com>
Subject: Re: [PATCH 00/10] adp5588-keys refactor and fw properties support
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 8, 2022 at 11:36 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> The main goal of this patchset is to remove platform data and replace it =
by
>
> firmware properties. Original discussion in [1].
>
>
>
> While in here, some refactor was done to the driver. The most noticeable =
one
>
> is to replace the GPIs events handling by irqchip support so that this gp=
i
>
> keys can be "consumed" by the gpio-keys driver (also as suggested in [1])=
.
>
> With this, the gpio-adp5588 can be removed. This change comes first so th=
at
>
> we can already remove some platform data variables making it easier to
>
> completly replace it by firmware properties further down in the series.
>
>
>
> As there's no users of the platform data, I just replace it in a single
>
> patch as there's no point in having support for both (even though it migh=
t
>
> be harder to review the patch as-is).
>
>
>
> Special note to the gpio-adp5588 driver removal. I'm aware of some change=
s
>
> to the driver in [2]. These changes are in the gpio tree and this patchse=
t
>
> is naturally based on the input tree which means that patch 2 will
>
> not apply. So, I'm not really sure how to handle this. I guess in this
>
> case the conflict is easy to handle :) but just let me know on how to
>
> proceed in here if there's anything for me to do.

Resolving conflict like this is easy, just input subsys maintainer
needs to tell Linus about it to Linus in PR.

--=20
With Best Regards,
Andy Shevchenko
