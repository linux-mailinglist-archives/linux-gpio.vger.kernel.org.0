Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5728A52783
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbfFYJHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:07:48 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35903 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfFYJHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:07:45 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so15465236ljj.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0GWdIS+GEfUG5nPSEfqs5x6+drSTvkhfOWgKSNYIqN0=;
        b=QyBeTVgMyvV3A51yzjyFast24jYXD9mt1vYhxM+sIQQr9vvvhD24Q8C2Tojj/HzDOs
         N5MpHRTsgCVobB0lKXDimS1Nui2PheataX+Mu/E5NqIjnhRYxc4y4AAROUWO7p3AQa+5
         dkoN0wDLziZJDEzMxClpeUP/RU9UWvPeLmoELQcv8t9PFYBz5RBfGxc25hb9TF4FpICS
         b/IOVmvBltbMfLgiUDDo1S3hpikRWMkhjy7j1J7bbL6WBDOBij9OXOHxUPKAsp28cuVK
         pUKnDln9ijZ/N8V1r6D4/J/11sl7s9W/Obg7YeSW6reO42F2AAtMTn4G4iFOWTAWjZyC
         HWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0GWdIS+GEfUG5nPSEfqs5x6+drSTvkhfOWgKSNYIqN0=;
        b=VtrxhvRX1CKi2uwTGQyjNGPT26GfhmAYZpU0l4k4XRnYvFE1QiIsnEb+JQAQD/L/Uh
         LwsAHBGmbiET1uuxNwQFJTPtonqLexmVVsW1IdBQqg5iCKUv9KHrq5sdxWmdAVQTAYSc
         Ec7L+1q7YlJhqODn/o/Er9AV7gI2sEBtbln1KTP60QVZ3ekPpespkMokCneOvWtykTq3
         oNOCOVL3jIPDwV9ebaOXg/6k9fQfCcG8zuenjwT6N/Nu68VFriR98/lwV2xa4vPWAmqf
         yTv7MvSgECtfCwxgHL6CAsWRQ19gWaikhDgWb8mZWo2T9RJ+OZ1hIJyi6uG+AOnWfD3V
         cV1w==
X-Gm-Message-State: APjAAAWKpOTGEHji8loPCHlj44DeRZozYV1r5gQ04dyh6Tym2OTGBOO8
        HozoCkfc3dOJRbEuOKhFIP1XSyZq/+8DBiTis8SpwQ==
X-Google-Smtp-Source: APXvYqzz9Um+MYJcHs/yCgJ4qUjUqXZH4oi0xIYoS/HhbJbKDvrsegnToehDA35zTaDo3fbZAHo6UYebdB3weJDQ2Ko=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr60952483ljg.62.1561453663092;
 Tue, 25 Jun 2019 02:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <1560790160-3372-1-git-send-email-info@metux.net> <1560790160-3372-5-git-send-email-info@metux.net>
In-Reply-To: <1560790160-3372-5-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:07:31 +0200
Message-ID: <CACRpkdaRy+aVsmTCy0x+V4Xx13A3rihKLr2BkvLnQ-if5UZsGA@mail.gmail.com>
Subject: Re: [PATCH 5/7] drivers: gpio: grgpio: use devm_platform_ioremap_resource()
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:49 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Patch applied.

Yours,
Linus Walleij
