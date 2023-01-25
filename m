Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA9E67B15E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234996AbjAYLdL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234798AbjAYLck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:32:40 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF9F27D5F
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:32:38 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id s19so9650984qkg.7
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1tUyAZghC32d1Vrhoqxd92As7orqq9kxo5S7taG+7I=;
        b=PTKCsJzAIXDuUCY3Qp9AgWIcqFUFeAu2zuKTFnh3F1MBLKj5yhnc5zO8tRuMRi2MHa
         m3KXqH2WLfuMeoOT/C9RyJrQnh57I70xBUkc5UjF/omJ32PNdMMfSFvKpLH4UPOutMOC
         SaU75fW1C/vd+ZpFYqhaBx38c8+U1K1phWAXISRXnrLtRM7A5KM1siXJ2lnx+B6RcMUp
         yEUxy/rwX8Nmzn3VCjtKlwIkI7MXPeoU4kPT/umr1Z1f2kUXaA5acHRh6BFdukJ9BtF2
         TkYQz74AwnUTwZ3l3yVFZ4kLY4vYZZINaOeWU3xFNRxmQn8WSjFhoNj22wT5epKvyMj+
         oRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1tUyAZghC32d1Vrhoqxd92As7orqq9kxo5S7taG+7I=;
        b=7sawbmWUlCCqZkNcQAkAlwc0j9FkZVFz+OUCBnTpFy/Z6uYq4gc3N7qhaqDngsDrXI
         vD8JpQ1w318UraE+KvcCzhU03dm68npLirDQ6Ks2V2a1w3KHaKHb6tF++CSOFRMpkBLJ
         mk9tXVbposMBMk/jWyUTa1nOE6ThtIWfFjy5NDjKctpXiPCT1KIofk2WT0TZ5/ri7u6L
         EG9RXtSPZYgncvkb7EIBG2dpRcP5Bn43f7VmYClWJMo7LYiRofb0MNKsvINoxQF+rSay
         Hc86y1tJdbd0o2BRxempfKWIE2Y0Ry7HnmQFEJyz6Gst6MJ2/xYvfMo/KQTvYu2MFSOp
         4T7A==
X-Gm-Message-State: AFqh2kqEIJvNGDZoaHnIn+a1/9EIr75xP7F6PYodLwdN+Wi69J/QrOvD
        UX/SLmd0NlmpgV3IcWzI0WlWNhYFSa9w1SxQpw0=
X-Google-Smtp-Source: AMrXdXuYVJFTEJHJR3rcSr+pgsjyAfKHsfFzrCwfsk+MNiAS4LCGUJyvc4FRs8VMVgleVlYsgbvEaLFqz5nmD8xLmiA=
X-Received: by 2002:a05:620a:e:b0:705:c63f:1fa8 with SMTP id
 j14-20020a05620a000e00b00705c63f1fa8mr1917811qki.504.1674646357913; Wed, 25
 Jan 2023 03:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20230125110547.18093-1-hdegoede@redhat.com> <20230125110547.18093-2-hdegoede@redhat.com>
 <CAHp75Vd22k70oiQ4ygmYrGiC_cdb6NrqtHzV+q2j=Yu3VXj00g@mail.gmail.com>
In-Reply-To: <CAHp75Vd22k70oiQ4ygmYrGiC_cdb6NrqtHzV+q2j=Yu3VXj00g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 25 Jan 2023 13:32:02 +0200
Message-ID: <CAHp75VeQxx_a6ss-ipsFbmrsg8Q+3VkJf6snqiz_QN5Mj7-j0g@mail.gmail.com>
Subject: Re: [PATCH v2 resend 1/2] gpio: tps68470: Fix tps68470_gpio_get()
 reading from the wrong register
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 1:23 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jan 25, 2023 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
> > so that the actual value of the pin is read, rather than the value the pin
> > would output when put in output mode.
>
> It really depends. I think it's a wrong perception and brings nothing
> to software. If we output, we know what we program, so reading back
> returns us what we _assume_ should be on the pin under normal
> circumstances. The difference is OD/OS/OE/OC cases where we output
> only one possible value.
>
> > Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
>
> Is it really fixing anything? Can we have more?
>
> P.S. Before doing this, I would have a clarification in the
> documentation. Sorry that I have had no time to respond to my series
> regarding that. But it seems we have a strong disagreement in the
> area.

Just realized that what we are missing is BIDI settings for the
direction. That would solve a lot of these kinds of grey areas. Linus?
Bart?


-- 
With Best Regards,
Andy Shevchenko
