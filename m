Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E56F7DED5C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Nov 2023 08:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234433AbjKBHbm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Nov 2023 03:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234486AbjKBHbk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Nov 2023 03:31:40 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FB4181
        for <linux-gpio@vger.kernel.org>; Thu,  2 Nov 2023 00:31:34 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7b3d33663so7892957b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Nov 2023 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698910294; x=1699515094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwj6+GtA47RRH+wYz3Zgvge0io5h1zQITD3u2rEHtJI=;
        b=L49wgFWH/ELLRFqvDNDVhoiDh+Uges8MC5IvmmvtO4mN9gCob4PZtyjh2YoFQmW9JD
         ej/mU3UqGbZPhXOgh+rhaaDpaaNFT+N3o6iPLqq+WX1wKMG2zmMSdoE/MfCwoI4TndX5
         0pBQzG295Fsuw+S9aBRfKJ6VIWxoDX26qOOVJhYAN3C3AVZagd3B/bMOTp6y+PCPKOcM
         rVi2+uPnqEx1rs2sO/MYqdNskmjUqdH6dJ70+duayHneNIalJENrmEINk9+q1jwGaKk9
         zoRVfsBZ6srwdTVCXoCCjB7LWKkh4hToCtY4tuWTHdVvdX1uWa3+oTHAKxuSlH9yGHfU
         Zrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698910294; x=1699515094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwj6+GtA47RRH+wYz3Zgvge0io5h1zQITD3u2rEHtJI=;
        b=MRa2Jd7jv/zvUUK1/jM+5xQw0TJHxUHPdJrRpRSqvPQN+xJiMKYS+IwpsMqNPkkU6g
         UqRU5D9K2rTYa5ykL1MOb4806K5QyHSvnvPDwexbNFUbNsHKfX+v7PiAggvA15dgOyGw
         6Uojoh00zjId80L+ppO2uaoTtkckwPwJ8P79uvh/GDlxVx4hWWVZUaRB3WGGeNdpp3qC
         jIgL3goU+ou8VnLXhkzQmfh+x/RczOJsyw5sM6CaSLAW/LSyGJ7ybTXY9DMXZalafcmK
         z3XSKV/D3rhLaB6xm5boNH4guxcSBxxgGUnkxG9CD1lWBmQt/Wq736FW18E7DLkfZIt+
         rgoA==
X-Gm-Message-State: AOJu0YykVCZbES1MLD3XVZqFIF4qnFQVu14clceQiP0z5Uy8HcHuOjD7
        r9tvhcEiU4ueygQ5jVW3HrOo4VFJq9hztd1arw2SZw==
X-Google-Smtp-Source: AGHT+IH+NUUG0XHneVHCm6tOaIiXE7bLdMbOq9IlVeJfu+oOsulbis7xCvD2FQCJHMumzvS1Gsxeq3g+2s6BviXHxRI=
X-Received: by 2002:a81:431d:0:b0:5b3:46f2:fbd3 with SMTP id
 q29-20020a81431d000000b005b346f2fbd3mr7207455ywa.7.1698910293912; Thu, 02 Nov
 2023 00:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231030141404.3242102-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231030141404.3242102-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Nov 2023 08:31:22 +0100
Message-ID: <CACRpkdZvETetEBwnZB2r28P_m07RhYWD4XQP7Uww4B9ywfi5rQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Enable 910 Ohm bias
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 30, 2023 at 3:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Family 7 (I2C) supports special bias value, i.e. 910 Ohm.
>
> Enable it for configuring pin.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Neat,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
