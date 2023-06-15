Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48FA4732038
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 20:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjFOSyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 14:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjFOSyG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 14:54:06 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF341FF9
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 11:54:05 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bc379e4c1cbso2188343276.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686855245; x=1689447245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwKA0mI6E3ECHuSybdmXbxPH2E9QmacoEa6v9Pwyf/g=;
        b=NMwcqpA9BOG0MJwES5ZLpsP4ZHAfV1x2QcFintJUrxP4HqtBRpcJy8y2RdqrOXu6NN
         +GDQ2/+IGQLyajJuylDILzO1kYeYVNqmawq7NHzxLekntEV0L0DxULD8OFQzJWJlsaLP
         5Clin/GUtI/6RnJfIVvF8SWOx7eoYrbW43RQjvqBFLmJteMUrOZCv6Fq9I1pdCWJayKU
         Vb2quLe5s3VRKNnsPYEsizFJOAFIAnd+si1Shnh4MYp6+kcfQvdGm+VnuE8h67LPHDtR
         9eGarY7Ei2ZRC54PetprjhlxjR0SIeK+YIr5txQCeYzsAcv7QqhhVMZJEQFKAadciMGR
         5/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686855245; x=1689447245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwKA0mI6E3ECHuSybdmXbxPH2E9QmacoEa6v9Pwyf/g=;
        b=G3rZZxCS1/SHb5UBO4RGzp3WOJo/jE/aFE/5pMQG6lgFgwLgTs5AqZtOwJ8xds7wgg
         TCojjeyVEbJunjuVW4KXN8Hij5lIMS4fFQ+CPM2Q7WlnR6jSwYeWUZAJFF5VUNRzETIZ
         dZsPWhetIGGY8LXKlBzlsxPqyp46xthgFFOJaZfMrlAPj4hbgpZ63h+gmwrITNv19BYM
         N80MdlQv6tm3igMR7SHa5KGvOmJjJfCV2phLVFA49/X/Y0HaiRNc+0QXqblA24Hgp8Ts
         t2YUFO3EGHAtDhvvCD/E5C209fTJrIzZQ+1ebrSQW3aqJdaRy96xxE/ML7FIMxms1Lx7
         CFbg==
X-Gm-Message-State: AC+VfDzImgm0kPTvkfzTWvUbfEjizWczaZX4DjItuuXGEBCPaerwRpGT
        9Lv0wD5lUZ0UlGmYMXo0EXum7dOSWBo9mtLTv8GSFQ==
X-Google-Smtp-Source: ACHHUZ5kbh49/R4F2mM4t8uRVbSyFW2gntjVuHyPDdPfd5ksCF8QfK6xH+kB4xDbHBBbYwHEOy81mQdszL2NzWz30y8=
X-Received: by 2002:a25:e086:0:b0:ba8:3613:76a8 with SMTP id
 x128-20020a25e086000000b00ba8361376a8mr6826471ybg.41.1686855244870; Thu, 15
 Jun 2023 11:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230615162612.21487-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615162612.21487-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Jun 2023 20:53:53 +0200
Message-ID: <CACRpkdYFu=RP1ikbTXkW1TC-pgO-FGdgdB2CUyLLbkFc6Dcn_g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: xra1403: Remove unused of_gpio.h inclusion
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nandor Han <nandor.han@ge.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 6:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is not and shouldn't be used in the GPIO drivers.
> Remove it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
