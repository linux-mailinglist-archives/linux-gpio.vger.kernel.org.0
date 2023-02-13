Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79244694137
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Feb 2023 10:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbjBMJcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Feb 2023 04:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjBMJbj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2023 04:31:39 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE0916AF6
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 01:30:03 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 81so3101719ybp.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 01:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fbCnS9qQOyU9623tJsn2QphhHvRbvyNNBbtC5U5z6J8=;
        b=odroHUcqkgcojn02dHabgYmZH3VY11+Urwb7RTpZ5NyCwDhI/MTiKdbotFjm2yzYBU
         8OVdx6KfYdT00gJY07OXJkj5tDo2fHRtR+a7ued0jN3bZjGm+bvqgGLd2iKkD+Iyce8Q
         j3UKTikpP5Tr49t/XOxZMhip5nxQnPvBV/Aj+VN9liszJnJDp6b5SOxTtEwF4hq/IH9A
         iTxmrUxzY2043+mlhVViU0qc/BSBZ5JBJW1Ni/MGuyGemOydRaaNQTwow0qHI/+vMRwN
         NtmQh1SF6nuLSPa2nfc+jJJ+N1VVk9gWT59iCdto60h8O6dnTth3+yLTJGNK5mnJnfDo
         M1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbCnS9qQOyU9623tJsn2QphhHvRbvyNNBbtC5U5z6J8=;
        b=W45UtyjWl7yc8DKRilGNpwsn13BCjDC5x3b/GU8AU08OwNyLxl0wb7VJyo5BWlECyT
         o64flCCA9JA8hmycH+NCQJG0sRCc1S+nsS6IzV0KUS4chJEaP3bHOeUpvTXCWyYM8Zb4
         iwBpIlbLpZ1h/sQ47lOt4W5bGU7JrIQ+gKJD+H0Pqd6yDq7dCmHxt8UZK+VCIB2osFbu
         ffmC8pS5mUeDysOHUq6hnkUTX/5lYyeqjUOmohmL5doh41VcBSwE/phFfnZkHlIu+o3o
         NqpDG5sEEt2//8vA2qtTSGqZYkYwqjVNUsVXLW9QtFO9WffEozKC4t9u6dN29i63k4Ja
         Pe7w==
X-Gm-Message-State: AO0yUKURlBnXfDCoVJaxRBZiXvMe6ajavovp0y+GdmqNWG3kCnGd6tiL
        4IzFy1U+J4IgshFOCTLJvizpaFochTz9hkzEfUnqZQ==
X-Google-Smtp-Source: AK7set/Q/aym+udxSJIugldGIX6aULPrP69cxHciJd6Aja2+B3PO2NjOVa2H35aSpgMPo6/GConlmtxbwpwEyp0a2LI=
X-Received: by 2002:a25:8e81:0:b0:8f7:f072:720d with SMTP id
 q1-20020a258e81000000b008f7f072720dmr1045699ybl.426.1676280600037; Mon, 13
 Feb 2023 01:30:00 -0800 (PST)
MIME-Version: 1.0
References: <b151531d-c9fc-cafa-4e46-e213a9892247@microchip.com>
 <CACRpkdbK8A9X4nCZEc53-wXU0Vgkc53j_r5rLQiSeoNbmvm8sg@mail.gmail.com> <961a2164-640a-86b5-980f-73668eb161e4@microchip.com>
In-Reply-To: <961a2164-640a-86b5-980f-73668eb161e4@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Feb 2023 10:29:48 +0100
Message-ID: <CACRpkdaKYN9eRtuOhBBp_50sR71AQvNSKtjAR1RZPhaKYhfJVw@mail.gmail.com>
Subject: Re: I2c GPIO Recovery with pinctrl strict mode
To:     Ryan.Wanner@microchip.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, alexandre.belloni@bootlin.com,
        Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        Claudiu.Beznea@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 10, 2023 at 4:21 PM <Ryan.Wanner@microchip.com> wrote:

> I am trying to enable .strict in the Atmel pinctrl driver, and that is
> what is causing my issues.

Strictly speaking (ha!) that flag is for when you *cannot* use a pin
in GPIO mode at the same time as another mode.

Example: if you use the pin in I2C mode, then reading the GPIO
input register will *not* reflect the value on the electrical line,
because it has been decoupled physically. Then .strict should
be true.

The strict mode was not intended for policy, i.e. stopping kernel
developers from doing wrong things. They have enough tools to
do wrong things anyway, one more or less doesn't matter.

Yours,
Linus Walleij
