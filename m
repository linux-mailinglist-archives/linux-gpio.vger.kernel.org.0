Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E6E48F9F8
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiAPAWe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiAPAWe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:22:34 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEA1C061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:22:33 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id a12-20020a0568301dcc00b005919e149b4cso14952718otj.8
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mDz53WoKLYCM+cEGYwOUzJ6gMzNx+RSdT0XEfI9l8bY=;
        b=i2FDB81ZuePT0kBwWa0TuKZ5jmzOON/UNwQaSPwchFV2RfqPy+BvFFQKzZ3Vg7Y8m9
         iUtki4z1TJbECXA13RzIgzj1k0XL69QnLGk456uTpQo16MalJlGAh5o5yEht+4nPkMB5
         1Szyhfz51KeCGdYNrRw6/qDAG4OcenkapOGsX8wn/tGsZTprEX4gjq0QscvpHRYTshB5
         MHSKGrXMH357WNi8EGW5pZzUnUQv1mfbjBwjCcnkEVrYd7IP3Bed7GBGQZ7KZGZtPUoX
         2vU5rql2Rtg0xfAi7/2Lzes+iSjIVOlAhLsYAmVJ4jA2Tga0718Pnxn9ovqI8bJDhfyp
         cSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mDz53WoKLYCM+cEGYwOUzJ6gMzNx+RSdT0XEfI9l8bY=;
        b=h0F4eBogL9oON/DTqBghmuiTN/6T2o/DL8640eh8LGad1uOsuhnA1U0YpRZ7bE6c0W
         EtJaWUqdxB2ExZ8+SrJDxWTHJVDw5zIFx+ZHy5ZYhcmQEdXUxtEMY37jERnNvB0yvUSL
         JvIBdiuU1WE4OeD7aiXq+eyxHLsSJ0I8R4BhCNQUA0YtWq3BrbbvEPu0jm8afWUFY6GE
         +5d24yPDPRLq89Pgod/OmKw0gAzw2qaG3JjwksXiZvmG38CrJ5w2Q+42ePCPv5C4wGbG
         0R6y7fRxCS1e3CD+XOwxSwrOrwEaCOS0pJg+IuBLqDrnrXVVTOHAfKDOvihcjPvB6zxQ
         0tOA==
X-Gm-Message-State: AOAM533hnpbcehSyaIeJ5gQ5yfWQ+bIfsPR0pKb1BpAL9bMkzBVNvZD+
        KaxDIEBxsmrKvBt4RBcffF0HlojnQgwWncgvBJzcqw==
X-Google-Smtp-Source: ABdhPJxSu5IhVjSwegCJrfP1eAHk6CxUX5iX80tu5ORB38oA4VXO6y/0xU0eWkH6KTtMfFqUJs5VqP7HCoxqDK37yWQ=
X-Received: by 2002:a05:6830:4:: with SMTP id c4mr218721otp.237.1642292548103;
 Sat, 15 Jan 2022 16:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20220105124003.11319-1-zajec5@gmail.com>
In-Reply-To: <20220105124003.11319-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:22:16 +0100
Message-ID: <CACRpkdbiyi9c6XLVyOZOgr6fhibAE-D4QdcumYP4YgXr33EnSA@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 5, 2022 at 1:40 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> w=
rote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> It's hardware block that is part of every SoC from BCM4908 family.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> This patch targets linux-pinctrl.git for-next. It requires commit
> 896568e5b9c8 ("dt-bindings: pinctrl: convert controller description to th=
e json-schema")

That part works but instead we have a clash in MAINTAINERS.
No big deal but if you could rebase it on v5.17-rc1 when that
is out and resend I will apply it immediately so we are sure to
get these patches in early.

Yours,
Linus Walleij
