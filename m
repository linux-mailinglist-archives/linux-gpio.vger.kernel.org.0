Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05DF2A7B79
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 11:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbgKEKQc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 05:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKEKQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 05:16:31 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EA6C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 02:16:30 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id t13so959944ljk.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 02:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XzY1VkvmYL3pvQ6ooemzXER1+NGHzQExssTtwYHfu3I=;
        b=XTFQbF5935sVeuBgqmaOO5pdnb3YL+UApn4NnnwcaWSfdg4FAy6KlYTD8nryvGlxg1
         zmPsKr1X/9039LndgggUw00Pk+GXaNGvH1pRx2VVE5oowCpSYyb2407ZeNMNTnh++S3g
         jFihuaqOm1X5T2ZVRothVsfeqaqcW1kGB4eZxaC7Sp0ydjd6NRHvC/r2L4WXFLJ9SNA7
         8Ye1SiLbKEiHIeW6QWCn5epaHTPKW+nhHBOkqUlxMQg9ke6QBQ3MuX924sxywTVuTXZP
         2V1c/2Gbcq0mBXzpawm8qxP7jzSJz5xS4QNVuQlLYTMJ+lvcxQKKkfqEQvYQ/YnHtkaD
         /aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XzY1VkvmYL3pvQ6ooemzXER1+NGHzQExssTtwYHfu3I=;
        b=Q2F9S+2+Ve4WiDwpmv5gbbc3ZZz5ySRORi7Z2u3SWu73IHhKH415+BEjtqxM5dBoq2
         qT9dAilArTvsNqzf8nTG9y4QYugUN7Ux5g2k8ebJkoLu2IFLK+BFmvkzPobIdHueSbfJ
         oq7rjtybigut/FZ1lqNY/13zMYiQ84cYhBcrlZmumO4MoA0y+7bzedh4IpYFZdL6DJ7h
         fUcYtR8M/DbhLbuPUgqLJ18BBowDmbBCc/k6zL18YP7RBtCJj3MHY/hh0h9jhnqC1U+u
         hJQJ/M9t63rNmQBfDrz+AjOnIEVi6crdbMT3Fc+s9nErC/0Elzj1ArubNwJBHD/+ow50
         g4EQ==
X-Gm-Message-State: AOAM533hZlcNsWlltM3LwRqu1mhokGFJ8YEUe0oswyjaIyMtvTneL9DX
        0o/x6aD19V3dwAbEogTBkBTSoHbNW/tzxmb1of3S7g==
X-Google-Smtp-Source: ABdhPJxaq73gcB/JxlAqEL/i+o9calac2E7MR1bcyxAJh/tpAKN316vVzkkP8N7+kPd9X5pE5hxh+OwUmsUZtVAg2Gw=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr668709ljg.286.1604571388670;
 Thu, 05 Nov 2020 02:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20180129005948.7714-1-bjorn.andersson@linaro.org> <CAKZGPAPrwXNeYk+bDiMBRczVf4PaBANnzhmenZie+V0BJ7OqBg@mail.gmail.com>
In-Reply-To: <CAKZGPAPrwXNeYk+bDiMBRczVf4PaBANnzhmenZie+V0BJ7OqBg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 11:16:17 +0100
Message-ID: <CACRpkdZ2UzA=Hyw+b20dCqzu8+L7_D1bTM44MKbbue2VFCY4UQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: msm: Use dynamic GPIO numbering
To:     Arun KS <arunks.linux@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Timur Tabi <timur@codeaurora.org>,
        Arun KS <getarunks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 4:21 PM Arun KS <arunks.linux@gmail.com> wrote:

> Im only concerned because, after this change, the use of gpio number
> from user space has become a little difficult.

This makes me a bit puzzled so I need to push back a bit
here.

What is this userspace and what interface is it using?

We recommend using the GPIO character device with
libgpiod for userspace applications:
https://www.kernel.org/doc/html/latest/driver-api/gpio/using-gpio.html

Is there any problem with this?

sysfs is deprecated for years now:
https://www.kernel.org/doc/html/latest/admin-guide/gpio/sysfs.html

Yours,
Linus Walleij
