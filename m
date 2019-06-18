Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B00449F71
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 13:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbfFRLme (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 07:42:34 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:47022 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729689AbfFRLme (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 07:42:34 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so8975719lfh.13
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2019 04:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oIBwXK9dI3H4C6jCiFQOTvpSt7NpPT82uRdSNxuqa9Q=;
        b=qPZThsTCWN1XW7k12h7QnaKGBg02dFFKUeJ6sW5MIPxdfNJNLdK6JbuO3saQSNJ2bA
         akg1DCkD3XtZgILlFT43ed1pgXer/T3YzXgdZz4cNJvCVZ3FLNb8DvxwIvFvuS/BXpD5
         T/XPk/lK/Tx0S6nhB7ipq94cnoTMtVGlMQgX6aVCpDQGNWv7JUo8L92sDnbFkONRwmQw
         RxvkLcKufWjgCc9e03dqVGj/2JyNxx4+irb8RcN2/rRahdNNbRxve0A9mMVmKKk3SMl4
         5NsQGMnO/02a94Dzw+E7gNcApohCslX92tPrYr7G+ApGIq9nVOk6LBYdvEQP6zaC4Jmg
         V3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oIBwXK9dI3H4C6jCiFQOTvpSt7NpPT82uRdSNxuqa9Q=;
        b=aqvQMO4n0fnrloOFnE6YghVE8dMF5XsAOuGb3MK8K8gifpe5XOAYoKXQvkjGVsNjhb
         qKog5AsJIO3t6jKhMMoHuUXX2MYLYzjtYcjzKP8fEFjVJnvPnRSZ5dwRniYJUZM7OZrk
         vG8ArH7UHzmXI15qJmAyBPQW/j+4vmTZ20BNI+FRvj8gIZIEtrvPedf90yWZOcYuyNn9
         Si3xAE9jwAYczrVbu4SWq2VJyzVip+9TzGqIskWzPiIr+0HMFSatQEmijCXN0ja3p0E2
         BzIMeosCkJxErNOCXmmcYxuOF8XjlJBqzba4J5g0HX57hlsE1mdeUD49eiT9fYfrbeNZ
         yEkg==
X-Gm-Message-State: APjAAAXrukWxBngBdq+graD9NsTklyWphLitmqhmsHVptsXBgatnp4Pm
        bsrkvqTpX3dNo0mxjTO9h070YLzhQLJilUqMTfsuHA==
X-Google-Smtp-Source: APXvYqxujUS24o1zdCMyG62CqS7+rnHcXfSb9zeo3v23q3hCeoy1MzIKYp0I3S/ATeAMpicp1vC/7OchmpdRYjQQPs8=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr56486049lfu.141.1560858152483;
 Tue, 18 Jun 2019 04:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdaSLwELtWMiEvYRBRF1d6E_9ymupdiCe-rEaaJkCfOd4A@mail.gmail.com>
 <b56f84bd-6f31-95ff-427f-1bf0dfa27421@metux.net> <CACRpkdaGFw9XZSW7ise5EBun8ehikNMzw4BCs9hByme=6z4KDg@mail.gmail.com>
 <0bd09e2a-5006-4587-056e-9aeb6b05d18c@metux.net>
In-Reply-To: <0bd09e2a-5006-4587-056e-9aeb6b05d18c@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 18 Jun 2019 13:42:21 +0200
Message-ID: <CACRpkdaQTaKATc2piWPQ5dY3zNdNh4QXh5GkXJuLU=deEhz4Yg@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio configuration
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 14, 2019 at 3:13 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> On 13.06.19 23:58, Linus Walleij wrote:
>
> > For devicetree people mostly use the device tree cell flag
> > GPIO_ACTIVE_LOW on these to work around it. But there
> > are some cases where that isn't very readable.
>
> hmm, do you recall any such case where it isn't reliable ?
> What are the problems here ?

GPIO_ACTIVE_LOW is there to tell which way the consumer acts.
If the line is counted as asserted when active low, it should be flagged
as GPIO_ACTIVE_LOW, in the strict sense.

So for example a reset line:

reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;

Then inside Linux we assert this with
gpiod_set_value(gpiod, 1);
which will drive the line low, here "1" means "asserted".
Then we release the reset and drive the line high with
gpiod_set_value(gpiod, 0);

On schematics this will be indicated by a line above the RESET
rail or using the notation RESETN. (the N means inverted polarity).

So as is the case with regulators, device tree properties should
describe the electronic semantics of the consuming devices, not how
some random software in the operating system want to interpret
things, it is not there for software fixes, it is just being abused for
that sometimes.

> Are there any plans for removing the GPIO_ACTIVE_LOW ?

We can't do that, it is ABI. Besides it should be used to describe how
the component works.

The fact that many people use this flag as a workaround doesn't mean
it doesn't have a valid semantic when used right.

Yours,
Linus Walleij
