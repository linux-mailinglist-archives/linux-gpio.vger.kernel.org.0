Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4260A19556D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 11:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgC0Kjt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 06:39:49 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39476 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgC0Kjt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 06:39:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id h6so1658686lfp.6
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 03:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E4UzmHJWGO1pRQqrexZbf1+UgH31TgfKD2t+zBaDOXY=;
        b=dOmISskcGyXMF9Mk60i1AbuXRxbXVNM1rDPLL746D5+hKMbAkTIvB54tBnuUcjzrzd
         e5lNuIg4Kn0BWMuHjCMIHCcbadsSj694H4VZBMUjt3qhKCVkxaTw+xbkHE991VnPhkMT
         6pV4eM71aFNPnUNsf2Gedxi/eiyNy6i8tuYStAKvGHIJxsSCZJ/r1/wKJPxIZmwvPkIk
         yDSECf7iZbw+9nMftpT5YQ3eBFcRX/h4GTEvMxYCD2cKmok8Vv6Uebt4JA6PL4A7eX5q
         TuE0SyZdn0LnH65LmNCPM5oUJ73mkChy7JLCttuWZNxO7VLfjo5dzNU+p3OlztyeVMFU
         /01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4UzmHJWGO1pRQqrexZbf1+UgH31TgfKD2t+zBaDOXY=;
        b=tbnbPLOnwu6yuHfllUMAFKn9ZMdcx18/meG0obH7Ngg3mfDtFKrsZN+FZ1xrRFO2eS
         4iU8F0lnDQgQTXyYC80XPHRID/uQGBrnB2aP1HQURzOmOCqW2Bv6OZp/IwQ0mHAx3FCQ
         Tmmeq4X1tNcLanEUySiGdP68fvpT9dwL8UsWBRqKoR8sf7ovA5cf2YJ7SVbGgewwGbtC
         9AXEz9oIH/Wsk2HF9o7s3mLAqf1CqaGqAhrx6stvQvET2rd6wNFPR567TQ7ghs17yT1Q
         FB0CroYnO8OYBILyMI7lvD76i+WUnb0jMabhUqr7GQRNsfguGh7FpHmIx8fN5n0cKNQ7
         Zd7w==
X-Gm-Message-State: ANhLgQ0gvoT2e3/VC7KTG0LlzunMNvusH/sExskRqoGqoeJUR637blWo
        OwF50mp2DYAO6rhx5pKtZpin6JGzhUBILOq2GqiqUg==
X-Google-Smtp-Source: ADFU+vvNZbbHzewwkxtzRG2oJ4JkS8Jd2ZJo5ANimPJnnuTFNrkDPPAirxg2R8rIFryUyaApzr5xDSCOsQVDoCJtkI4=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr8264186lfc.4.1585305586184;
 Fri, 27 Mar 2020 03:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-3-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-3-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:39:35 +0100
Message-ID: <CACRpkdZ-7Fm8uPYoE6fL7WXQYbdV-nW_Ttt1ggXSApxMi55ODQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] gpio: tegra186: Add support for pin ranges
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
> Add support for Tegra SoC generations to specify a list of pin ranges
> that map GPIOs to ranges of pins in the pin controller.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij
