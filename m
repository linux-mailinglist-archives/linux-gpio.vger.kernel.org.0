Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD1F25605D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 20:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgH1SV4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 14:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgH1SVx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 14:21:53 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACA9C06121B
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 11:21:52 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id oz20so373172ejb.5
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NitsUGoWpHEi7JACdZqk2bJfVv+nYWQfxXZQZAJftR8=;
        b=arunfWFIhdXuMWwizjSFeS5fQKjHaDoEcN7Vc2TTlQA+/bZqLiX0sjb7NF38Todkxf
         WDtoh+BOFrYjgn9k5nrrbYbcWhYHgPwfmEjw6UmYepfk52nRi/CPxN0dV/VALThCz9gr
         RHwnRMhqX4ARUcABIYCv6R6tU9W7/vQIBkFx1zB+W7KDJQGhv5/q9yWIXCtRpGIzv68D
         IxBcautBeHTvdOGh3F7OVRPge7IU0AH5Jo9DHy5mKWfOXsXLXrAswzJAhL2UkPf8JBaT
         gKSOcg8KaVsreqwJQiknwS2Mn6xjL89qfGDAhBKuUOWZ/4v0diJ4ufsgl1FDfZKuNyI9
         Uz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NitsUGoWpHEi7JACdZqk2bJfVv+nYWQfxXZQZAJftR8=;
        b=M5A8DhddEV+MB5H8vI7bRhHuadD6sBJVXtlnUOvk+S3Grg4xuxEz95mlFLKDqMSQqu
         D0GMGeBKKT+pHuQvIHyhUoINZoBAevM027JI1Va0T4FzAH5FP1qGuvWtPTA6rvmh7Q6z
         NjWo2grb6WjtKUVpbtFmKvkW2AXi8eJqGDzP9WhI7T+Diy45SmQfyYUisYwg97eM5Gjt
         LwejiLI+6hYPdBJvTEy+gpINd3JUegNYAZgCEQlGBqn5Gdg4nCuPs1NbKTIMlyjoq/5K
         zUU1zJo4nOWAJR/5oaTXkEahY6+5T85gusXE2WCuCoKy5vCaat/P6jin/J8QaS8v/xBL
         QJxA==
X-Gm-Message-State: AOAM5317vOo+SyyTD9MDe2HOIsC9xxgp5o+AFWteS0KxUQIRdRwBVtSX
        zOOs6Zsqz2+/sT7crrWWm66zuecwSL6AM+5hQBV1RbzaMZo=
X-Google-Smtp-Source: ABdhPJx9jq3Dqxs4D2XtzVZrYv4qnQpE7IQTqeRaY34szwPLGLrI1OI2zYvc4zladcGFqXFNLjYnyxvqAckASdsW51E=
X-Received: by 2002:a17:906:4d10:: with SMTP id r16mr3212844eju.420.1598638911015;
 Fri, 28 Aug 2020 11:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <1598070473-46624-1-git-send-email-dingtianhong@huawei.com>
 <20200825095726.yvg34q74xy57qhrx@mobilestation> <CAHp75VfnCRFPQ19tdQb46PvnBV3RActKn4+hSivPN8e122Q1Aw@mail.gmail.com>
In-Reply-To: <CAHp75VfnCRFPQ19tdQb46PvnBV3RActKn4+hSivPN8e122Q1Aw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 28 Aug 2020 20:21:40 +0200
Message-ID: <CAMpxmJUEvaW82V8s8Tw2MVGVb4Tgkg6T9-NfFJye7zF+j2a-ig@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: add support for new hisilicon ascend soc
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Ding Tianhong <dingtianhong@huawei.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel.openeuler@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 10:20 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Aug 25, 2020 at 12:58 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Sat, Aug 22, 2020 at 12:27:53PM +0800, Ding Tianhong wrote:
>
> > BTW Linus, could you take a look at my series? Andy and Rob have finished reviewing
> > it almost a month ago.
>
> I was wondering the same, but in normal cases (not closer to the merge
> window) Bart is taking care of drivers/gpio (AFAIU).
>
>

Yeah, normally I'd have queued it by now but I'm only coming back to
100% activity on Tuesday - I was on a leave since July so I was rather
inactive lately.

Bartosz
