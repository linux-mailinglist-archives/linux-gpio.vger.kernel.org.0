Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A5016818D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728976AbgBUP2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:28:17 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44274 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbgBUP2R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:28:17 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so2572576ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UN+CWiVcnl1t3iZVzq1TQm7oj61jG5zfG5blHJVYlAI=;
        b=ipsLkFmM7mX3UmnaWZVKbi5pG0qQJn3b0UAAel0eQqHf0WXtgcQwKNwvfRoIsD37O1
         3zMEFbpBJiuC5/Og5GSvuWtysk8901K+gI8JMIy1Tw8rcVmYv4CKFhoSyJlVGk4WRR2d
         zB2Kuo8EQP39F1O7bolUPpLaYWQM7x8ifZq1Q65owiKRk2GrnNvBlwgg+CstAhKLA+lG
         dCjpfhI6GJh+8bYAspFB24GBKGVogPDsclfK8UdTplP18IMIjuO93ydyKj/xMIcVINxl
         f9a/ri6ZvEpVz5XIpJn41uPWE91lWaMjyQD+A93dNBtzTKx+ho+LlJ7OlvfSbxRvRq4/
         BZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UN+CWiVcnl1t3iZVzq1TQm7oj61jG5zfG5blHJVYlAI=;
        b=rZvAKqLcviMoW9g6FEgV7NyJ/C+mTlPIlquEM6i1/Arq9FcXo4SvETfPvhJSgN3C6b
         Lr4SlnlIXlAwbHABVrfdvCIGSPXjj8ja5+OH2OesfmT5iO+KCHSgTtGcIpZQVm45APcu
         HOqAIoWV4Relo4xFXcDygt5MJeD/0Z/yNy8+9FRjNXRH3KqYTDywMs9v+tAhw41zJZVB
         +FNBcoolcFXqkouTAELk671fINHXgic03Jw4HCvZDdEoEPHA/sAb7N71mL51A7u9EfgA
         OT1q+0wpUu0yOCG7bkv1oiRTYchdlCCD38LZR+/wKnEqaoNkYhAkyDSH7AyiwYp2k8ep
         BsiA==
X-Gm-Message-State: APjAAAWtJCCBKiXawXkaxb1T5SE8r+h0gRaAqPgnFDOkmqTn2mKXNR43
        DLniXpxsbt5DoLFb1qNNOahKoNtf/b19aIWQTU91mg==
X-Google-Smtp-Source: APXvYqzmRFe5+aD/XXxN155ljO/M/dRWkcx3FCLqbfPxZB8aGlo1hrJcZ2FMwgK4758C1WxaFEeTRiAAgqNT/nNrtts=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr23121445ljg.223.1582298895959;
 Fri, 21 Feb 2020 07:28:15 -0800 (PST)
MIME-Version: 1.0
References: <1582204512-7582-1-git-send-email-nbelin@baylibre.com>
In-Reply-To: <1582204512-7582-1-git-send-email-nbelin@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 16:28:05 +0100
Message-ID: <CACRpkdajEO3HvqG+4SNj1UoUpAZJoq9RHT+bqvHDbvP6UUjA+Q@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: meson-gxl: fix GPIOX sdio pins
To:     Nicolas Belin <nbelin@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 20, 2020 at 2:15 PM Nicolas Belin <nbelin@baylibre.com> wrote:

> In the gxl driver, the sdio cmd and clk pins are inverted. It has not caused
> any issue so far because devices using these pins always take both pins
> so the resulting configuration is OK.
>
> Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>

Patch applied!

Yours,
Linus Walleij
