Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622F319556A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 11:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgC0KjN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 06:39:13 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37798 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgC0KjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:39:13 -0400
Received: by mail-lj1-f193.google.com with SMTP id r24so9677475ljd.4
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QAY6LStwKvfEXpyxvgU9tGLf/woIOZU4Um2DhnXbHnw=;
        b=ZyO3oo8SapI/Dod/peYZDLOME6rk2SaGjIwtel3AGAPSgCUvf1YY+q3QUveERgDfvt
         VHPnAZnJnYgSjWb1Foth6XYB1hmDnaqa/JGem/OD+Wy0N7vtKp+1SAN0lfNrmRdwRe5R
         7sYOsoaqwG77S6eXUm96/ADlvx3mSW38/nmVu5kvglAnScMNUDae8dAGbq/99xQGZUIi
         mNl8P9XHvL47gw4IXAy9jxDF963rhJTlvvbHPUtjEFYqXNndqtPYopQ3R3s+8i9H0fJg
         D7Jjw/dzkZt1iQ7IWFs0R9MMZHod0eXhH8Isye4huCLj9Ewj3Rb3CLf8wJqdZCrkcH8d
         baQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QAY6LStwKvfEXpyxvgU9tGLf/woIOZU4Um2DhnXbHnw=;
        b=jzNLqn+BWGojTwnI4FR6faoY7WvMBasRH8Xx0Av2Gxj8InpzSlhSTwF7zPY8lSKbdF
         UMBGauBElVQB2sUNIy7dgDitkIG7dzCB34IPdtJg9RsIOcrV+NZ94fAbnIOghD62zld3
         aQJo/D1WfwLpVpqLfu5Iz2M5mbn3A2DH6u8FI5f8VGQCaoFf7i9pr0Vuico9Vt77Q75A
         UOUnNQRxezoyivHOEAzJx5JfX8gX9fTcW8jhYus8EUCQUxeAVjRyTgqvZkEd52mkXi6F
         h9euxpMNdK/2Vl1kZ6/Yn0mS49rBhuvc5uzg5epSvTnJpSDUgb5p7mbNJs9hj+hjgbat
         Xu9A==
X-Gm-Message-State: AGi0Puajr5WRhiV9Wyrz/Pqi3GgZrfX8H4IAPAY/RwhH1iXwEXbmo0QN
        bLKWNMg2Kjprt3hLwIa/VCPQ668wD/9Cor4THM7SNA==
X-Google-Smtp-Source: APiQypJkw8XtdiZYWO7/zVheX7U7S+gVMtkBq8WcI32RNxjrxmVuLME6cbbOzwhBYTRSdwQs0o+zZpT768VdZqPoYRk=
X-Received: by 2002:a2e:9084:: with SMTP id l4mr3150861ljg.277.1585305551437;
 Fri, 27 Mar 2020 03:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-4-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-4-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:39:00 +0100
Message-ID: <CACRpkdZ1vN1Rv-jfGZNGU3saxGXDhKj=2ptm-zpk3mb=rXmuMA@mail.gmail.com>
Subject: Re: [PATCH 3/9] gpio: tegra186: Add Tegra194 pin ranges for GG.0 and GG.1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The GG.0 and GG.1 GPIOs serve as CLKREQ and RST pins, respectively, for
> PCIe controller 5 on Tegra194. When this controller is configured in
> endpoint mode, these pins need to be used as GPIOs by the PCIe endpoint
> driver. Typically the mode programming of these pins (GPIO vs. SFIO) is
> performed by early boot firmware to ensure that the configuration is
> consistent.
>
> However, the GG.0 and GG.1 pins are part of a special power partition
> that is not enabled during early boot, and hence the early boot firmware
> cannot program these pins to be GPIOs (they are SFIO by default). Adding
> them as pin ranges for the pin controller allows the pin controller to
> be involved when these pins are requested as GPIOs and allows the proper
> programming to take place.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij
