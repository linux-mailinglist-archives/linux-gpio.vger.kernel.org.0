Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44AD167B537
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 15:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbjAYO5J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 09:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235947AbjAYO5G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 09:57:06 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB7A577D5
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 06:56:35 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id i12so14246370qvs.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 06:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KYg/H/ZHscvBETqJos9WhmRLOH/rw6E59czFMVPdDE4=;
        b=Rw/xlAgmkZXHbks/rMEoRofoiqcpd9qdnACSAt5Yu2CpgR4lS4eRVS8WfvGPsA1Nn3
         4QwD/KA3mY+zNjGTM0GSiaFtbFyOj0HUZ22VH533e1jJSBxy3OiMdqUkSbvfSPi6BTWs
         Mepb7h7UmeKLp8Sj/9cT7BNdkt3zr4MBRZEPFzt/ni7XYd9eO4vjFm265CVIpO2jshwu
         Uah3QYB45s6yHVwiqXo4oa/yxpzxzRSx1vA3uFs7ka03scEY6qOJ24oQ1dfxuPzp3yEq
         q3tzSL/dOpTYS8QCStjk6vmFfFciD90inWaLVJrXNRTWPwNJoJb00Ov6dBspFMSAdEls
         Hz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYg/H/ZHscvBETqJos9WhmRLOH/rw6E59czFMVPdDE4=;
        b=eDlSp6ZuzrooXazTTIan2i6KmI+dLZai32rEtBx/I+pGW6APJ4Eq6w/Wf8I74l7N7Y
         j4+qOXbs+bvWBsC2E+LhpjnmtSQve/CtJYmQF09MCxRlJ+OCdYkcSLq7WJMRO9lMndis
         UGcdnverDxSClh8pNXKFl50Er0wIC0VGzGJDPLQb9AndDQlhO4suZZWiSqchrDYUo1j8
         fUOW/qdWPz7S+B4dxFsh2u5+qZeI3gLgSrIy+OQWToYv2pvv3igQkCcOF7/St28mUlmr
         7J8iDykIehwxhBQXKzPNXbFwRHe8QlmbBkyKJQ64q4tVnBIyL44OsABDnz30IcR0bgQf
         55RA==
X-Gm-Message-State: AFqh2kojDed65wfLErSExzcx4fU5p2+l0kLbxCGlDqrLM6I+UX0ksUs2
        LdM55zIeNhn4ELGTFlMVoDZZBrRmykgfakZEiBNXkcG4Z2Y=
X-Google-Smtp-Source: AMrXdXsdR4yormpVYHXo4mYkd8odxX3Cew8mUFqNkU1B1YSSQp/2gXKTVOaa80+vag7OjktIGVdjsEH/K99z5JLW8c0=
X-Received: by 2002:a05:6214:418e:b0:532:2c82:95ac with SMTP id
 ld14-20020a056214418e00b005322c8295acmr1998462qvb.97.1674658591826; Wed, 25
 Jan 2023 06:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20230125110547.18093-1-hdegoede@redhat.com> <20230125110547.18093-2-hdegoede@redhat.com>
 <CAHp75Vd22k70oiQ4ygmYrGiC_cdb6NrqtHzV+q2j=Yu3VXj00g@mail.gmail.com>
 <07a830ec-4cb9-8a02-dfc0-a3b52cc79290@redhat.com> <CAHp75VdL0PMKUCm=4TpE96A5eO8a+GA2Lg-76JYL+EKVt6JOwA@mail.gmail.com>
 <201635a8-5af8-7f8a-69cd-666cd3ed8e02@redhat.com>
In-Reply-To: <201635a8-5af8-7f8a-69cd-666cd3ed8e02@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 25 Jan 2023 16:55:55 +0200
Message-ID: <CAHp75Vem+Jytu=10nxxFuOpOf5jPCboUg5q1CVpiRjU8G1ZRCw@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 1:40 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/25/23 12:34, Andy Shevchenko wrote:
> > On Wed, Jan 25, 2023 at 1:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 1/25/23 12:23, Andy Shevchenko wrote:
> >>> On Wed, Jan 25, 2023 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>
> >>>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
> >>>> so that the actual value of the pin is read, rather than the value the pin
> >>>> would output when put in output mode.
> >>>
> >>> It really depends. I think it's a wrong perception and brings nothing
> >>> to software. If we output, we know what we program, so reading back
> >>> returns us what we _assume_ should be on the pin under normal
> >>> circumstances. The difference is OD/OS/OE/OC cases where we output>>> only one possible value.
> >>>
> >>>> Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
> >>>
> >>> Is it really fixing anything? Can we have more?
> >>>
> >>> P.S. Before doing this, I would have a clarification in the
> >>> documentation. Sorry that I have had no time to respond to my series
> >>> regarding that. But it seems we have a strong disagreement in the
> >>> area.
> >>
> >> I know disagree on some of the semantics of gpiod_get_value() but 99.9%
> >> of the consumers of gpiod_get_value() are going to deal with pins
> >> which are either in input mode, or in some non push-pull (e.g.
> >> open-collector for i2c) mode. And in those cases reading GPDI
> >> os the right thing to do.
> >>
> >> Calling gpiod_get_value() when the pin is in push-pull mode really
> >> does not make much sense, so there will be very little if any users
> >> of that. And this patch fixes the 99.9% other (potential) users
> >> while not breaking the push-pull case since even then reading GPDI
> >> should still return the right value.
> >
> > Some hardware may not even allow what you are doing here.
> > For example when input and output direction is the same bit in the
> > register. Another case when the input buffer is simply disabled by the
> > driver for a reason (power consumption, etc).
>
> But we are not talking some hw here, we are talking about this
> specific driver, which has separate registers for setting
> the output and reading the pin value.
>
> The current behavior of this driver is *totally* broken wrt
> gpiod_get_value() and this fix actually makes it work!

I don't see how you can make it work for GPO pins. get() method should
work for them too. Probably I'm missing this part. At least the choice
of the registers has to rely on direction, correct?

-- 
With Best Regards,
Andy Shevchenko
