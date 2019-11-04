Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75423EE31D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbfKDPHd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:07:33 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34612 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfKDPHd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:07:33 -0500
Received: by mail-lj1-f194.google.com with SMTP id 139so18043634ljf.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fvHw2sjmo/JCAncOpRv4HYnoJdxB7pahq9CqMy6R5Ro=;
        b=nf6L6fU1K0BBJ67+DVaY4vRH/ulYhdJ+bLO8NLv64MjZQEZgmCCDA/Q4k6UxioIvlL
         8839yai9pk2b6UPEb7/sJxb2ohbko8tGL6sgcMcbS6pR0A6lI4J5OI9x8g4uImi5rjTg
         BSBAX+2z5AcfBRmkcZF0HqUwdu+bkXI/gjD8FZxpBVZVU/uuGAtZONOaBIDwl59aNeyP
         +xkldXrpyGIGtgo5Tx0FI6E2HU63W3//lRHYZM6io3IA4b6hI9/477ZFjfGLkeeHd7Zx
         TUkpmR+x5Bdzee8IFo5CeHpq2tjXAFqi4MwpF4xDJuQtZB0bzOl7eQEXUA7/tNNqGIM8
         p9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fvHw2sjmo/JCAncOpRv4HYnoJdxB7pahq9CqMy6R5Ro=;
        b=KsJRI8vE/pKZxxjXALCTBcfbDUmwNKN6BCmAyYhriSfj7UavSq9H2d5wM6guwiLAR2
         TkY9UArswV6ghnXSfB/rjAr4ha5igXKF/wMnfjz4r9/It6QjqKfBJxWHBGR46pS9tpD6
         x5Nw+a5uOaAvjVpCcSvI7YyOcEadAJSA3xsu53L6wqxHQbtGrY2QmccOVhHCpR0F0H+S
         WVgQBxvQaoUBLJLWYyj2F9yhFKjy5wzMVTXcwcSq2EF1fkXECRfC17K5AeCFKHtYxuDj
         no/ASAWYkV+nKVPUOjQzh6lcz4LghCYM1V6iZ//eWPs32HvEsnCResdhrYXa/h3+AC2+
         l4/w==
X-Gm-Message-State: APjAAAV2BVB8xQ6ev+jXkedh2VGcf0lW49yXXoBSXSRJGXVXFguhibm4
        u9gJ7FDZ8uJ4eAozrkIIoSXIQt0EGPydMtxBRORye758D5w=
X-Google-Smtp-Source: APXvYqyBTbEHbndMvrcgfmEWjTNIL7LRkfwgFFgw02bwzUcFHCKaf9bdrPc7TJYiCURL9UBLvIj2YasNoma2Fr64GL0=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr11733746lji.191.1572880051601;
 Mon, 04 Nov 2019 07:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com> <20191022100004.66532-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191022100004.66532-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:07:20 +0100
Message-ID: <CACRpkdbV2de0AzzjymQvXcJ4reB1xjU_AeWz+S6rigZ4Ybx5ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: intel: Introduce intel_restore_padcfg() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 12:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Deduplicate restoring PADCFGx registers by using a common helper.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

These look good to me, expecting to get them through a pull
request.

Yours,
Linus Walleij
