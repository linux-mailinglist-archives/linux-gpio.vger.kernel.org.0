Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C0F1D718E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgERHPv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgERHPv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:15:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C771AC061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:15:50 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h26so7092745lfg.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xPkYZCxunjtpOlgUZmZYqgeNGxo2NPvPnPI5sI+K1zI=;
        b=nl0jWiJrct4S4hZOQOpzN/l1l+3XnZNY/kKSKhT3wAzqjAv34RAKHntTPseSEUQoqE
         uYll5rZ5bY+dIeaDOuyphvo3IKwARJeKdzzOd6PDbxTiE6Lbu2Qyac8xCGwSS4ed86tz
         lXoDpiJhiN3wPGMcfTY6PX6AN9C0a+x4BHWWYh5LxoQMsPtJvcSgoqmW3vNUf1+tjkOg
         6rlcPVPka9jS+urkqnSvpN9xU64Zeh4tZZyRORIBUuJMIm4yKlMBkdT04ks5CRfi1Q7h
         Dkx8Ipn0iavRU0bMiDR/S/6UMvWfDLDkLsJ8luieotUEbOjeL97gl0l/Zg4wcFgMM2Tw
         rOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xPkYZCxunjtpOlgUZmZYqgeNGxo2NPvPnPI5sI+K1zI=;
        b=XtMmkbk56hNAly3rwrBwQO7j9pLJj7PWY3ZS9EdPxQoqbkmZtkl5oh+yqhsUj7h4qO
         fFBXy8Kiw+JgowQmQwJsCjsfpdXkShOnbzhN8OQRqfspWlsL0y2IGy/UIuFQc2ZFoNuH
         iP/hbepDEw/N+qzJVw1R8xAn86SEoGrmb5IVJ8VvoHmU/zMQMSBc4fUepFrhkhFN2I1k
         SW6ugasU7h9cTZH32Zhph+vo5DPttJ8AuXne6M+TsXRCQMX/IOhd73CkTPDXwhoLgEGr
         P2rxFrKXR4fpcGdk3LwmhZn2rD5u8+tGz2P1bzDKOz6Vq5B5IGK8sfWKeO7Ie1BsGXxJ
         SnfA==
X-Gm-Message-State: AOAM532013clI6ePD6rBAl/rtIlYA1n3/F+vjOM088SJyFlq6iz6iz8M
        U3jDZrBEkMWKfXZ5v46APOw+NbpZVKrTOW8rY+hwGAXP
X-Google-Smtp-Source: ABdhPJxP5MeqPLVhMR9/8QuT/JKJHVreCc2Q630qHFmhTuOLotSUj75q8DEZoU4srubfzS2K1bXDCy4R6x/+HmCLTqM=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr10533095lft.194.1589786149237;
 Mon, 18 May 2020 00:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200512182623.54990-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200512182623.54990-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:15:38 +0200
Message-ID: <CACRpkdaFNuof-zNsJOsMhMYmiH9ChF3ctYALRbkgorQm5TPZyA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: mb86s7x: Use devm_clk_get_optional() to get
 the input clock
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 8:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Simplify the code which fetches the input clock by using
> devm_clk_get_optional(). If no input clock is present
> devm_clk_get_optional() will return NULL instead of an error
> which matches the behavior of the old code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
