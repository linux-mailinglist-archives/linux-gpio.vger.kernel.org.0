Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE267AE8A8
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 11:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbjIZJL1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 05:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233806AbjIZJL0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 05:11:26 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FBDEB
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 02:11:18 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-59c0a7d54bdso98799507b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695719478; x=1696324278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0PDhPpQtKfenHFIZYPJauktelsKWg7AKOZgGNnjJU8=;
        b=lqBwYyuCXCIW2MjnLSK+xKCcG8xSX94XQLF48nYubLu2jgpn51zzGFlw8YrRevGrNs
         FO0vc6TjzPfdR5JZnAvqjzZadO98ccEQFrOsn3ONsKFUCGrBx/Q+p5hDRnZbnhCYAdX2
         3lyJ/LsFInMJ3EcMPYzYD99PT0Rt9rwDoLySqfhEPJiNvvybr+kwMCb39++lC7PacUFt
         M26lkazNfWeEZCVdRNjMkIqY+w3x4HoJrog3Qt3ClRRvcyyPy8VVlLUpWf6Cr2qpKQja
         lNmVzupBXEhxWbWO7sc4f8AXinuKzjBXoc4eZbsakXI9aiXbOyMURuJmiWC2lvYmFV4E
         rdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695719478; x=1696324278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0PDhPpQtKfenHFIZYPJauktelsKWg7AKOZgGNnjJU8=;
        b=CsDVW//iPRyE17s4GOlJWXDejSjdipQvswaO8bLROWdSeBKm3FvENL7gceb4V5GkWe
         wvsU46W+Z15PJzhSpELs23w6+HFgfMR5XHJRBhp0VACtzOIfhDQlWMS/kmLYBBmmm8bD
         mzE4sN9XZ294890S+bDom/crhX7qRa82nuzZLtP5C+rXSbEBkAHkkU3/rWFjEQmnCqOr
         jhB3TFesPKAU12bQrnGHz1LgQaD4ELxdANra4xQmFrIz8FkU+qLTu84xHzdY7Sev57bl
         rpdtH0Me6p5DEz9egT9qnISinnM++pCzGB1USAH/U8eL86md//YwjqlM2oSo0qVTpIg8
         kySg==
X-Gm-Message-State: AOJu0Ywx2RD8OAWsS20NgSVH7AdLly1TWSx++hEHPHKMk4qz54TV1tJ+
        32C6xDqDZt/98UAsPpFYFoRC7j7DD5UI/CjGwDPuqw==
X-Google-Smtp-Source: AGHT+IEgKX3n5Olx0xH4y1czhKrXxa2Jqjj7SjkTTJVSRD2X5jBRYpc70wR8SkoYZ0fDx9gEksPsrC9fstLgwM+xMHA=
X-Received: by 2002:a0d:db4e:0:b0:59b:f18b:efa0 with SMTP id
 d75-20020a0ddb4e000000b0059bf18befa0mr7877471ywe.36.1695719478064; Tue, 26
 Sep 2023 02:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230926090623.35595-1-brgl@bgdev.pl>
In-Reply-To: <20230926090623.35595-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 11:11:06 +0200
Message-ID: <CACRpkdaVaqooxjgLqxzrVrMp088-FjdwFH7XnuWL2J=BqX_5HA@mail.gmail.com>
Subject: Re: [RFT PATCH] mtd: rawnand: ingenic: move the GPIO quirk to gpiolib-of.c
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 11:06=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a special place for OF polarity quirks in gpiolib-of.c. Let's
> move this over there so that it doesn't pollute the driver.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
