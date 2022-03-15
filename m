Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5414D9AC3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 12:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348107AbiCOMAZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 08:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236841AbiCOMAX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 08:00:23 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD7050E34
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:59:11 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m12so23809668edc.12
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D8gTmbfCxhO7g3/0R8Qgj9lqXXgy8qgFiwqJhkCuhJ8=;
        b=3SskI8Ij8tak0UzZ+8A9qPnLh/Hr70AemkRkvC79u4xtV2f1tP1sw75bNSJx+cE7HM
         gLQVXcgyEzX5+5MojApm41AHzRqoCJDNPuWT8aN8bqa4fff9hzckfJanmvqJI2qtQqGU
         4owR78OsNdHg32ArQSDo+zWLrKDaVeoGWZC7Y3PaOZ4DQE0snqPml7Xq8tX3ISs+iYxM
         yI1lL+0YnGnrFtFkhUwJsIDmsH9u8vXCbqdA/1DqCrdZBYSE6JboUwRNZOgW1Xf+OQrg
         pH/jeiBBqOP2K51K8IBRrd1rONT9sfMplmE3twsish70ehR7O4ot/DYFqAekWWSSfdkD
         2p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D8gTmbfCxhO7g3/0R8Qgj9lqXXgy8qgFiwqJhkCuhJ8=;
        b=SZ+cxw4b36jM61gCExdf/QwMVDk2cGefP3o9KSIkKgc5O3/t5XT+1uqjrS2NRynnza
         WS0K7wpjEzmflc272WsIoRqRCG0ydH2LawqDAIicCgUIoryGJjPQ4OS3CxIumj/4fUCA
         2QPOukUJIVTFdeJ10UkDPIC3YmVr/FLkcKUXSa+aTdcqjcFVGr3qyW0Sq+j6nJjNL7lP
         6GXDu2LFquAr9Vd2QVDfBEFWU3G9E2mym/QjeNrtF7UNWCo0y+nk09e7fwKfb0MnZzcK
         TJaHrXZy56CJm2JiUCFXOxJlRi2JTV5ZMv5GhiBuN6YPe9kF1valxAQcRkMxPr1iwKpL
         trsg==
X-Gm-Message-State: AOAM533kpnB756pYs5VrfihKIGTQ/mSz2Vk5Jz7uax6/KuIpAKuDWh0R
        XbmL9DbQIzFvXkNR7WOFrdkslLhjjYYWpS+x/Y7SnflNp6rC3w==
X-Google-Smtp-Source: ABdhPJwhhWsCp2jHyYRuUemq9WuYHNl3Kauwo+v9zR9KhOoIK7voR35iwpxh+InU6Rtb06xC+27M96SXWVzzMKnFSBc=
X-Received: by 2002:aa7:c982:0:b0:416:1dd3:7704 with SMTP id
 c2-20020aa7c982000000b004161dd37704mr24810618edt.69.1647345549660; Tue, 15
 Mar 2022 04:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220315053220.102934-1-warthog618@gmail.com> <20220315053220.102934-2-warthog618@gmail.com>
In-Reply-To: <20220315053220.102934-2-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 12:58:58 +0100
Message-ID: <CAMRc=MeT5-ZKkeFZfUdW087snnu1ALRFihkoc9ntwUugWmLWyQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 1/3] core: rename gpiod_chip_info_event_wait
 and gpiod_chip_info_event_read
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 6:32 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Another couple of functions that don't follow the
> gpiod_<object>_<action>_<object> pattern.
> So rename gpiod_chip_info_event_wait to gpiod_chip_wait_info_event
> and gpiod_chip_info_event_read to gpiod_chip_read_info_event.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Applied.

Bart
