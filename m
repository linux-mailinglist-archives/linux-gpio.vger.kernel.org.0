Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52A9013BD41
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 11:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgAOKUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 05:20:36 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37101 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729631AbgAOKUf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 05:20:35 -0500
Received: by mail-lf1-f68.google.com with SMTP id b15so12265322lfc.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 02:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OSYI2xZp6moj18vJWopRU+GyEjnAAPir0aPbuO2xATs=;
        b=xonQ/OIMfW8ijywfRBm1tFBfH2+jjE990GUtkQ1ZR9g7yGqPs7uUn1XEdYoaIZUoYM
         Zx7c2C7r8k0vhbnGjQrz+tZsLIjGhYi0MUi9kvbNsvq+ZOnnZqDmFV+He+UUYWRPhuFl
         3+h8iJAsnfLd8gUoLEsfMUUEGKheU2ojYJ6Co2BhygNAPJAWzenrii6I/cyMiabN5xlv
         NcJwERf+XiwFt2SZwpr2ALA5IxvaOrKuTuvsYJuQ3A9TN0kdrpwrxK2N5veuXHdktSZc
         t5vA/Fpd0Ep0/HNzdXcb799TJHdFRZ6orVhxyO+cORlrjg7PigP8f1EnN/RM51X9LgQZ
         JRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSYI2xZp6moj18vJWopRU+GyEjnAAPir0aPbuO2xATs=;
        b=QMWeCRqt0NEKrctsjGjImC1O8v6rwbWJPvsPcV+jJC3+VqO3c8W2QbRpwgrqy/udQj
         Oi5q2smf/RvNQSfyuaP3+H88sB84NDnty3vE99KJaxuMZ4CYjplwACfaC8gSO+ozAwW+
         tRsmLPiGvNa3fryWMcOsK+XYccydYAcrrPysGCnG5IX4yR97SopgB6Ksq8KqGaAD2BNr
         ulPOYTC8oM37YQeL0l+f+mRUDyygW0xHZlhlayjM/hg3CyIOUUUBvpMfyIgCkvLd886L
         Wfr7fb0OA/1jMz/eui5wI1zqfJZ8cJ8Evjc9V20A5tDL4d37wKPrip7EZ2+fG9NUUyvs
         /qLQ==
X-Gm-Message-State: APjAAAXvQ91ECi85EMvGPEhnjmMSsdxClJRmusNMojBHZT0rwFDmqraU
        Tw61ys+MVV942g8FC2+P6Clo0XqRGLrR9642meKl/g==
X-Google-Smtp-Source: APXvYqzbu66rhpiW8Wtdm3l5NbV6GsB7o/UI+DDrcuAArim166YJj884QRtDnfcTnYrqFD7mFG1FqjdFtc9behO+w04=
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr3963101lfm.105.1579083633798;
 Wed, 15 Jan 2020 02:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20200114082821.14015-1-haokexin@gmail.com>
In-Reply-To: <20200114082821.14015-1-haokexin@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 11:20:22 +0100
Message-ID: <CACRpkda7LmJPkMG7hXq9MxHL2tYM5uTCEotdSbtaKxhtBQPW4g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix the regression for the thunderx gpio
To:     Kevin Hao <haokexin@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 14, 2020 at 9:39 AM Kevin Hao <haokexin@gmail.com> wrote:

> Since the commit a7fc89f9d5fc ("gpio: thunderx: Switch to
> GPIOLIB_IRQCHIP"), the thunderx gpio doesn't work anymore. I noticed
> that you have submitted a patch [1] to fix the " irq_domain_push_irq: -22"
> error, but the kernel would panic after applying that fix because the hwirq
> passed to the msi irqdomain is still not correct. It seems that we need
> more codes to make the thunderx gpio work with the GPIOLIB_IRQCHIP. So I
> would prefer to revert the commit a7fc89f9d5fc first to make the thunderx
> gpio to work on the 5.4.x and 5.5 at least. We can then do more test for
> GPIOLIB_IRQCHIP switching (which the patch 2 ~ 4 do) before merging
> them.

Thanks a LOT Kevin, and I'm sorry for open coding and breaking this
driver so much :/

I have applied all four patches for fixes.

Yours,
Linus Walleij
