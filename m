Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1201889FB
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2019 10:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbfHJIW2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Aug 2019 04:22:28 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42190 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfHJIW1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Aug 2019 04:22:27 -0400
Received: by mail-lf1-f66.google.com with SMTP id s19so8492660lfb.9
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2019 01:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pc3qLlQ0oDS/ErmPhgCH+EKKU+gZ3YZH+6szWLiU8H8=;
        b=h/J/JDe+O8fLtWaF7QsQUS65lORhTc/HLOUgNSJBchaDmHC9FOX1tjM2vsU8KE92J0
         L3TZUbszXjPM6ieOgu2zBATyb/EIQNzRL1jAKTNcty6Brrx0Q9bXvVYaT2aP8aqJFkNb
         2Zy7ew6SyiIWqGKmXWd2au7j7gkbzo4Pg+zYOWk+xg+GqxZ8Z0NgFyDFjQOFyiSiDSNd
         Qq4XNSuK+9+3MtrldCbidcUguL/3P2XgI6rClzRD9bjUgmyBUnqmokuPw1Fb87PDJgA1
         B+k8trmUgKNLPHxSeJp82o6LFUdQUR0dzM87r+f4K1bkLMizQkHnQZYIl1T0zkEQzH2Q
         xkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pc3qLlQ0oDS/ErmPhgCH+EKKU+gZ3YZH+6szWLiU8H8=;
        b=D6i+GNKLFVgwwWCYb4L5UcdWYEl217FmxWy9F0iNRBTPmS83g3bqrVzllnKuzKaz8E
         cQooqFBi5czhpYTaBm4b11N6MHNFGHZyrl96nVmTS7b4a8n9lbleSPtKdJ8HBXkNU6ex
         ZWBczezA0YAmg1pgq1lNTDAI+oeSbWrw/jB5cgtBVC2mPf5s6HzqmBApQLwD1VY++kt3
         p1hty9W6oTE/24R96p21rbCIPfDzZb/WUekPUww5ii5evXuOIYUVzd4BQy3MNlRmuDV8
         WKXLAqn8lwh+ZcVzgN+g6jydJkRvxM//pB94nk3wsJMWLp7W4BUu4HahnZccDXNCxqMO
         GbWg==
X-Gm-Message-State: APjAAAX4ieDDjE84ERl3WzSssewQGiUIYT8E+cHOaIAD0hrolsbyeKKl
        80Ie/Ucv79bSxJ+nBMN6dSyrXoPdGDamD1Zmv+Demw==
X-Google-Smtp-Source: APXvYqyvHrlvtVs7ifq6cN1Jxp6sfhCgtxKfNrZ3NRhbWC/hAwmuwvvUHk3Q0lUpq+cm+bv8rqjcj7WSrqYgaz6dQCM=
X-Received: by 2002:a19:e006:: with SMTP id x6mr14672568lfg.165.1565425345868;
 Sat, 10 Aug 2019 01:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190808075457.16109-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190808075457.16109-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Aug 2019 10:22:14 +0200
Message-ID: <CACRpkdZgpSzwgjM_p99+j+0_+J6ydK-L6_ouphggF1iGs+Jwmg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: stm32: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 9:55 AM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node and
> for_each_available_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return in
> two places.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied.

Yours,
Linus Walleij
