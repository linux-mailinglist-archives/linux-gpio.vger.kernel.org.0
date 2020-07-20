Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C73226142
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 15:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgGTNqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 09:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgGTNqr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 09:46:47 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDCCC0619D2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 06:46:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b25so20289458ljp.6
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8qtN5L8/xZpkQuUDdQgpDbwS59vLxj0mGpt2DoBoy94=;
        b=eXsM1TqXMP0+Ycllxnt287iVoc4UP/VmkbTLyen6E3H8sTZIqd9z05gN/mMJfdmKmk
         BoJo8MyzlEYp7ARXgkpltQj640PDZyIDVmJw8pr5I0qCjR5l4sA3Zs+PRacBBLXeWwSI
         P/+0oQIeqpm3sV+uW1mN67zbkry7xF0VlZgjis++Euub9b1vv95MLRcvI5OCWJ4QlQCb
         SuRNmhUdtMlzKM0Nmoz9Hv5kpvsp2YDTORZGw+lWD9umaFAaMgicUR+ONXSdsGOfBxzz
         1rNvJhmUA1bS+pr1aejUW00ivh6s7iEjEE6htmYQ7BUmzXFlo5mlJrh17Ymq50aOh1Ap
         0zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8qtN5L8/xZpkQuUDdQgpDbwS59vLxj0mGpt2DoBoy94=;
        b=iPwvNmArKX/b5svE0JauGUvufDuYlF3E5Y32cigWif3JVZVKwQHfKPFh71JYBSJTNB
         W/Wn1iV0iIK3yrbhCrjDQtKfUbaN/Nus1CwPQqiFJqLGYPCCuDfSQacf+SCnECy5S8+U
         xaFtp/7snyK+QjVYlf23qB/N7QbG0CxUmXZd3puXnxDDFDuj/olb9sa9NzyW9XW1oEwH
         93zkUHcpbU+v6y4P8cB/aAfZ191N2PSjI+OUMn3/Q4zNqCvj/+QGj35jWHt3lLM5CLZm
         iMrEnt1nWtImsnptJ3RH6Vl3wqFzu801u80wC5+r4iMi2hQmw7N8xegBdwMHjO37Z2qK
         ZjZg==
X-Gm-Message-State: AOAM531FZfJzaKFxl8rMFlnI1kK8S5+gIq9GMFL/+YMtWopqlRl6GIXY
        ixWAJF0j/6RwhOxj7OYaVSVmiIJox2mCi2znp0GBKw==
X-Google-Smtp-Source: ABdhPJzRSIGPw4xCiw8wIgSx2BFb3C3mWivZPGkHLMXSE3njtM+f1mImRq6NBxxseL7B9Y8eFbRc4USvjpMyv+bDbIo=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr9943001ljc.104.1595252805400;
 Mon, 20 Jul 2020 06:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200717014908.13914-1-jay.xu@rock-chips.com> <20200717014908.13914-2-jay.xu@rock-chips.com>
In-Reply-To: <20200717014908.13914-2-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 15:46:34 +0200
Message-ID: <CACRpkdYyZ3GHYo0vB-1UpW+EtiTXgeRuOhOuB0XxUNXN11N9-w@mail.gmail.com>
Subject: Re: [PATCH 01/13] pinctrl: rockchip: add nr_pins to rockchip_pin_ctrl
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        David Wu <david.wu@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 3:49 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Add nr_pins to rockchip_pin_ctrl by hand, instead of calculating during
> driver probe. This patch is prepare work for making rockchip_pin_ctrl to
> be const type.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

I'm letting Heiko review this series, to me it looks all right.

Yours,
Linus Walleij
