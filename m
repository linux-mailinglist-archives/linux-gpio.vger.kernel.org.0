Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3522925AE
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 16:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfHSOBW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 10:01:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34581 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbfHSOBW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 10:01:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id b24so1234504pfp.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2019 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=F7cpkNBFx5xI8+VlOismPhtrQ5hpus/IZj9fASHsXMk=;
        b=JU855dzAkwqT1H/3BG4zjhY11jGbS9PftsV6YBi4NEDxMc/cyHOiZxstQTIEPdBs/D
         px4XzAmMqIH+epMx9Q9/I/Tj4siR6qSFje5XrtsMzPHDlj9VNSHTX16cWDS1TBNjYxvD
         6gKP/m3VIZ6F+GD9oBFrvxgfasAD9ShWYTl/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=F7cpkNBFx5xI8+VlOismPhtrQ5hpus/IZj9fASHsXMk=;
        b=jVjl2eRTt57BwtKVK7aUy+h8fC2sywmUy+UdBqQNu9F5Xr6Fkn+1mbWVzQWTKCTZQw
         wRXklpvMXnvN136Y3B1TlQqATJjdAvHpStYYEsVTWBsgZszrH1blq3QBFysktWdTB1JM
         ODN+J8NxujNuqSxPxNc3xOFEYpjyYt9SgnsEDLWpXz9dyep/8nOUzPL8VPfosRC5cB9b
         2fV/lkBYaXIP/0hHdDp1k3uziwkQJp8j/9CozValLxBv/Zpg5i+S4F3b5vrLC1tHTZCb
         YctzeBkBSs7zL06hGak1ACfU0BwpN6gGzmbrS8fIL8ZA974ZTWC8igVyeMEm0FkcErQA
         wZEQ==
X-Gm-Message-State: APjAAAV33Mfgk5p5jr5kUm/cf+U5YRM43i2Y+FjV5ojlW+h5nk2qjBy7
        QAd7cScbpKBlKPSm5V/JyDJ6ig==
X-Google-Smtp-Source: APXvYqwd2MJPQXgPfnINl1zrYEAsGlaRF/1z/0BEQQvDiTLDS/Ut4D3ajYmeBSpGrNzJXUWRj0iCew==
X-Received: by 2002:a17:90a:e28a:: with SMTP id d10mr20993767pjz.107.1566223281613;
        Mon, 19 Aug 2019 07:01:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a6sm16857646pfa.162.2019.08.19.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 07:01:21 -0700 (PDT)
Message-ID: <5d5aabb1.1c69fb81.869b6.c526@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190819084904.30027-1-linus.walleij@linaro.org>
References: <20190819084904.30027-1-linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Pass mask and size with the init_valid_mask()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 19 Aug 2019 07:01:20 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2019-08-19 01:49:04)
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 7f35c196bb3e..a5d8f75da4a7 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -593,24 +593,25 @@ static void msm_gpio_dbg_show(struct seq_file *s, s=
truct gpio_chip *chip)
>  #define msm_gpio_dbg_show NULL
>  #endif
> =20
> -static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
> +static int msm_gpio_init_valid_mask(struct gpio_chip *gc,

Please leave the name as 'chip' like the other ops in this file. The
other uses of 'gc' in gpiolib are fine though.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

