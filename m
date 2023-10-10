Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7833A7BFDAB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbjJJNhu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbjJJNhs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:37:48 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5D1A9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:37:47 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59bebd5bdadso69503747b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945066; x=1697549866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BcYWTkK3Zq4RaJ6QSiIWDLjJKh5RkW4qWVPOlMXZYQ=;
        b=FyN6/fI2sWxqtiTy/l2QDF+qmUdUeSdbtPzkMPjBP402HQ0A9u4G0gKj3Wrd9hXKVr
         9s3qzs4d9/At5k4xQBfOuZub0YqXkvkXtnRI3OQC5w7HeNBW+SyZSarEsqvmkiL9sgYN
         GNvTZn/z8qJj3bIVmMP3IwgnX+PrdmwvwzEztcHE0cDChYG3U9YAbdOzwjlhR6ufeJBU
         /MN7obYdzzWV9rLsxWGVAo+xhmOt36j0dY3vie6B/6o3+pSy7+OVsTjTwbAPxE6kw/k9
         j0uG8QMZIZ6cUkJezhGTbdttlKPaZbjb+cihDv+COxJZmqKbVpNgDBv/7wDhnr2fSDWO
         BzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945066; x=1697549866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BcYWTkK3Zq4RaJ6QSiIWDLjJKh5RkW4qWVPOlMXZYQ=;
        b=krD62aEkDJkp2oHSQLJMYmPKBfURZYGwVFzxig6BQ5s17KW2nsF60KHIUYLtuo/9++
         zav7ORl6QRaaQQ42JEJOsw+NyqJlCZpyE3ZGwf/H7SIcNM0k5aS/OhOzL+JzXFz/3i6O
         QsB4wXOmr65payk66nBKRXQp5y8sSsRDPzsaViYUUc0wSvu7vEN8VkZLfQf1vyisxQwd
         HySEpfiTAo86lhLZyHZSz+++z2JW5LUvDbrCPyAGDf50X+M1Ex3WSMyxL10ChAYyuUV3
         kIGD4GdV7PWfTBjoSHTUtAFcNyCZzJnNPNiuCISzwsMT0r8QLli9FRFDyBLa0GFgDPMS
         oy8w==
X-Gm-Message-State: AOJu0YxPzyXjjgSerfbUxDA7aTRopJZdP/k6iInnkIbKcIVsh3O5aVps
        +etbyOfxB9hiJODZSYHWX0GUxCQN4YMX6iv5RQzUhw==
X-Google-Smtp-Source: AGHT+IE9ra+QcU5GelAXlm/a059fwMX6oxmQ0juTA1o08HyJtYqownxe+FeFv3gkCGaafO5jpogaFwyON/cZD9IiFGA=
X-Received: by 2002:a81:7c86:0:b0:59f:687c:fb36 with SMTP id
 x128-20020a817c86000000b0059f687cfb36mr18746618ywc.45.1696945066223; Tue, 10
 Oct 2023 06:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-5-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:37:35 +0200
Message-ID: <CACRpkdawPWhYQTKMFqxYxc7=rpTGWK=3Ohis5AYb3Ye8dkxEpw@mail.gmail.com>
Subject: Re: [PATCH 04/20] pinctrl: cirrus: madera-core: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:


> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
