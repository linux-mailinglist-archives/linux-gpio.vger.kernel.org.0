Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9067B2747
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 23:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbjI1VPV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 17:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjI1VPV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 17:15:21 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697FD19D
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 14:15:18 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d81b42a3108so15219725276.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695935717; x=1696540517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMae55Fx7PiApDYXyPzKPPdkwhRMRqPd7wXKmf/Imiw=;
        b=V3QrO3PKQm9H77cDdo64Sx3GKFC9R0/AE55TYuvlRWvAc38QhOX3skh4W/5A8B3S6v
         wRN7Clf1QRkmqa0FYiqOW0Mz0H02ARktho3VUFYk2r0SHBqvSLyWa5f9wz6FaTJjd2Ui
         HR0QYYZQlkvV3wnTLuUYGizNl+F1B3P7TTKaUICfy3dfiLsRYJDgEVX6NkMtoEnQF63/
         ckabajfDmYZXifx0zoG/OlGFeXeGetgLsiDevIs8+JeJobnnAm2oKeOnOyeTvOel5AZQ
         KYsjBRbsecZVyJVmHK8fIKhOzpU2HW9p0Y9BtMwj1z0mnM81SJ0+eUH/3XOQpnWLleUS
         +AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695935717; x=1696540517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMae55Fx7PiApDYXyPzKPPdkwhRMRqPd7wXKmf/Imiw=;
        b=FGzubvFBiouV0R3PrT7kG1pgsBu6AgNwLxDBKGSeTKYka8VUFfw0nYWrsHEO0pJv32
         A1X2sJfXN6PxI0xJGztrTxH/oP4aD8jYP7Lt5+4SaaKhqRYJGnrzIjvprsfuQMLQ0Kwc
         yUfcOnBHvS1agb/F6vpvzo50AZ6lmTU1IQWT0v/AK8lkDk283qvmHN8370QhfX+epdUA
         s5Q0cnG1S/l7+7TsmoMTofi2n/ebN30kqaOvwAM7WVUIK5BuCAZo4feLsSmAPhyt+JsN
         v1+4Uv4NyjfD1Oal/faVXgrxQOQQ51zT+8zyh+OohC27ARr5PCxJPM1+LqrbaenkR2rG
         NU/A==
X-Gm-Message-State: AOJu0YzehJzLMAoNYxP2HVwoo+dkGF7UwFCwZwjUJgqK11aV6SU3uSQ5
        TpYK7mCChgFHhozQ/SCbANeaNYHL5r1NgDysU5k6rg==
X-Google-Smtp-Source: AGHT+IEx5vmOlgc90YGcN9ELfymxnTjl5jH5W/7HnoFi7r9aFnJqkqfFU0S8v8Bpml17IwCuy4WjLkmqcJSWej8jc+E=
X-Received: by 2002:a25:ca8b:0:b0:d80:9ed:5038 with SMTP id
 a133-20020a25ca8b000000b00d8009ed5038mr2385007ybg.21.1695935717623; Thu, 28
 Sep 2023 14:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org> <20230926-gpio-led-trigger-dt-v2-1-e06e458b788e@linaro.org>
In-Reply-To: <20230926-gpio-led-trigger-dt-v2-1-e06e458b788e@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Sep 2023 23:15:06 +0200
Message-ID: <CACRpkda0XnLtNwp-sQhS=SKqPB+zce7ZJpEeKnJbGmfsL=p_Qw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: of: Allow "trigger-sources" to reference
 a GPIO
To:     =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 11:48=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> The "trigger-sources" phandle used for LED triggers are special:
> the DT bindings mandate that such triggers have the same phandle
> references no matter what the trigger is. A GPIO is just another
> kind of device that can trigger a LED.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Bartosz could you queue this patch? Lee already queued patches 2+3,
and there is just runtime dependency with no in-tree users so it's fine
to merge them in the different trees.

Sorry for missing to CC you directly on the set :/

Yours,
Linus Walleij
