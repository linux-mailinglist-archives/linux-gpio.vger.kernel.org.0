Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871446DE486
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 21:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjDKTOl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 15:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjDKTOk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 15:14:40 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5771746B2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 12:14:29 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id z13so8496550vss.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 12:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681240468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy4Lw0DpqdADptiKiVlpvNWhF+erzENS7ARLFgE+lm0=;
        b=lXUT9qQPzkSsX8PSNKdNYwOpDKbIGhKhaNloBW9lEuSHUSEtVaUavTVkBwFGBD+yE0
         yZzyVKKlaGxoRA3fUdy/cmJm4eEppP3v5yto/3V3GJEExrzjDsySdb7jTcZF0fuKiM3b
         1RoLW/vpeI57yzhRMIt6sl7yuB4KYH4LuxtbnM9i5Uv+Ty2QjJTsS1o+3K25J8AxTANv
         sxrS4ahcLF066aV9/0ioLGcEDTx6zZuxZkVVReoJh7pFGQbo03i8X0t3rNh4BcXS9QRv
         5kG8rY++Ms72svRL2yZMwA/u9dBiDhry1FgTXqysFW4yW4ivOTx5DfFsuYyFeqsWDl43
         nioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681240468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy4Lw0DpqdADptiKiVlpvNWhF+erzENS7ARLFgE+lm0=;
        b=598Wq3BdAV6Nx/4wM46IkBwTQlpX3rCqo2CTzJZTMV28Zb/QShbrpPnycqhVDFvrAr
         YnstEMUdxhQjOYGQl28/Yt8MP4BADKJOlouJHELBFjzYJfhT2LjOJ87J8F7jj31VFeUx
         2hPxe6imxeStTJ6pfRCEfptlH1noTxOV+4jCCErktpleu+G9hTdDa6dFIVBnEhYK1DL/
         D3+uPPi8rZMII2YYeAeijHfFJ7qGwf4JQc7KUbSaIgrauG0d5OSeXKmyBKx/KwusNKyw
         uBQzkoxt3a6X5p37wngs0DSSoQmGymqPkYpx2lA+3zG+osZax1WHFu9ddMOVIAjlu0zi
         s+ZQ==
X-Gm-Message-State: AAQBX9emekbHjYStO+76XU8RjQvCLLick+cp+2PyHJvKYq0LsVElrz+F
        AClSbo5vUhEOyZxeD5DsQ/9RG/9yeN7lIEht6BWIaURZHAUy4bXD
X-Google-Smtp-Source: AKy350b+fp1ZEzNnM9ThVI5u5q6F/mw/UGsLXForQVCj7Fbu1ZZk7RMU1v5yLNQbGgIBW2Q7bCOblP/yPu0Ab0IcPSU=
X-Received: by 2002:a67:d904:0:b0:42c:54d4:1a1b with SMTP id
 t4-20020a67d904000000b0042c54d41a1bmr5926950vsj.0.1681240468476; Tue, 11 Apr
 2023 12:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230411082806.41361-1-linus.walleij@linaro.org>
In-Reply-To: <20230411082806.41361-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 11 Apr 2023 21:14:17 +0200
Message-ID: <CAMRc=Mes9pYVhu2T3mOU8iZpMmvw_PC-tcTCxXxA+J2LXXLkNg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: Simplify gpiochip_add_data_with_key() fwnode
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 11, 2023 at 10:28=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> The code defaulting to the parents fwnode if no fwnode was assigned
> is unnecessarily convoluted, probably due to refactoring. Simplify
> it and make it more human-readable.
>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart
