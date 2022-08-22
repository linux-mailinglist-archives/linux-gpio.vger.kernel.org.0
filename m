Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA9D59BE70
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 13:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiHVL2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 07:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbiHVL2m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 07:28:42 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACBC10FFC
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 04:28:40 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id d21so1187046eje.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RILhH6Aq9u12AHXrJLapVf/35ykvKgXZJJKhDUJ3u5o=;
        b=W/FLeb+GN/UehRVpHTVUl3UWfEaP4LnB1oyOCWYS3tUzt43GdMgRFKogbJL7ZyFvpF
         QbhKRwjCvxpZqfapq8M8QbKjv0NDNTRs+xo6F1FSw/pUQtHppxwGh3pYGTh4PZ00g0IR
         eyynmLwtdeajoNl4zUfaZnL166+WdYZUzKF7iYxMlKQ/6KI8spXmN1cvFlFZh6BUIWJz
         0Epw9Q4bwqe+QbZ9KNvLFPd+O/HauG5nfdywKF+YUck869jCfl1c+k5qKC0kEojyf6rF
         XeCvoAGFCrAtawgmoXnlyJy4QqWLDUQp4FGvOf6jBtmtjAK8PE8tD+lR4DcegAgoY6dw
         wbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RILhH6Aq9u12AHXrJLapVf/35ykvKgXZJJKhDUJ3u5o=;
        b=e9x8DGhVO7tfkPQEs5yqJTonyMNV3Yl8AFydGaQ5f6hBaOc39mXfzDBqe4hyi/aQyo
         PND1gERIjAebNTCTUVo9vPzoeIqicTGm0g+gxzCCH3YLkbhNOdcO/wvRsgsCH4eH+SNq
         d1SIV8GcZ2KuMbTIJdd3YqIoTw5QU/cvypFAzhOtjQKceLW/rpVEqlUFIcTPReQTiOM+
         2/K6Rs1euK205DXI+801MUHD9+js+gMsN5KDEuAWx0bBEsXa8vZ6pnwdMEyPWENWLguN
         IyYTrGzrnmObN0j/7v9d7K3TSL+WAiEYF7+E1iWkNhixxzBY/SSqXouzZTd3KhCIPbQ5
         1E0g==
X-Gm-Message-State: ACgBeo0sTVQAvejwu+MMCTZ+yfHlXxsUNKq1X4QINCWv/TAadV5r1xU1
        +87Hvy0S7v1EawubEpPqYWWWE1G6r9Bbq9kWC+kLxA==
X-Google-Smtp-Source: AA6agR4oXIhMWvyTykV73Rd+VMMf8KizpzG+NuEN/NiSVIDY85ROM3a/ErCmdsahH06lkeq0eo3hUDt62A3a1KcpM9A=
X-Received: by 2002:a17:907:9686:b0:73d:1de0:7fbe with SMTP id
 hd6-20020a170907968600b0073d1de07fbemr9625140ejc.500.1661167719419; Mon, 22
 Aug 2022 04:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220815120834.1562544-1-lewis.hanly@microchip.com> <20220815120834.1562544-2-lewis.hanly@microchip.com>
In-Reply-To: <20220815120834.1562544-2-lewis.hanly@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 13:28:28 +0200
Message-ID: <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
To:     lewis.hanly@microchip.com
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        brgl@bgdev.pl, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
        maz@kernel.org, conor.dooley@microchip.com,
        daire.mcnamara@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 15, 2022 at 2:08 PM <lewis.hanly@microchip.com> wrote:

> From: Lewis Hanly <lewis.hanly@microchip.com>
>
> Add a driver to support the Polarfire SoC gpio controller
>
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>

This looks like  textbook example of a driver that can use
CONFIG_GPIO_GENERIC

> +config GPIO_POLARFIRE_SOC
> +       bool "Microchip FPGA GPIO support"
> +       depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP

select GPIO_GENERIC

See e.g. drivers/gpio/gpio-ftgpio010.c for an example
of how to use bgpio_init() to set up the helper library to handle
the GPIO side of things and combine it with an irqchip.
You get get/set_multiple() for free with this approach.
Also see documentation for bgpio_init() in
drivers/gpio/gpio-mmio.c.

Yours,
Linus Walleij
