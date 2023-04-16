Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664246E36A5
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 11:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjDPJgq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 05:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjDPJgq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 05:36:46 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035D2198C;
        Sun, 16 Apr 2023 02:36:45 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id gb12so20363192qtb.6;
        Sun, 16 Apr 2023 02:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681637804; x=1684229804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbfDrzJRkM8K1un7ocCqgCwd0PjSNRKebf06x0UdXOA=;
        b=H/7P139nIYVSxF/EpLa1Xv3kV+DoUb0IlN71+7IZCz/3VDSWiTvTX6xLBENTqAcOQz
         o3TFGOzdNoJYVxue71033eL3VKXngXafmf2no8MmxYt5lLJmK4dsNwiD2CMCDNDM0Y9P
         RKreiwYsnlPrxbCFMDlUThkXGwrMK7Kzebk4Fe1u7DfFF2fzh+iaHp317cO5W9tg4o0K
         pMsz4hM9TkTkofWFhBROXEw92AzhjNgRXORecgcck/Xv8qDQkS5wMiqUtaJLP+Ua9u8W
         T0yJ9GRgMAtGCjQJBip0m5LC9aKoA6Yaa820cCTEdrDM9XxvYVHebeEE5hG20wVq0X2N
         pz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681637804; x=1684229804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbfDrzJRkM8K1un7ocCqgCwd0PjSNRKebf06x0UdXOA=;
        b=lOHvCvt2SG+9w9GtJqwKq5nxhBNgZSU8HZz3er4ibGsalKbR2I8HIafoQkhMGyuIOD
         7198Deoa2MazFqSTZTFVpEZ1alGpSAbxd1ASzjda24bbc34IlAE8w+gNBp2FPvSwZdAk
         52sU50weOMuAKHwPx4MGm3BpHfYcm5OpjbgSjUzs7+s/WK7NbR/Ekt1Q4xKE80ARjaUE
         iN5zUeA9MsQwh7Zeq2xStXhbhciI84dj8aZzZrVuDO2sN7kddYtVgaSQn9T7YgCb+AHH
         pTQdekRW4Wd9OMwUC90kT8zad8dmZ82EA/aDZqFJEDL7jSnUH8y+PS1r3CoMhfnDSo8D
         sNEg==
X-Gm-Message-State: AAQBX9e/7OD9vzc+0UfRP6Fy4+COCcoygfifu451GF9hCpjtWoSkUiRX
        1GB6v3ROjA18EoU1lV/uXvKjV4Almn/VzsWVSjI=
X-Google-Smtp-Source: AKy350b1WWgf6dXmG9GT6/je3w7PCfM64pRzyWHgf1y0BhNIlgTXpdb59g0fXuC1a0BBki+W8u+ffUUFlHDQaYZfH80=
X-Received: by 2002:a05:622a:1a9a:b0:3e9:9419:b153 with SMTP id
 s26-20020a05622a1a9a00b003e99419b153mr3386803qtc.0.1681637804028; Sun, 16 Apr
 2023 02:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <3231223.aeNJFYEL58@steina-w> <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
 <4800953.GXAFRqVoOG@steina-w> <CAHp75VeTFDkaYRfX+9hE7LYE4Z-NpNfP=xfsGt27nm_DrTC_cw@mail.gmail.com>
 <a79134a3-be9d-7297-15e1-1de4eb4054d0@linaro.org>
In-Reply-To: <a79134a3-be9d-7297-15e1-1de4eb4054d0@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 16 Apr 2023 12:36:07 +0300
Message-ID: <CAHp75VdRjCvcwjVO8GZfrVhFqJmO+WaqmJ63A2vVK4iELx=OXg@mail.gmail.com>
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

On Sun, Apr 16, 2023 at 10:42=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 15/04/2023 17:06, Andy Shevchenko wrote:
> > On Fri, Apr 14, 2023 at 9:37=E2=80=AFAM Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> >> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko:
> >>> On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
> >>> <alexander.stein@ew.tq-group.com> wrote:

...

> >>> So, taking the above into consideration, why is it GPIO property to
> >>> begin with? This is PCB property of the certain platform design that
> >>> needs to be driven by a specific driver, correct?
> >>
> >> True this is induced by the PCB, but this property applies to the GPIO=
,
> >> neither the GPIO controller output, nor the GPIO consumer is aware of.
> >> So it has to be added in between. The original idea to add a property =
for the
> >> consumer driver is also rejected, because this kind of behavior is not=
 limited
> >> to this specific driver.
> >> That's why the delay is inserted in between the GPIO output and GPIO c=
onsumer.
> >>
> >>> At the very least this is pin configuration (but external to the SoC)=
,
> >>> so has to be a _separate_ pin control in my opinion.
> >>
> >> Sorry, I don't get what you mean by _separate_ pin control.
> >
> > As you mentioned above this can be applied theoretically to any pin of
> > the SoC, That pin may or may not be a GPIO or a pin that can be
> > switched to the GPIO mode. Hence this entire idea shouldn't be part of
> > the existing _in-SoC_ pin control driver if any. This is a purely
> > separate entity, but at the same time it adds a property to a pin,
> > hence pin control.
> > At the same time, it's not an SoC related one, it's a PCB. Hence _separ=
ate_.
>
> I don't think that anything here is related to pin control. Pin control
> is specific function of some device which allows different properties or
> different functions of a pin.

Sorry, but from a hardware perspective I have to disagree with you.
It's a property of the _pin_ and not of a GPIO. Any pin might have the
same property. That's why it's definitely _not_ a property of GPIO,
but wider than that.

> This has nothing to do with different
> properties/configuration/functions, thus it is not pin control. The pin
> control maintainer also acked the patches.

This series is about GPIO, so the pin control maintainer acked that,
and not reviewed it, so let's take this into account. The GPIO
maintainer has yet to comment on my reply, if he has anything to say.

> The choice was discussed before, so I am surprised why you jump late in
> discussions.

Why? I was not in the initial submission and I jumped as quickly as I
noticed this.

--=20
With Best Regards,
Andy Shevchenko
