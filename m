Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 791176B843D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 22:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjCMVus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 17:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCMVur (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 17:50:47 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F17873029
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 14:50:45 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5418c2b8ef2so100722187b3.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 14:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678744244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCHz2nx6p55EgvQKGZC0kvbgWbyB/L/IeIhJ3qrWExg=;
        b=O0QtnlfjPghCh3YIXUoOd2ANaGzc/QGxZuL9b7TcCUliwf191AxWceuPEVSHCLBCgj
         VR6PmUDKGedxn0Bm7PvV7224rtRDmEzyo398XOMtWxJ6W5iHcGWxZm+491UlPEQfemB+
         d/d6AX/TwQGcA9iPcBHfFwHB8hQnz4ARHMPDOT1Y6Zc0Ufs2isbXCVv1xNLPFNrpDf49
         ZkRoh8BE4pu456C48aZjdKXFcsxY50E47fURQyKds1XDRPxkiX6ZBB1bhEhUabGTAy1y
         chn04DWysQtIY5BcV/1fb3eUKUZ1NNpfFzBXughk2igwdC6fNu/NRnYTCMS4E6UANfb8
         AfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCHz2nx6p55EgvQKGZC0kvbgWbyB/L/IeIhJ3qrWExg=;
        b=TBz098AHIH0LbDVieLhNwvsGCG51DzN+hGmKDwG82dy2Pyosr7bfRbgO3rNhHpNA7Y
         FQrkZaye7uxJu41ZGbKRiQl0MN/cYNMuLbPX9x4V2MkvVoKAKCvFLBfKaVMeKhqh7cFR
         Fzj0sgDTERxyCMp8FwWW59T4N0k27GmhV8ENjFksw9jnh4bjnl1LqguwBjOwhYDw570i
         Go+M4SUVHrWx1E0EzYx8xuUOh0FeRWVUBXivLch4C8ImWT8b+s27J0UhahCdBgkcemoI
         ZhONg96sBSA/x+HYICoN1RswiimvYEfY0yhiO0cAQqyuLJUo4+5ZkEQmiPt8B0ioO9eJ
         UDnA==
X-Gm-Message-State: AO0yUKUG8SPODwwXipQkZistwSmP9pa4abgOVMBF9N+KFbvXWY0+MCwc
        zHaNMeTGEauliB4Ad/AQIlCmEcsqvciy8m/mXEGCuw==
X-Google-Smtp-Source: AK7set87ubU8GZDtPahtZba/MrzEpnuE6JhzbhHmiamcnjVaWobwungB6CFhw0/0tsNdyXXWXn/YmmTbX4yJulP2dsA=
X-Received: by 2002:a05:690c:445:b0:53d:2dcf:890d with SMTP id
 bj5-20020a05690c044500b0053d2dcf890dmr9320437ywb.4.1678744244230; Mon, 13 Mar
 2023 14:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230313144557.35856-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230313144557.35856-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 22:50:32 +0100
Message-ID: <CACRpkdY35RkGPp=smaG30JoK+TDXtXH-=DwrtWeXMTT_Brf2zQ@mail.gmail.com>
Subject: Re: [rft, PATCH v1 1/1] gpio: Drop unused inclusions from of_gpio.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
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

On Mon, Mar 13, 2023 at 3:45=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> As a preliminary step, drop unused inclusions from of_gpio.h,
> so people will use the header only when it's really needed and
> not as a substitute of any of the dropped ones.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> For testing purposes on what will fail in CIs. People are also
> encourage to test this, if have time / chance / wish.

Haha the CI gives 6 million errors as usual :D

Wella, just nail them all down, that's how we got rid of
<linux/gpio/driver.h> from <linux/gpio.h> ...

The end result will look really good.

Thanks for looking into this!

Yours,
Linus Walleij
