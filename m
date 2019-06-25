Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0300550B3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfFYNsB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:48:01 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35511 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFYNr6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:47:58 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so16362595ljh.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vqj9RJTLU6a7u47c/a2XupnA9jHEjvrlPTNwz8/pAYI=;
        b=e4iqcuL7UrUFxNJnOOaBzdgx3YrvjL/tcddqVNmyBvq77sJiTTcqtICftMEIq6Xz50
         dXwomMLX65/Vcbqhe+UrqDl1OYzzMfRzHrK/9BGOuPWRfhesBx7TwiuvaRiL1jPsswCT
         pZqJKU3UDGIuh44/ThJik0yQIp+yEn+CvGEnXci1tOkWH0x5QUktV+j73tF9g6CetwYi
         eNeGjmOp4S3GlttW7lbz/+sE5QsyOTFPZkrPWe7h8bSOyc9c7m/jclIe3UI+33lc5a8p
         nyRlgT4zSZUYc8IlfMvS+IMXIBLVBJ3D1ZnAJqMTgLr28tG/uS2yfKvqximd2wbSaYth
         jumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vqj9RJTLU6a7u47c/a2XupnA9jHEjvrlPTNwz8/pAYI=;
        b=sioAWJwxDyuz4QLvoQJZY/NnQo9/0VkXNMUwQk+kTkQSGf1B0Pf0J5rgeRC9Rvxk5f
         wB5gV56OdLPrSwHLMGbJjzWU70dNS8AcM7GElSvQunB+ZmQ43e1t7jh6Hh/PeY3PgnSV
         w+aog9ffToe86hoVEIxqbj2a9YEnJ+JWXncLARIlIszGqbXjdnpL94dk7WMqaHYvhlBq
         ll4GAkd3tIgLirmHQXgsM0gkEDu6tsVGyYuGqXRyAxPhsd90WmJRYKppzdgCqOMX+qtf
         i1fytb27h4vmm/m6ZP+6o6qpi38Kr6/PvDmANvjsmZq4xjdiXh3pi11OM7F2oAKpEnzk
         Cr1Q==
X-Gm-Message-State: APjAAAU2cAve2ZIRxHd6Znd7esGkuByNuFs8I15YJ839jZgAvCqDajj5
        cYD0cu3WLr4N2NXrb6nETPueNHvGtgWo8T4BOgRE4A==
X-Google-Smtp-Source: APXvYqxcWfEyG7sNk/JkRaYtPGwrWAkli7OwDCO7bqYoL3jX7uJ8UgDBQAE4GreAMx83t0VEuJIiv4peaDl4sX/yZ64=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr52570827ljm.69.1561470476420;
 Tue, 25 Jun 2019 06:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <1560938081892.33415@sensor-technik.de> <CAJKOXPej57MJKe6ShinG+VJdG+XM4qhpeD3rQ2ZHzRTmO43+GA@mail.gmail.com>
 <1561066629320.13520@sensor-technik.de>
In-Reply-To: <1561066629320.13520@sensor-technik.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:47:44 +0200
Message-ID: <CACRpkdbPxHgyTAnE12PrMRu9XQqdoXmS+SWXYrSKXgL_SWOzcw@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: Fix return value mismatch of function gpiod_get_from_of_node()
To:     Waibel Georg <Georg.Waibel@sensor-technik.de>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Georg,

first: good catch! Sorry for breaking this, and kudos for fixing it!

On Thu, Jun 20, 2019 at 11:37 PM Waibel Georg
<Georg.Waibel@sensor-technik.de> wrote:

> In case the requested gpio property is not found in the device tree, some
> callers of gpiod_get_from_of_node() expect a return value of NULL, others
> expect -ENOENT.
> In particular devm_fwnode_get_index_gpiod_from_child() expects -ENOENT.
> Currently it gets a NULL, which breaks the loop that tries all
> gpio_suffixes. The result is that a gpio property is not found, even
> though it is there.
>
> This patch changes gpiod_get_from_of_node() to return -ENOENT instead
> of NULL when the requested gpio property is not found in the device
> tree. Additionally it modifies all calling functions to properly
> evaluate the return value.
>
> Another approach would be to leave the return value of
> gpiod_get_from_of_node() as is and fix the bug in
> devm_fwnode_get_index_gpiod_from_child(). Other callers would still need
> to be reworked. The effort would be the same as with the chosen solution.
>
> Signed-off-by: Georg Waibel <georg.waibel@sensor-technik.de>
> ---
>
> V2: Rebased on top of [PATCH] regulator: s2mps11: Fix ERR_PTR dereference on GPIO lookup failure

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Mark: as most of the changed lines are in the regulator tree,
would you please pick this patch up?

(Else tell me and I will take care of it.)

Yours,
Linus Walleij
