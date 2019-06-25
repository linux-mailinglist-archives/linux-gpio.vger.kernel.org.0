Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA16E54EAB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfFYMTE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:19:04 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43871 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbfFYMTA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:19:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id 16so16009207ljv.10
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jALhUuHnRMGGpmpdlDb0HIhW7kZ/qK9Mq/evTmTkD00=;
        b=I48yWJwGiioj2FgBHsgEqo+h9ie0rIphzW/pO7El8g0Ve0FckbkZNMUB367r5J1WCU
         /cp9KZzBY2nwMFG8rx5wAWI3vxwowVuqV3/DhgJsA/mAau+OXwxd52Z31Uo/CcD719oD
         ddSYF/1nj92zTIcEfhIDG6VdaKTFVkOLK70ziTnrdpYIUhIJ1xtv1Tign5rn2dAyJN/V
         n/uaJ9MMqHk0Zffw7LvtEWm60FzmpXVsPeqxEqH1IatZUK0UyjDSnMUbm7iXIQQcxioF
         Fp+ZtWzAYNpPGOy04scBl/bQPaBfMkr6h0ztFmvx3nacYkph9QHVVk5TbIhDP2ncAWDY
         Joaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jALhUuHnRMGGpmpdlDb0HIhW7kZ/qK9Mq/evTmTkD00=;
        b=J6qeizjVbt9Fof35l1ycMGBZD2EnLY09JWLVa3a0sk/KRRLYnqfOlTBATF6EMkYtF8
         eqSyhSjgrdso4+LxGbGZo7dAqrgozI5ZpttT2s1e7MUeu9bX1ODkeH9kCNvenD1OZG33
         fTaWtogu4HAAa1bPFagy7pRRi7JnVu1Co0/8dlzOJoP+VxHkgxd/i1SDadp2yhjHJOQV
         w+qGWeUK+ws5aAyxy0ppmjg/e2eAcdlYd5HQ5TNrEqVJOaRlM4xBiNX1YE9Xhts+eaLc
         AIJJpvTlWL5SvBCVSA0ylZ4LACfBDSBjzSEO2Kec46xXY3GCdWigaGDYekLeEOXSKejl
         msfw==
X-Gm-Message-State: APjAAAVlfJabETFPDdhIYe2Vfuw1ZLowfEQZJtsZcLKig7xj+CN9bYgi
        TvIj0YN/V1VgM1mwJ6KnHfQ+4MbhD5vx6qrqx8pHqwVm
X-Google-Smtp-Source: APXvYqwJlShOUGzSJYy1EdHq8lnqlJ7DfvQSdzbDHyFXLiG7jgfjQp4H2cmef6cUs212VQhxBDPSZv9UmUqJAyI51+o=
X-Received: by 2002:a2e:81d8:: with SMTP id s24mr33236100ljg.37.1561465138557;
 Tue, 25 Jun 2019 05:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <1560764090-22740-1-git-send-email-neeraju@codeaurora.org>
 <CACRpkdZ4BoZzX7pVw4HYBzSMvhnyu_oVNoiiLk3ME05nnG1T3Q@mail.gmail.com> <c9eb6bfc-a8d1-75df-159b-3f2304fdb8ea@codeaurora.org>
In-Reply-To: <c9eb6bfc-a8d1-75df-159b-3f2304fdb8ea@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:18:46 +0200
Message-ID: <CACRpkdYMW8TiK3jBfgVhmST_S8CHuyY2rTD=ZZ37eckdrJ2uTw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Add irq_enable callback for msm gpio
To:     Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Timur Tabi <timur@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 25, 2019 at 12:29 PM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:
> On 6/25/19 2:28 PM, Linus Walleij wrote:

> > Please don't name functions __like __that.
> >
> >> -static void msm_gpio_irq_unmask(struct irq_data *d)
> >> +static void __msm_gpio_irq_unmask(struct irq_data *d, bool status_clear)
> > Instead of __unclear __underscore __semantic use something
> > really descriptive like
> >
> > static void msm_gpio_irq_clear_irq()
> >
> > That is what it does, right?
>
> Is below ok? as it clears (if status_clear set) and then unmasks irq
>
> static void msm_gpio_irq_clear_unmask()

Sure thing! Thanks.

Yours,
Linus Walleij
