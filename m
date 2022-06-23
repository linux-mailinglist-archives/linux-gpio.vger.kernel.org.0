Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D767B558A7D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 23:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiFWVLj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 17:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiFWVLj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 17:11:39 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D5937ABA
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:11:38 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u15so715688ejc.10
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pf0Ayeyw5YDoshmwUGk0ggf6cGsHGbuwFe/GEImiIuc=;
        b=KH9qluuqsjVTkNhRIAWSBlYNDcQjUSwS+YEkjz1sHix431VCY4JgwpBM9bG6Ml2rv+
         hKIYNF7ZeQOLC2yhGFB+X96w10pWHk5lqEA/eMCJsfil6sYpGgRd/KfZmZXxLX5gRw5T
         /1E/Ktx5rvsEAAceYDB01Ez9zqLje1WNZc4uC1Fa6NpneKPnTcK3atDV/j5ZgBfX8ZYk
         F3+yRFbnW/Mq/IhbsI5JL9zkLIY+vS0lLVUX+YOiuH0j/mkfjTrY7SUfxWTA9rbJlHqv
         +9m3AviAo3nUV7HkOl47fENuwTQne6KRj9T4dD6oHGpRIClWkQHcUXZq4EPBBV4o7CnX
         Llxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pf0Ayeyw5YDoshmwUGk0ggf6cGsHGbuwFe/GEImiIuc=;
        b=vjMB0E997WvreHZjMMSeH9GWJo/mSFGV2pmcgJM+eO8+2bs75u7g//58CUloeHh9lD
         j9JrRO1jVLtvxlkrtFMAg0NcsLEKcOAt4ToNvsj8D8XS8DY3ek52Ww12m3By1DNo6NyT
         xwfnHcbBrv/D04v/XFlCrslJPYKPcCOrfhv+nn/X1SlMC3ZAV8v2oq3W0+t+OzZ7ilfB
         0rucys76U4pZzmOzXqYbhpM9ds8SEqjqxFYhtAJRrAmsrooyMzSd50kNolhq1aBshc4y
         +toIsWfaPLdDQ0Gpkb+QCIQyOFnolkf0608sGbSpXK3g88qQ+XLA0HIQKSplMgM4YOQA
         AhaQ==
X-Gm-Message-State: AJIora+PTGQbOaxIylaeMx3LqqoCyZKAgeeRcYBuy+KanrnumJaLRDch
        yJFkobHl27RvJ7cpTVLrGWecZUFtMdp9Zrw02tmRCQ==
X-Google-Smtp-Source: AGRyM1sNc7Nhhs+wDfnMrjbfcOxOVzmKZOilIj/bzyYUD5ijoZT38TwC/AWFPs0cX7ajtpBbkaA9jz0GEVq2QevHmQ8=
X-Received: by 2002:a17:906:434f:b0:711:eb76:c320 with SMTP id
 z15-20020a170906434f00b00711eb76c320mr10190022ejm.636.1656018696977; Thu, 23
 Jun 2022 14:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220614152339.252958-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220614152339.252958-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 23:11:26 +0200
Message-ID: <CAMRc=MfPybMH43kqrHGd-Ac0jxi=ZG21E6B+oOme0dSwNC+pCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: twl4030: Drop platform teardown callback
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 14, 2022 at 5:23 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> There is no machine providing a teardown callback, so drop the unused
> code.
>
> This is a preparation for making platform remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied, thanks!

Bart
