Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83DA577F99
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 12:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiGRK0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 06:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbiGRK0F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 06:26:05 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C0B1ADA9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 03:26:02 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id m16so14572918edb.11
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dKtWhaBR01kOs5t5WfXdpceIgYotqV0N9c2snMDzhss=;
        b=eCELGXkjvHTpXtFiONS0ZIaKrUr/5CzauZxqEEyEy3D7eaDEYpm1ZjZaMlh3e5KV17
         0G/l0w2T63cSaQca04XnbyujUgSu71fNjvVIYf28TCD5JrkykpvdHk1yORyUPlczPOF7
         Yvby5XaoYaaTBMTm/i2TS38nwb3haopn2n73FTpmVw1SoIP5iGwhEnWtAAaZ8lPJ3Dd/
         xL9ldwA0LxH/CGxYxgFSxE1N+hOozkGjjIEYcWZ1j4YECHnRFQm7ezRHQ1A2Li7FPO0w
         rtAtDc/LqCoQgrdfrxnHG0z8+axPgFjzhaT2nhP9stwoD+GYQR0zrJDyLIi4l9WPVqvu
         4Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dKtWhaBR01kOs5t5WfXdpceIgYotqV0N9c2snMDzhss=;
        b=Nfk0c+iGKDI9umE5vyn0gwGz8srvh4B0ZjJm7rlu+41qghpuer3EYjKbpZ2M3toHpW
         z/OjrF9Zplb/F0A3bNO5xEKaedlPIABSqF6WBoX4g+ebubZOCfMIWl1Q1eV8JGXdrUVS
         qa9mHAt75BTkpteEPv9yP+tyyHxu5hNxCMMPHTZ4qYPF5KAVBQYjHsyIPdhHzqRAnCOG
         ZcdR2EQFtdnCWxD3nSNbOVidZi41Yjc+Z5X2NNrNzELz2ZHv+PU1oiPMj+DPgGXplEf8
         hBUObMynRdTO3CAUbEsyxzjR2CwL/6j3xakg/JGC47xTcQJ1+oYQy4ZWJG86IyJkLDcw
         khxA==
X-Gm-Message-State: AJIora8HEvDrEL8X6xMKzY0bQ+RKQbYI3ZzoWUxXNQyZe33W9ebydFAE
        L2JQJd4nrauz4zzM8iBy/L/AC2tgIC7tP8vVTU2f/A==
X-Google-Smtp-Source: AGRyM1vt3WBOt5SUOQM8JApj4R0R+2atCLHZPl1/KIqBj7FYHEjjfhpRUAq+5DBM/3R/CqQ+qxJnWSE+o7moxkfGnB0=
X-Received: by 2002:a05:6402:3307:b0:43a:826c:d8b4 with SMTP id
 e7-20020a056402330700b0043a826cd8b4mr36812978eda.32.1658139961475; Mon, 18
 Jul 2022 03:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220713131421.1527179-1-nuno.sa@analog.com> <YtAvHMmGay/3HACZ@smile.fi.intel.com>
 <e0638b02bdcd0ee452846b86ce83458173912ef1.camel@gmail.com>
 <YtBnIxh6rDJMwpEm@smile.fi.intel.com> <5d9f9272334177e3ea864467f50095a8709bc0d2.camel@gmail.com>
 <YtFYFbP+xqAUUHZa@smile.fi.intel.com> <88114aeb10f7316cf3c1396179949f2fc351ad8f.camel@gmail.com>
 <CAMRc=Mdz+8yfrATQPJ=uY33k2Dwt29g6vZbP3mSjkB_VAzP5+A@mail.gmail.com>
In-Reply-To: <CAMRc=Mdz+8yfrATQPJ=uY33k2Dwt29g6vZbP3mSjkB_VAzP5+A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 12:25:50 +0200
Message-ID: <CACRpkda3dWd=MMA=5_eaqmhJQDgMem24maGWZ+W2A+AiFhrQtw@mail.gmail.com>
Subject: Re: [PATCH 0/4] add support for bias pull-disable
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
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

On Fri, Jul 15, 2022 at 9:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Fri, Jul 15, 2022 at 2:19 PM Nuno S=C3=A1 <noname.nuno@gmail.com> wrot=
e:

> Ideologically I don't have anything against adding this flag (except

Ugh that sounds political :)

> that it should be called BIAS_DISABLE not PULL_DISABLE IMO). Nuno is
> right in that the character device is the only way to set this mode
> ATM and. However I would like to see the first user added together
> with the series because adding features nobody uses in the mainline
> kernel tree is generally frowned upon and it's also not clear that
> anyone actually wants to use it.

I agree: makers and tinkerers definitely need this flag and it will further
emplasize the transition to the character device and to the v2 character
device interface (which, by the way, is looking awesome, especially when
taken into the picture the libgpiod changes and the new language
bindings for libgpiod).

So we need to add this to become ever more appealing for one-offs
such as industrial control.

Yours,
Linus Walleij
