Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C165A414610
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 12:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhIVKXI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 06:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbhIVKXH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 06:23:07 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D666EC061757
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:21:37 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id d207so8220431qkg.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lL2DQUKgYky8J0s7D27IqBXnXuaSYyqrJtM1rXYOyrM=;
        b=zwgf5NRANcg1FFk/+b/lLclJ8ONE7GC0k5BLnCiNbr87/fyS39uHZB1UXIizDGcFR+
         siqUo4Sb5QDy7YO6mXIc56oJ7kNab6kaUGuLJR1gPcjesfMKHYIHDdlQpN9u5kAfe7DJ
         +h61o9aaaFvVGBDu0XbWsfmui2ayWYJQsqd2gHSEDlTTD38UdFoT1GbIkpXjssdI+A/O
         V+iiWu0ZJQKDw8YXolelsoEWPcatfSoWoZcAf+3on+SatVxKN94WJsjMOk5/0HGftIZL
         u2y8RPvHeGT4hWk9PIFGJrCQIGolmkRfYw++Cn+tkqvb9B37CieH5G06c7VIoHHZMWDP
         1qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lL2DQUKgYky8J0s7D27IqBXnXuaSYyqrJtM1rXYOyrM=;
        b=d7sFrMKev56WB1dMwnLaznKvsoYiySFvKNceRyTFFG1BE1s2b4TYx612fwY86PMueD
         5myqp7UiDTZWgINyoqX4kSdvJwR4tzLeQlRCeAKp97tDKMvNswrxxi+aB8ALFbwou3m+
         xKTOIO3s7gxRjSnXjnWmm/RQveTPhX4ZhIqA/mijHJDSPI+1/kC/AghJ54IJH3hKAEGs
         /HsuY3ame7Ap0x8rrsgp0iDZlW2WqD9/aa93bsa/4h4sbkBmoA2/WPN7LUJkPt+RLGe7
         U1AeBjeeOaQxMDe/Yij88aEW6IkhF8nDoc11qfBDpxeBMo+LlgZ81Yv+DDnXuniFBkgi
         k13g==
X-Gm-Message-State: AOAM531QM539nIe5li7jPQxXTw/0AzcYC4AhAoCzS0XzHe7n8n/entn1
        M3Vaq0AA5mK8Tq83lkNlcTiXb52PJn6/AFY44JMcUQ==
X-Google-Smtp-Source: ABdhPJwKdkPRdKCXrof4v74Hhyc6/eIg/BFqhLPnsbXHmOTJQPKw/Hy/zjnv0XZbcm9nqlfts+HE+rmDptqQ8W6xuaE=
X-Received: by 2002:a25:cbc3:: with SMTP id b186mr42865524ybg.199.1632306097026;
 Wed, 22 Sep 2021 03:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
 <20210818081018.2620544-4-piyush.mehta@xilinx.com> <CAMpxmJUvPg3LvT1EJa-ZecXMWpR82EQMr8vhTjBpO3_6iiGecQ@mail.gmail.com>
 <2286343a-e061-d5bb-b266-6f657cba63e2@xilinx.com> <CAMpxmJVUTy5iOoTuDTY8-7z-brLJwkv_a82tU47ZXsJjM_Vp1A@mail.gmail.com>
In-Reply-To: <CAMpxmJVUTy5iOoTuDTY8-7z-brLJwkv_a82tU47ZXsJjM_Vp1A@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 12:21:26 +0200
Message-ID: <CAMpxmJU7+QEumAbN=2JY_ywFyhzS6tn4JKRGnoEy=mbYp6ZjXg@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] gpio: modepin: Add driver support for modepin GPIO controller
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Piyush Mehta <piyush.mehta@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        wendy.liang@xilinx.com, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Rob Herring <robh+dt@kernel.org>, rajan.vaja@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        git <git@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 12:18 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Mon, Aug 23, 2021 at 10:14 AM Michal Simek <michal.simek@xilinx.com> wrote:
> >
> > Hi Bart,
> >
> > On 8/23/21 10:02 AM, Bartosz Golaszewski wrote:
> > > On Wed, Aug 18, 2021 at 10:11 AM Piyush Mehta <piyush.mehta@xilinx.com> wrote:
> > >>
> > >> This patch adds driver support for the zynqmp modepin GPIO controller.
> > >> GPIO modepin driver set and get the value and status of the PS_MODE pin,
> > >> based on device-tree pin configuration. These four mode pins are
> > >> configurable as input/output. The mode pin has a control register, which
> > >> have lower four-bits [0:3] are configurable as input/output, next four-bits
> > >> can be used for reading the data  as input[4:7], and next setting the
> > >> output pin state output[8:11].
> > >>
> > >> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> > >> Acked-by: Michal Simek <michal.simek@xilinx.com>
> > >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > >> ---
> > >
> > > Which tree should this go through?
> >
> > I would prefer to go this via gpio tree.
> >
> > Thanks,
> > Michal
>
> Sure, just make sure to get an Ack from Rob Herring on the DT bindings.
>
> Bart

Nevermind - it's already there.

Bart
