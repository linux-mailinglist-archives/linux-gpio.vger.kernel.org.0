Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8CF298F30
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781388AbgJZOZJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:25:09 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:45614 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1780854AbgJZOZJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:25:09 -0400
Received: by mail-ej1-f67.google.com with SMTP id dt13so13810951ejb.12
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7w4jeMHfk0aErIBVFgSyeg+Yeg4wndmrt5fmHB78LX8=;
        b=NwqD/7PqebhliLvuyEgGxkAy1tSrTzX0VmwnbfwudD8QWIhJPvaV5UvNqEgIwS4POv
         53YRNEKMOL5294GspCb5WkT+bzMUmVsm1I8uPNr8j64Iv/83Rjxjc2co2UCtgiy9kGDb
         jr1UeJlzyQtmciPQwT4yENmwJtgHBuVEStLU2ReXxdP4bz2zoNiQNd//7ixe8m0XX0yV
         ghWf8qpJuesgwQkYmyOpMdbaJNXWLPN7WQqUKITGMd1e9uUJkRJ/egLAovvA2+OxguKv
         Vq8SjS9SPeT64gD6Dp6Za1G7WHirFKrJRU9xFyyQprQjNQlRDVKcchqVtE890eb51ZUh
         iynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7w4jeMHfk0aErIBVFgSyeg+Yeg4wndmrt5fmHB78LX8=;
        b=PlTF13a5xFSmsZoeFTpyDtqnNFGKXJejcyD41F627UPI8PpSTUq/JH8kEkdhkR8FJj
         RN2XfvmUveHEG5DMAG6F2/Cei8gw5NlZYzaMK2REv5Zgcfhz8ivFEe7LcwkoBKpncdZx
         mvM0rXiZLvnFqjaBTt9NrVLnc8eRADXiGwnqGkx/qUqr5rNwGLagOnm3xGqWF+qsKrXV
         AEA76L0tbXkiL/WQnuvO+/jTiGo8BV5AzwSDD1O0fQ1ZrIfa4rN3TijSOHA+P7/0Pbjq
         JqJUvjeMYZWp0QV1znmbsXKfmg2LqMG4tX5+OB2H07AezcecAeH0KbLLppzOvxsXANnn
         CzjQ==
X-Gm-Message-State: AOAM5319b1u0oucZBA84ODwSQViPR95dizatNrsG9GOoah+RIZYOrTKb
        raLhDbsX9kwCIgErxLEI+8NgDytOdGo87HAWiLfxsB8G+lk=
X-Google-Smtp-Source: ABdhPJzR5F3tZnH3GYfMI0ohmE8A8E6l67sd1C9welxD5ucf5ZdyY6KmEKup2W0ARcfssdIVLijzZRfiOQiJyJtG5zw=
X-Received: by 2002:a17:906:7d0:: with SMTP id m16mr15612447ejc.445.1603722306268;
 Mon, 26 Oct 2020 07:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201021142528.10285-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201021142528.10285-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:24:55 +0100
Message-ID: <CAMpxmJV3hGEq7BDD2fuUHkdxGTOA9gwkmZSv_YiT28YNXgR6BQ@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Extract gpiod_not_found() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 4:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Several places in the code are using same idiom, i.e.
>         IS_ERR(desc) && PTR_ERR(desc) == -ENOENT
> which meaning is GPIO description is not found.
>
> For better readability extract gpiod_not_found() helper and use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bartosz
