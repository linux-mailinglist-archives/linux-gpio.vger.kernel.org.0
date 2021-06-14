Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16B23A6FF4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 22:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhFNUQY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 16:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbhFNUQW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 16:16:22 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E828C061574
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 13:14:03 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id c14so17225155ybk.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jun 2021 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aPAnMLQk7hVqO5coR0wKdyEqk3yCrFigz73mgfLmDDA=;
        b=Oy1LMMQVKWjcGglXjI5/GMhXpu+UVfVaifc7EzzUCNkuS3HkG2nVpU8TL1nN/39mab
         8qCctyoWv5uXmtS+XGXPL5KePOYlsAZCFZT/KksiEKqZsWQDtGXoM7RDaibGmHPO1Xya
         8/KZQFbwPtiL+hhxOqiBdUiRVwKJvrQKGDKIT52YmYoE5aJTUGHmP6F2zrGds5P0G8KM
         7gBbvXdjeDcuNMeNq8DdxNpjq9eFeh29WHMZ0xS0rt8dNTpZszDRJchTTz3Lcl3+/8e4
         Va39J6RK7EmzM6EOXRq9dYS7YpDWDhveOtgMPBcWds3ERK53OgQ1qhQ61Xk1Thh5iBX0
         IT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aPAnMLQk7hVqO5coR0wKdyEqk3yCrFigz73mgfLmDDA=;
        b=E3Yv9Xo+HDj/GBky8Bh/HIP557h2nI9iayprf8nSKMDbPSD68hp3rvsQxYO8RO+wBU
         2a+sO4ZkxfYWUcFLZity6/oC4rjzhv6wLhdWrm4vnXHST95PzxNOH7c0hh5CfQTtxGgP
         LpgufV+bQTqfoNGYw1pQ92+3nLPNC7pTIARla2YQyP8nsPh087kpyE5MEcBHX8pL5CB8
         caXESlDiEIJS7eaB2rux9xx2J2raTz3JvgNGRmNAffmLIO+WYCRUOvRkxRltrukSI2BF
         Ii6azbV2RKjID4Sy8E80juBwdP+HahJXpvCBLwvoWt0GjjwvA1Zx3I3HOXWCkITwuWsx
         pY7g==
X-Gm-Message-State: AOAM530HVhsn9GMqJjnUhdEcmlEudLpaMduS/R90A70/tUTI2qh3WBne
        Jz7AhxeQ0Fdreod5/BQSk8XtlzY5MhfrVuwmToyrTA==
X-Google-Smtp-Source: ABdhPJzy8k0LHFs+Ud8M6AwiZGZ0gS/tF12cwe2oQDFAmo52RHbpVaqLDkV7ZHrdpuetfKzOMZT80vNsp6GO0E1tsLk=
X-Received: by 2002:a25:420c:: with SMTP id p12mr26545373yba.25.1623701642805;
 Mon, 14 Jun 2021 13:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210603164900.46020-1-srinivas.neeli@xilinx.com>
In-Reply-To: <20210603164900.46020-1-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 14 Jun 2021 22:13:52 +0200
Message-ID: <CAMpxmJUsOS1YwMFhgBVesSgBdjrEXLxTE0RLrVL0T+ux3=gvLA@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-xilinx: update on suspend and resume calls
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 3, 2021 at 6:49 PM Srinivas Neeli <srinivas.neeli@xilinx.com> wrote:
>
> Current AXI GPIO driver checking for interrupt data in suspend and
> resume path and reporting as error in case of no interrupt connection.
> As per AXI GPIO IP specification interrupt connection is optional,
> driver logic is updated in suspend and resume calls by reporting
> debug message and enable/disable clock in case of no connection.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---

Applied, thanks!

Bart
