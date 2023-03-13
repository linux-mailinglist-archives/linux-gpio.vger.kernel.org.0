Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234C76B73EC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 11:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbjCMK1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 06:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjCMK1i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 06:27:38 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D659B53722
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:27:36 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-541a05e4124so44875697b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678703256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l6bU1pbEudUUUByO6PSRSXVLcSCh5cB1ayRcZBq8Qto=;
        b=w7Vu6wdnclghe1Pr+RjHXgcKfadgjbEY1DQxiD64bHT+ELCTmz8FBjd+Hrxf4+zA+5
         PvQPONfU25qa0hs9xFufFC7wwLEH7hWisWBKm4AhwlbCiDC89GQFrx9mHb2mfXy/irT+
         YAY8wiLM4lpmdkpIfYlOaVLTDS72kZtzx8mBY60r1zSaErZq2gaVAQk/RG/EK5xWrgxO
         8s1EvCnT5E/nCCP5r0I471h81OmNo0uB35kqfCj+1IgLt9Ksg1bD63E2EfYKVd03RBMf
         fx6ki4rJOq23KB4En7mSgkoP/4Oq+AWexTXSV8/i9ah2pl1fnZAZZOYqkL4g0BE1wxJH
         064Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678703256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6bU1pbEudUUUByO6PSRSXVLcSCh5cB1ayRcZBq8Qto=;
        b=E/W2Mv33nRXJjEOD0a9DZYMXBstJKLPZLcwdhGmEakWed+ejpqcNCIHYpRTuI9USlg
         1qsi2vnQMHvUJqiQYZo8a4trptqSo4LquvvhjaTweyd2J8v1NgZwjZqIV7HQOw0p4nS7
         6dx2oYl//7pDfgIY4NBzRUC69vILbqA8goPlKVgzi4aMNID1xrBkrVSsG1xvKuuiRLmq
         +DPz2LKI5ydLhkM5sAjdv1zMccyf0VZMXjQ8X5ijEKoJdVQ7WiSkc/FdtGW9UD8dNQd8
         se13ZrNAw0rfnwmt2UTIY9BRV/JJvYw1q78V+GtYmj8p1fdOFlZycoWrkyEj/WBhWLjj
         3mxQ==
X-Gm-Message-State: AO0yUKU+sRvO4yA10lnfd8g4ix2iwrk0no3NomkveTZHPZ4GyJ70wHIC
        VSyVJWc5nV0BGQCFTIHydhFTMJn7bHRzB0i6Nrgm7a2VZF2Al8yL
X-Google-Smtp-Source: AK7set/Nm5tJJWoMnBZcF+CkV+A/1HE98IrzrQlM5/Dtox1CwdT0O5RSeMxOp2bYSJmo9131/F8NNwhWC+7vrAeojcQ=
X-Received: by 2002:a81:b665:0:b0:541:8285:b25 with SMTP id
 h37-20020a81b665000000b0054182850b25mr3758930ywk.10.1678703256085; Mon, 13
 Mar 2023 03:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230309185819.85050-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230309185819.85050-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 11:27:24 +0100
Message-ID: <CACRpkdawH6LCHwDqiX_Tg4EiWOq0GEPj5Fis9c+o82jnpenqzQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Use IRQ hardware number getter instead of
 direct access
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 7:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> IRQ framework provides special type and getter to transform
> the Linux IRQ to the hardware pin. Use that type and getter
> function instead of direct access.
>
> While at it, amend an indentation in a couple of places.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is more elegant, so
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
