Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D9D5A7D22
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiHaMVW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbiHaMVV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:21:21 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83740CE49D
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:21:19 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id qh18so7725441ejb.7
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=3deuHTbgt68FZtumNl8QakR6BCKlpcTobGFH5+SIwxQ=;
        b=WbC/jQehX0sc3K9UA1wtLvp69wnyLXnZSWUzYC9sQqcUUUYmekRudDvToByniNhWgM
         PJMpOc+DADLEb2mBDmHoFpl4SkOKDf7eFw7UrftOW6aZ8gaKbngMQ/wCdoEKehYn4+Hh
         XNc0R2nF1ZsFW/spP/+ZLuJvXVfZB6owJWDhsrIaideNqm3jTOflfE8VZm0yXo2QlRqe
         H156A/dmG177/dowVXfFewi2G16neuIXio5IuqGuSBFaUqf8J8S98Fu4BlQjSEu9YTiG
         rKAmUz6g/zzpv3GQ/NJ7+pdIXNu6pGAOHqobQksISRIJKVebLxNmuMib/LkH8Y9qzWa4
         ywdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=3deuHTbgt68FZtumNl8QakR6BCKlpcTobGFH5+SIwxQ=;
        b=ntEWfJos3j5ct28bvcY1I2MqOslIQAASECSYAHwbCXNsm8SuL+6YD7YssUPkLrQSgZ
         SwcNOKu5oVR56AkuSt5wlk+X93PqhE2nuctTeDdLCGDYx80zViYE685pG947Ina+dKRl
         exadu89HT+KjPf4phOilSOyQzqGcKoH/MftkpJ3bYyhM0Z5SoxCgiJ93/SEZwup3fgPN
         1jy2wQCOSE6/mQ2hX9O/vE1+o1FKG7ogS2PQUXdkB0KTD78sjIEtlXIt1Oy2fOO0aQQ/
         zmnpiTpdv6//9VYc0fDnOYpYTLWcSQgO7nvZy+8epIZF9OmxR3o4fi6sQn8NwYMNZASa
         QOMw==
X-Gm-Message-State: ACgBeo0NsxoHqJky52zmquaMDobNk8dbRvpHyNlAba77oCUj3R+1Ijcg
        daunN8eufNwH92Ez8Jx+dkT4JNa6dIniclkVc1JErg==
X-Google-Smtp-Source: AA6agR7nxBSRmXKCoQQUr1oF+8aqdDCvlAHX1BLSgaBGBA7fWJIA2GHZt1ecaCU1w9t3xRmG/zBQAqjqtkGjoN+7ruY=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr11166567ejc.203.1661948478103; Wed, 31
 Aug 2022 05:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220829131553.690063-1-nuno.sa@analog.com> <20220829131553.690063-3-nuno.sa@analog.com>
In-Reply-To: <20220829131553.690063-3-nuno.sa@analog.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:21:06 +0200
Message-ID: <CACRpkdZYNhmqGPED0ghcT+y9uCeEVsPzHRxG9GyXt=r2pAPQKg@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] gpio: gpio-adp5588: drop the driver
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Hennerich <michael.hennerich@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 29, 2022 at 3:15 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> With commit 70466baac3de
> ("input: keyboard: adp5588-keys: support gpi key events as 'gpio keys'"),

This commit isn't in the upstream kernel.

Are you using some Analog devices internal tree? Upstream
those changes first.

Yours,
Linus Walleij
