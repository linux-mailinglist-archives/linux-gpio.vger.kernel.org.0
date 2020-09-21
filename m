Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A76C27351E
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 23:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIUVp2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 17:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVp2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 17:45:28 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0C6C061755
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:45:28 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id k25so12401252ljk.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R3X+ectYsUEDbV0kr5KMVklz24d+TCqCqB5D2xYWDlo=;
        b=ESWNa009iaZh/Bm2PF0qGYKlcEaiim/+IwjxITJ2PlUwpZ2uBw8e7JrKtOdnwlwPaJ
         JMgunfTPgEKWlCzsVX8ujSjOUqIGk/ip9PzidcKJUO+YPzr/xNzryo8Gb7ccjvdImKLG
         WGNDlc98HdAD0lm24zdhZIBW0VtC3At0ss+lEfOOhVGh/wmHu5iNhr6E0XR2A8pONOzt
         L/cZ40BjQSZ+U5pqXn+2fJ4eT1hrJhfvnBi2Ylizs/wSYdbX//xWrmwKNQWbtAl7nNIf
         t29G5ENx8aJNuHc4OU31mpD0WA+yjPO7NRPNKkOje5a91zEoMU8hFO/34gfAWo3tNDm2
         g6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3X+ectYsUEDbV0kr5KMVklz24d+TCqCqB5D2xYWDlo=;
        b=QeMtaO4iHcKJk1zq8zH9Qxo+jk1GvqOOI0is7OZ3GSXEHT6wIp9eykrP6UwdksF6UR
         hyYQ88ZEOMcbUBzi2dTCU/YjFZGuSi4LnYmUTu95sfw+Tkh8hdgluh2HF5jlPZhDuus5
         mvFIZ9YSQofxgV4n4JfhwW0VWAt+X9HJiualYS2wyigDBcfTMna7z4ap4ptRrTK1p+2C
         XnxPijnGim9PaTDa+paJN27bCDJVheVyBvfK/B5BYYnvNNM0JcpzoK3IA9uX+ufDT9IZ
         TKvGOGaANt9B1FnA2P6OjCU9uoDzH5MbAYODesKN3Dno/71sNlTfQDpG4X60diQ7aN39
         KLGQ==
X-Gm-Message-State: AOAM5313ZKfls3doTfmqddb5FndZxWoSG4cemHoHHUB2hRqxXsIUUOzf
        J1nls6PkfwexY04l0pcfP20mfnsR8gT8/FyxJCYyIw==
X-Google-Smtp-Source: ABdhPJy3d/Z6n9IcWX1WQsn6w0+VreRyhXE1vyzEJ24tiCs+/Rj06OxuVNMHUuBphJ9gQqa1/fptyHePjnj/O5U/cks=
X-Received: by 2002:a05:651c:107b:: with SMTP id y27mr455128ljm.338.1600724726686;
 Mon, 21 Sep 2020 14:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200918145047.GA71533@black.fi.intel.com>
In-Reply-To: <20200918145047.GA71533@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Sep 2020 23:45:15 +0200
Message-ID: <CACRpkdZE=LmjmW4c=efUGYAw2sESsAE8TR-GBbo_BRPUBddowg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.10-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 18, 2020 at 4:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Regular bunch of cleanups and fixes of Intel pin control drivers for v5.10.

Thanks a ton, pulled into my "devel" branch for v5.10!

Yours,
Linus Walleij
