Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A61661AE0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 09:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfGHHFD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 03:05:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45220 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbfGHHFD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 03:05:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so14716149lje.12
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2019 00:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6oDs/R2687/0m7enmYw96V3f6cwSyu/SOwSXESh+rOo=;
        b=GB4xqh9L/HaUV5F66gDo9xBaWCSzE8KYoNyzROYxYBWSYTPYa1vkONawouQ9WcBb4m
         oKv+YUGogMOMx2H1LASw1F4ZIEQYVlgClCGPN6ENIJsk93AZOPRI3EGFaPPy8CNWJ9LW
         iTMnWmPGCpn3ZirpK+iuDaufcQIIiE2Cjxt9rCTdVvnw6kJALuc2lNYVIub7CpCnu1sE
         6QDT/UAi6Y9kFymRXoM0qvIjMx03KkbVndf93VMjgMcNbcg2fuObmdZsvHvSqFe0PFuL
         SDO6SvsEYCd2YLG3HrxfXT/mqVVUTUaGcivZQeYSvo7pUw7w2U5hF/cdKGWX/+M9LuNA
         lT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6oDs/R2687/0m7enmYw96V3f6cwSyu/SOwSXESh+rOo=;
        b=rBIa7QdJ0ZBqOitjUImPdWPtALS9ywE9a8Js1IF9XkKvkRGE93Yo3OLc+PRdKuoiJb
         I4+Gd7d1u5Yl89XORbTek6K1I53/kXQilAr/fe861+VnG9XhI7RY7xLrYp9Xxc9YACa8
         WTfSzneRk59FvT+EN2rmEIMGHa7XQGfAJxfgx1Dvq4mEEfqc32nweZ8sgGKFxZnpQSsR
         MAm/l4fEFXrZX7dhJUJC4PQUEVKtiehWOPci6JJe9w9EHjkTY8Lt/Nst/0C1k4kn7ZLJ
         f+ovMQcLefOoZG4SyeiVHdUz5hlpg51gyuRBT8zvtU69ziCJ1f421zpvDqaOsPK5XRuu
         1GHA==
X-Gm-Message-State: APjAAAUY55QuhnP127UavDJ8RZvKmBkPd6LdrKbODdV4Rz2gbiySDCN6
        vwmovd0PPkjhZeud+e8g6f9/mWZalBe9pEcu7O2Iug==
X-Google-Smtp-Source: APXvYqxTN6GN2XqcfqXpDohhEROVzao7dZxkipjljHsOdogU+UAMikcAZsfe7DAG4OkITSbIAHoDnnP/haQ0jkcsewI=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr9464901ljm.180.1562569501270;
 Mon, 08 Jul 2019 00:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190626134258.26991-1-jonathanh@nvidia.com>
In-Reply-To: <20190626134258.26991-1-jonathanh@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 Jul 2019 09:04:50 +0200
Message-ID: <CACRpkdaFOs24DJbXg4eKVOAzdGOx__X9rbHPcPUzpTJpZ-jbVw@mail.gmail.com>
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

On Wed, Jun 26, 2019 at 3:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:

> The function tegra_gpio_debuginit() just calls debugfs_create_file()
> and given that there is already a stub function implemented for
> debugfs_create_file() when CONFIG_DEBUG_FS is not enabled, there is
> no need for the function tegra_gpio_debuginit() and so remove it.
>
> Finally, use a space and not a tab between the #ifdef and
> CONFIG_DEBUG_FS.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sadly I've had to revert this commit because of build errors, but
let's see if we can figure it out after the merge window.

Yours,
Linus Walleij
