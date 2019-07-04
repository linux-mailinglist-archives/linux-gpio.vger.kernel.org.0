Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672EA5F3EF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfGDHg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:36:57 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44792 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727546AbfGDHgu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:36:50 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so5127211ljc.11
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=No6cj2+2BiAzZgEaW7OR6lOBDi4yBK1px+PdIr3VDOE=;
        b=GtDbAv/IywE7PhRXWvUqOmx6Q9KsGCjBkwVjNNZQn3OSO4kPiJdSc/neYupU6Ali0O
         UbWtMNsjN5dA0o9BErBrLkAM6b5kOaVuviAGj8KSUEv8kvjyAhlM9qBTi7iXw3XkLgqp
         YfoWUmPTQFROGFGgcmYd8X/YekHU5gr4qcfjGr83vYcuYlMTf8f3sZIQgZ99gnSuNANX
         csoDmXLfQiptAmrO4UHttoP+TLhmTf9bRgmJNba64R0+gsYwzB9RDfwfZX18iUJs3ktM
         inPp9tccKf/ggtgEbUiTkqrIuuZAZY6Uc0oBjVm2KGYIlVIpfit9axQDfjVG6QcaV5X9
         497A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=No6cj2+2BiAzZgEaW7OR6lOBDi4yBK1px+PdIr3VDOE=;
        b=YzrFj6q5qiwFB+NVYWyiQBt0djZoTi9FYtVbl2J1A9PDu/1p2rP3xp1YySNBU7t7li
         tKrGHQ7DM1RIjBdIf04g/w+NxJhIUypserHj/myElZKe4bD+ynmmAOjftq9z2X4xgDxP
         cujcXumbolI28tqk91J/d3joDBy54WdOLLyScPKdwV1+u14PRMHoTFWF1a11WGV0XBad
         V4tjADU4Fk6HmlmF0UfImkYRo26waDq0Xth346FDgnk5+snR0QERlSlJt52UZrEWlYTR
         xxNv4lydq2FZWezNSfeM+LDOu7kAE8eTkqGmUIV2611V1w3epRSONAa9TvBSt57f5vme
         cIZQ==
X-Gm-Message-State: APjAAAUFmR9MHU4cYMYLlXvW/Z1e9PLHYC4lYQVyMk4Cl7uYubwCp2v0
        /qIPQQWEmuFfDrcgzBFeZ7CrpIpze2/UEh+Oz3zwog==
X-Google-Smtp-Source: APXvYqwy+fMPKbIq3hb8mThiboctfMy+7wT11Xd72UUmGoH+spjBrnQdiTIhpdn0Y+RZYg8pm1e2gKBDV8gGrOyFLM8=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr23689446ljb.28.1562225808477;
 Thu, 04 Jul 2019 00:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190701142809.25308-1-geert+renesas@glider.be>
In-Reply-To: <20190701142809.25308-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:36:37 +0200
Message-ID: <CACRpkdZh2u8KnNofVYPN09aFuHOkXbXmkvJP9C3w+kUNQHBsww@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Clarify use of non-sleeping functions
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 1, 2019 at 4:28 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Obviously functions that are safe to be called from atomic contexts, can
> be called from non-atomic contexts, too.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
