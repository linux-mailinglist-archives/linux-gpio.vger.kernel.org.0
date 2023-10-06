Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50AC67BBF8C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 21:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbjJFTIJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 15:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbjJFTIH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 15:08:07 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BBAAC
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 12:08:06 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-45274236ef6so1193983137.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 12:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696619285; x=1697224085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxlLhkoj1Kmhin2Qlx3Q+WrvoF0R0Cb9Ja4Y1YVu+4c=;
        b=TLDxoEpd1VVzP2mVNHKHE5dptEcJRqLnM8p/qOjD0CgPHt51KMoCLmd5kw1nzxcSWY
         yJNamVcOdDvcSGyjnliAn82Ky8Y63Z7IabIObEorEe9cIogWLZ5e8bP74QFLqjkg4zip
         FWFgfyWxf7PcJNAMeDQYPxhUyVWyF3a1+5qlbHHghJK1W0r6kuLePkF6M8lrdzk5exmd
         aJYstLDJ8Qew+l0SINgLx4F5p+FbNjYLrp8WZ8UWXpiDr3wyd1fbvCjXICu7wQ4yx+mW
         wGy0ug/gFbcSwavz4gXMQlt8USDnpXJGytFLgsbM1rnu62QUaby5f8/hTqK9NTnA+o8j
         4gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619285; x=1697224085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxlLhkoj1Kmhin2Qlx3Q+WrvoF0R0Cb9Ja4Y1YVu+4c=;
        b=YqIklGs0Qr4yMWHJepE46A13rk6A+PpGAcvF+0z6DsNmT1ZOCGBQcvbUNUAJbqxc3I
         jn7phS3Le45DTi6sO9iVNbm/BfWk0VRNpmaJL7sNptwWHmyGM7gUvQyAkXfz7/d5YdZ5
         uc4tbteEY5r+l3bfX2t+YBf0VTk+zJJb+B3qOuMxWsn+ezI+IfTZhwBFI6xnWMyDMZeK
         ShnbNaWQhzV3LUtcu/kGskmX+A1+mRT9ma4wl2OtWghqN6DYldZIJo8QngTN7nZD4QvT
         AbOTVTkrbDmIIc3vDZR/UMYBGBZzsT8gkskfs3frSCfe5KcLMhNVfcKzzFyHevC/K6SX
         if5g==
X-Gm-Message-State: AOJu0Ywjwx66E2iq7mHojDfJRNcHoC+48XmGzGW0cKq2Jf2Ktifi3vy+
        /1AWX2HBmQfOAK5Vo1lWk+MmTZpZPKOptXncrqhSLg==
X-Google-Smtp-Source: AGHT+IG4YWnlNuzYQ3D7QfQ85iW7UB8nypued/rD9Y1v+Txs/czpFfkdZpjjbAeS2dURl24tCbNVSIcLGC9D4KBQ7Mo=
X-Received: by 2002:a67:fdd0:0:b0:454:2d1e:6ced with SMTP id
 l16-20020a67fdd0000000b004542d1e6cedmr9726691vsq.27.1696619285327; Fri, 06
 Oct 2023 12:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231006115147.18559-1-brgl@bgdev.pl> <ZSAIUVAQ6ifi8LTL@smile.fi.intel.com>
In-Reply-To: <ZSAIUVAQ6ifi8LTL@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Oct 2023 21:07:54 +0200
Message-ID: <CAMRc=MdrLSPCEsQ6OEgRX-7Wh7ka+Rczja=QjY-srozj3cz68w@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] gpiolib: reverse-assign the fwnode to struct gpio_chip
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dipen Patel <dipenp@nvidia.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 6, 2023 at 3:15=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Fri, Oct 06, 2023 at 01:51:47PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip is not only used to carry the information needed to
> > set-up a GPIO device but is also used in all GPIOLIB callbacks and is
> > passed to the matching functions of lookup helpers.
> >
> > In that last case, it is currently impossible to match a GPIO device by
> > fwnode unless it was explicitly assigned to the chip in the provider
> > code.
>
> That's expected behaviour.
>

Is it though? We now have a GPIO device that represents a piece of
physical hardware that has an fwnode assigned and the associated GPIO
chip (tied to that device) that has none. How is that logical? It's
not coherent. I'm not surprised users of that code will be confused -
like Dipen in this case.

Bart

> > If the fwnode is taken from the parent device, the pointer in
> > struct gpio_chip will remain NULL.
>
> > If we have a parent device but gc->fwnode was not assigned by the
> > provider, let's assign it ourselves so that lookup by fwnode can work i=
n
> > all cases.
>
> I don't think this is a good change. We paper over the real issue where
> we and callers need to understand what they are looking for.
>
> ...
>
> > This is something that Dipen reported with one of the tegra drivers whe=
re
> > a GPIO lookup by fwnode does not work because the fwnode pointer in str=
uct
> > gpio_chip is NULL. This patch addresses this use-case.
>
> I am not sure I understand the problem here. All these should have been
> addressed already, no?
>
> So, the GPIOLIB should use dev_fwnode(&gdev->dev) inside it, outside it
> the GPIO drivers are free to use gc->fwnode as long as they understand
> the lifetime of the respective object.
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
