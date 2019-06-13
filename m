Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 343B344ED4
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 23:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfFMV6h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 17:58:37 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34610 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfFMV6h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 17:58:37 -0400
Received: by mail-lj1-f196.google.com with SMTP id p17so292572ljg.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2019 14:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1NTkophc7gul6xkFuGj/Ru/H2VGlSXZeyApMxzoLQfg=;
        b=p1C/aRKePtGlxtB44HTGgws1U3166zB/UYqQR+a1pFKJvWzbrE3Zqx0YST6VmsOSz6
         16Kuu1obT6cAdvecggLWaI7U0xbQmQdFw+hoAJCbqnV6T+Pq1Omo14qcGtfUnG9M8e6H
         yoEqiZBr5OOpMKA/ODFqejqzQbTBHt/iBMXj62/DCqGZ6gekF/4Y4ZJXv6Fw+3wYJriK
         DqXs82+kDQLPLjMcS96u2jt8SDVKLLxDzCKu5foVaYVG48a+5ZHUtdrmt0KMouU9rQPG
         OLVNwB/f7GF9EKh9O87kjWE5nzCRdWsK4j9QTlgttmBgPsg5baae0C+8uAWP3acamNLt
         RjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1NTkophc7gul6xkFuGj/Ru/H2VGlSXZeyApMxzoLQfg=;
        b=rl4EBlhpUDFdVtYjm0uoNe9PwTBq8WMv8bQhRhm69Tvbpj1QxeTTJdEzG9mwoMDsBS
         0+KtNh8FcH8cdFSOaxadiZF3M/I+OnFBHrm97rgJGKfJLiwaKThhksEwqAXMx5YoIsb9
         dABmx06vOCWvvZ4xpBcuS+k1Eh+eGVvNqFkbxRANIfarunnjbV4q7Vtd+cZgVRMjx9C2
         /PSeLQHfaED8fbREG39J7GFl4wYHLQMdsjkWuc9DgxcuFibw6dANix9CET5kGfHNtY5e
         RY8kyRCE7VfkAOLOfauUozKzSgnyhYjFkMKxQJrMUiTWAZepg8lXX9oq3mOM5KH23G8E
         081Q==
X-Gm-Message-State: APjAAAVsH3sqhPrtA95drolMuVC0K76fH9m0euBmxTJMUVfy+7WTdaAC
        PDOp+Y2QZXmkOnT3W+emNMkHi9p40HYTDuXXN+rfyPDa
X-Google-Smtp-Source: APXvYqxGN1BRMTTwiGSinK19wi3vRIQa6qsDn6sK0IrL/wbqgEQBqtLM7aNQVZ0YHd0CGLUcjS2EiFUWMIDHBPb08Bo=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr17767830ljj.108.1560463115476;
 Thu, 13 Jun 2019 14:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdaSLwELtWMiEvYRBRF1d6E_9ymupdiCe-rEaaJkCfOd4A@mail.gmail.com> <b56f84bd-6f31-95ff-427f-1bf0dfa27421@metux.net>
In-Reply-To: <b56f84bd-6f31-95ff-427f-1bf0dfa27421@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Jun 2019 23:58:23 +0200
Message-ID: <CACRpkdaGFw9XZSW7ise5EBun8ehikNMzw4BCs9hByme=6z4KDg@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio configuration
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 13, 2019 at 10:39 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:

> > "Inverter GPIO controller for handling hardware inverters"
>
> I wouldn't like to limit this to actual hardware inverted on the board.
> There're other use cases, too, eg. if the incoming signal is low-active,
> but consumer shouldn't have to care about that.

For devicetree people mostly use the device tree cell flag
GPIO_ACTIVE_LOW on these to work around it. But there
are some cases where that isn't very readable.

Yours,
Linus Walleij
