Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3006F5879
	for <lists+linux-gpio@lfdr.de>; Wed,  3 May 2023 15:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjECNCE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 May 2023 09:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjECNCC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 May 2023 09:02:02 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66669DF
        for <linux-gpio@vger.kernel.org>; Wed,  3 May 2023 06:02:00 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-77d46c7dd10so3410993241.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 May 2023 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683118919; x=1685710919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BozmJEISZG8VpIGq5e9BO+B4B1xoIZSJv2J5QCTb/TI=;
        b=QJB01erZq4Dl9kb2aaAgTlatKObfffx2TkkUpx6KcRHBIG1MImlxfZX01s0x21O8I6
         jerF940TXB7lQsK1cNi8HQwJvIMecyQjyJqV6htQL/o6eS6hUmjF+jqFvJAe+i5TFU2p
         uVQFIa0nPVE9u0tJYu4h0xes82wfu0g1L5HyManuIUGsh540aWDme10lUkSMSKEnc7Qh
         J4t+m3o9hlI5l3UhpdXjeLE5mIjvjZzSZzdIaq4NSDuitZYyUtKkjggOZBDjfcOKzdm2
         4BgmBOYfG0pcELHPZk3a9KLtAd7xj+512PQQsnmCxiNy+8Rtw1p9hknnSqW+GavC6mBX
         hC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118919; x=1685710919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BozmJEISZG8VpIGq5e9BO+B4B1xoIZSJv2J5QCTb/TI=;
        b=caf9laG+TR5aPWEkC8q5qO95OCEfp/8BEabQ7lIl6ZAapxBG0UtxQDfNXNPfwbRz6A
         taoRZX1tcgPt3uQFxLPmVAEvffDUcsBZpeL2/fG2zz2i3HwGwAB7zeg/i0JU+jUYLwSF
         W0G7WjzuyyK8PJpp7c9w78r5jKSDvGPDS4jjwuQXbFGrRrh1Wy7zITg4fP9wIduJYaNB
         EGbvgVHjy3Lr5ha0zrWspB1fH+L5JgPAuGnd8k/k5Darq6/Ses1fkYzOD1VgZqPvTadv
         PMFojOuNpQX02qHeg3BWNEXVb1MmgjTOvg7TC+orxZkzyTWYzHW/m7gGBmCdzGNbI1hg
         xNcw==
X-Gm-Message-State: AC+VfDx5vS/I7NIdNr1oO5PxiJzGazy+U/r8zw9Ehr/QUEzDXOJpoCrJ
        FcRPgVjOogn+M6SBjazuce7RlocKCl+w6CaZv4XIUQ==
X-Google-Smtp-Source: ACHHUZ5LN+eYNk66xWzeUOrIQ44drhXJBGqRDqWgma5Pqn9ZPSaIvNOiJD2JNY1TU6z/w7ISvI3So0l4DdgBV/7QihQ=
X-Received: by 2002:a05:6102:ecb:b0:434:4737:9760 with SMTP id
 m11-20020a0561020ecb00b0043447379760mr608005vst.16.1683118917498; Wed, 03 May
 2023 06:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-omap2-pdata-quirks-v1-0-e015f3a3ea46@linaro.org> <20230430-omap2-pdata-quirks-v1-1-e015f3a3ea46@linaro.org>
In-Reply-To: <20230430-omap2-pdata-quirks-v1-1-e015f3a3ea46@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 3 May 2023 15:01:46 +0200
Message-ID: <CAMRc=MczGKVFo+iWe_Pnvi3-hCK0fhmmkjp-h92RHONEHFAP_g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM/gpio: Push OMAP2 quirk down into TWL4030 driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Lee Jones <lee@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Mon, May 1, 2023 at 11:05=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> The TWL4030 GPIO driver has a custom platform data .set_up()
> callback to call back into the platform and do misc stuff such
> as hog and export a GPIO for WLAN PWR on a specific OMAP3 board.
>
> Avoid all the kludgery in the platform data and the boardfile
> and just put the quirks right into the driver. Make it
> conditional on OMAP3.
>
> I think the exported GPIO is used by some kind of userspace
> so ordinary DTS hogs will probably not work.
>

While I haven't tested it (nor can I) so don't take my word for it, it
looks to me as if regular DTS hogs *should* work. If anything, the way
this quirk is implemented in your patch moves the export past the chip
registration, while ordinary hogs would be applied when the chip is
first added.

Am I missing something?

Bart

[snip]
