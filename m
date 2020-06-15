Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51C01F97FB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbgFONMD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729875AbgFONMD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:12:03 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483FBC061A0E;
        Mon, 15 Jun 2020 06:12:03 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id s135so6923499pgs.2;
        Mon, 15 Jun 2020 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P/gBrMCkfFTO8CRsYbxCfaojgRfaZJLVJnlYiKEGsMw=;
        b=mN0IPe7VubxIctoBsWAtpeiEpB1oN9DcYBsmZuGFsmHNh1XBFBLkBKVjKE0CHmTqC8
         yzEyz8yNMXyaRMljBc1ZbeHMQLBMRsdRL8x+Bh1/oyCSjMNKAB0U0oPVhirLPC9QB0J6
         hb964AFthWLQuhlrxX9HysopcqT+5ccUgna5AmJDOBsOR7Y6lvf30+0k2WxqQleaJaa3
         yiwSxTV6YZdTirQaB2VcMYSHGx2UYGRRcsRn2lCi/iliy8AT6QG/8lNOpnXKaz00nisB
         6Z/LH5dfalParvsPvTIxS6xfDo/mwAM1ZpoDZcwlreb5BuA0/B2Thkftr0EOBbL/lXaL
         H9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P/gBrMCkfFTO8CRsYbxCfaojgRfaZJLVJnlYiKEGsMw=;
        b=MLT1jsmFi0UC2H13Lkhgp+hLX+2SwK0pqXUSAzrmS82KZ7imzoj3v0rQZm2SI9vml7
         pJI0xXQv2BqUyDQVrIUvsjJv8PuDvSdmJZpgmy2tUZHKooLY+PALPUmM25ltA6q8fhcn
         V2dANLeDn+245hsiyw2sx7sim71YF/ecWDCR/xsPRMlaTF34mH3G2McRtW412tYwUMrv
         u6DwJgvIY3GtZsM7too+jSlEwEN+PhRTseWbUu99aMN5oZ3GS2xM8NMbWi5LxnI79TLt
         t/lYQ3o2hU7bhinX9k7yGlrrzn7Fw1cNk6mhSXw9BlYfGNiwAIncApqqfOjtbSCJVA8h
         EmBw==
X-Gm-Message-State: AOAM533eaCLdq1NdpgxMFpwKyNfPLHzA8l/qsEwJHi8I76bSZ8SBU1I1
        gA3Lw6tQ+n9Wqz+Xq/9yab3lBG0SnABMjcddoas=
X-Google-Smtp-Source: ABdhPJyJ+g+QyiL0CvzlxB0k16mRYVogzm5EeqL/c+LYCpUN29bYjp3kOKxz71Glrx8FeRpPzizJwvi8awIXtMmXqnk=
X-Received: by 2002:a63:f042:: with SMTP id s2mr4607946pgj.4.1592226722131;
 Mon, 15 Jun 2020 06:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <53b5504b-dd06-c1d5-5334-d4c5525eca93@web.de>
In-Reply-To: <53b5504b-dd06-c1d5-5334-d4c5525eca93@web.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Jun 2020 16:11:50 +0300
Message-ID: <CAHp75VesznYipMFXM77VfazDrTYxSQk+mhKR81-OhmMJS33ttQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for the PCAL9535
To:     Jan Kiszka <jan.kiszka@web.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 13, 2020 at 5:45 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> The PCAL9535 [1] is compatible to the PCA9535. Additionally, it comes
> with interrupt support and input latching. Other features are not
> supported by the GPIO subsystem.
>

> [1] https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf

Can we have this as a Datasheet: tag?


> @@ -1131,6 +1131,7 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {

> +       { .compatible =3D "nxp,pcal9535", .data =3D OF_953X(16, PCA_LATCH=
_INT), },

Also, please update I=C2=B2C ID table.

--=20
With Best Regards,
Andy Shevchenko
