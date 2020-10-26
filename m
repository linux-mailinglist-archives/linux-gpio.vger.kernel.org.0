Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293FA298FC3
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781927AbgJZOpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:45:46 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45051 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781926AbgJZOpq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:45:46 -0400
Received: by mail-ed1-f65.google.com with SMTP id t20so9603747edr.11
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qxZj5Rf8BJeteEBejj4ID5sjb9s7PmrZXoE3pAj52X4=;
        b=x/cJL9FQT6WNIskWkItfEUCPmD3wEdTJurPIaDhAPYpWSuJ8M/IlnMQpLAkH2Y4x9h
         MWM7i7XHF0nfC7B8daPamf5APho/ryHkRbya8B46cD9aTDCYM9v76xGqyEwPez35G/EI
         sOf8j58w60E4o4+aoD40mse4mNw/hOmnu4CUHfnroQtdWmr5WjyAjUAzCRC7u9LAMNsH
         w9PgeAoiXcU+Xi7AzxYAWGT4a2DMbtN6UjW+IA87c0nK/SxzjP2RA/MN+2f9x5LK1CQ7
         xdJv+hjrRpxWfwsgOvhGCOsv2VIvyxBEkoWVRO1d2uYILcJxWmD7Grb3W+VPqf+OiESC
         hHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qxZj5Rf8BJeteEBejj4ID5sjb9s7PmrZXoE3pAj52X4=;
        b=Hp4YI5eXhNydpouhH/wWE/MCZOYG6Ud/ITzOfu9umAEh3/KnUwc4BeQ901qSRIsEqQ
         LLXjobafR0V3MY9G7jY6B5jrQFHjC3JZ/6YbQRZYR4kzw5XdOYlXFl5VEu8ZMzc3UM+2
         vbH1LPOoqLWGk2AoZlShH24tAlKtO+iTM9RxVh5uHspLoiFPtcKBLIwWGl2/w5H3A7H8
         7EEPJRekAeEBKVAjVxUnD3/4rfvBqJwvkbEX9N/iFcUvvhvhGsWJVEtq+Tr+6HdKXfLI
         fDrQ0Dc2S7b7tzkKFfBwHzhZA45conKY/BfeOpkRwB7LesM0acZcyXGsU+ScUhUqG/7u
         TISA==
X-Gm-Message-State: AOAM531RTzkAPeFtBtEjoEKuSL9huWDMqawuXjZ31NuOtEnXqdUXmK6f
        1eGIQUs3LBsWPspPWVoVSxKknSh6U/t1yMumwt/zRw==
X-Google-Smtp-Source: ABdhPJw67MpVh5FeNNe/2XmRVHmV5v/yZoIiJklw8k+YZ/AsVBEN1L9bSZ8vI10M6Q+yJSpwLHpGrJy5Ltoj/fAjhps=
X-Received: by 2002:a05:6402:3045:: with SMTP id bu5mr16426259edb.232.1603723545420;
 Mon, 26 Oct 2020 07:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201021112537.40738-1-andriy.shevchenko@linux.intel.com> <20201021112537.40738-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201021112537.40738-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:45:34 +0100
Message-ID: <CAMpxmJW9-O3n1ARdpPThfoJw_3y2HwvCLK-etz_UNC6VSy0b8Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: split error path in gpiod_request_commit()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 1:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> For better maintenance and micro optimization split error path
> in the gpiod_request_commit().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>

Applied, thanks!

Bartosz
