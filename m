Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362731F51C7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 12:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgFJKCl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 06:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgFJKCk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 06:02:40 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF783C03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 03:02:39 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so1718407ljv.5
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G/ZiUIIV8iMk3Rf5VRCT4Eiot6h1rdh+GgTRfXX5OTk=;
        b=iRkvyWtbKG9FeaqfyEPsStoeGXfM3aS4dkrQhpFqfltnvXhwdkTqtgztvDpaIZzGmH
         RtTZO76xVc/3qdy0J9rSVKrLaKNYBl/GS83JoQTuvNV6rm7N3OprgfsjHVGpoNUWFi+R
         RqoFqq3Gw2koDSIrukPF1J78Az79usDNRWUtZWwWDOCtdwr5bpeintbgvc/pxtAgE+Cv
         C8ihjLEojMlA3EDqHnfq7BJ9bY3Nh5iFfEY817yXS1KYQf8LL4SoR+jqzJqYAM+PO/xD
         IUvJuO/LW50XQV+DioljyezibAVwSq96QLyM12buU5/s7AIsOrDcXaNS/E7i8CLNyozo
         NlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G/ZiUIIV8iMk3Rf5VRCT4Eiot6h1rdh+GgTRfXX5OTk=;
        b=tDcGOIHJlLXZEcsaKk4Am28MOdjdRq5A4jVJLBGvsJiDv5qek7OFOGiS8ZtL19WICh
         Ksb/8vFYYi3J8J5EofNwuETcCXNyFkyuHLE4yrXrc6P74NWotdATAGo3IIfIM/Dt75tq
         QQOi6Zs0qYo4E2MUYdinpfLre7JuzacX7dlDkK8iFurkD6UftVGtZ9xqsxyE9HrqEdVP
         FJjIuTe7NdCy1KNTZCK99718/xgVORVuvK5H947SlCdo/UeqHlncoiyrV0wDeQHxOiPz
         HaIaRhSPra+Am5sjd1261w510e3cMtxNblqLxisoZQFydmi+PGDYAS5Xe0uo6TnyRPjw
         bOmQ==
X-Gm-Message-State: AOAM530HdFpcCMbPvURyDsigwm/uqW3IiKAuBG5XJu190pT6K3PmGC/A
        9l2+XQVDSPLYlNg4xqO/GjQ5WCL1OorgguskIs0/9g==
X-Google-Smtp-Source: ABdhPJxy0MwTfdtGLEADWrUxJKMn/lX/2cr8fh3TgJePLWUwPx481uUyfXCrk3EVKsfi51DxnDYboh8qt8cSxvyP4Gs=
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr1249133ljo.338.1591783358305;
 Wed, 10 Jun 2020 03:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAFAFadBs5UNsktWR072dXwvJpk-rk1wqPBCb=gkLfxMbE55QUQ@mail.gmail.com>
In-Reply-To: <CAFAFadBs5UNsktWR072dXwvJpk-rk1wqPBCb=gkLfxMbE55QUQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 12:02:27 +0200
Message-ID: <CACRpkdbkThMGRd=7zCpuuVqfZQSofLodvQwf9gKhxTxweM5gpw@mail.gmail.com>
Subject: Re: [PATCH] max732x_probe: remove redundant check
To:     gaurav singh <gaurav1086@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 6, 2020 at 5:09 PM gaurav singh <gaurav1086@gmail.com> wrote:

> The pdata is already checked for its validity above:
>
>     if (!pdata) {
>         dev_dbg(&client->dev, "no platform data\n");
>         return -EINVAL;
>     }
>
> So no need to check again. Hence remove the if (pdata) part. Please find the patch below.

Please send the patch as a single main using git send-email.

For further help see:
Documentation/process/email-clients.rst

Yours,
Linus Walleij
