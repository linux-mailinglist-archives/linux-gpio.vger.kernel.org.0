Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC8C79C892
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 09:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjILHuX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 03:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbjILHuW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 03:50:22 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884E210C2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:50:18 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d80121cba8cso3678443276.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694505018; x=1695109818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nIMhi3InVNLVngXoJNUnmobt2FTWHyrmQgIQ0m4PlQ=;
        b=Ln03ZSGYlqC6wx9XDMgjLa1lMczq5y/s9zEPKMz2ISP4WdT4P4V6SdXeKjz3B7mFv/
         DiMiAIUCllYJGoZKa7hQE+jOeLcvAEGgUQ9us8xa5Whp9kDzk7OgPo2p2N+5mijHHJlF
         1vPh2/nqdVdonI5zKiMTAkDgiH1DYlmSHOJ4ffsu0h2uYUQSt1eEGmQMhj/G9xTyZT4e
         tU5YHJIMMfop9BYcSXHDa+II5Lq4reP8yrDfWl2MqnfMu3fzJ3+zLXkeItuWPPGNRSHm
         megJLPe0Z7E1Ms14U94tDli8QnJLdw2CHematrXYO7sV22jTuW8wIpx+1EuEqLWdONjA
         bNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694505018; x=1695109818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nIMhi3InVNLVngXoJNUnmobt2FTWHyrmQgIQ0m4PlQ=;
        b=WErnSkVhfJtd05H6ukZt3YsonguMu6nDnyYDh3zfeV9pO38bcWQeaEkqXwOaMz2BVx
         JAx1fW4IHwRM8Ps3dAzrrG65oeFZbW+1nqQw9QEJuQ12fZg3Ox6LXZ2e5avWuC+kFY2e
         f87OXlfPdemUycJx1ru8ZYtEiW6QZWjCYNGyLEaeMMiaDiSYphzlKHMmegEe7be2BtZT
         r2hjctElsFhBZmiGRbvIHTnzF/PcDq7MM8ODDSbaz4GGwPfpG93ojxSZA05yEGNea7Q3
         VQvvtwkWzPyqbs1VjytY8pYa/b52BzyLWkiybTzxICOD0YP4Ui12up/YUij51qTWYQL4
         cadw==
X-Gm-Message-State: AOJu0YyXQ6DKI8V1de3jQa+NWGmcArZimAqIviYodKFwgdv0UJlCHCeO
        31iFMiJQxUtiIAr8+dphIb5pF18ulRshB2T5Ygamyg==
X-Google-Smtp-Source: AGHT+IGB76quZ2BumgLQpY5sqm/yL75Y3ZBYaOXvKSvHJI5t1FoNoJ2RrrAjGAqgjLNq/WCussV3rJc85yOob/A59P4=
X-Received: by 2002:a25:6b02:0:b0:d71:6f50:75f7 with SMTP id
 g2-20020a256b02000000b00d716f5075f7mr10660463ybc.63.1694505017686; Tue, 12
 Sep 2023 00:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230901134041.1165562-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230901134041.1165562-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 09:50:06 +0200
Message-ID: <CACRpkdboT46oadZJZTde=ze2vEvC9aUGjO5-MjDdVwCNijFqDw@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] gpio: pca953x: Drop unused fields in struct pca953x_platform_data
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 1, 2023 at 3:40=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> New code should solely use firmware nodes for the specifics and
> not any callbacks.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patches look good to me:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for all patches.

Patch 8 looks HTML on my gmail but I guess the problem
is on my side.

Yours,
Linus Walleij
