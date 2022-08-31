Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25835A7D2C
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbiHaMWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbiHaMWr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:22:47 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDF6D34ED
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:22:45 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u9so28024797ejy.5
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=s8MYTRyURyvJAWeVUKCjiLvHOGuujwI4X7v0OftBbSA=;
        b=bCj8f8OX2CyOZiIpq8J8A/Ifd7bsDf/xNLsrjZ8V4EOdYAPVNVWDa6zeMCuytSBBSp
         KYztvO1x9Nykquj7sde5MgS9FVjLgrENEvoDtDNwe6KCZbsdgWGW6tV+2Rsu2qCK58jS
         ducpWhhNzD+1XNHFQ4bbCa6CT3kuPhX8Gw1MUWKGF34TMRLX6vftiJd93LuD/VLEWUTd
         j221YKuf+LWL1TND5OunKsjJsmYjze+Swfx/6Bf4pljSK2V5x/hXGFh5BwmJwt+jttoW
         t5mGxQFpjegqZ4QFXtd3Wjafc2RHR7qwO+dVpOPDekBl1SGz/YV3B1IayQuXxWbE3Mt/
         x2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=s8MYTRyURyvJAWeVUKCjiLvHOGuujwI4X7v0OftBbSA=;
        b=qccP7uGbQW+G/MilmMOzzzhoxg1PXizKk7zyROvMQBaHCkY6oeCVcKyFXh5Lz7WI4L
         D6Dol/Is+oV0HhaYi3KSFT2kmUtsL5lyCb2Hgz/uLJlMq9X/kk7s1pMXZ+E30Rrrki5X
         xSc715HaKG2XO/ovqfB0Sql6wmXqlYdzXWoQzXKkJf44CwUY20Mxg5AlDzaXKueAjd/q
         +fik4Q8dZmn5ScFy4Nn6hQfxUY8FrqZ/k8vlUss1pw13bSIQvnXntgo5529oXRtnE37p
         YeqrHK5H1g/ahQPrMTTrhT0CZ2ZGSwOLA7kA8FkMrIDu4yLAlHU/KTM86q1BI5iMESOd
         VejQ==
X-Gm-Message-State: ACgBeo1zC7wOw3w/wYVAwcbD1KueK4jvup2Pkh4958MhxxZ8nywKh3OW
        IVXOE7EYNm7H5/MOWfbUuc6rt+CboRy1bJkIfQeaAg==
X-Google-Smtp-Source: AA6agR7hE2pVJv1Px0ddBlK4AIprmiIxvrzf1e3G6G/qNrWzbzKTCPLpdSrH4NFZ+2kAiFXgpCB6TyrjxpVWP7fBJl8=
X-Received: by 2002:a17:907:2707:b0:741:7c18:4e76 with SMTP id
 w7-20020a170907270700b007417c184e76mr10005539ejk.690.1661948564196; Wed, 31
 Aug 2022 05:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220829131553.690063-1-nuno.sa@analog.com> <20220829131553.690063-3-nuno.sa@analog.com>
 <CACRpkdZYNhmqGPED0ghcT+y9uCeEVsPzHRxG9GyXt=r2pAPQKg@mail.gmail.com>
In-Reply-To: <CACRpkdZYNhmqGPED0ghcT+y9uCeEVsPzHRxG9GyXt=r2pAPQKg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:22:32 +0200
Message-ID: <CACRpkdYL=-mny=tqmMmQVNKpPHVmQheEtVOd1uLKBaTbhjdAbA@mail.gmail.com>
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

On Wed, Aug 31, 2022 at 2:21 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> On Mon, Aug 29, 2022 at 3:15 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
>
> > With commit 70466baac3de
> > ("input: keyboard: adp5588-keys: support gpi key events as 'gpio keys'"=
),
>
> This commit isn't in the upstream kernel.
>
> Are you using some Analog devices internal tree? Upstream
> those changes first.

Aha I see that is patch 1, OK the hash will change all the time so you
can't include that when doing a patch series. Just use the title of
the previous patch if you need to.

Yours,
Linus Walleij
