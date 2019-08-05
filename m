Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49FBD81585
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfHEJdk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:33:40 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35807 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHEJdk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:33:40 -0400
Received: by mail-lf1-f68.google.com with SMTP id p197so57340950lfa.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a5/OTJbMULuScAIGgUwgZh44c0Q2JNkTQ861C4qV4Cc=;
        b=ho/2sxNBfDxcs2tNhtJSlBcXOrGb3Cz10/jv02e7llYA9pzqalUNakRqDqG664oW2P
         8v6QuzOZLIZjG8Rd1PGJUzokrnO8V/QU48nvtl5ZXdOfq6pkQnDSpvwfIMBiwA9ukO0i
         eJkHHbY2Wl/d9ITBiRKFdvBXQx6vMSnkP2C7v0r0mU/d6XRmRcSCCu2GDt5N8BSQ4Gen
         hRNLnMD8WiiU1hFvDPPrzwfy7iBSWZk2c1YimgnzTS6f25exVdtkK6W/8+lg5GCjfhvA
         nYT4BKCaRs6RLR4KlSqx9ZVz955VzDaK6PbLn4aIHKVOzacnhEh5zr5kdRvRqpEzGxaF
         B7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a5/OTJbMULuScAIGgUwgZh44c0Q2JNkTQ861C4qV4Cc=;
        b=nobmpcqPpCs/KJYe+IFv1zKj0StFxhIIs4j2tKieEWU73/Q0xpqZm4OnWGVeySzQlE
         BbIEuERRdF8l296Rk64fcvGa/pXzpnzpmXIAV/CvhUQcdfnXwMlhy5v4zGrQpKu5KM+a
         mozB/cb1kMyPmKv9enExVfGwTWLo5QlfDELXY/Vk6l94n8fwMXZMxlG/f0tPSVZF+Mi5
         2O5hYr+jAXVZMgfUPJc0QnQ0nhLxbOcl4Soc638zxvvTJbAE5ytiszfm9Y1oSyHJLGJq
         +hnfv6kevGojNbm055bcC4OyQTap/ztqQ4hvFpcmMbZKTP7Zqy9TtTyzLm8nhSLMnzCC
         a8EA==
X-Gm-Message-State: APjAAAVlFjnjGCHS948IGJ6YVmlJybgKG9bL88o8iqYJKM1JJ5pyUVhz
        gpUqiit+mmdyqpTfTE3Bi0F3oc92Im0uUcYFupb6UA==
X-Google-Smtp-Source: APXvYqzkLt/2s7lmYJRBiAbQdejEqAdGn0s71l9TnQmxS1/x8GXzJw1ryF1BLIw92aPA24EkDs5CVVp1VW7C2rdLl/E=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1239072lfq.152.1564997618266;
 Mon, 05 Aug 2019 02:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net> <319549e0-23b5-4a49-49ae-723da754f984@gmx.net>
In-Reply-To: <319549e0-23b5-4a49-49ae-723da754f984@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:33:26 +0200
Message-ID: <CACRpkdatwda5Pj_mLsg4zgT5WnRWyhkm=eaOschd8UTJGHKYvg@mail.gmail.com>
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 28, 2019 at 1:22 PM Stefan Wahren <wahrenst@gmx.net> wrote:

> any comments on the clk / pinctrl parts or do you just wait for Rob's Ack?

I'm just gonna apply it.

Yours,
Linus Walleij
