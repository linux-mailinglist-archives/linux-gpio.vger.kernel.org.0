Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2986E37A5
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 13:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjDPLPV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 07:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjDPLPU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 07:15:20 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5042C26BE;
        Sun, 16 Apr 2023 04:15:19 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id l11so23630282qtj.4;
        Sun, 16 Apr 2023 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681643718; x=1684235718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LekGLcBF9xZpY9xI9z0ziJhiroV/vg6MjJvZ0A8P4Vo=;
        b=psqEBSco7QPfsDh+PUUMGmo0Nr7/xbBQrFqTfEsIRe/JXbw46E4Aud+AuO671oZ9RG
         e65089RpmruylAdQaU4hb/EGD5kmUhhvxz5R+Sm1rEwTYaA0sjcjqkFewIx8p3baIt68
         PSODT3Jb7u6TOmQS6lrjXo3w8+/nNUQOgeWZi6vBFAU4zhkT/v4CZK1DsDBYY9YqNGYY
         5CWfGEyaWl/QC7KoRhPT8ZWqlAE5/TGXqIZd1w8/JbSlXX449nDnZAh6uBqT7vARsZtC
         KGbZj6spPDj1hqW5R7wQHxcbIxO8V8ngGC1gHUAoo7ExyS2ihObCy94/ZpqEFjK8/flO
         zigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681643718; x=1684235718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LekGLcBF9xZpY9xI9z0ziJhiroV/vg6MjJvZ0A8P4Vo=;
        b=Eu/LEB/csZ8KjJ8FN5PP8X3WxUPSIis/JFS83FEve2ju3sVbH4FVT6eRyvchIB49M6
         aOefaSHlHwTZBJbKnu3/RnN0/rcw4pQBXZum+nYRJHesG6smygu/zm+WJvMgGxqtnfYO
         vaSnvByrMlq8+5cXElyRcWHWLXSwbz6mmZ2TqSGeb8gh7G8ZnV1kZxUGnvu0RBLTTige
         XgYrc+2T7BgZEm0cogXYF/NELcV3BI2mDt3qaurEpofdE6xKmPY6/M+ipY3cOl+xuJh7
         b+xM9Mk/FgEg0BigNw027ZibQ5oJtbBgKGp16aJgDyGCSY+yWUd0dlORsWYbbNBrSk2K
         Y8vA==
X-Gm-Message-State: AAQBX9cDkjmhERmQv2pTJ7/L7qWKuJ9J+DxD8I154/komnt7DfVjlxRw
        6xMZpb/Ihu4uFuhL9N+LGL+wvnV8WhRdEWN/yhVh4qH9HRI=
X-Google-Smtp-Source: AKy350Yr4zuQksiNckAoyJpNsW4s+0Ef6hREXYDvZCUVv8YZGXSaa+yyMeHY7IYGPIdJRtIIi4MkcFgbVkFbqrtR18w=
X-Received: by 2002:ac8:5902:0:b0:3e6:720f:bae1 with SMTP id
 2-20020ac85902000000b003e6720fbae1mr3610966qty.0.1681643718307; Sun, 16 Apr
 2023 04:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <3231223.aeNJFYEL58@steina-w> <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
 <4800953.GXAFRqVoOG@steina-w> <CAHp75VeTFDkaYRfX+9hE7LYE4Z-NpNfP=xfsGt27nm_DrTC_cw@mail.gmail.com>
 <a79134a3-be9d-7297-15e1-1de4eb4054d0@linaro.org> <CAHp75VdRjCvcwjVO8GZfrVhFqJmO+WaqmJ63A2vVK4iELx=OXg@mail.gmail.com>
 <ee53f7cf-b94a-ba0f-1e28-5ffa2c0f5e78@linaro.org>
In-Reply-To: <ee53f7cf-b94a-ba0f-1e28-5ffa2c0f5e78@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 16 Apr 2023 14:14:42 +0300
Message-ID: <CAHp75Vc31cQLT0TNS7UZddA+M=215qy_xZMpzTeRj0LV7t69tA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

On Sun, Apr 16, 2023 at 2:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 16/04/2023 11:36, Andy Shevchenko wrote:
> > On Sun, Apr 16, 2023 at 10:42=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 15/04/2023 17:06, Andy Shevchenko wrote:
> >>> On Fri, Apr 14, 2023 at 9:37=E2=80=AFAM Alexander Stein
> >>> <alexander.stein@ew.tq-group.com> wrote:
> >>>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko:
> >>>>> On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
> >>>>> <alexander.stein@ew.tq-group.com> wrote:
> >
> > ...
> >
> >>>>> So, taking the above into consideration, why is it GPIO property to
> >>>>> begin with? This is PCB property of the certain platform design tha=
t
> >>>>> needs to be driven by a specific driver, correct?
> >>>>
> >>>> True this is induced by the PCB, but this property applies to the GP=
IO,
> >>>> neither the GPIO controller output, nor the GPIO consumer is aware o=
f.
> >>>> So it has to be added in between. The original idea to add a propert=
y for the
> >>>> consumer driver is also rejected, because this kind of behavior is n=
ot limited
> >>>> to this specific driver.
> >>>> That's why the delay is inserted in between the GPIO output and GPIO=
 consumer.
> >>>>
> >>>>> At the very least this is pin configuration (but external to the So=
C),
> >>>>> so has to be a _separate_ pin control in my opinion.
> >>>>
> >>>> Sorry, I don't get what you mean by _separate_ pin control.
> >>>
> >>> As you mentioned above this can be applied theoretically to any pin o=
f
> >>> the SoC, That pin may or may not be a GPIO or a pin that can be
> >>> switched to the GPIO mode. Hence this entire idea shouldn't be part o=
f
> >>> the existing _in-SoC_ pin control driver if any. This is a purely
> >>> separate entity, but at the same time it adds a property to a pin,
> >>> hence pin control.
> >>> At the same time, it's not an SoC related one, it's a PCB. Hence _sep=
arate_.
> >>
> >> I don't think that anything here is related to pin control. Pin contro=
l
> >> is specific function of some device which allows different properties =
or
> >> different functions of a pin.
> >
> > Sorry, but from a hardware perspective I have to disagree with you.
> > It's a property of the _pin_ and not of a GPIO. Any pin might have the
> > same property. That's why it's definitely _not_ a property of GPIO,
> > but wider than that.
>
> I did not say this is a property of GPIO. I said this is nothing to do
> with pin control, configuration and pinctrl as is.

Ah, I see. But still is a property of the pin on the PCB level. That's
why I said that it should be like a "proxy" driver that has to be a
consumer of the pins on one side and provide the pins with this
property on the other.

> Otherwise bindings would be in directory matching the real hardware...
> but they are not. So you can of course call it as you wish, but from
> hardware perspective this is not pin control. This is RC circuit, not
> pin related thingy.

Yep, I put it as a pin configuration which is part of pin control in
the Linux kernel right now. But I agree with your above explanation
and it seems that we lack a, let's say, "pin modification" framework
that stacks additional (PCB level or why not even some special in-SoC
ones) properties and adds them to the given pins.

--=20
With Best Regards,
Andy Shevchenko
