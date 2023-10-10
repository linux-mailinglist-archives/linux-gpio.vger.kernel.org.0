Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA53A7BFA69
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 13:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbjJJLyN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 07:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbjJJLyN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 07:54:13 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBC0A4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 04:54:11 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7b91faf40so11672957b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696938848; x=1697543648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDIZK2JgNL/4fmh5x4TEGivcbBKztGUQajvuvg54oRA=;
        b=a3VQbTEnJC+7cQjfm4S3VJSjObAz82XvDeqHRINZQaneF6XoXRHsb485kTU/hN14ri
         b7ZvpsrLHqs76+NuIoB4aCxDTmv7Vg1eJWgNYdGRfkt0QeUAOrkEOOzB/NfYa6U1EdTt
         nEDluPz5zLj49F6p3MHDvgXNJ7v55epocWrexgwapHRfsybvUuJ2WlioqQWUE0IFGRaN
         4rBR8KBrZeNW/3jXVOAxYrbiBLpmuAD180mNTaD4cFkxMgRjvsRuc/3/XhV4z364mZ+D
         aGiGOWji/s+PTsq7YTgphaNt8nhik0om5nq6PACZ7pGkAJb0VNZh2I7Fk2iu56GoWI7o
         dIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696938848; x=1697543648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDIZK2JgNL/4fmh5x4TEGivcbBKztGUQajvuvg54oRA=;
        b=ko+Xwenmu+YPTYPgeesK5MMOTX3Pk9pTQoaQMzHJasuPFW4KXkNRFGwswsM5w9sv8g
         pqW3fsGCooBKXACVNMzQD3mhoyDPI7ev7gRZ8Mz2fr4WG4b/Abckd2KLE88xB9c9lwqY
         kPlPKsuA6zDeIjlHGekbS5QMdqfT+9KU47oyCRZzB+YqUR7fxJnUlOOMLzEXBnyvYOf/
         EPB62vA3uXfVAyeM2ZvtKkhBw/dk+O/CvxbIcTEf6mnvAOdzpB56DazVMtg1ssBq00mY
         grAeKbXKhAe4Zdx1ETDTk/S8LO6IUhPhh/IsDEUR94THIkQdwJ1jqIfCFk7p5nuV7dOR
         76Ww==
X-Gm-Message-State: AOJu0YwQcgrKC4qTkR+xDsqNWNLjaffl2c6HR2N3kTP4ODMRLum0MvaP
        +WSEW7c6nXWvLByTeXExLMupy5jNLmsiCNWLRBhenw==
X-Google-Smtp-Source: AGHT+IGJLeCEgyssCwkr1IRA6nE/61tJtIYUAQpXlv6Sm1fP8byIFDZgaogCvc1s1fl7Wj6hcZI7Vh16BAo3bPi/WUA=
X-Received: by 2002:a25:a344:0:b0:d78:f32:5849 with SMTP id
 d62-20020a25a344000000b00d780f325849mr15719479ybi.24.1696938848554; Tue, 10
 Oct 2023 04:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231005025843.508689-1-takahiro.akashi@linaro.org> <20231005025843.508689-2-takahiro.akashi@linaro.org>
In-Reply-To: <20231005025843.508689-2-takahiro.akashi@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 13:53:57 +0200
Message-ID: <CACRpkdYQefGqb3UUyoK6sf6FRUH0m_2xLDzUKO7rQ6dXyeGTww@mail.gmail.com>
Subject: Re: [RFC v2 1/5] pinctrl: define PIN_CONFIG_INPUT
To:     AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Oleksii_Moisieiev@epam.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 5, 2023 at 4:59=E2=80=AFAM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:

> This configuration is intended to be used to allow a pin controller based
> GPIO driver to obtain a value at a gpio input pin.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
