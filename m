Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF6888A2F
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfHJJEE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 05:04:04 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39864 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfHJJEE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 05:04:04 -0400
Received: by mail-lf1-f68.google.com with SMTP id x3so17437686lfn.6
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 02:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2+7/rOX4aw3CppBe0IexN01CpzL88m+5LBEHDnN2Rw=;
        b=UWXfmIvt1zHaFkYC5PiEheTFjDL7HpdPy8/pWaB3rltMoL9ZOy12Kw00PkfDPqoeJQ
         jmRSwYU9WauFsE0125chERnsi49PwatStXmIjANuzt+o49gfza6ZiEewStFi2akTWgfH
         ZV+U45AZD5QA5/Op6qprG+kqufxr42/yviarDiT8gBrh08xIqESd5EqDzjccW13UtbOJ
         MZQaHFi21rewWbj4Bgp3SQPPwwUBLsNvl/1xla1CxRJ13EwijevHjFLBmIizayRtbJsa
         7j+8aXU3zI1JFycLadcUOet0i3qvQggkICji+NvunvHtjHlFDtKt1KTAGtO4U2THdX10
         Os7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2+7/rOX4aw3CppBe0IexN01CpzL88m+5LBEHDnN2Rw=;
        b=gvX5p/kF9meyHXJCe3nyuzCZNCptIcCNBayR587hfjKq11B8SoE/v+zAmk3i1Xz/Z9
         fHJdaa22Q6YBzKM73/0j8mYgMh6w2IRzp5rX4inOyWZUJXA+TQ3QdF4FLGMb+3Siao9z
         UrkC2PbLGKd2dk4lKTZ9On5SS/ZW/uQFvM05cMYdr9LD13Wjd9ii1n5BIFKa9EEmmAGG
         VlctBSuEESxyqi/mM0hSLjSvo/UgVzmmBrB+B6HXHrmg/3b2X5IXwII1jyCVwHFblR8+
         s9mlFeH1bQdVZigtrftjZeR/vE7W4a8WsbhRwuzxoieHs+wIZdqpZ5cZ14P4bCDlLEQC
         D15g==
X-Gm-Message-State: APjAAAU9RqWL7i8I93Ie+9dsFEX+p65/0zZzWLRQuHXzcEPMS7Z6AP1r
        0BZUFNpTqAIprI52o2OK+S542x1L523IQoO7I8dD0w==
X-Google-Smtp-Source: APXvYqzI1OUT91BOym1WtVyDuCF8UlcJ0q+oCBXUIJCXfURb7tSXeCn2SRWNYfl0AXcRv204POPlchz1LNHOB+/AQyY=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr15054737lfy.141.1565427842907;
 Sat, 10 Aug 2019 02:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190809202749.742267-1-arnd@arndb.de> <20190809202749.742267-4-arnd@arndb.de>
In-Reply-To: <20190809202749.742267-4-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 11:03:51 +0200
Message-ID: <CACRpkdYRpsoxwCjGW2JOJCCgs2xGztKHk429gg4SMOwgqvG+Rg@mail.gmail.com>
Subject: Re: [PATCH 03/16] gpio: remove ks8695 driver
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 9, 2019 at 10:28 PM Arnd Bergmann <arnd@arndb.de> wrote:

> The platform is getting removed, so there are no remaining
> users of this driver.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied. Thanks for cleaning out this old cruft.

Yours,
Linus Walleij
