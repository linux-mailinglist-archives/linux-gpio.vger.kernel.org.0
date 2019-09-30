Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2774C2948
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 00:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbfI3WH6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 18:07:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42848 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfI3WH6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 18:07:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so11122251lje.9
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2019 15:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5H6jio2cMCYR9yn59g31ZgL0co5RN5Wl4ynSfmiwzMc=;
        b=dZ9gyiyiFxdnEyiksBrNh+bgYDbqxu+y0Ae1BWixlLV6guACV+4ItCXv9uV9SoHV+2
         O/sEkC9ugDrhQosuPRtaYZD+bYAjLeGJhaTuId6O47oSpaFwS4Jx4/lD+DIrElb6FF9L
         woUri/85Yh6th97bTfvDDsHrT6+i9TsbFC1nWmSKsk0kkSrsgBEI5OtOn7qx5CtMxXcS
         AwClL/dF2I5WeNLyBbUpwdPEGPEK2Zw7fjjDjdFqklWiEJKc5O2lcI2Ft5jGIf/y0oed
         y1KxJlJdJiHr+7CUQ7Cx5FxREoV17NJpqwLhbZNg/pqv6RoYN2o9SzRcM76V1jSx4HM3
         CjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5H6jio2cMCYR9yn59g31ZgL0co5RN5Wl4ynSfmiwzMc=;
        b=Nk2+qGD0BsSM9n3P4CWdIKUkHLpF+Ug8K8j09BnyXQNZMID+gofAvscNgHOf1JTE86
         jNI3pFQ0MqG0WJTMGhos/LhTjE/FgH9RHMJ+KbT1/7F64h2H30lYw7LFRjyOEYwsPvhH
         COWweRgzvkpmcwRU+Vv1r0WZKfhQUM8SqXJM4Juqm0USLMjTbEZKgvOmDgv/pY49iC/l
         ho3IPtz48Ru7coel0xQvQ4PiRP2BP51Y86eH3/BbjgxwoV2lskbSAn/iDbHS88WNS/RP
         XdhJzj04fjhtuFLaIh5+ADs9QW5b5w+3+yc/fdWPnGT87sXjuuEB7ru1D1BHu773LuhF
         dvqg==
X-Gm-Message-State: APjAAAU4M/Mp2tJ3jFEXbZCDbJeCUUL1v4jJFUk2E0DsvWRaXs9WEhxn
        sQV3vrlRNWmBuUhvGqFrJrsxhLDLOUfN3a7M9DmKX8F8Lh0=
X-Google-Smtp-Source: APXvYqw0L42/kKZNDX+JySxgT7I1cCFhUcVKfqZGNJPLllk/7xezjCzzlZojrP+/5qn5TiYOtTEhzwC3pffN7cWfEHM=
X-Received: by 2002:a2e:b4c4:: with SMTP id r4mr13960291ljm.69.1569881276180;
 Mon, 30 Sep 2019 15:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190823094728.15012-1-linus.walleij@linaro.org> <2a71bee2-a378-3513-5300-f30bf7f8b102@monstr.eu>
In-Reply-To: <2a71bee2-a378-3513-5300-f30bf7f8b102@monstr.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Oct 2019 00:07:44 +0200
Message-ID: <CACRpkdbNypgy0mXrDrPthBYMB3UyKtGG2dHpbuhKud=eDh1Amw@mail.gmail.com>
Subject: Re: [PATCH v2] microblaze: Switch to standard restart handler
To:     Michal Simek <monstr@monstr.eu>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 19, 2019 at 10:46 AM Michal Simek <monstr@monstr.eu> wrote:

> I have applied it but moved machine_restart() back to reset.c

I just noticed :) thanks for doing this!

Yours,
Linus Walleij
