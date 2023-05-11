Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88B606FF1E4
	for <lists+linux-gpio@lfdr.de>; Thu, 11 May 2023 14:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237540AbjEKMwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 May 2023 08:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237327AbjEKMwb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2023 08:52:31 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F2C197
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 05:52:29 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-44fdac26696so2730530e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683809548; x=1686401548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIFQBHLwYqv6lGGE429jGVwKNnCLq/V2hGSXlHxpl3g=;
        b=e726sAhjika6ekgZrLEDdRwkU6D+A3XR54/bVD1oY8BqPYfvURljXn/Ac3NNEbLjJb
         ZZhUIQtz6UFXbTv+52c9BbucH21xOMeJh78YP0lg9P/QZi7GHRupEfyVKjW7poGejPIk
         q27gjR3d3WkpQqMYfD1LXJ6t+IgrS13RLYV46pVe10DxmKCeJnBNwt3aVILDl36SWPDx
         6le3hqL2FaQDU5dxU1vXQQ/jASEcKa3ubPzqCOxLAxKFeT2fQqiNQ2xOiOrKuRcTuW5t
         xAOXYgcPImoJxi0ipcWoNcEKlw2ZUoQPLWy4W9LeOavD4oNPzHHB1AyRmuB6lygjfcxT
         bKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683809548; x=1686401548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIFQBHLwYqv6lGGE429jGVwKNnCLq/V2hGSXlHxpl3g=;
        b=RkKpW7XsvTdwo64EIcwM6U5qqMrIdlgzuBw6JI/udFLH2LKcUxr9h9qZ732XWWZRY+
         iF74FyYeYGvjJVqUhgmXkkfQlDf3FYNr1ylmm+NYIS93zVkTAaKBmfRtp90kQ/L9DajS
         s9qd9SzHF2c2Q8rRWxIt+wz+o7zx9AyaISRCkVqQth7KhuHjwN7Mq6Y8iiFSoCGPwqU6
         kVM/tmfBhG56cX+/KgvuSNx2vqLuA7UBK/h4A09m5ZUXTYkzAFj923c11Up7T+HIWe0n
         3Yr5f5dIMzhk1H0BWj/yyVmmq/byl5l0XQijqIuEt5hflT76uNmcbduY9VCQmF4GudK9
         uTUA==
X-Gm-Message-State: AC+VfDyc0CpSDN99smoTJm+ZSXNJE0dIh6nBhJrUQycmRa9N02enpW64
        IEEcNIpJYsY/SlS3svj/tL4f5M1fPxgCuK1xeuJaPg==
X-Google-Smtp-Source: ACHHUZ4E+DP2en8hersZMtumGaAAmISlIFjmmKAQ5ogqmesBVVrDmP1MJTPpz4QT+mVGh1wEJXc3/nKrS+0L6DlVwD0=
X-Received: by 2002:a1f:4510:0:b0:453:4ce3:21e9 with SMTP id
 s16-20020a1f4510000000b004534ce321e9mr1861864vka.10.1683809548173; Thu, 11
 May 2023 05:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230427152055.18380-1-henning.schild@siemens.com>
 <20230427152055.18380-2-henning.schild@siemens.com> <ZEuBMCxeWAx9OilV@76cbfcf04d45>
 <759b2df004e2445e850a01b33e748972@siemens.com> <20230428113332.3a7b9a18@md1za8fc.ad001.siemens.net>
In-Reply-To: <20230428113332.3a7b9a18@md1za8fc.ad001.siemens.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 11 May 2023 14:52:17 +0200
Message-ID: <CAMRc=Mdfptr0ZXV=fzBE0T+=vTxhL1tOKxRy+ccFLOqinb0w1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio-f7188x: fix chip name and pin count on
 Nuvoton chip
To:     Henning Schild <henning.schild@siemens.com>
Cc:     "Wu, Xing Tong (DI FA CTR IPC CN PRC4)" <XingTong.Wu@siemens.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 28, 2023 at 11:33=E2=80=AFAM Henning Schild
<henning.schild@siemens.com> wrote:
>
> Am Fri, 28 Apr 2023 10:26:18 +0200
> schrieb "Wu, Xing Tong (DI FA CTR IPC CN PRC4)"
> <XingTong.Wu@siemens.com>:
>
> > Hi all
> >
> > The chip id of NCT6116D is 0XD281, you can refer to
> > NCT6116D_Datasheet_V1_0.pdf, Page 291
>
> Thanks Xing Tong. I think we have come to agree that for now NCT6116D
> 0xD281 will not be supported in the kernel. Maybe until someone has
> access to that very chip and a use-case.
>
> But you managed to somehow get these datasheets, which are still not
> publicly available. Maybe you can use your contacts at Nuvoton to
> kindly ask them to publish those specs on their website for future
> reference. Some specs are there, but not all. That would help people to
> add more chips and avoid mistakes like they happened to me.
>
> Henning
>

Henning, do you plan to respin this with the ID corrected?

Bart
