Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5342AD8FF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730687AbgKJOlK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730059AbgKJOlJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:41:09 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0BBC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:41:09 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id r9so14284125ioo.7
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dn8iOwBj5fjE2xG51HcWqy5Oy/yWfS8sGb0RXIKjdS8=;
        b=i5ZuAjKq2niuYt59/TsWQ97kVsCB5xVOWn4LU0FaFcOD/Q22a34uTq5NEfyFq5tmzM
         AjDcioXz1kF4w+W7K44SwROzHvQRWzz92huVU1NL1JNOnhqJgaj9yjMihpJUw/cU+fDI
         JPhawPOyOxjaCCos1/yI4HuFpCswXXrR8jiz52XTq4vZJ0eTHXhL+yAvfFL5eIG/uMyz
         kcT1ppm7rOwTd03OHrLHZ/SPmttHd8D4RSXFkLWtwvFlmAtheP6u2htlBYS24jl1UJmm
         etnq3+mq7f8GYn1Wvf5E6grV7b3wbG90fuyYuziz3OX0TUo/cekgT3j+6pky/on7cjn8
         tdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dn8iOwBj5fjE2xG51HcWqy5Oy/yWfS8sGb0RXIKjdS8=;
        b=pjoK4l6Ufn/yitnUUP2qWcOkNZPtsudNPlMNF6ZhKcSyv23nPwTcUx+7bqpDWu5UTI
         goF4XGB8q7CbC9EK403ywPN39VeyGpzxUvgq9OZSoRIVp2LW4/dD3GbwYCICCLbjBqEV
         WM8eWIvFHkukWxmIso+OeLHqULEcXZv22UKnNm2+6zt0o7FwgzOAzJtCOfYpV85sOdUD
         A09z30yakpUu5gBsLWpCxsSpgbc43bxcwGEakRuPMwYzLqZMakz5Pi+zRAdVeUl92CQW
         ZQs8apWcGqxBQRSYW4VMgsODiOFDE/84tVOTEztUzTTo/E9vIHxZtVUSaXVKIRaJD7LM
         8Wpw==
X-Gm-Message-State: AOAM531MjfN6CSzTuNdVvK9mjnxepMzhWQCw8Bd+Sgg+Vp01+nWSEHuQ
        o/1/vjWnXbjRIYtojyLJRL4h0JlADtcdbuuC/wbzqgEwEWw=
X-Google-Smtp-Source: ABdhPJxqBC+rsXnsukSKbdhQkufqcmVTnGmVcKWhybsmKzxbAsYrXqJLXqaDCqalT24sA7YWwCJC12qidi3ZN796zmM=
X-Received: by 2002:a6b:7c06:: with SMTP id m6mr14721110iok.130.1605019268856;
 Tue, 10 Nov 2020 06:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20201104115348.51930-1-damien.lemoal@wdc.com> <CAMpxmJUO-fyQRyjKD4gNZFw=_iAH7eMd=xyLXLuwAikC0OnLsQ@mail.gmail.com>
 <4dae7924b5d8b020e747a36ecb015063090b819b.camel@wdc.com> <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
In-Reply-To: <CACRpkdZup58yojegKUxpok-aqE95sk18JDc0kuiUoiOj1XKpGA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Nov 2020 15:40:58 +0100
Message-ID: <CAMRc=MfjWfvKP8ZjU9RA+kgpR9x3pqkGExzMjSerLztLwDV86Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: Do not trigger WARN() with sysfs gpio export/unexport
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 3:31 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Nov 6, 2020 at 12:27 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> > It may not be the best interface for regular end users to
> > manipulate gpios, but it is definitely super useful for developers to do quick
> > tests of their setup/drivers (which is what I did for my work with the Kendryte
> > K210 RISC-V SoC support).
>
> It is a bit discouraging that RISC-V, which was invented after we already
> obsoleted the sysfs ABI, is deploying this for development and test.
>
> We need to think about a similar facility for users which is less
> damaging but fulfils the same needs. I think I saw something a while
> back that looked promising and added some funky files in debugfs
> in a hierarchical manner per-gpiochip instead. That is how debugfs
> should be used.
>

Basically something like what gpio-mockup does for events? Was it
something out-of-tree or was it on the mailing list?

Also: quick tests have the tendency to become long-term solutions. :)

Is gpioget/gpioset duo difficult/cumbersome to use? It's a serious
question - I wrote it in a way that was as user-friendly as possible
but maybe I'm missing something about sysfs that makes users prefer it
over a command-line tool. To me sysfs was always a PITA with the
global numbers etc. but it still seems to stick with others.

Bartosz
