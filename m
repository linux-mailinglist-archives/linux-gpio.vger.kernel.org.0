Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622FC18D87A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 20:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgCTTiB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 15:38:01 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42705 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgCTTiB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 15:38:01 -0400
Received: by mail-lj1-f196.google.com with SMTP id q19so7689825ljp.9
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2020 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ojBDNVVg2fruS6vU66MRKq2HphKitUxDIf4Wi5OElFk=;
        b=H29ke979CtIKPWckEzUsuYpeXcJn0yGKplWCTRwGM38fgiEfzXjeBDHupe4dl10PrI
         CN0AFHW/1Z5WOi+UnkdWwHAYQzubLXn73uFsjOo36z6T4W1EMTPZf/hi9xOaVdG8H82J
         qX8uoyevm/RinEbzHtxs0LF1rPpi44bxfB3bi2dC5uzMnYkDKnyZ4zYV9f3lJWNA3SJV
         N97KMy84ehMTl3BFk9mt9XnN6L4sIiOAHJ42Ym0gTFtLtDcxWsbRK9F72+TnHlCnh543
         CKbJ8KOBio9nCiPiewrxFtweoctesYfXHk4KxA0CHTWZVYUKfcOE7zhnA0WSTgE56alC
         KkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ojBDNVVg2fruS6vU66MRKq2HphKitUxDIf4Wi5OElFk=;
        b=f+G7djEuldbm+gWkyPt9EDhE6OszaIlDHu1z7/70MBXjmbr5fwbV+hQ441EtOqb25Z
         yHsBJkw33XJFzV6YAYdgwnyxpo88lvgz+u0UZFlVQxJWHBBKPmhZrpi8lWcs8L2pnsBB
         3R2Lf5HepLQOdsJ8QRc/u3FrP87Fyvu/ygbTJitGNL3ryq8HDrEpVYxHlHEyA4xEzc/p
         ubEeq5TmRuet92oqhVOB/LppCpJeJnNjmL7Ixcsv6nkRf03dPu+WxGKq55V1ENsaIowp
         Vz9RXC/1JpGRRL4Pd274XDylqC/sd8CdbcfmYdQPsoyL7MLDGAvt660mjU4uSinYZ5t1
         B9Qw==
X-Gm-Message-State: ANhLgQ0sekuMJ3BSd8BeCOqqIheNdULkwp6QR8W8RvJICvzcVl3AEFm0
        9j9ia57x+JMsmJFCgiXzZyG1OmOHCmgQS10XuRYU0w==
X-Google-Smtp-Source: ADFU+vuS/9xB6+q0ZbkIaydrAFCWP+otW9O2k853/zfcdsFkYFBJ+y+LfbWH+y3RZhI4HpxkzNuRYB/RfAI/RH68lyk=
X-Received: by 2002:a2e:9a90:: with SMTP id p16mr6558605lji.277.1584733079409;
 Fri, 20 Mar 2020 12:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Mar 2020 20:37:48 +0100
Message-ID: <CACRpkdY7LnyHdX4xKrr1V8Cquched0PMNL1sFTrWT6J3fdRx=w@mail.gmail.com>
Subject: Re: [PATCH 0/9] pinctrl: tegra: Support SFIO/GPIO programming
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

> This series of patches establishes the mapping of these two pins to
> their GPIO equivalents and implements the code necessary to switch
> between SFIO and GPIO modes when the kernel requests or releases the
> GPIOs, respectively.

Is it possible to apply the gpio and pinctrl patches to
each tree separately?

Yours,
Linus Walleij
