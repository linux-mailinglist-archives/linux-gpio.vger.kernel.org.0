Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFEE952758
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731117AbfFYJAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:00:15 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37298 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730976AbfFYJAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:00:15 -0400
Received: by mail-lf1-f65.google.com with SMTP id d11so12071058lfb.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QrxtlAu1B2CD3ck2TgAzqcG8651s0deK7RQ+rxs6V3w=;
        b=d/bWkaIpUN5Wvq1sTe1KDfGKebPI5qstftCZVx+uPLmoI0LsU/Ojs3JO2YYOWCpSjc
         PJ2An5IJiGR/W7rjUnie55oqg6Nm7tZrtrNMhF1BQAgu4yPhOvYsyQfLKQ2oKn8ljk91
         yZ40XJG87k47XKGW30g6LPIJDxUzgBRjBrc3/Wzm6FhCeY8pdr6fb0Ut0w6zh/bv/Uc/
         svB9oj1hLyM+Cq+kZVuXQwZhFhuPRv1d4ApnUvChTJV9nSc9kQAQajufR/tKQVKumVGE
         HN/nW/JVyyZrfdficyGiyivFV7bVVAbknf7BNNURwtdW00H/yRz6LVunhTAMX50Rpu3C
         3Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrxtlAu1B2CD3ck2TgAzqcG8651s0deK7RQ+rxs6V3w=;
        b=SNeIEUvOaWmmH4IMBrXCM2YwfyodkNSEmbv0coBAXAxStPhy9qdFp64HKncwYJ61N/
         fA3ilBruw8tm57FeRT11CbgWZKcBIw2KJ35xUGre3yZJXHLwat6fEUwRQxpCb/z7amVu
         vtb+1OCADNQDsbGbj686APijdwn9CyrVDpheD4QKc8DokGnrYk2iNqpbQaw/4l/jlfLD
         WrKa+xTDpNpDI3TUsME5hpxC8HruqKJtKwo6/gSYgHrN7uEJkDy5/mvifL2r0Z5LKtVL
         XjLfObC1gBtWesfA8kQjVGDxj52WRkX5tyW+dvjcCiKStjUvJPzQzntrH1xCQ2At2Sii
         gidA==
X-Gm-Message-State: APjAAAWjIUmbSL0CSIb1o7eiyzz986kM89iogAu+5uEBbRbTclcG6dcX
        /0NeuvZxUliG8gG4+CO/VjJA3vNcaIhJjSItEL/InQ==
X-Google-Smtp-Source: APXvYqw+fZ1lEwHAeBaEUCCBt0I28DoD+AlxXv2wJVkBYdvJDWINLuXdb/4ZqeOCPj5TZVn+m3TsNKVYXAZs6ZjJM4k=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr13435676lfu.141.1561453211950;
 Tue, 25 Jun 2019 02:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <1560787211-15443-1-git-send-email-info@metux.net>
In-Reply-To: <1560787211-15443-1-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:00:00 +0200
Message-ID: <CACRpkdYut03q5v=H7VW7UjTFsiLxx+HXhcaUQUZePO-cBfsjgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: gpio: amd-fch: make resource struct const
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:00 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> From: Enrico Weigelt <info@metux.net>
>
> The struct resource field is statically initialized
> and may never change. Therefore make it const.
>
> Signed-off-by: Enrico Weigelt <info@metux.net>

Patch applied.

When making GPIO patches please make the
subject just:

"gpio: driver: Fix foo"

Yours,
Linus Walleij
