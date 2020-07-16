Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893B1222396
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 15:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgGPNIS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 09:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgGPNIR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 09:08:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018CAC061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:08:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e8so7112563ljb.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 06:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R7N2aBROeX+YFprlGDk5Xmj7aeLtlymLdW0LHGxpCgE=;
        b=WjNY2YnDSCilEnR5CUW1lJbcs4d7aMtWoaI8nNptasAqG9imG6yXmpfaRcdsySAJCP
         HBiQEtJiR+/q8RDARzmk87LBt6Ju0XWKjh/UDNmIbrsoMnilmd924AVC6cKPowmAmgBZ
         B0Eo6ptIaYVPOTtT9VJXwsn6Tx+ozPvXyTH8x2Buk7QujSz9M9r29BSx0gNfUfHWPfYW
         mr3K8O/RbmE21gVBZySdPuTW3dXGsYLMfvyzg+jfFsQQv4uFRV8ptnNxr5n9yS8/3sV/
         bHGcbKowd/QY0jo28t8VkJer+o1xNJfd5ytomDltrpyYAWxEMd5z5nLnAp3Fc132NEj0
         COkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R7N2aBROeX+YFprlGDk5Xmj7aeLtlymLdW0LHGxpCgE=;
        b=Vrw/UwnqKcqy5e/Stbz5cpXNKt3Z8evkiZPwzje85RmH4AmHwFuZippQT0TVegN3n1
         GYTWQj2CLxEhEINbXxoYCb7J1AYqCns7pWfEUrSd9o/lV86vHToWxh0Df4VK3izc60nz
         GBLAcx3zCXkVcWmDpga1Fg34TWjiDhAs9C9iExVOebHi1dcfoNCgb8cEDmml0XZkf7xo
         zQ/1DZ4wRzPYBTA34prIDMSEq4USr2IGCiR6D/u9B7qzovVO9fK8+1eHJn49IR4VI8io
         fE0UofERpbmBcfPfDrqYZ+Fv5pKGoznub4oS4QT+WFPtU8oA3FGGqfiZmN5mcEYIjrgi
         yvUw==
X-Gm-Message-State: AOAM533biczKCrwvZvyqZRvinDfOnmHs5SLt/Ip/HXQjrRpQyvZm7SM/
        huUfqW80GlZxdJhedO+KPDwNdQtZcTJ24QFkX+P/EA==
X-Google-Smtp-Source: ABdhPJwyE5Pwlo7lg3lv+YfgIIcizMkHOnJ9VRbyuQybrBvoxm978VmVGEuiGExsFZOsp0nqgoIEw1WC81MDzx7dkew=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr2067175ljj.293.1594904895506;
 Thu, 16 Jul 2020 06:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200713154429.23662-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200713154429.23662-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:08:04 +0200
Message-ID: <CACRpkdYvx9o_U2-PX-s7a8VPVJr+dNJmtdi7K9Qtnt1RGfH2+g@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mmio: replace open-coded for_each_set_bit()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 5:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use for_each_set_bit() instead of open-coding it to simplify the code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Excellent, patch applied!

Yours,
Linus Walleij
