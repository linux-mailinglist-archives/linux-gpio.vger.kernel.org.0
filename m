Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB8639DDC6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 15:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhFGNje (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 09:39:34 -0400
Received: from mail-yb1-f175.google.com ([209.85.219.175]:39815 "EHLO
        mail-yb1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGNjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 09:39:33 -0400
Received: by mail-yb1-f175.google.com with SMTP id n133so24999343ybf.6
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+6FcM8ZV21XjYhgtSkFirusWqSNWC7OG9HFOlE5+6ss=;
        b=G3TTFrNtDQsfKGjbSzlCuN189t0mFMM/EmBQTTEGjH24z3DNXz7rHohzCbl9Jg1WTc
         8jdDq5meBcAfT4v8dJCWLRQGY40qUTMZ9tTosPt6afCfsWw5UhuqTDOfnCO8WJd0TR0Y
         Nmin/bVd1RcOssIws78gQbUixLRKQBK5C0BtJAu16Z4JsPJzzN1WkKhBYDW0vCjq+2dW
         npKssWWEVK2j2lkWlmJiNBwaCu2IwjlBmPQgI/1rHpHKGY3+neDRk/cnfoc3bmezD+lf
         IBEBFQ8zQbDLKqL/NFR2uRjRKnV8o0Jzxanm2ogQkk7e9ar5Uujhbjtsu3AjJrdvLCl0
         9Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+6FcM8ZV21XjYhgtSkFirusWqSNWC7OG9HFOlE5+6ss=;
        b=EWeyPg0C/merlQUOHatIFfjCyVIKqobSdfrgxPzSvtruRjzIVR9gWbPgb/8nyS61DW
         bmO0xhVJcjU+UUs0ARt1NZQ2Jf8zRJBUGLTXxEtKfX/OUB/OOMpGpYc/m+2FrQNvq4D5
         24w3SHH8VygHmUB1GRHJv0D2x2jKQtdmRE5rZF8YyrXsFuTHexbrNcG2saLvrPzgERr5
         AoTiIGUJ2HQohpN7AOKIdPJVGnWkuqx+ctrYv0Wse3N13HU7yi8JO+IsqddqAl0uxJFU
         l6Rq4Y6+Pke3QHdmPhg2CV28Z+ofue1//RgaXkVaWQ6KOswlxPw6luWXUFDKAFsM90He
         C/aQ==
X-Gm-Message-State: AOAM531cXlOQFQhhNg8uOGC7T1zJw0uaM93AXGyze56l/gOGsDdgJauz
        u50QFQwd9DrekxCCFfQX0sYFnYh+ZtTFQM0dsOcN1w==
X-Google-Smtp-Source: ABdhPJxdHRseCyNG7D3UoptNNuXKOpoDUfb7dVUGr083kvn6AcERhtQcUNCJiaSiuvBR/fZrEnqKhFsbsOY8Ih7KtFw=
X-Received: by 2002:a25:1804:: with SMTP id 4mr24220428yby.157.1623073002172;
 Mon, 07 Jun 2021 06:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210604185013.86662-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210604185013.86662-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Jun 2021 15:36:31 +0200
Message-ID: <CAMpxmJXwe8eRwimUhvuDF-Z7pyiHmeKk2e6ArVVgc9Sp7g+=hQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio-dwapb: Drop unused headers and sort the rest
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 8:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Drop unused headers and drop the rest.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
