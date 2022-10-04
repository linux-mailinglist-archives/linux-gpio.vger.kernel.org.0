Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDD35F4239
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 13:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiJDLqX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 07:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiJDLqW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 07:46:22 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13C5D64
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 04:46:21 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a26so28273493ejc.4
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 04:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oORNADYw2Hs6SXVF89SHeppIwMC8xyCVRPn/dcMDta8=;
        b=wZWjblKQl0aEUQB+vsRy3d/uRWWMj87UVamfoB8EIP1aQgI2xKg4PcftQkrG0xBw55
         3m5310nYhRkYhBm+1K+XqA9RLDCtm+4gXWbglf78SWX4z/0AgiIK3cvTNlPHINt8RkXy
         6TOStrr2gGBaIAo5w/UDRMc4USsUm1ygbSnY9byqcb6SJBVK+i62NNhfV276hJl+Exzm
         XzvgEyn6ekFYzmoO4jfu8QNcrZLD9MbO+g7jg+SfjQejp/p7v8Er31pJ19hTt9aY0d84
         YOd/OCCoWDwbZ4keWrC2tGNMy4ufJdh5w7NZ5nbEun0ddCh0aMPaGF8GZeiuM2jL4jMv
         ajAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oORNADYw2Hs6SXVF89SHeppIwMC8xyCVRPn/dcMDta8=;
        b=dik2JquHBUP0LJYFDIhXod/UVhQ6hwEeSUJvbB1J1KI5Jyzki5dWZ3LORbRk2KN0Hh
         UN3gp3U43mjmiC3ihswDvxSAM5lw7jYFBva5WaFfm4ketIWkRi/veUqpVS8eC4w8y9Bo
         5Ts4gGpH6fgHzaX04JA8sgi1rvl9+uJsSWqVkbnnKkpJbjczPYynB58I+wVbjd9fiaR5
         TYwpTOiGieG86Oi2YA6OVcsZvRtSdFV0PBQXav/3WbZBSY6+oxPoWMck1oHy4Dx2WBAv
         EYYcy4JHR2bUJrCuy52wWSo+qSZgiIc1fRb4KwFQzmhOULG0pY+ScTT25gg/XlcoBtYs
         djCg==
X-Gm-Message-State: ACrzQf1VVUQ0fQwOqOdF4nWb9SMMrGDGjZkCW1i6qrWHsClnAbI3ZdZ+
        A22DPA6ySJnmeal71b5fGwwMo0jCq2Ihtud2mydMWA==
X-Google-Smtp-Source: AMsMyM6Rl8AvED4hTgT4ckn9RdP7PY+Ahr8aGamCW4ge3WsJ6i9dOd1oT50zsTn5swY3Q+E9I7UEGLnLchLwdXv5+sU=
X-Received: by 2002:a17:907:2d0b:b0:782:76dc:e557 with SMTP id
 gs11-20020a1709072d0b00b0078276dce557mr18020112ejc.690.1664883980452; Tue, 04
 Oct 2022 04:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220925021258.1492905-1-yangyingliang@huawei.com>
In-Reply-To: <20220925021258.1492905-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 13:46:08 +0200
Message-ID: <CACRpkdZijkQAT84mfP06SgxBjHmrqSbWwctBBA0pvb_1xYzGvA@mail.gmail.com>
Subject: Re: [PATCH -next v3] pinctrl: ocelot: add missing destroy_workqueue()
 in error path in ocelot_pinctrl_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        p.zabel@pengutronix.de, horatiu.vultur@microchip.com,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 25, 2022 at 4:06 AM Yang Yingliang <yangyingliang@huawei.com> wrote:

> Using devm_add_action_or_reset() to make workqueue device-managed, so it can be
> destroy whenever the driver is unbound.
>
> Fixes: c297561bc98a ("pinctrl: ocelot: Fix interrupt controller")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v3:
>   Using devm_add_action_or_reset().

Patch applied, after deleting the hunks removing .remove because
that was already gone upstream.

Yours,
Linus Walleij
