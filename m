Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D7010671E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 08:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKVHfd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 02:35:33 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42446 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVHfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 02:35:32 -0500
Received: by mail-lj1-f193.google.com with SMTP id n5so6166991ljc.9
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 23:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tDdbFgRZ/DftFdgsbV1nBG702kIvVQNLzAtOboImYho=;
        b=ApxNRYnw7RNF7PQvsGNN/DGujlE3iWNW2XQcseTQC8u0Pd8ru6z/ihzMNEJkIcm/re
         /LgurCblgfHcKgzlyNijDGy8esKo60XlrWoZ1jP96DaMcmnyTswzH1mSc50dWs1F1v6p
         DChNeXGO+KcAUNpmKRxK9PTjk3FytEiEkwFrTKUtmQOIPaecR9udfRrtBYCHvKOSuLG2
         ZI3L5jQyEbN/4DIT8GQGcITW7ZNT+bz3gtGpbhDn5CMS9SpsMJeQ4hkPudMH7bjIeYzi
         HG4QPdag6HJhjC3hXPzqpN3FoxrF8xrV+AgQDeJZvIllNJxedvTfZkEGoIf64zWC6KMQ
         2lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tDdbFgRZ/DftFdgsbV1nBG702kIvVQNLzAtOboImYho=;
        b=YxLk07D+fjeXgfs8E7bRmsxVkplzckQeZ5Gj2RbI4iK7RTB/sz2h60imzoATt/QS4E
         RmdT7CMS+VnDJmuTyEWmwctOg1RiIlr3kM56K5/atP5BK//N9j5sWhCHnINo+5EwJ3J1
         RFxK8c5RFucoAQ2UvGRFbDt/EFB+Eme18nkHPke7pMIfth1XfaS0hft7zZTJqNNROcie
         5knEcYkjQuKtrXZS4jPHeJXL57HbagkZfWsRPsTYzL8Ng1WBIsGoaQnzJSevrkbqjh3L
         6TmUO5cgjuroQPK6sI9zfRdZISd5L9wb/T46e5hbqYNdl/PJppjLqyBW/WeBcAiVXxtn
         empA==
X-Gm-Message-State: APjAAAXPb+FQJLuDtf0L3OpwpVcX3gC7Z7Ybftz5Yd1ZLu7GtrFuK9nW
        O7MX0HztrXeQXO/y6ciIYNr3uE+Se1FHCzcxQr/lKg==
X-Google-Smtp-Source: APXvYqzL2vp/KKseaTOghvkAWrY9JxbNs0Ofv2U7rE+Ia0IND/xSVGjjfDmSUff7cjBMwjzExoBAvD7ZWm0tIyzIfVs=
X-Received: by 2002:a2e:9784:: with SMTP id y4mr11128660lji.77.1574408130240;
 Thu, 21 Nov 2019 23:35:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com>
 <b59afc497e41404fea06aa48d633cba183ee944d.1573797249.git.rahul.tanwar@linux.intel.com>
 <CACRpkdYZi-0LRjih8+2cgWZ6u-eFN5+3sW1eV2ujYRd0UBoEKQ@mail.gmail.com> <bf8396af-3ace-7463-0fef-890b2f5cc487@linux.intel.com>
In-Reply-To: <bf8396af-3ace-7463-0fef-890b2f5cc487@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 08:35:17 +0100
Message-ID: <CACRpkdafN-NjGNqqu_6-Qz6qWkZ4VGuBz_iyGirgUscz-Qk6VA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 22, 2019 at 3:24 AM Tanwar, Rahul
<rahul.tanwar@linux.intel.com> wrote:

> Thanks. Yes, i have gone through Rob's generic pinctrl bindings patch
> seriesand i was double minded if you should still proceed with this
> patch or waitfor generic bindings patch to get merged.

It's a compromise actually.

It's a bit of struggle and tough sometimes since I care both
about the kernel and the autonomy of the DT bindings
communities.

We are in a transition phase to YAML bindings, and what is important
for me as maintainer is to have developer buy-in, and
it is more motivating for developers to work on this in-tree
than having patches held back. I personally know how
important it is to feel that things move forward in
development.

Now it should be a separate task on top of what we have,
which is less stressful and gives the feeling of a bit of
accomplishment.

When the new generic YAML bindings are proven to work
on two drivers or so I will be more demanding that people
use them in their bindings from day 1. But we need to make
sure it works first and that is a separate task.

Yours,
Linus Walleij
