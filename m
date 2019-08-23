Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90B49AC5C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 12:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbfHWKDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 06:03:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43022 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730796AbfHWKDL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 06:03:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id h15so8296707ljg.10
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nSBz+3Ajg0zUkEHOpalFy2yQQERAUt33EX4Z6O2112Q=;
        b=Qqbt7Hg7CVMJ++GMLAdQEdO5V9jYs6VU8k5Bb8ML6AnhICBExaR4DjFJFmQ0NzNuYg
         sbHDg5E0qPzUgFo/PS7UqlpYU8Q7IkC3yhgkNUVXiNT7Z9oy02pGpElc7Cx617GhQ5bT
         fdl4cZlVArIRQmvmtcE/+ktEuqhIdbU8oGRyAOaBsqRse5q6yZPnGYsjVFdMl84v9qFo
         i3jTov1EHj3JqU1+740PmIgYO2WxvE4K6zJihYHaEm3EX7eZZzTFuJrEyoYhVYCsesu5
         QCAUmZ5er+iYxYZj7EiDOTWvJFkXwQbA7pmT+eZy87XDQK9NC8sAyfNuMN3SXXZxfHIn
         bNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSBz+3Ajg0zUkEHOpalFy2yQQERAUt33EX4Z6O2112Q=;
        b=fP3v08BQCdAE/Ip2DG50fYoPDXRoZPMGInDaBnsvrohCPYR3SAQgwbyU+BvbyhECcc
         A3hMsA8ynVSv4oa0nSd1u33qCwO6OqMESiRIiBAym4JNxBcFU3qCnJhpjvVapEv20bca
         p/OS7ZlmeoRdcsW9Op6nia5wOeX2ZcvQWOF3K6wq3M4NItdpJ6hf5rZ+ZlwbLBBjAIi+
         Gw6B56ctGqnRdV50qZy10QzwbE12HHLCGkB8rR3h2ecGmIoXy9fupd7mVh/fPS41ra04
         1Vk5CIR8omMP3G71Wd24lmzzsS43FWqKA6WOOpxurSs5nQATfbahHVQJ2kY71SOzMant
         aT+A==
X-Gm-Message-State: APjAAAWiB4aBPrspR5+3LHa+Hz8+OfBQxmin4i4qt8iLvUrMBW1RO3Wp
        zNbi0gxjAEHuN0VB67isRh/Kc+/qxFeTrS4EOubtwA==
X-Google-Smtp-Source: APXvYqxTjn97YdwzicnGq3IvnbKXlScd2i/LCcZyVhZZvRtC+Dg4mYSvpgp9/b3MPiBed4CvWtwmVE/lJdpaeT8Pa0g=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr2446810lji.37.1566554589125;
 Fri, 23 Aug 2019 03:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190822204538.4791-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190822204538.4791-1-christophe.jaillet@wanadoo.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 12:02:57 +0200
Message-ID: <CACRpkdacDZTnT2myMrsPLMZYkonGbFu27nr_A1hgw1AKozMMgQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: ftgpio: Fix an error handling path in 'ftgpio_gpio_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 22, 2019 at 10:45 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If 'devm_kcalloc()' fails, we should go through the error handling path,
> should some clean-up be needed.
>
> Fixes: 42d9fc7176eb ("gpio: ftgpio: Pass irqchip when adding gpiochip")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied, thanks!

Yours,
Linus Waleij
