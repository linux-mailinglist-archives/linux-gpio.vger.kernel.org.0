Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A5E13D7E7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 11:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgAPKab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 05:30:31 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44965 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgAPKaa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jan 2020 05:30:30 -0500
Received: by mail-lf1-f66.google.com with SMTP id v201so15154325lfa.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2020 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YLnT5lRUqx2g/ROZ7ixstAp+BbnFc5B8W94IMarCcO8=;
        b=JsCgWBiwNiNyl3gMBU2fQGsoz4OMfgMTJFon/0qw3WeTUCrr8Oj1tgVHov2rihhnKG
         bXdRnsT6lHyO1PXksaEGBvkbpjBQwIibqjIzxO+RFB7rLMjCnk0rh/ox+1GMf/J9fKST
         Ex6A4y44Pqo9lNt0bieAmuoT0ZNx0bpmpKKnsHadCAIwUkYwAlzGfDl1qi86hYACxPHo
         96akU8S8+Je01CJ+wyzbSHXnaQH+JMXJX9Y9SnE+VC/guv81oeN8l2d6LzT2mBDGiOh/
         pzAiMenrWS/VG3lwRKb5gMDe/Ril5r5izMX2etqlCtI319GFxGQpMKjaINJ/bXDE+ts3
         1Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YLnT5lRUqx2g/ROZ7ixstAp+BbnFc5B8W94IMarCcO8=;
        b=Qe3nlcs0teRNuJrHJNZYkCTB3uzG+XFyw7tUowG4Nh055vzYxceCpT3K8eVGdo8lK3
         qTnHi55a3PP0rX9GUY6JpHGyqxIpgTOeLSMJzbQbNwvwnpYFUXv+bq3SKoYgnzxpSeEW
         3PxZQpPS9Mc4SgcE1Ep2tXoWh94epw7LAbJZANn9etExH5x8+3FWjdlCF6CKwIuc8J3R
         gi0d5RQdDkGRVsxSE9TzjVpxoFjZm0DlCExGv498sG5N/w0z44zBuXRIM56QpPTuNWZ7
         JICN56EX6iyXbQkJf4/DBHPEWGNXQI6KAyr01kHiEDg3ZqRP+m7hC6jQ9ga7kJkUx78h
         mg1A==
X-Gm-Message-State: APjAAAUrh1gDtB23ICxGnuFU8PhnmzuuAR8kFVkKxxk7LDkZk3r3RJi5
        NQ0Pv8Z6Zu5tiw3kqnigcDmqJJPeYPLFnRtwzOdnKw==
X-Google-Smtp-Source: APXvYqwc+zPupOjbxCpLFje7ZPBxmKugMWQJZR5xXbnovBvouG5qRFnygkqd8IFXhjbYS44EtnwS54Om1tUxdDpJCH0=
X-Received: by 2002:a05:6512:c7:: with SMTP id c7mr2109146lfp.120.1579170628111;
 Thu, 16 Jan 2020 02:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20200116095003.30324-1-haokexin@gmail.com>
In-Reply-To: <20200116095003.30324-1-haokexin@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jan 2020 11:30:16 +0100
Message-ID: <CACRpkdYPEpiDx2ek8=jTga-Myh5m=tihsBuy7y9VGkxU2LXR4w@mail.gmail.com>
Subject: Re: [PATCH] gpio: Fix the no return statement warning for gpiochip_populate_parent_fwspec_twocell/fourcell()
To:     Kevin Hao <haokexin@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 16, 2020 at 11:01 AM Kevin Hao <haokexin@gmail.com> wrote:

> In commit 242587616710 ("gpiolib: Add support for the irqdomain which
> doesn't use irq_fwspec as arg") we have changed the return type of
> gpiochip_populate_parent_fwspec_twocell/fourcell() from void to void *,
> but forgot to add a return statement for these two dummy functions.
> Add "return NULL" to fix the build warnings.
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Patch applied on top of the other fixes and pushed for inclusion
in linux-next!

Thanks for your hard work on fixing this Kevin!

Yours,
Linus Walleij
