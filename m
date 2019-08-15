Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC178E5C6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 09:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730573AbfHOHvv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 03:51:51 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43578 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfHOHvv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 03:51:51 -0400
Received: by mail-lj1-f195.google.com with SMTP id h15so1455987ljg.10
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KO+Z0JsKFmq2PO7wNOhuuy5QVOCrUT3RkmKRxIEBxM=;
        b=MFX+4DBCjGwtyq+vpGo6BFOdWRFE7uHXLJA3Lp63Rm41HUV/ctST4jX4RIClPJz38D
         ayGGN6FXa2reujZbvOX5UiTHdbRMUPx2uzBXBntLaeA8tMv7wUnqqeFooDdMyUjKrqPt
         vhfNjMu8ABOYkztZ8XgebxqtzxNkqwq7gz85a0oF6vekNc0hUHbFYpXI/AgevaB7vVEq
         0xhkUf1gCOK9IT9+Bu5PGFY9wAurydpISn8NiKQG/V7HcfnYaZMrTlAb+9oyH5l1Wpsl
         r6D/cbOgRQ0m38xq0n1Ld0evhLvhxDCgID50uib/d8evoQFYoYAk5zOCz35B2CWzHvXA
         XKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KO+Z0JsKFmq2PO7wNOhuuy5QVOCrUT3RkmKRxIEBxM=;
        b=uk08L8BGflaQ8aeZq2i19hP0u/az/07b9K26bh9y/Q+kHzhq8QzN7aM981tgKa2Cvi
         TJCUaH7A85x7jXmGfS5WfuRXtklEHyIhjfXUQQOP7EgQhnL7G0qCCsfKUptriOgc+3qg
         80i+3PsmlzrgTt4vD3iDB5G1XofH+sZ2S9Be9OfjVwqmPyTru4o40LIh6fpmARta3qhe
         MnFpBR/TBh9F8SJmqUJN+CvF+OXYAz0ZcFt6jSd/dUBIGl15L2H0mQveMAGbdKaAM7sL
         3/x7g2XN+8uOlBZONmqcGz3FuhhNeCJmYVb9472VUv9VBWSXLq28JWoze+3+c+bwbe+u
         jCBA==
X-Gm-Message-State: APjAAAX8OryftL8CjAhb6S3WyMPWcWJRrCvJGTndUZcaFVasBe8roCTY
        udmGdSf5890/mexsFhp8S/vDCrqXBJwSFM5MRr8pXw==
X-Google-Smtp-Source: APXvYqynv1Gde66j1lWkcpt1eC+OtHXJ31xTsAHe5lJV/skSr6II9/5QHd/HzPoW5xCyGd8uaoIz0NAIhIRu4HhP/0w=
X-Received: by 2002:a2e:b174:: with SMTP id a20mr2001181ljm.108.1565855508911;
 Thu, 15 Aug 2019 00:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190812130401.22769-1-linus.walleij@linaro.org> <60da7536-2d41-69b2-5730-4678b6e84cf9@broadcom.com>
In-Reply-To: <60da7536-2d41-69b2-5730-4678b6e84cf9@broadcom.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Aug 2019 09:51:36 +0200
Message-ID: <CACRpkdZ4k_b=rOPvRi2wPgk1=9Md+urw6No1xcPy3nSFEcUogg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm-iproc: Use SPDX header
To:     Scott Branden <scott.branden@broadcom.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pramod Kumar <pramodku@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 5:59 PM Scott Branden
<scott.branden@broadcom.com> wrote:

> Please leave the file description comment separate from the license
> header/copyright notices.
>
> ie. leave the above 3 lines intact.

OK... Why?

Is this because you have an automated tool that likes this format:

/*
 * Copyright ...
 */

/*
 * Other stuff
 */

Or is it just a personal (perception) preference?

Yours,
Linus Walleij
