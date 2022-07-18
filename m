Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033F7577FAC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 12:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbiGRKa4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 06:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbiGRKaz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 06:30:55 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3AF1D0CF
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 03:30:52 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id sz17so20342905ejc.9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+K5PUgLbPOh2pYTqv2OCvpFF3AnVsbVN2Qf3iujLkgE=;
        b=ro9jXPd9Pj09GtPgs4Slq29N13r6QTF5lHWM9hlY3iOmwP3AQi1/0TxYVTQmvVtXof
         zRD9Ciq65H+TqfiW9c3FLG+XXeETgEToVCc+XnSV7omdn9Ye1R5s2XJcVQquzL+902Nm
         Adl4T30kA2m+gMjXTxx6ernJGJ6cndpj/KFs2Wczgip2Y5aD5R2N4XN4szlFQDFEI3cg
         yjZqgJZ98aRrJmaqImE+gOCI48SpeZiYpFZHiPI2rQWSevA+HZeylnog+yyfeUbwv0bp
         6oM+1MkApG0cZQZYhgYp0OE0tH8O9splOyY+9oimJfE3EPvrURJkVUqC4pokT8SzN+Xh
         xtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+K5PUgLbPOh2pYTqv2OCvpFF3AnVsbVN2Qf3iujLkgE=;
        b=PEJRO1M4rbn/ZY3NT/ztfq3YVMgsdNN6agsgK5DNcSLzgpn3anKhovbbDm8C+tWIS7
         hKPPjhgiXb5flt8HwFWHBhTzClPXX7lWZKqjaJu3UMFT6HcsVXaHzdI9xeLRQooDwfo+
         mo9sOqsTwM6p5t2RkpPbrDvz2DWiXfXuBnESfVaH7zj/AOD+xVkpSYnSyJJeSRc+WCa+
         HCxiCrcXIKQmAWnBvfatfAgTwZ1QtPzWrgRlJaqcTh/dzoOp72qB6jn2hSXMn9ZXmPc0
         w3Ex3kZ7twFlSjrlPCFO5du/T62l4y0jccN1Vy0LXrRh0VcGXiEfvDbwHDadiwzQ4BM/
         q4gw==
X-Gm-Message-State: AJIora9gtFfftrefRrR72QAx+YltDQgEPnWMociYel+oPdOoipa00P6N
        t2bkqQQWnV1TpU/frqkh4oav5YkAlTQiOOBn/CYLtQ==
X-Google-Smtp-Source: AGRyM1sKXB2UFk9OFv2GXxfvVbshAtkgM3g9E1fKG+ksWF9jTOGEyTSwlQ7S72fQ+Izu1bfHWWz/10Q2nf9gFCZCWTo=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr25233550ejs.190.1658140251501; Mon, 18
 Jul 2022 03:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220713131421.1527179-1-nuno.sa@analog.com> <20220713131421.1527179-3-nuno.sa@analog.com>
In-Reply-To: <20220713131421.1527179-3-nuno.sa@analog.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 12:30:40 +0200
Message-ID: <CACRpkdaWSNLfjqKw6Eb3rHtC1LV9C8ENGEBmBQbq11LCXZn-dg@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpiolib: of: support bias pull disable
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 13, 2022 at 3:13 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> On top of looking at PULL_UP and PULL_DOWN flags, also look at
> PULL_DISABLE and set the appropriate GPIO flag. The GPIO core will then
> pass down this to controllers that support it.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
