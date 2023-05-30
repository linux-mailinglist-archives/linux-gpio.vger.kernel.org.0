Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B62A716047
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 14:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjE3Mpt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 08:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjE3Mps (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 08:45:48 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682E2FC
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 05:45:18 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bacbc7a2998so6253965276.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685450716; x=1688042716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79R19rYlxuprBJRyr5z/YlA7zoEUwbCIoncrtvpWbd0=;
        b=GR7hEh2u3m9oNv36D5Dzgayz9bGii0ew1XKwMOjvdDBDXdPtfey1hM/jCCCHd4yZ03
         0fBnYKe1tqtjRBQeVT9YOB6MRADJIvVfeyCu+M62uvB3oqy3H8Y6Lt47MDNK+FXsAZ+o
         4Fp6Vpl2iCoPuScZG++LVYhn4+E9R29d74IKtUdnh4bE3Rz4vXTXo3ahdX8BKdDu2EcT
         IDc2oQZmI/ZzCmI4XZQHC/ukxIMC8cQ1EKnFwllVkhw7ns3z5YhlEY5h8MPTxUmZQxat
         v+EQwOBQrfbUX3L/fifWsZg4j4BfZAbf/QZN+Pn4LABJokHJSmyEb/VcCr1AK/fptCQF
         bSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685450716; x=1688042716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79R19rYlxuprBJRyr5z/YlA7zoEUwbCIoncrtvpWbd0=;
        b=TUuiaYk2hBEIrSgPsfyhT/pcMWBjmclW+UTDZkmGEnS97Wu6XdWhh3m3BQ27Evk+bp
         r0H6KNkko52nMgCFOjO/NtOjGldjrAmwjomxywFfSm+kGdFLR1tgq/pYFrqW4lCvhK4e
         3mZ2RlsSvR/GwGOUK0e9QIqNaTeGDl2+/YwtDHh/K6LhQR7jsO3Kij+CyjFh2/GQmFs/
         SCeFackUvTvgCZmmj8oY1p0DqWaVy1tl9S6OBAstgSEMjBVwjrj3jQPaLrrjDMIG6Xk+
         3Zt9F9y6WmBct776js4tV+vhp3ylLpTeoKGQrCoEcJhOQkPwK7qRs3jyk4A6r/CZwEHl
         Dc7w==
X-Gm-Message-State: AC+VfDwTxJDP3OyJ3m/HR9+i9O79kGYWvMfaOht7k8azIAWw1nPRwoEY
        eKtDMoBNR0cZTj2kiklOgCySv+ndFToHjXpSWkVfFQ==
X-Google-Smtp-Source: ACHHUZ5IF0zxpXfP+MK5/l8CKCW0KkcoXfJuyMyMb6GIoIrCyCjPNNuMb7I1dbl6KbQkfIeKFWhqVkrt/krStXPZs2U=
X-Received: by 2002:a25:ad4f:0:b0:bac:f602:52c3 with SMTP id
 l15-20020a25ad4f000000b00bacf60252c3mr2638406ybe.28.1685450716419; Tue, 30
 May 2023 05:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230529221446.87785-1-andriy.shevchenko@linux.intel.com> <20230529221446.87785-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230529221446.87785-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 May 2023 14:45:05 +0200
Message-ID: <CACRpkda0Dak-jLLQhWZVx+5rCUbM8TtiBd==uJYXbTG9C4mcdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: Kill unused GPIOF_OPEN_*
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>
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

On Tue, May 30, 2023 at 12:14=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no use of the GPIOF_OPEN_* in the kernel. Kill it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
