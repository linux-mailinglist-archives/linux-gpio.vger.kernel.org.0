Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4651B743B13
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjF3LrN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbjF3LrM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:47:12 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C9B1FC0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:47:11 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-c1061f0c282so1721353276.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688125630; x=1690717630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgD41sFQsaYu8W5UCgn8kJ9blq5yagSR/C40/Pp7Pog=;
        b=y1S+dVpso8epoiniuW/LAESmbWn1pyXabyrJYQ6WCNLASIPFEz/IBJkKhiRU8e8bsa
         G1dkHLrY32RvJofQ1yJL7K8C4tsiu18w5+cn2IAvnnCqL9mVMp+0q4ui1WF7Q2pStzcQ
         gTfCyz6NbHgsXccabI+KKQscKm29eKMNpVJVbKvUIxy181V91vIL1nqG/zv8nD60IFWS
         BA3rXeAQMOFBSPCtQA0zP4ZggfdTANk4MuyZYv30w4OEu29rjRl+Z+Pxv1EmRZjBWFH1
         yDwnRIAy0qyiJVHi74A+wGnfx4uMLDOjXwxDkLXq5gu8b7pIxVyhcVo6twI/9sHo9YCz
         N8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688125630; x=1690717630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgD41sFQsaYu8W5UCgn8kJ9blq5yagSR/C40/Pp7Pog=;
        b=WWO/8GNRsdHI3w1d+VSpUxLjXmzDKFEuSHkgCgG2jSBQO5lWGxfgKJdLyGAxkzeDVH
         edA3njPRshJgkCW/VmsH7F/oB0RC0MIWLn28FM5cbSJkopPbrpYiD2c9tUZKqQbpG+la
         jzX8iVp5+DV+QvFdl/rCLX7XIXGn88yuL6x4DvLS6/d/3GwH8ULpuzQZlLymLlZTqlyy
         A8y3kivgeSUdLXMLYsCUirvPOb2ZiKg0qKUSNvtBmSn3CsrHpEOxyiP3GIT+yDuVz7ya
         xA9WdaIrL+/cdWtP90WIf2gcztrYsa6wgL9ayowOJqlGX15s7U9fAF8U+ZOAfMvYXfew
         NVDA==
X-Gm-Message-State: ABy/qLaEp01hrYYuEBIbanaM+mNs6bcmzyPiz4pjoCOBIZKnw57rR3EE
        S6D0FKT1yFUoXEAqvF1YfxPrd3B8SGOgM9ZWtYgdeBeBafoF2bnc
X-Google-Smtp-Source: APBJJlF4Z7YW4J7S+sxLQcF8aCNQPMUwQ0Tiz4jTY9TSgMJU7xkCyjINQvxgxi0hlNM4fzXtbXuW3zqpo5uscNpHmwQ=
X-Received: by 2002:a25:c7cf:0:b0:bd7:545e:ab41 with SMTP id
 w198-20020a25c7cf000000b00bd7545eab41mr2380041ybe.27.1688125630273; Fri, 30
 Jun 2023 04:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jun 2023 13:46:59 +0200
Message-ID: <CACRpkdaS8knozRzJbPdROPpdboVLwo093BCNd=DhydyPSho-8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpiolib: Make gpiochip_hierarchy_add_domain()
 return domain
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 21, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> As a preparatory patch and for the sake of consistency, make
> gpiochip_hierarchy_add_domain() return IRQ domain. While at it,
> rename it to gpiochip_hierarchy_create_domain() to show
> the change.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
