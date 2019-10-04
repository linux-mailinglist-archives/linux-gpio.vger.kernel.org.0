Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACC2CC494
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 23:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbfJDVJq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 17:09:46 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40696 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbfJDVJq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 17:09:46 -0400
Received: by mail-lj1-f196.google.com with SMTP id 7so7849123ljw.7
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nsF2c8OGTXKvB1zK+uZXhEjz1J0a3m4rT+VSSrY1BhY=;
        b=aCbl12x30H0M1NbpcbVYJ/2/eoaY73t6fRBNVfU7bOOOLlr4BH040+mtS+nuDKsAfC
         1Ag8zyY7B5JSR8VhHXV6L21EwY4QTvIwa6fDAOZIJ4FHNSi5rqlgB4EZZ4zD4x6TkIr+
         X65ZARuNLu/KFOUMm0C16M4Z5YyQpKuQqNHRNCv9C1sEkEBhg7y6Djg+VOMwmknnv6Kf
         upXE2q/+qp2bgdmPbqkgFHcVfj35Y605o9IEkR6s/tHjfBVbv2YiF15BIb0NMejloO4t
         hJD8YDIkI9wKHqPV9XRs4sdGdo14hCUFvOlIqwEWmJZv2TH7pWmdEj5GkR4vNTfFgIT4
         9PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nsF2c8OGTXKvB1zK+uZXhEjz1J0a3m4rT+VSSrY1BhY=;
        b=Nu8yYcEdS4QIUDdSizZXdzgDc5BaRYfig7NEkRzeiHW3foGra1U65cxhWAoZdo/JtS
         CidVxvg1WDP6WucepSg1b5q3muvWCbP9D9UiZH8cEeAnciWeX6nZq6GDqhs35b9XtPhF
         TFmPg8sslDVo/1N1H7L1h38A3wl8hyVL9Z+6JsCLLZIhBWFr1B59fHM7EuagvrUDgndT
         wpdjYlkstnyynMGLA+6t+G2Ssj4GZny72JmZgI7w5LqIT9zfuBv1iJjyxWp3d/rM8WDA
         5SfyBRtoOLxvxgi5UlarH+4H0M0hJKOwTfuCpm9mT3fu471GU1isKLDumTGRVJN06LQl
         cFVw==
X-Gm-Message-State: APjAAAXiaJTEpZoA3DH1NljMRJ1XxBQeqcUDIkGumRqwUBsUxf2xBunm
        V4jF2sskfHSVdx6+4aPg99HJQrG/2W6UJThmIybDTg==
X-Google-Smtp-Source: APXvYqwPSI99zYdzPXsF5LC5g1u0DHiTIc+QFVPoPtWG8vJBF5vIibncqONIV7SaF30kuuK/kJPPe6LMA+kLJKX/Dn4=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr10618294ljk.152.1570223384451;
 Fri, 04 Oct 2019 14:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190920122030.14340-1-colin.king@canonical.com>
In-Reply-To: <20190920122030.14340-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:09:33 +0200
Message-ID: <CACRpkdbQBaZgYBGAAfi7mg+4RMfWovi9io28q4u7KAW44bJ6WQ@mail.gmail.com>
Subject: Re: [PATCH] pinctl: ti: iodelay: fix error checking on
 pinctrl_count_index_with_args call
To:     Colin King <colin.king@canonical.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        YueHaibing <yuehaibing@huawei.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 20, 2019 at 2:20 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The call to pinctrl_count_index_with_args checks for a -EINVAL return
> however this function calls pinctrl_get_list_and_count and this can
> return -ENOENT. Rather than check for a specific error, fix this by
> checking for any error return to catch the -ENOENT case.
>
> Addresses-Coverity: ("Improper use of negative")
> Fixes: 003910ebc83b ("pinctrl: Introduce TI IOdelay configuration driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Tony's ACK.

Yours,
Linus Walleij
