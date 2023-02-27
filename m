Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A56886A4106
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Feb 2023 12:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjB0Llq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Feb 2023 06:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjB0Llp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Feb 2023 06:41:45 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAB616337
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 03:41:44 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id d75so1955046qkg.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Feb 2023 03:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCfgRrNH2/uylUmlymCnFpILYkpkTF34suNnBXq73SM=;
        b=GF0v8pNNmV8oMh3lg+Khda99xJIOJl3gFvNe9m9tw2gqhCf+ya70T3ZdAuA94W88MP
         YcnBMa5zPVbPa7zD1S6SDCoooG2YEQcV8uxcnYnv3BgN0IuVsNVBdRbKpftx3pIaJtQB
         r3nq5t5WF+g1yuVUIYITVjdfhRZxb4cyFQRgRI8lkqBUJAAMBpfcAgufKWYLQ8yWJsc3
         77lse63G198YL/arA3ZQs1UOZqDRNwnsEIws8KMZB+V/Htici2U+lBcwboz+L5dkEOMI
         LYd3lOdHRRzFWGMjCKpMv10W4HtemgI7YyyWvIeMhL8MMKa8EdxdYf5QQ+nvaCri7Nyp
         h9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCfgRrNH2/uylUmlymCnFpILYkpkTF34suNnBXq73SM=;
        b=sF+nwynMubGh+GkZO2j0nXw/X9zZd7jTGBYv2mKpDSlcRZEtG6UYV4YyZdZb0FLtj1
         wglL3JgdFmi4lkMRROKyHNPGKmzwSLzaqZ0EnpdzMQ48amHpkqxi/ooo+FKJZGGsukL+
         xq5eiwka2GfK3rS/DXIg9smzveSoKsE9VB9SZTPMp3RWYuRjArTnUTJ5M/UdCbLvzIUX
         B/yeWuvQt/KHkjQiiazGdTcI+X9XAEjTCyyVyE9fDbWOJHnlJsimx8y583Gefh6kHXjH
         CIOgHQPgPkvnyAUz4wHgXhKSbkRlRJsA0v1AdkcXfiaOi2SqT8oL5KJoRnvV7e9aP80s
         fDRg==
X-Gm-Message-State: AO0yUKVepKUoMUOOjBpnLRJklTyQJ181o/o/xJyxngQ9IVgbFdFXDwcx
        P/gQbLaMJwMTuU0LF1goGa/Q0D+93QbumbNvNSJaXnJ0whPCmA==
X-Google-Smtp-Source: AK7set/9lYwrr8x83I+Hg+RlCOFJLFXkqp8sJ0VlX3pQsJ7XhGzugdVImKPGx1AU1X/tQYQRByqDAwP7/4HmAmvXPpg=
X-Received: by 2002:a37:a8ca:0:b0:742:69db:3bf1 with SMTP id
 r193-20020a37a8ca000000b0074269db3bf1mr3183864qke.10.1677498103245; Mon, 27
 Feb 2023 03:41:43 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Mc+cAPZnxFXPPp0RzhUqFRBYBkf1c9=wTozY15gTyi5aQ@mail.gmail.com>
 <Y/itg/cmrPCGa5qf@surfacebook> <CACRpkdYLb6YApR34g5k8FzRi2ov5q7qcGAQ+83mL6niesTNxSA@mail.gmail.com>
In-Reply-To: <CACRpkdYLb6YApR34g5k8FzRi2ov5q7qcGAQ+83mL6niesTNxSA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Feb 2023 13:41:07 +0200
Message-ID: <CAHp75Vc_RBCiBOXF19B0qi4V=2F0JGM=1kEiNZXUqpQdQx2krQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v2.0-rc3 released
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 27, 2023 at 12:36=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Fri, Feb 24, 2023 at 1:28 PM <andy.shevchenko@gmail.com> wrote:
>
> > That said, would be nice to have an additional flag (during request?)
> > to tell kernel what it should do with the line after releasing the
> > handle from user space.
>
> I think that kind of lines up with the "default initial values" that have
> been proposed again and again and eventually merged as part
> of the PCF8575 bindings in
> Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
>
> These states are supposed to be set when the driver is initialized.
>
> It would make sense that if a GPIO handle in usespace is released
> and the hardware has lines-initial-states set for its driver, then
> the line should snap back to that state.
>
> +/- however ACPI would define this.

Yeah, but I'm more about lines that are free to use by anybody (read:
user space). When we request the line we can tell the kernel, ok, this
line needs to "keep the state after release", or this line needs to
"reset the state to the previous". The flag should be available only
for user space handles.


--=20
With Best Regards,
Andy Shevchenko
