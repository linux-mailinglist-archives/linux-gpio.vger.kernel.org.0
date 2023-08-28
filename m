Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD69E78A676
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Aug 2023 09:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjH1H2A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Aug 2023 03:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjH1H1g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Aug 2023 03:27:36 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AC4139
        for <linux-gpio@vger.kernel.org>; Mon, 28 Aug 2023 00:27:32 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-48d0dbf4ec5so940185e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Aug 2023 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1693207652; x=1693812452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aAdLCo7+5NsyJy4woVDAtzriNe/Ar/+QNUBkrNNwNk=;
        b=sNMl2UDUX3JowQ3/XIWffWmHya5JO9YpTKjoq3J4anjxUN2AynbD5fBoqugGvh7GaI
         Up1+bihyzpGLtim8dOksR1ahR/JnBOrqoI8+RF5JZVW6Ojhd4QJQ3tngsThX7MgonxsZ
         jxAvSFq5qo2HKZ3lRXBsrvAUpu63EwkaMRLRTxUgB7srNhNWLk1nUyxhzzx8nojSE9kZ
         6iotrIbLyN07GquyYlSi2FIxqX6NH+JlSpbRjB7+s0q8rwuyrDew2QkV5Vrr+9dl38OR
         pyRvmeyGRn3dStLTw44AhUQPVJlrdBtMlBnyVaGR2eWyUvq1NiSTbWgPuz/HF9Vb6SZD
         MokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693207652; x=1693812452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aAdLCo7+5NsyJy4woVDAtzriNe/Ar/+QNUBkrNNwNk=;
        b=aMn1YTFO9eTB2LIiLaZSQWS89fMoq2gsCEPi9gb4wmKBOmBZty4C48xC8cRXGUo76N
         NMD9VYzKB09SDfQvSVWnvxtYYs0NRRWGfzir0qR4OIpYnYqKTN0zMgeV/b1TKGqhfFre
         KIR/IS/FGb9phmBf2wyw2pq7F1Z0/PIot034dOzwfE55FaOkeuigHen4oXJ7BAiOiwA4
         Oo7se3Ct5lvu6HyIIaZGXXRyNLCq+enodi/xEV4adBz7M8qT5h15OOcwacBFnuF2Rxl8
         VK+VBGhdU/viGdrGInYGsuqQWzRUulCZ1aYjhtEV06lUxmNp7hfmwxREGzgwXX9PhoC3
         rT6A==
X-Gm-Message-State: AOJu0YxqXeLYahMyfBp11y5rf06uzZoZo0uIcBo21WP7mTWLYr6Co5UH
        e8dtW1lkXehnOPJM62Yfbk9oZQvDI6XsgAh+ktux2g==
X-Google-Smtp-Source: AGHT+IEJylB1pZZ8U3hYbqpKHzzVTBvaaWl9vXTK7SDgTsScgcGSwsEgavbn7vGuUKghrUmhND4cgC8KZjPVxRypeBU=
X-Received: by 2002:a1f:ea84:0:b0:48d:3933:f545 with SMTP id
 i126-20020a1fea84000000b0048d3933f545mr13641569vkh.12.1693207651895; Mon, 28
 Aug 2023 00:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <1693091643-20867-1-git-send-email-wentong.wu@intel.com> <1693091643-20867-5-git-send-email-wentong.wu@intel.com>
In-Reply-To: <1693091643-20867-5-git-send-email-wentong.wu@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Aug 2023 09:27:21 +0200
Message-ID: <CAMRc=MdfUuq3OePe9suXpFnE7T+A8_MYZmFX8Q3rHA4b4mYnFw@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] gpio: update Intel LJCA USB GPIO driver
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, srinivas.pandruvada@intel.com,
        zhifeng.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 27, 2023 at 1:15=E2=80=AFAM Wentong Wu <wentong.wu@intel.com> w=
rote:
>
> This driver communicate with LJCA GPIO module with specific
> protocol through interfaces exported by LJCA USB driver.
> Update the driver according to LJCA USB driver's changes.
>
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
