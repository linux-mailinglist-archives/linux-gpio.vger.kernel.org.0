Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA8E7B4F90
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 11:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbjJBJyD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 05:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235897AbjJBJyD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 05:54:03 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7517483
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 02:53:59 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7ab8696d047so6143479241.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696240438; x=1696845238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjJTpH15uS3ddzPHZfcNZKAKlTvCRlB+B1ZihX3N+kM=;
        b=Ld5xlCLKkRIvpkn/muY7G87yujndOfifgN6GD3uHW8s6GdVLFeDTMiuAEoTaAAU86R
         qGKsxePaYLT5IvWMFRwwf7mIqe7m+2omCjnSQOViHISRWcAx76k9bUUhuivqSKAZgXKS
         chduV1srQQs+TEdLOOAIGE7BBKlnkHbta/6xxN3ggpS14A3d56ECIGxv+rjRp6/HUXpR
         n2gESnBgwxPVImPfILJtpjWCi3opft1VabMnCD2ou065FAw7ksWW5ZPZdetFeUXM2j0T
         lhWdxUx6jJHsuhFtFHfipg1Aqbc108yEB2mNRM2glldKRYcs+gOXN8twVnzMKOe6m9xo
         FsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696240438; x=1696845238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjJTpH15uS3ddzPHZfcNZKAKlTvCRlB+B1ZihX3N+kM=;
        b=XkK5OiQXrnY+gt7hE7KkysecvVCzKpP/ZYGqpyirGRGKhUiRvgGjFXCPChWWK8bu1I
         oxf/UF2Q+496oCSiy4vmXrHRKqrRh9HNOmQMs/662IcIL7TLARmXKC9sdAXwEX+GOXZp
         PNUAkuTLTst2K87e0xixNt0QAaDNx5TB4a9fQVsEWwHHe8dxjINur3zF+pzuN1nvm8fm
         L23+bKIG3Xn+9loIBigTHBW56T5kzoX3/JdN+tQiHvm8zIj6KTBLlft+fdN/uwUjFdH+
         XslME0EYGbltgWJqFafHyG8ZSyvATaFA0j2+yEDDiYn+vG0LXpazV98p1K3wjCvtMujO
         xQOw==
X-Gm-Message-State: AOJu0YxMrmDABfdBqzHoWFM8WS0p6Mcp670XFngQQQHs0/D3LvNs08xF
        buvoQd7RwIOn0SGpNX8fLqKLlElJuN13qF/iWv2WXg==
X-Google-Smtp-Source: AGHT+IHXp75RaHIqUPrY5dpDyz8XwBgG4eTttIV7MPUmgom1c1vTD6yp4hlL+7Y6EcIAlX2I9KnnUTt02JAY3/VsJ3M=
X-Received: by 2002:a67:be0d:0:b0:452:60c5:20b with SMTP id
 x13-20020a67be0d000000b0045260c5020bmr9251197vsq.15.1696240438549; Mon, 02
 Oct 2023 02:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230927142931.19798-1-brgl@bgdev.pl> <20230927142931.19798-5-brgl@bgdev.pl>
 <ZRqQ9KZe619vx7pz@smile.fi.intel.com>
In-Reply-To: <ZRqQ9KZe619vx7pz@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 11:53:47 +0200
Message-ID: <CAMRc=MfGPHk9vyS1iDJnB8PQEowB+mWBGM-9CKxDvMrNKnNuhw@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] gpiolib: provide gpio_device_find_by_label()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 2, 2023 at 11:44=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 27, 2023 at 04:29:24PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > By far the most common way of looking up GPIO devices is using their
> > label. Provide a helpers for that to avoid every user implementing thei=
r
> > own matching function.
>
> ...
>
> > +struct gpio_device *gpio_device_find_by_label(const char *label)
> > +{
> > +     return gpio_device_find((void *)label, gpio_chip_match_by_label);
> > +}
>
> Are we expecting that data referenced by the first parameter to the
> gpio_device_find() can be altered? If not, why not using const void *
> there and here as well?
>

I guess it's a good idea.

Bart
