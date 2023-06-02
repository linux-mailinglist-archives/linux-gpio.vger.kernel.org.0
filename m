Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 160FC71FB38
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 09:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbjFBHlk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 03:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234518AbjFBHl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 03:41:27 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73BAE65
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 00:41:10 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bad05c6b389so1906271276.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 00:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685691669; x=1688283669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFqaTu5B61rwfwc5NKp0Ccl6n6BJ3VZpDfsWbgoPDJY=;
        b=a/RrQ6Eq+HdWOqGJu2OeVkoQIqHJqHlvQsPNvxAT+7e1aVORcmh8kHRkjJdX14R2xP
         4kXoiMpKOpWDCCaSZP2uG7y5OJ5qU4m3G5JYPB+zpRClI1InVr/yHoeps9D1ZvPvtote
         vgA/IZ44Xf0uS4vRU9u5f5Jmz5LeEEcan33ZNjSuMhlzzMhLSBdaxGH1PPnTbYydQSlZ
         I+OM43sqDWfk0UeAfCSF01EVsUNnl3JGUyr8Ut1JjHQ9m8feUx3tpIlHUZHQ/SHrpCim
         dphjTALvdqIS9TbKVEeG/f/Xwi3HVfuIsAZqcazPhydaVIXgkm32CYzqd2P/hv77nOJ7
         s/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685691669; x=1688283669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFqaTu5B61rwfwc5NKp0Ccl6n6BJ3VZpDfsWbgoPDJY=;
        b=aoOhr0Ly6doaCFf608UwzD9XkDv7ylR7mjejE/0ctnlH5Y3BE7vGNXsNKj22d1Qv0i
         KgUqpATnYsKOnOcUUbqtlVJ9Pt1+OcFFjMlaOzvfsd69RIMG+5+hzX/KO+hdg54x3mIy
         X0mmGVGR9lpCKa8EFCllBm+NIVbJE+YQ7WWcDXZv/0L+c4Fu+g1JYgqlb2dFf1bCu6jY
         mTFeCiwPvL5XYwg7H+TFLwe91j1O69Zfzf/Kk0ZFzITtcKoKdwPIn4xShQKj4DQi2DIh
         4CV8Sf7XXYNVC8HmIMtr0LVTDBK8iZqLlMO6S4JiTv7CWLYw/YvLEwRTlULbnbQEG0nx
         oPzw==
X-Gm-Message-State: AC+VfDzhc/aAeuVQCPihxn8xSyyH39imOvLRPjVPLz9rUm21ZEVsGkbp
        kusaSDwFa9KlqSLdcetNTK1dRF3uWFRds3kByoJEpg==
X-Google-Smtp-Source: ACHHUZ73pPHO+fZThX9YLy7zOMNSuvWVhr0F792nFpsbuy9S15kHXP6xWIA/VuZ16exeHC4Sjxm0z7LvF7Ih9WU/1k0=
X-Received: by 2002:a0d:f181:0:b0:568:fe3a:46b3 with SMTP id
 a123-20020a0df181000000b00568fe3a46b3mr7716449ywf.28.1685691669320; Fri, 02
 Jun 2023 00:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230601054549.10843-15-nikita.shubin@maquefel.me> <cacd8ea8-f834-4983-20ff-a875fee8011a@linaro.org>
In-Reply-To: <cacd8ea8-f834-4983-20ff-a875fee8011a@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Jun 2023 09:40:56 +0200
Message-ID: <CACRpkdZVhwsoHg3jOWuXtdL5kqbnbHjEYJOGsBCTcfLrVKbX3w@mail.gmail.com>
Subject: Re: [PATCH v1 33/43] dt-bindings: gpio: Add Cirrus EP93xx
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Peters <mpeters@embeddedts.com>,
        Kris Bahnsen <kris@embeddedts.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 1, 2023 at 10:20=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> > +title: EP93xx GPIO controller
> > +
> > +maintainers:
> > +  - Linus Walleij <linus.walleij@linaro.org>
> > +  - Bartosz Golaszewski <brgl@bgdev.pl>
>
> Did you choose correct maintainers? Bartosz, Linus, do you take care
> about EP93xx platform?

I'm fine with it (I have a platform).

Yours,
Linus Walleij
