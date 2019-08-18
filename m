Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D300919E8
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 00:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfHRWUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Aug 2019 18:20:18 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41717 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfHRWUP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Aug 2019 18:20:15 -0400
Received: by mail-lf1-f68.google.com with SMTP id 62so7539790lfa.8
        for <linux-gpio@vger.kernel.org>; Sun, 18 Aug 2019 15:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDJV2qKgc2rE1ZecO56MT3ujkmelBSa9vGB/ZXufqTw=;
        b=WQo7LW0wZCePzyiGp719cN5hGt2IqiOZor8+bvWmUAuHbV9PGpTkPF2bK8mSoOXKsk
         cXos23XIkSNlw0j+eYIVrAy4wm2b3mzq63weuFYrOh9fayfx7WXFe8iSR6qpRdjO706B
         rZ+5VK/R0mvml612IDYouJwZmejn8+fTgFXdMcvHDx9HRgqz5GEK4f9LALcvvM6rUbci
         M4mKmHbo8CAYGNbRwBoRtp9vQBSecxXLMFdsHbhuwir5Dk/WpwGKyZBA0s/Rdsr5+nHk
         jlS3RDdEtsGYcj1oAF3qTYjb6o7I26Q1FPM0SBih/XnZdml1vUXnn5vOE0lsOwhb0Ff8
         6Chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDJV2qKgc2rE1ZecO56MT3ujkmelBSa9vGB/ZXufqTw=;
        b=hzxrK6oH/kZbWzUWnoNYaTJ4XmjseLGBzq4Xf/XO21ZqxJd1gDOAW+I6z9hsltZpwI
         OjrknquBR1p15uXyIPiITRXwmgVUsICV8o81Mr/tV06zYS9HYNCt0aUcKlNPWANNf5SZ
         1sbph/BUsQy/keftmsvA2BBvsZ6h+MxScEfXsOntu/bP/pgJuaDnxUVzW3RSoe8K2gpW
         X/GMx8Zazhg5gphOj3YQc3vS9a0336aKY0dus1k58UJPpX+Ys8xpOcDzO8980MDxwXcn
         l1f6v72BinxzAikXdCtvX3tNsZv6xfPjQN3GLiv9FnZMAaKcAvzVX4OINgLOKk8C8UkM
         44/Q==
X-Gm-Message-State: APjAAAVVMHrHnOsVGFSZmSpvYc/jqLp1+xPvXJuSDkMwzRBDSghn7yTU
        MdpP2cJlCOcOW7m7RDHltbs0agS3Fp73UBjlAjyakw==
X-Google-Smtp-Source: APXvYqy5zNUWEXYZ2BNwjMv+MHdjmq2+twXb9Dmljui/KTewQHGrsVYvarl4oFwHNOai9V/3ApArVT6G7+uz+EzX27Y=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr10723641lfi.115.1566166813184;
 Sun, 18 Aug 2019 15:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com> <1565984527-5272-2-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1565984527-5272-2-git-send-email-skomatineni@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Aug 2019 00:20:01 +0200
Message-ID: <CACRpkdbTYON9nhrP1ritBNcm49u7-c190wL5zeufvUoGQt1jOw@mail.gmail.com>
Subject: Re: [PATCH v9 01/22] pinctrl: tegra: Fix write barrier placement in pmx_writel
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        viresh kumar <viresh.kumar@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 16, 2019 at 9:42 PM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:
>
> pmx_writel uses writel which inserts write barrier before the
> register write.
>
> This patch has fix to replace writel with writel_relaxed followed
> by a readback and memory barrier to ensure write operation is
> completed for successful pinctrl change.
>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Took out the previous patches and applied this instead.

Yours,
Linus Walleij
