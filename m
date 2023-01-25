Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF6A67B180
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbjAYLgK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235532AbjAYLgE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:36:04 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABA0568BC
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:35:37 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id jr19so14394228qtb.7
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=temUz2s+TUIWFM3QJVjY2nXT8fVc0/EQDD9pP1P2O2k=;
        b=CJQAVauVtHLYSvNWOGFr4eu2CW0AeTs9ZlNil74UGDH9phRG0qBPTsAG2yiHL5udt/
         21eDWrYfm2M4bS2mG5gueI8nyqV6ApHuSTmxNjLI1CFtD+HSzcbUbOkTmNRw82AfXnJG
         Obekwh3z8a1lKFkxdVkwj727BrHTBhRyYEmvOkvM+hl37I2fgGGeJ2UiASyd5voqG0e/
         Bnbh+nEIvGoj3AuzwuRx6Z0RQunYVKkVky5FpZdzaRiJn+3h/f7Uq6qSMsOOEEaGsCNR
         qGphNTYbuUmVyVFZU28hDr9CnD3a5fT4ofbq1dIlNPPg96hFOkcC2T6iwDhwv05VshJO
         6vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=temUz2s+TUIWFM3QJVjY2nXT8fVc0/EQDD9pP1P2O2k=;
        b=wzWlun8FFDx5peaeqjINgOn34O0veNBvJhL4BMxzmb0m6oJCJHKlmOEKbkmyRGWpOf
         nMy4T7lD/oId0JrqTglRyKwZlFu56hmNZN19OC14msNHaKC8CizOkJR1RJ2OCKs3NrcE
         cGGe7vC2hbWGDuSphYFFv+ukaQXzxZk/02lyrg0bWWe+IJvLbEjs3Zw1uaNheekxRsrA
         wd/DlfZPTTnJSidOmOujk82kJsM9mYQbqdBpYq2jrD5Y9N0CryPkdH7DU2G+7Hgfccee
         F862qCW/DUiM0QUs1h8Yc2KJqylLjU4atE5TUKlRp7Hlh7hmhv/86nHRoNP8Gw6CNqR8
         4K9w==
X-Gm-Message-State: AFqh2kr7bcBarTV4ZbCWumkDC17576yiTySSO1k3+zoVsCFIVyIuWYVb
        pgb3YcF9Aq7aOQ7pDhMNog6elkzDQc+Qd1gVvls=
X-Google-Smtp-Source: AMrXdXu/dqKLKnNSJJ+dIwIHLceg2UV9cemlcYxjkBVI5FfghZROox10Q2PS3PxjRVIQgyobcwfDp3nDDhiw3l89/hI=
X-Received: by 2002:ac8:7455:0:b0:3b6:2b38:e076 with SMTP id
 h21-20020ac87455000000b003b62b38e076mr1685988qtr.384.1674646535418; Wed, 25
 Jan 2023 03:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20230125110547.18093-1-hdegoede@redhat.com> <20230125110547.18093-2-hdegoede@redhat.com>
 <CAHp75Vd22k70oiQ4ygmYrGiC_cdb6NrqtHzV+q2j=Yu3VXj00g@mail.gmail.com> <07a830ec-4cb9-8a02-dfc0-a3b52cc79290@redhat.com>
In-Reply-To: <07a830ec-4cb9-8a02-dfc0-a3b52cc79290@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 25 Jan 2023 13:34:59 +0200
Message-ID: <CAHp75VdL0PMKUCm=4TpE96A5eO8a+GA2Lg-76JYL+EKVt6JOwA@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 1:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/25/23 12:23, Andy Shevchenko wrote:
> > On Wed, Jan 25, 2023 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
> >> so that the actual value of the pin is read, rather than the value the pin
> >> would output when put in output mode.
> >
> > It really depends. I think it's a wrong perception and brings nothing
> > to software. If we output, we know what we program, so reading back
> > returns us what we _assume_ should be on the pin under normal
> > circumstances. The difference is OD/OS/OE/OC cases where we output
> > only one possible value.
> >
> >> Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
> >
> > Is it really fixing anything? Can we have more?
> >
> > P.S. Before doing this, I would have a clarification in the
> > documentation. Sorry that I have had no time to respond to my series
> > regarding that. But it seems we have a strong disagreement in the
> > area.
>
> I know disagree on some of the semantics of gpiod_get_value() but 99.9%
> of the consumers of gpiod_get_value() are going to deal with pins
> which are either in input mode, or in some non push-pull (e.g.
> open-collector for i2c) mode. And in those cases reading GPDI
> os the right thing to do.
>
> Calling gpiod_get_value() when the pin is in push-pull mode really
> does not make much sense, so there will be very little if any users
> of that. And this patch fixes the 99.9% other (potential) users
> while not breaking the push-pull case since even then reading GPDI
> should still return the right value.

Some hardware may not even allow what you are doing here.
For example when input and output direction is the same bit in the
register. Another case when the input buffer is simply disabled by the
driver for a reason (power consumption, etc).

That's why we need some flags to be sure we are doing the right thing.

-- 
With Best Regards,
Andy Shevchenko
