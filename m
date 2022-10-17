Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3857C600BD8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 12:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiJQKCh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 06:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbiJQKCa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 06:02:30 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D045E678
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:02:29 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id 13so23721030ejn.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 03:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wromoIqyFYYmKGVgUCwqccKTqGuDYGo0Uq0TCCpN45k=;
        b=f3GCNR9KOr1UQM47oOT0gBrqvNYOuqOfZU/C4MdF1VnG+jRVF+K1jlYjeMvx4AwwtY
         pfTzgbHVWtVe2AK1MCjT2wu864W+pke8/awEdc1LKd/pkdwG3t5XTF/QKvbNmOtajDc5
         mCTfyC+tgEdN2IAbSzeiGk9Vp1CkEhOFPsMAUIYyXSeWTiAZYwflDNgEB9LfJrvPzywT
         ao5RGCrNPmny0E1BbJ346INSG0knezYd9/PRaDymqtRF3icZpcXIS82F21I4Mq2ds/Zu
         L+MKHlQs375D7YvKiOlSaabyRA4UB2SdFjp3r1xB0WiMABphHXdrb3BoE0VUeUZh6i5T
         QDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wromoIqyFYYmKGVgUCwqccKTqGuDYGo0Uq0TCCpN45k=;
        b=JGfdEoEIqDycfHDf5cwQWCNvetjB/2+mXKlLwxb/7kFyfEzXrtX7U5sDqpFHXCROqx
         CJanR3ffckzzBpvWx7LfqL9/GwmyMwtU0FuTTE5ChjZARNxOtYvDwNLH7/sSDOS5vswV
         fZGa1LtvG5rpx+1pufXZIE6gR0AUrKigvkVjtdnwQgoGRhBHwvnUtt6IeHUjPktG6j2M
         yCSFVP9Ycr+xigGrdFsfE2tCp+XYwbyeo7FHWDdGAr0XD+UCN5xukBR1XQZKKoAz5f+P
         aGTeTxODyRcD7thfANrjU4JdSA+x6BJZijC4cuT49/nwXEL6+I50hMEdQwTPZ1tE1Avp
         7oaA==
X-Gm-Message-State: ACrzQf0lFjjP/foBGtgYm/IgqkEz4h0ZL3TR72GFEm/JRVNgdFPXOrRV
        BBUaiE0HY0eMuR0/32uJSHgWbHhTl1aSFtf/3hFIsw==
X-Google-Smtp-Source: AMsMyM4JceqnBrrgp8U5NyQIzRXeyM0A3Mj6pXxWv+MTaNcl6MKVLNkaIGOrQ7kF/kNL+8qgL3GTDtNZJ67MP28av0g=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr4929349ejc.190.1666000947420; Mon, 17
 Oct 2022 03:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221010132007.924810-1-levente.revesz@eilabs.com>
In-Reply-To: <20221010132007.924810-1-levente.revesz@eilabs.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 12:02:16 +0200
Message-ID: <CACRpkdbVCw=b-Hot83UpqmzaBSYGT0VY0g3QcgHNaPke4=grgA@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: pca953x: Add interrupt mask support for pca953x chips
To:     =?UTF-8?B?TGV2ZW50ZSBSw6l2w6lzeg==?= <levente.revesz@eilabs.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Nate Drude <nate.d@variscite.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Peter Robinson <pbrobinson@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
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

On Mon, Oct 10, 2022 at 3:23 PM Levente R=C3=A9v=C3=A9sz
<levente.revesz@eilabs.com> wrote:

> Some chips in the pca953x family have an interrupt mask register in
> addition to the standard 4 registers:
>
>     0: INPUT
>     1: OUTPUT
>     2: POLARITY
>     3: CONFIGURATION
>     4: INTERRUPT MASK
>
> Chips with this register:
>
>     - pca9505
>     - pca9506
>     - pca9698
>
> The interrupt mask register defaults to all interrupts disabled, so
> interrupts are unusable unless the driver sets this register.
>
> Interrupt masking is already implemented for pcal chips. That
> implementation could be extended to support this register as well.
>
> This patch series adds support for the interrupt mask register in
> mentioned pca chips.

Added some PCA953x users to the To-line, lots of people use
this driver so please review!

Yours,
Linus Walleij
