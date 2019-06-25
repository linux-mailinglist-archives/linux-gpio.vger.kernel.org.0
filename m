Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBFE45277B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbfFYJGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:06:48 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36678 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbfFYJGr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:06:47 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so12099872lfc.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0GWdIS+GEfUG5nPSEfqs5x6+drSTvkhfOWgKSNYIqN0=;
        b=cqZmHocIds26v78FD0hZWzSrS1sS4RO1JTOTnN8GdiR69sKc9Bl3wRM71FrY4zT1UI
         2vsZVEc1VurGWpnc5fWwWLl4opKF6oHPsEd3dElV1amNVtQIGlSao7tPhq2UjqktMn1z
         vAL+TdvclegR8/3Ca7qwmr7qPJgP83KAGImVRlMbGIdW83lzO9t6hXOplajeOtyoWjhC
         om3VFvDUVKBoqmnqzcGqXQQsL8X35lrBPCxMkTklJ1eWMbvabLwGMFhWj2sQD+HgrRbg
         8LaKMdBhKqW4uIceY1H/7JwxRS8VVOB/1gFvgVEKkLViFWlS+TLW4X5uq6BVRqsaakET
         zKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0GWdIS+GEfUG5nPSEfqs5x6+drSTvkhfOWgKSNYIqN0=;
        b=ORi1ApjLJKA/oNaJ+hdRe0Kz5gKHfmyMSXtXz5HJohKCU8+P3AcZAAEyQg6Ym962Iu
         HbKxQCthzSycZ+vSwYE6O17uB88o2guPICzokdwcyWN7JPVT4jrIkHbCvzv7jjy8rv3h
         5fVOqvw+/GCduDQ3YUrGgdwrokBgDedpPn/IvVKvGa7UgDeAZF+V0kYr0eskUkfib/Ow
         vS/RQOi5+LClQXxend2xf7aLWzYXzWY66ZYfndDlBc2yAPqUcVkbaw3+5haHht93RySm
         UmuCqiSsGI88EceZSDcOFcYJCEWLWVlAcgOATohJ1S/ctrRimJ+3RY14UNrWkTvzpnT4
         rjFQ==
X-Gm-Message-State: APjAAAW5HexibW+zoeMaqNxLFOIql5b6tBASBpF5BmfMfTti1Q1EnGoH
        5uM/UPYQemG42WoyzhqeuBxfN/lMt1xLGifEetbbUA==
X-Google-Smtp-Source: APXvYqyX8aIOrqvIiIi+XamilqaJJoRB2E+h33a7b9KRiEugg+bPenbcNtzmyITE1BuZOzB+C0AVayz8pq77sBi8xb4=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr13452923lfu.141.1561453605766;
 Tue, 25 Jun 2019 02:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <1560790160-3372-1-git-send-email-info@metux.net> <1560790160-3372-4-git-send-email-info@metux.net>
In-Reply-To: <1560790160-3372-4-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:06:33 +0200
Message-ID: <CACRpkdZG4qBUxcxEmov9pHMKhVu=C=gUssaviciuV_OsACB8Zg@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: gpio: ep93xx: devm_platform_ioremap_resource()
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
