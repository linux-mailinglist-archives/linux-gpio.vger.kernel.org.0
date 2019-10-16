Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD1ED8F2E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 13:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389534AbfJPLTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 07:19:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39299 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390988AbfJPLTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 07:19:17 -0400
Received: by mail-lf1-f66.google.com with SMTP id 195so4179074lfj.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1AlVFzVNzLFhybDABbQIP7y9fwuWZqgdiTuBdrVDMgU=;
        b=ZE6OEgnZ8yrNuwOpjQUl1DrdrhOJcU/OfJQ+UWAJV5VSuBLt4kobSn90ZvkwKhz3/W
         DmWuNa8o4L6xpUpEA32J5Ft1QTqgjgdu1dbOpgk5naABVzkOtVTLGgWzYWNTzQ0WgTbb
         Y5niXn2s+/QyNMl5FrZPP125aQ4QKxA3TA4Lw+iuOCQIhfIOlJhBFdeOJIR1GZ+oDqDq
         hCnZiK17J2nBsS8Ybej2tVBY0I7+6EKSRi0R6PvzZFSb1ptl6XnMGK+lHRNew2QPY1xJ
         KNOCbpWsHgotFI3zRLMVcXg5iQytMnF3Gq7qsWWyjGRj8Jo3TTknxKUco7I816TsaM43
         NMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1AlVFzVNzLFhybDABbQIP7y9fwuWZqgdiTuBdrVDMgU=;
        b=o9wom2wqo3H4aSryo0v4zLk0ZvPGfXzvcOOrf05Tf8h7YxtmB0HaAvzFVFLLF1mqcS
         kW+jXB47ikOK7oEt0aWRwFmo+Jkbtyc5Jv/lbfKOgyzPX4y0++v04GtHErA/yRlUjcZ2
         X4ZhWcapzXw1Qbp1IQC1owCF2wso4dIXDhsJh440u7sK8AwBSh/dElgZ+Kq0h1CIV2LV
         N6qhBsZZffXfrx3VgTYXnzjU7AVMAwjgOUb8hm1m2PIn9vSgBzWkVgX0mhAsN5wQlCp7
         NELrZJn7sZYGfstmK5sU8IUNao9klQLs0qhUrScyZ6bN+IbU+B/Ah4oLi9l19NlxPOR1
         +3Ww==
X-Gm-Message-State: APjAAAXg+WsYwVa8i/zjjqiaD3t5QOkCFIuuLRJWaCjdH8me1q49WTVO
        DatH+cRCzv583tAUIGWZj4KQj8ikuPEJTfBvZ69ddA==
X-Google-Smtp-Source: APXvYqzpMNbiy51j6vtkjPuuhusjbti4CJFbH8pcmfYvGpawltJmnzSIwtrjLRWD8kgfIxeJjRT4UBofz6S6sUNLEa8=
X-Received: by 2002:ac2:4345:: with SMTP id o5mr4806342lfl.60.1571224755662;
 Wed, 16 Oct 2019 04:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191008044153.12734-1-andrew@aj.id.au>
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 13:19:01 +0200
Message-ID: <CACRpkda5cWaA7R3XzyiERCCgwUrjnXd+wCBeKvt-wtjex7wNDg@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: Fixes for AST2600 support
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        johnny_huang@aspeedtech.com, ryanchen.aspeed@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 8, 2019 at 6:41 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> This series resolves several issues found in testing by Johnny Huang from
> ASPEED, who also contributed the patches to fix them. We'll have more patches
> from him in the near future (which I'm pretty happy about).
>
> The major issue resolved is the way I grouped the eMMC pins. What I had was
> ugly and I want to get rid of it before the binding is solidified with the 5.4
> release.

Should some of these go in with fixes? All of them? Or just some?
I applied them to devel right now (for v5.5).

> The remaining fixes are minor issues that stem from lack of documentation or
> understanding on my part, and at least one brain-fart.

Do they need to go in to v5.4 or not?

I need a shortlist of anything that should go into v5.4 if anything.

Yours,
Linus Walleij
