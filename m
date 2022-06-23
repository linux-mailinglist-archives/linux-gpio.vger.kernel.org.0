Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F461558A12
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 22:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiFWUa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 16:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiFWUaZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 16:30:25 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5853653A7A
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 13:30:23 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id ej4so583292edb.7
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/lO1oENNfy7vmMJgr/E29ldbZVBHzBZTdtNgKvBlKc=;
        b=OYrprdnXLfCPeqbZyaMSZPCV4jww/kffZoNEBTHlZV7PQ9L2dClQvSVmOn81DyovCg
         mIsPcjZ7b0tCBsej/j2/V401TYKuO6bsIgB0nNizYlSafGAisc8wXyfUwUfXjVPAhyg/
         h0LsBlUFW8wr1EskyscqsVlMW5YjxK0obm6UdxqWzNK3xKXd/yzSM1eG/1ITtxvwm2Og
         7l1bHHzmzMpSY3rG0D3gj4jFFkKmmGxZ0xN/ZSglMZqWb2elfxGMi5uLDgJ8HiNTJMeN
         q235Vqxgan9472OtXJxseJE6QtGXfRdPYH9bZnXzcqH5oYP9wJ/gKsy3M4F0hKRuEOO+
         nZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/lO1oENNfy7vmMJgr/E29ldbZVBHzBZTdtNgKvBlKc=;
        b=odv72s5UMJhwMfEZ9rhCRDkaDnyuzouTMhLXbGlsDOVobRoKvlxnq9JzG6W2XVT9cf
         VErsN1GWNkLo+DZGL9TxxjKFs1oC1gSVdh+bFGU49qmqdNpmrTmQ4AJ6hS8x4snbvSL1
         IystXpbpJ+Ow1ZQHvOVIHKN9YWc1ZxKcjqusub+iPRa5fHaeyU6hD0+kq5kN2kHPMjRu
         lahRsY5PP32AJIHdQYSDSlmB0bXCnMMSRM++9jOXJ3OzGvuSWzTqOJ9RcxymoJcv3YaX
         sgo4ooab+/MFqFhvzP+Bl7qQNVgCg6AyIZrxxzSD91PKRUrFa8OkQJczRa06SGUgr5Xa
         Kgeg==
X-Gm-Message-State: AJIora9s/1Mk6Pmz7yFiA/OH1rUeQlnUaEIaqfJK0Vn79bPGb5KBTb6n
        CfU+WYaBIilfY+zhKWRaim7F2R9qxCJ+yzHAcpmO2g==
X-Google-Smtp-Source: AGRyM1vp+akZQOu6612uR1H5BLWRRkjkLz0ROFh1WQmqoL7FNnAU9Sd4mnw3yBTysurqaByP4xz0j0pWGZsJRcQ4YEc=
X-Received: by 2002:a05:6402:430e:b0:435:9e41:6858 with SMTP id
 m14-20020a056402430e00b004359e416858mr13228843edc.69.1656016221918; Thu, 23
 Jun 2022 13:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220613054310.21186-1-a-govindraju@ti.com>
In-Reply-To: <20220613054310.21186-1-a-govindraju@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 22:30:11 +0200
Message-ID: <CAMRc=MdLOEWyUjhsyUHU0hfHGbd+SmpzNUOagOoLM6z9eVAZgw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: davinci: Add support for system suspend/resume PM
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 13, 2022 at 7:43 AM Aswath Govindraju <a-govindraju@ti.com> wrote:
>
> From: Devarsh Thakkar <devarsht@ti.com>
>
> Add support for system suspend/resume PM hooks, save the
> register context of all the required gpio registers on suspend
> and restore context on the resume.
>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> ---
>

Applied, thanks!

Bart
