Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189473AE72B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 12:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhFUKcz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 06:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhFUKcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 06:32:55 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3201DC061574
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 03:30:40 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id i68so29102490qke.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DeySwvB/L6nRcxyc3RUUU/XORVsjO8A0OuiLh/T9c9E=;
        b=e3fOXIsdHN8zBR5AjQWgc4RNrsDP1MXpB7+IkfN5wdlTVxLZn8JKTfXMYbfZeR95XK
         S5ft47Nf2INeLNoUgoXUSrOPeX5tsT0+kbat/e75YnxfQxJ1RdX4AXSxI6cdFb5M4H9w
         Z8KqflUOF+SZCWGRLTL5qW9AV3tfIVjYyAWdtT3bjFseHVHp+YjabZ3IZowO5tHiL6S6
         7yVu/h8HleEmpKORVXdljtApCwHoVXccETcuFSxuKdPQOgeZAXOgBkoqRWPQKEDZ2ZpS
         hu5il66gQ3oID3VF6R7aPQICa3fXo2PjZXXQy6GJ/l3JSDq60riUZxczsTnfs8ahPv1H
         +pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DeySwvB/L6nRcxyc3RUUU/XORVsjO8A0OuiLh/T9c9E=;
        b=Vzdqm5afXrnZxUyklo5rp8Nw64da0Vy1Nvt+J6icnNkUW3/czJjrnXRHfQlqTlYRhU
         FWEq7EXgpWpfpLpLfG+1vV997GLYDNHaizsg+y2fFr+2mggdNlImP8js2VpH9SKW3Mhf
         fvRslfOvegOYRhPHN/yknAG4roXDu02UZ/Dl91NvZmMpbEAUliNHvMaP7VzlP/RXCyRq
         g1rYTi1oyHmtokqKdEkPS336JcM97moMQJKbZlmwCEm86c1xZMHecFQ2UvY+bOmcU4Ne
         lIfIufDBlI20Lj7jE2Q3y5ofZuQfBrlLtqOCj0HMtiW5CdYN3+dMCL2+3R3eays0gbr9
         7ZIg==
X-Gm-Message-State: AOAM533OJqBNPEiPh6ZK+wEUWSnmxALmGKZd0GJ0EFT3uj3AklgMyVeu
        EHnQeRgH6rmkqMSYh92ke0yU1VJ6Uepsu9LFkSYNJw==
X-Google-Smtp-Source: ABdhPJynErsP1ymVSnLK/htXoVZUp48gWLGb5+JZcWWEkfT3WPJcFvso38Auforwlu+DimLlQo3C8a8PDp40Kmu89do=
X-Received: by 2002:a25:738e:: with SMTP id o136mr8451107ybc.469.1624271439447;
 Mon, 21 Jun 2021 03:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210531120753.719381-1-iwamatsu@nigauri.org>
In-Reply-To: <20210531120753.719381-1-iwamatsu@nigauri.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 21 Jun 2021 12:30:28 +0200
Message-ID: <CAMpxmJUcscOAf2_VsOF0TbKT7KyAi6MdVkptF5+4_hmdEUG2pg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: convert bindings to YAML
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Soren Brinkmann <soren.brinkmann@xilinx.com>,
        Harini Katakam <harinik@xilinx.com>,
        Anurag Kumar Vulisha <anuragku@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 31, 2021 at 2:08 PM Nobuhiro Iwamatsu <iwamatsu@nigauri.org> wrote:
>
> Convert gpio for Xilinx Zynq SoC bindings documentation to YAML.
>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---

Applied, thanks!

Bart
