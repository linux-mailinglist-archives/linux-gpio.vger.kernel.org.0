Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5C5609C5B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 10:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiJXIX0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 04:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiJXIXA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 04:23:00 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EF952458
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 01:21:13 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r14so28314840edc.7
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uq7xS/bgky9LCL9H5rxZt6mCRc1TVmbrTKZm+HAzH/k=;
        b=ZO8ywbAValoX0pzpZbXx9TEH8+lltaV8XZ30i6pSSzNX/td9sizTdSIIA9K9B9iKFA
         rdPTOGVFAO1hisgo5wcVt+uW1dKz5EkOXwY2cNUuxpEizsadS5Yif/qBAxclR2wI8w8+
         iOXV+qC4GNiuXKrZtddNoJor4i7nOBs7ADVBza+baKQK5m+2f5ZyMDS/NxOgy/a9gIXL
         1Cu0QvlybZdhsFXRWailMqnzSrKG04Z8GSn2Kvr6yCRX8Am1QcULXTHEAvSx7EV6a90G
         M1NMNypuKDj6xMeGpnUb/w8KB2+DKGTce0N+JJHWt3RDAD68VBirBGc7ZeztoD/ttOXR
         D3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uq7xS/bgky9LCL9H5rxZt6mCRc1TVmbrTKZm+HAzH/k=;
        b=3UtlC4M373ayJCJ4e3CnvxSZXwDsiSmje7MNnpaDHgXio7klowpAJoTGyNX1b7rHBb
         eqWh6CCMCTG5tzvobX6Yz5qsQ6yo8okBsk0toQtW7cKCJEJPw/5m4nLhFANtAIVJZ7xf
         H8AQM1p3lLv54mX3ubjlN4cf+a+HqqfUByVT1zKObaMidrrUc2dEQQrvh2fnasan5Ovx
         iRqxN6wTm1GxwAeURMHxLR/3a6qtS2tHCM2aKTAe4rDRKtOjsUWt9/dw5Y9eAfomLlK4
         lU0T6btCALt+4FjWYOdA14br1fP14ZhYKF0KxFCTzYkMNeSDzv+7YGLx1iDgwphi9GEZ
         Q44Q==
X-Gm-Message-State: ACrzQf1sXJX8FBiSJM6AkiW13Xrm4WqxKr+JrivSPNFQtM4ZBMYCC1Fo
        6PF9lxomc3grUGsmJkheAes1rBtdyzrr9Mati/bOEPcDd3o=
X-Google-Smtp-Source: AMsMyM63YLHJ4B0LRPCZUQ4L+2n5KxSY07BVH9TD290GxhJ/ynlrwjeB4kFeLHb88H4yeNQF8pa3L/m3X2yWambahYc=
X-Received: by 2002:aa7:d385:0:b0:461:8cd3:b38b with SMTP id
 x5-20020aa7d385000000b004618cd3b38bmr8827244edq.172.1666599671670; Mon, 24
 Oct 2022 01:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221024080828.3840438-1-jk@codeconstruct.com.au>
In-Reply-To: <20221024080828.3840438-1-jk@codeconstruct.com.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 24 Oct 2022 10:21:00 +0200
Message-ID: <CACRpkdYEVHR0LCnxn4q=6Ccvu+vWOzR5XwAoaEtPURkubz71wA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ftgpio010: use device name for gpiochip name & label
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 24, 2022 at 10:08 AM Jeremy Kerr <jk@codeconstruct.com.au> wrote:

> Currently, we use just the fixed string "FTGPIO010" as the gpiochip name
> for ftgpio010 drivers. Because it's fixed, this means we cannot
> distinguish multiple ftgpio010 devices present on a single system.
>
> This change uses the dev_name() instead, which should be unique between
> multiple instances.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Fine by me:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Out of curiosity: what device/SoC are you using this driver with?

Yours,
Linus Walleij
