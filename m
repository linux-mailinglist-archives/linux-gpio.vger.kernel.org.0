Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6820C724BA2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 20:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238251AbjFFSpL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 14:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238911AbjFFSpL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 14:45:11 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BB71712
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 11:45:08 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bacf9edc87bso7505366276.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 11:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686077107; x=1688669107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0f2HXwtzZPOu2SMs3B1mSn7YTNWPbzVJ1Q8BJIRe3iQ=;
        b=A83iW40wCu/ek1ytLlTmsLhXBj6U+rOa1+tNlTUyFXHdLTSHpOxNJEZdlaEs4eDrTy
         wQ5+SeaERA498ZJRC3fNAX6yBRgALkT/6PEUYCUm8baZ3JtoDqFtoxHMTtNGbAJWN6BB
         tXFQHR8yvXw6omV8rL4HRbVIr4XWMcCXzZyzqqxeFQ1frfH166Bo0KTqliVTZzysmv25
         2KEQMebNF+8GNvhfgeBcJ4phUzq4icwOP63DiSUsEPjrPZfsY8GjbOhysiCFlST/+jgN
         xSL1xbO73eHT5aKWvF9+miiRrdye8izuSAyPoDo0sKNHeXlAY7Xa14EoSaz3c5xI1pVy
         ELgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077107; x=1688669107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0f2HXwtzZPOu2SMs3B1mSn7YTNWPbzVJ1Q8BJIRe3iQ=;
        b=HrjIn7J2QVhOMikotvSUK4aCyS5XPkT8aMHpXdz34+RQf5DpHFIsJ2+8YBqpnBi8rP
         Xw25b3uOtB8bslDrCLfmMgt4wHE29JGchxNB35x0eL3vGRemtaSvXPRnc0k8ueIuaPaS
         tbSZ5d3bP5xfCnEH0kUpTBranuquZdMDCCSEwMC+XczrNFAZcHAIf3gWi3bsv3/kJBxI
         8af8hc2gnzYqkMQaZqZyngMoJLLVjuxfzATWzciRQVK3ox/RFyZu2Rv4AfhCW6qJHPSA
         2ZwlaS2rHzvujIZ1DpTQod3QLhL/woT2IqSuTZQqlRQAMRLCsmIRkyPbNvtHBBD3BL9X
         JYUg==
X-Gm-Message-State: AC+VfDz75hQALinU3F/jVLTouj3Dyg8fpf3BvYzp22l9C4dQnz08iPBU
        MAS/GArxnyWSjE8v5u4GDGRXQPLBTPaKBRbVx+ro2A==
X-Google-Smtp-Source: ACHHUZ4+MgtBI155SVVj6TAoJSeiCWrPjWPUuzvphCBEewj1WdM4RRkNxKwQUZ/tRptVbz6GgSROWt5q331IR/Tg1/A=
X-Received: by 2002:a81:5c03:0:b0:561:baee:ee8 with SMTP id
 q3-20020a815c03000000b00561baee0ee8mr3344440ywb.32.1686077107326; Tue, 06 Jun
 2023 11:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230602162258.63853-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230602162258.63853-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Jun 2023 20:44:55 +0200
Message-ID: <CACRpkdZFwHm--KYxf+NnynPgKz_VJpzZnptTVmFpNxauZ3Pbtg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Do not unexport GPIO on freeing
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 2, 2023 at 6:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since the legacy exporting is gone with 2f804aca4832 ("gpiolib:
> Kill unused GPIOF_EXPORT and Co") there is no need to unexport
> GPIO on freeing. Remove that call.
>
> Note, the other users of this functionality do that explicitly,
> except one SH boardfile which doesn't free GPIO anyways, so it
> is safe to drop the call.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Makes sense!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
