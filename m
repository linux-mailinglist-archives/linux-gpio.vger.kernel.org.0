Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59E466D128
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 17:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbfGRPag (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 11:30:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34648 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRPag (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 11:30:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id i2so14082119plt.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2019 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=enTxUkUzWwDVJKls4jnHiVkcuCVL3Z4nxXwF8v+fVOY=;
        b=MWl276meOjKDs2ZS61poZVM2fiDXKc6ShVWsOBZzjVtWKusvdwhSesvk7MvjqjkoyL
         g1rWRtaUPlMy/4rS4zBg1y7kfjnCaxe/N7x5YSaEwh/xVHHkACf2EW3e4Qx1v0E6NogR
         zXri1kaUUKJ9QcZk/OmRUkOalB6Cb57IwqzQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=enTxUkUzWwDVJKls4jnHiVkcuCVL3Z4nxXwF8v+fVOY=;
        b=nEIf7ivcv7I/rP9ZucAK4KhRhSdcuyrHzt+6cJH08yIPMT41CjNQ2dPnYw0LEZTclS
         h4RV+JyAXY+Qwq+dEl/7/nT01orBcqaAk4zYLdLo+uzmgLI9bkP/zbDDphZsq/fKgGx9
         9FkYG12HwyC80Pnn3O/ucke2NX9DsPV1q2QkZZNSL6CTxnL80IiMh1f0I0T7UNq6BYUc
         PZ703aDz3v+IRHzSfLRMY+7qPj2rUk7RBql8/DS2/H5LhPQFk1qQt6l8bu1QPr//BtEU
         AIjtvBSwonfPGPF1RFNhPwqhbfOwl16EJJWt7iPozn0KKUmbVynLW9tRctKnKyvkI1Ot
         QcvQ==
X-Gm-Message-State: APjAAAWw+r4klCTeWxB8oQEheilCUAAGV8puSpNLbra/zCbRgdxjxM1I
        mNnDzthHo/OjNi+qsfgglHcegA==
X-Google-Smtp-Source: APXvYqwwHOdtFI3g0e9QUZENq+nEdLyWEtPqwnAB8Ja1AUOSKTg5KC9sGrRwnscxa+7h15LnEJpM1Q==
X-Received: by 2002:a17:902:26c:: with SMTP id 99mr52459455plc.215.1563463835657;
        Thu, 18 Jul 2019 08:30:35 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s5sm2217471pfm.97.2019.07.18.08.30.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 08:30:34 -0700 (PDT)
Message-ID: <5d30909a.1c69fb81.23a02.413d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190718065101.26994-1-yamada.masahiro@socionext.com>
References: <20190718065101.26994-1-yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: refactor gpiochip_allocate_mask() with bitmap_alloc()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Thu, 18 Jul 2019 08:30:33 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Masahiro Yamada (2019-07-17 23:51:01)
> Refactor gpiochip_allocate_mask() slightly by using bitmap_alloc().
>=20
> I used bitmap_free() for the corresponding free parts. Actually,
> bitmap_free() is a wrapper of kfree(), but I did this for consistency.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

