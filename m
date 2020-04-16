Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5471ABF6F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632907AbgDPLf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506401AbgDPLfS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:35:18 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AD1C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:35:17 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id r17so5336144lff.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KaAhukMUIHoPJmiet8bQ9He9/igYhmROF/7nbgT3NNs=;
        b=VaA8N/yDV5gUKBF5azwBtgHkrXp/cGfGUNE29vNHgk7uyXpKQBkJSzymfBO5T5yfy1
         aIW/Efb9Py59WvBfFHkF6YUvNe6Tn9nxH3QHSnbo+Q9ycdl227TVI5lUbm+oiGp5i8dA
         PqZtCrFqqOmj7p9TkmQXg3RLA8JizGO7+rleOXOFZFTThlhpsiGrR7gwL2t78/ggtA6x
         4gSjPkEq7GVeiz/ce36nzJOzg8Z7vylxL39EumAWakC09+XIw8bc2OgcpB3NVkwxovHk
         xua8lLAnwetlHmTpbq8I+DS7qlJ27bgm+3jr8eamhFykzQsgrBMZSE2ZNRq6St6ghuPc
         1j7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KaAhukMUIHoPJmiet8bQ9He9/igYhmROF/7nbgT3NNs=;
        b=KHGvMgq3niV6T+nah+wUXCc0QC/2h9LTqghtBZEsXtlNrP+frNe9iEVSx6OsmX0JDW
         WKFsT5jrIaXZz4Zb/w7roSdnbLuSzSLsenTyEUe6sjHrF/YWO7sNWG9PP2GCFfyiN/9o
         lTVQeBLhddCufznO8TQDWz8cIowdl34/rk1DOOuiik4OxslkvYgv6RpalJ1/GCGLBAlP
         cAbvm3zCjsohBk5tseGQqf2+j71tDeQvjzt550Rc09EVjw6Z34jNDkpCpBLCPROMCrmh
         t8sh7MZFBg9Xe/I/t11YXnG/tx920giB+a9LxtpS3hwIjt4VXQV22dnQ3E99vM3+H5Mn
         Hqxw==
X-Gm-Message-State: AGi0PuZkxW/dzbgqROnGHZT1dvBfMtBhIiJA4kLPUMRkGJBYPl6lBm2Y
        4uIMb/qo7Og3BNjZqFFwhjF3/KvjEbRct88lrTOrJw==
X-Google-Smtp-Source: APiQypJmC7KgFV1aBCIMoLEemCJAeJyegX94Nx9H1CIZ7FdkAQVcBfWABrRgBI2IN4HJjyXehe8cuD+DW63+70AOJTA=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr5891623lfg.21.1587036916039;
 Thu, 16 Apr 2020 04:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200414161338.3025-1-andriy.shevchenko@linux.intel.com> <20200414161338.3025-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200414161338.3025-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:35:05 +0200
Message-ID: <CACRpkdYpQC2xMzRXcm8v0LC7NB+47txJph37YHjUw9Vjw0b2bw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: lynxpoint: Use platform_get_irq_optional()
 explicitly
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 6:13 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no need to repeat functionality of platform_get_irq_optional()
> in the driver. Replace it with explicit call to the helper.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

For all Intel pinctrl patches I will occasionally review and othewise
just wait for your pull requests.

Yours,
Linus Walleij
