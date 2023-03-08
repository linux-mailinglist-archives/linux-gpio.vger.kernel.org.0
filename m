Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5D36B0425
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Mar 2023 11:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjCHK0e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Mar 2023 05:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjCHK02 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Mar 2023 05:26:28 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50737B78A3
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 02:26:26 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id o32so14905009vsv.12
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678271185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGmotPoG2120yB70tKLvm/NcUMvlY8fYIwzXAE2sT5E=;
        b=ikmN3FQLY36alaZWM7yikv6mQnHmAO0CBsIMnVSL0SKNv8lQ6Jgck86pX0+z/SNheX
         fCJpcMd2Vri0U8uNDvBhlt5K6RP4f5Vnwp9pQT2iv6C8jSHQUMxtQL9muBb/2qclAi5N
         0lNXLlkl5sisMB6TrhuNIjxJTyj2kvySbMn3Uz9wbex7OfKBYn7WSpF+BwkzjZgH8oQM
         NldSecCcEDlHOQeZEqoaRbIogSqOeSnMLcANZ2iDNUX1f1f2nX5F9YL5bQk/i3yn9NUj
         0z3V6I6y0HT02asXaBJam4cjb768Whr+HEQXJ9BJZZv6MeFI/uP8qoVkA7uxVch2JQnB
         0V7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGmotPoG2120yB70tKLvm/NcUMvlY8fYIwzXAE2sT5E=;
        b=yeP5uSY1elMXihvhIAna1iVmCvt/ld1wSUqShsEQXQ86OkKf+nD0oSDSi9/K2QjGgD
         WVqLJcDSsrnc00HmYsG7i0OPW+tItfID3GY/u3y7wU6LqtmYaJcYaUk5i2XEXRyhut+/
         L/DruMN1AqJCfBZJAuPagwA9wOjgLe13c78tFz725jD5gVdnd+98KP+9hlWCJ8iUteH3
         2mvl8K4brZW4ufD802XDf/8mkQveRz79NffcwF1Wp3DUqw217+HH/DJNShN9bdlVe2E2
         KuoyuiNhSHCoeqvX1HGDTTdoIuqsKlc22UWEQTVXX45Fj4XS7eFg+w4O9LtCpt3/KH00
         pmHw==
X-Gm-Message-State: AO0yUKUur3sfMAOmNy8hH/fiEjToej6r6TsE3+KPlgbEBW/NbpW2k4Lb
        hd3nQzn4cdrXvH8jVoAJS6UC+D1OgGoT4LQZyd8U+Q==
X-Google-Smtp-Source: AK7set+nfFCDXVga6XlswqORZjNQ+XvGO2KUTaYGALjfouQWJGkZeidT1GEBY8YrejCjCD/g0wbdlikML4iY6myTQWA=
X-Received: by 2002:a67:ea49:0:b0:411:a740:c3ea with SMTP id
 r9-20020a67ea49000000b00411a740c3eamr11948516vso.0.1678271185398; Wed, 08 Mar
 2023 02:26:25 -0800 (PST)
MIME-Version: 1.0
References: <20230306151532.23246-1-sensor1010@163.com> <ZAZvH6CFtH4I1BOm@surfacebook>
In-Reply-To: <ZAZvH6CFtH4I1BOm@surfacebook>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Mar 2023 11:26:14 +0100
Message-ID: <CAMRc=MemEXVcqL0axaduTrAZhT1Zx6APCY_qo2TM2E-aD=Seqw@mail.gmail.com>
Subject: Re: [PATCH v1] drivers/gpio: remove redundant platform_set_drvdata()
To:     andy.shevchenko@gmail.com
Cc:     Lizhe <sensor1010@163.com>, linus.walleij@linaro.org,
        geert+renesas@glider.be, info@metux.net, shc_work@mail.ru,
        j-keerthy@ti.com, hoan@os.amperecomputing.com,
        fancer.lancer@gmail.com, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        kaloz@openwrt.org, khalasa@piap.pl, keguang.zhang@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 6, 2023 at 11:54=E2=80=AFPM <andy.shevchenko@gmail.com> wrote:
>
> Mon, Mar 06, 2023 at 11:15:32PM +0800, Lizhe kirjoitti:
> > remove redundant platform_set_drvdata(),
> > Because there is no place to use the platform_get_drvdata
>
> The commit message has to be improved:
> - English grammar and punctuation
> - style of func()
> - clearer wording on what it all means
>
> Note, to get driver data the dev_get_drvdata() can be used. Do you aware =
about
> this? And hHow did you check these drivers?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I would also add to that: you need to use your full first and family
name in SoB because I assume you don't just go by "Lizhe".

Bartosz
