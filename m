Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3647429281F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 15:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgJSN1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 09:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbgJSN1l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 09:27:41 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB10DC0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:27:40 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id i2so22174ljg.4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kDW1ZWZvWA7Ax8mXUCoWsFd8wF6o3UZE+j7UMbdRhIQ=;
        b=wbgBQbueAZJYtvW5/RskvdxKDjMWH9a7rCKk/B70GnOA/m8ZxxZdvA0wqN5zwD9YKt
         Br2c35ByTkSy7w5MNonTE+CYbNY0ijpljrrSMT/Ibb6RzV7+yRBpd+A3GrfP5jP7kXxH
         9hrO9jiJvTWyKYs224zFx+s/bQ2yRk8yyfFEErRo1T61O9yw1CKTEceYY2aDhwLkvVLw
         KIfDfswT5eY2oUs520My1g41jn7Y73CTMgGploXQafQ0VahkzeQ23JJT0myMuRAxz6xf
         Atlm4+/Od674w88c7K0wgmyIjswDXJILiYNy+OCHoMPMO5th7yn56kL0GjiAq2Qt0Qkg
         sm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kDW1ZWZvWA7Ax8mXUCoWsFd8wF6o3UZE+j7UMbdRhIQ=;
        b=QrYdx1rdkS4LOeTZ3SlphXfNIb9LHd8W/UZbB4nxg3DE1GWiJSL3jK4NsReW95yE2R
         5WpMG6gWOZkCljPiYo2qs+TIql/NRum0Szy36sgwTpsGmTlmi9Cg0o9s/8HXePkiKDN2
         YlF0tTvC9WGlufxuAataVbgDkbJoTaFe67c9beL4T181efJVfPvYhAMiFrUXsaLmwI0s
         3VWaMuBvQQKIVCN4uCLlpX18ZyklNcfYN8DceybhWYEWnOttbdJldJWpcElbBnzSqXfX
         KHUBT6VsTUnMph978DyuSVuzH1PNbpKVI6Ef8NbRNta3AeEBYRFP95klLeIbK8YyWPiz
         rInQ==
X-Gm-Message-State: AOAM533ROQx0w+JlzsGTwWoxorzgGZHQECV/J/iX2V3gRApZh2UCOti8
        9oexRq38k+JHfOp1w9M7vpvEl3ScI6/h0BXisjmFfm3LbKXhQQ==
X-Google-Smtp-Source: ABdhPJzH4l2INhAM+6rn7acZBZVpTl4KCPceLZMoHbhnxT2f3IdPH5rjQ/53WCd+fR2mcnAznXB4/Tm81g9o0iohwTg=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr5835450lji.338.1603114059137;
 Mon, 19 Oct 2020 06:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Oct 2020 15:27:28 +0200
Message-ID: <CACRpkdYaOnxunieAGTvr5HVvf2BhTgzMFECpSVj5urjtUorj2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: mcp23s08: Use full chunk of memory for
 regmap configuration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 9, 2020 at 8:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It appears that simplification of mcp23s08_spi_regmap_init() made
> a regression due to wrong size calculation for dev_kmemdup() call.
> It mises the fact that config variable is already a pointer, thus
> the sizeof() calculation is wrong and only 4 or 8 bytes were copied.
>
> Fix the parameters to devm_kmemdup() to copy full chunk of memory.
>
> Fixes: 0874758ecb2b ("pinctrl: mcp23s08: Refactor mcp23s08_spi_regmap_ini=
t()")
> Reported-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed few typos in the commit message

Patches applied, fixed the extra typos in the process,
thanks!

Linus Walleij
