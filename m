Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67BBC586FC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 18:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0Q0I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 12:26:08 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44025 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfF0Q0I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 12:26:08 -0400
Received: by mail-lf1-f65.google.com with SMTP id j29so1963302lfk.10
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2019 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9RRMDm00p9AJVdFcHrfeUH7UMA7Myos4ORq1dN0RjbM=;
        b=gaKEOSGiWwLZ3KPNv4G3TGQzDHLXQtNfe54AlgbSKN1ik0ggWcCbxmtl37nBHB6EeS
         c9rqKO1wDxaWBHYCScqLI/6D6i2loQXfo9w06QCxLXIb9V9P4nNp4dUcMDeYLpBlyf8T
         znR7X3qvG4hAK/3sNmZILIXc3J6kAv7xXuYYC+jKoxx2qWwnEydZEyLgUPr2C7Ae5XFX
         UlYzjXlGuSA4zh2/4C8TcfnhtzE6RenQx+mSxLV194hTU7L04etMrs3pxG4DG3QLgXQc
         vVmscEsFCEYoMp3jIjrMLx6QFIXxiTc8VBNbZUToq3RHUuG/UqQ/VfpJ5iq/jTMZc9E0
         jlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9RRMDm00p9AJVdFcHrfeUH7UMA7Myos4ORq1dN0RjbM=;
        b=sFm9+UctE5iMhrZq4YNynQLBDaeiwKPcsf+0SvCGPXbX9jZ4drKf+dHfNDY2FGHcXd
         SDYO8wea8WF7UkEeshpFgxODI8AjMxmjj64nrjfSrH4N8cKGyrMGPvdzQLR4CmSg2yNf
         YzoXC37CScyOotlXhmNEH4cht03IXf5uC8v7XZr+2/z2O/5Y4TfEhvGwzYOsYDN0O0lG
         YPMaxE7No48lV7tc8GQQXyJrTWDsDUZYT2F8jKVUf9kRGjYfUgXuAsE+jvrq+lgiJuwF
         dGpniRyfGwK3+APzs3sSHGh5llWZxIZV07zG87c+wdlAeWFH8Mi2v9lXYJMZcf9J5lA2
         1yNg==
X-Gm-Message-State: APjAAAW1QGwMi5kWCb0g3g7RHZCu2Xglozdk0lKfrvJWVSDyORg1tFRX
        hYdnF8Ftq2O+4r3mbDUHl1kmNGuFxBy3ZDboT2QIEg==
X-Google-Smtp-Source: APXvYqyTl3tFgPOvf0mzEQrfvC/KAMaf6z9PDn6A4m2Us0uL3kh2uRdxdZjJI8AUObAJ6tPtR9okP4jozgaGcXhkCRg=
X-Received: by 2002:a19:7616:: with SMTP id c22mr2561517lff.115.1561652766589;
 Thu, 27 Jun 2019 09:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190626134258.26991-1-jonathanh@nvidia.com>
In-Reply-To: <20190626134258.26991-1-jonathanh@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 17:25:54 +0100
Message-ID: <CACRpkdZrdzs8TfESG4GJ-Tn0oZ4FoE90zrR3oO3KgdQBDLeASA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Clean-up debugfs initialisation
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 26, 2019 at 2:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:

> The function tegra_gpio_debuginit() just calls debugfs_create_file()
> and given that there is already a stub function implemented for
> debugfs_create_file() when CONFIG_DEBUG_FS is not enabled, there is
> no need for the function tegra_gpio_debuginit() and so remove it.
>
> Finally, use a space and not a tab between the #ifdef and
> CONFIG_DEBUG_FS.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Patch applied with Bartosz review tag.

Yours,
Linus Walleij
