Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E251C6E3207
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Apr 2023 17:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjDOPHg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Apr 2023 11:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjDOPHg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Apr 2023 11:07:36 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3168C40D6;
        Sat, 15 Apr 2023 08:07:35 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id i20so63651qkp.3;
        Sat, 15 Apr 2023 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681571254; x=1684163254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3V04fDJnYoSF7uXoiVmv9JNp8rPXiQUAsZVWyn2F3E=;
        b=hiAd2NWPRwSj84rHbz4HiQ2GGQ7VzVR1qs9M7Vasn9w5BKjc7U34qymdZ9TA8S5Z1r
         MPUdAqr/vQWR4X2MH4+7MhRHbpQlXP7wQo4hR84WtJwIYnA0uKtuX4cL+tGro3BZXYrl
         JXD6UdmvOOQTc4kH1T7knUsU+K32DWF3OOCc63fHJHM9q46Qu6I64o5XfTotRQFCd0gc
         a0wBG0m4q7W0RJHGlNkc8UrlMtM7sckxYbQENjecM+mkgaItAGUjYUAr73fbZknjhztG
         LttEVZ0kDHoLatnsxBrIU9VkChASuJMelRoKkL/SjfWq0WfBG33FaDXcy7KN/iwVIDH6
         QDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681571254; x=1684163254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3V04fDJnYoSF7uXoiVmv9JNp8rPXiQUAsZVWyn2F3E=;
        b=Iit5gRR6jfXz/i3CS15XFeWUlZbcuriJ9/PI0xrtscWdWDK5FYelpQ2b5VIFNvV7wb
         G4tBK/m1S68JpDodzWYqHprt21VqZssQF8ZMnD5ULtyg2XDzPkHZp91GLCS1cb+iW8+V
         pYgyM/vtWHKKE4tHLhYXW3TUSQMwJAmyQGuG4miEspBhW66BgFoPL35ymIedYW5xIVJP
         RDymf1oaworgKFu8jB5QX4v1SqphMLObJ/5nC5FhZ+ONtjSa//kbc+OU+M3NijNrQX6p
         3d9zQrg2iN77sVVDhw1wVUcp09hjQ19j8KEf4GYXp0CEj8GHIIv8Yf/TvOrFy+LlDCmO
         yjKg==
X-Gm-Message-State: AAQBX9cQt22f36aAB3big1D9olPWsLi2Cn4GMWDLodN7IHBGeYyc7lty
        rpLK2ZC5deL7PI5kDxVHRDqyZZ0xt2oKHHN8VJ/+YsS2Wvk=
X-Google-Smtp-Source: AKy350YZ/vANNePEKc9aOp2+XqMvhSjnVqZ9h5T7zCrF3FxIhPdguLfrcVhE1sF4Oo1FG3AplLGgwBXPIDe3u3pZUqw=
X-Received: by 2002:a05:620a:11a3:b0:74c:4349:8ceb with SMTP id
 c3-20020a05620a11a300b0074c43498cebmr696265qkk.14.1681571254161; Sat, 15 Apr
 2023 08:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <3231223.aeNJFYEL58@steina-w> <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
 <4800953.GXAFRqVoOG@steina-w>
In-Reply-To: <4800953.GXAFRqVoOG@steina-w>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 15 Apr 2023 18:06:58 +0300
Message-ID: <CAHp75VeTFDkaYRfX+9hE7LYE4Z-NpNfP=xfsGt27nm_DrTC_cw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 14, 2023 at 9:37=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko:
> > On Tue, Apr 11, 2023 at 10:19=E2=80=AFAM Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
...

> > So, taking the above into consideration, why is it GPIO property to
> > begin with? This is PCB property of the certain platform design that
> > needs to be driven by a specific driver, correct?
>
> True this is induced by the PCB, but this property applies to the GPIO,
> neither the GPIO controller output, nor the GPIO consumer is aware of.
> So it has to be added in between. The original idea to add a property for=
 the
> consumer driver is also rejected, because this kind of behavior is not li=
mited
> to this specific driver.
> That's why the delay is inserted in between the GPIO output and GPIO cons=
umer.
>
> > At the very least this is pin configuration (but external to the SoC),
> > so has to be a _separate_ pin control in my opinion.
>
> Sorry, I don't get what you mean by _separate_ pin control.

As you mentioned above this can be applied theoretically to any pin of
the SoC, That pin may or may not be a GPIO or a pin that can be
switched to the GPIO mode. Hence this entire idea shouldn't be part of
the existing _in-SoC_ pin control driver if any. This is a purely
separate entity, but at the same time it adds a property to a pin,
hence pin control.
At the same time, it's not an SoC related one, it's a PCB. Hence _separate_=
.

> > > > Which part(s) did I got wrong?
> > >
> > > Maybe there needs to be an explicit example in the bindings document
> > > what's
> > > the actual issue to deal with.
> > > Right now if a GPIO is set, it is expected the signal on the receiver=
 side
> > > has changed as well within a negligible time as well. But due to exte=
rnal
> > > reasons (see RC_curcuit above) the change on the receiver side can oc=
cur
> > > much later,>
> > > >100ms in my case.
> >
> > I still don't understand why it is a problem. If each signal is
> > delayed then the caller should be aware of the delay, no?
>
> Then we are back to square one, to decide where to take consideration of =
that
> delay. Up until now there have been several proposals:
> 1. GPIO consumer [3]
> 2. GPIO controller [4]
> 3. GPIO delay node (this series)
>
> 1. and 2. have been rejected, because that delay is taken care of where i=
t is
> not caused.
> 3. explicitly declares the location of that delay. It's less/not intrusiv=
e to
> existing parts and purely optional. Given this is a rare case, but not li=
mited
> to us, option 3 seems a good way to go.

All three are for the particular case of the pin. I do not think it's
_solely_ related to GPIO, esp. if the pin can switch modes from GPIO
to some native function. To me it sounds like it has to be a pin
configuration (of pin control) delay node. I.o.w. the #3, but without
tights to the GPIO.

> [1] https://lore.kernel.org/linux-gpio/CAL_JsqLeqpMuRkvpT2-x5q+8e4bHf4oLD=
ML2QqCOgRMAg8=3DCsA@mail.gmail.com/
> [2] https://lore.kernel.org/linux-gpio/
> CACRpkdYioW1GROHFxA1vuAEiXqHh6fAu5CXNLcTvW_w3mWjSPw@mail.gmail.com/
> [3] https://lore.kernel.org/dri-devel/20221209083339.3780776-1-alexander.=
stein@ew.tq-group.com/
> [4] https://lore.kernel.org/linux-gpio/20221212103525.231298-1-alexander.=
stein@ew.tq-group.com/

--=20
With Best Regards,
Andy Shevchenko
