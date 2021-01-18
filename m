Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834A22FA6C1
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 17:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405812AbhARQwa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 11:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393189AbhARPNH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 10:13:07 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE716C061574
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 07:12:26 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id r12so12800365ejb.9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 07:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZmXMj6tFKE8O/qXvV9RqSTfoZj1tErBM1YvyS8NSRYQ=;
        b=rSKd/+kQhKHKvCzCBh+bDSZaqvcd3n6A8x36pafF19Bqvr1Ssokw2zVnNNuecpVUnZ
         hIvJ2PY5lmtAH07hYNk4KiFRcLQxQZ/4fEpWyYchZZSIR0gqBKzGjVYMffT8M0ayXNwJ
         vHij/uYX3va2Fwoy57ZU3+U7+W5LCSD8Woc4ruFMoHn3e3RP+lRmDD0vYm9b+0ON+GEH
         Kd6/JJg8TPd80zLk/6dsYzMAPB78tKHQ7SrVKnZJZqgPpfiIUeGLdkI7fU6OtrmSYOGM
         zQwNxtucHHdZuTPfwEyU57JQUBuESnEiRT3+3tjFGqDzsZmaKnHt7qDDy2Vr4Uaf0C7g
         3TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZmXMj6tFKE8O/qXvV9RqSTfoZj1tErBM1YvyS8NSRYQ=;
        b=dWSwT6Bqw2lcozfxyGn5JUX/qewGr95LAlKRSOF7wtx7UPZElzy+i0uzaUUL2ppBub
         3IC5U35CXUC+zGwb4nIXkA4JEBIm4ZaaVXwbp7OoVE+dcbwrIUB7R8kjze6DjElwfbK0
         EuREDfNXPbnfm2z/xBUwYvdI40PCy1+pmmd9CJJj5ieA5FdHVhIKVK5sHnpBpp961hjH
         IsSDzjkP1VrxEC94UsFhVQBswvtWafRIfpW+vfTJ4lcqYnllayzFZp5GS261dEkZFzHa
         9pyvQrlwCNXE+euL1Wh7YTeldG2WeT0YwJX79Kmr90v2nFyZUvjS6ZJlNHPWDXKjrIp8
         mDrg==
X-Gm-Message-State: AOAM531qVOlzQfz09G2OrW5aXyenVqbEL5y2AIuvx5MLKhq8g8lMNaVk
        1fWAR2fjQyoczAHrNVapIQ3McbNDJ45VJ/tj0ji+yXM4ByQ=
X-Google-Smtp-Source: ABdhPJweZGFoaO6uQEfZVRheP1p7oFTT5JiICmWMpMlLwDagcrJsBxmLSovHoJthz83/Az6ydq9fXiF6RTWwlWplxxg=
X-Received: by 2002:a17:907:2705:: with SMTP id w5mr83892ejk.505.1610982745601;
 Mon, 18 Jan 2021 07:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20210115095313.2334693-1-geert+renesas@glider.be>
In-Reply-To: <20210115095313.2334693-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 16:12:14 +0100
Message-ID: <CACRpkdYyP=2Rkoxz4ce0R3O_zG9kgqJVZk2mjGaFGRL-amGzpw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.12
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 10:53 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
>
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.12-tag1
>
> for you to fetch changes up to a5cda861ed57710837bc560a3c715160da710555:

Pulled into my "devel" branch for v5.12!

Yours,
Linus Walleij
