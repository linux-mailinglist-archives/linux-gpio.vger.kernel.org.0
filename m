Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 385417BFDF8
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbjJJNjc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbjJJNjX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:39:23 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E90196
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:39:09 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7bbcc099fso11025697b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945147; x=1697549947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BcYWTkK3Zq4RaJ6QSiIWDLjJKh5RkW4qWVPOlMXZYQ=;
        b=tuM0G+Y2xZWQOLfe9pEIr7l163zWvyvrumrsCY6fRcmDB+q2TOXKHrkcdzcw/ugp2G
         zBvyBW83OE0VD7mbbqnMba1kzP4afiHyqn4pbLliSD+gtY5/muZuihMh7xRJ7yEmblp1
         2a7kx0JdWNlVDtlGXYYO/9BtIk4ErD2zxjMs9z7RlivGaOiVtTrDRAM6qvG3bHpEHx9m
         ebk0ysY7ZdQCHc+N/HP1zw6eQD08dV+F0jcqFW86xxBQDmdxfRT51AOtuWe+MH50+F/Z
         ix/bnEk/phpFSnDrCAhozXvqGaVe3MbB5Pgmxr+tcafQqnrcGIZxPovz9ddKlI5KWNQ9
         WxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945147; x=1697549947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BcYWTkK3Zq4RaJ6QSiIWDLjJKh5RkW4qWVPOlMXZYQ=;
        b=Af/DGjaJAJ7eGu637b4wo17E7277dipMrGKsNw/RAfxKWfcj6zRVfZxvJ19ybFzZrl
         rZ1f8+vMEFuPwEUBFQBlWoISQcdmW4y5lGXUfKsjbTuFD63Qdj6GQo1l77ro0+QRKIH+
         P1ncSzfllIdK3QGaKgNw9cm+nFEPNQZtC1R6/pCfBh304VaueJ43q9C6J+cB92/Ko++5
         IQdipvSIQNCFMSmECHXLLjvFpeQXXWwHhUSgAO32pus94FPyyF00oxH09X+r2SLhRLF7
         ub5ZRiF7B7Lpuqt5CuYLDaPy6kQgFCHlCwMgij8Vs6E38Fo597V/PhsMjiGHmzsctoL1
         2P8w==
X-Gm-Message-State: AOJu0YxJBuAhGiK91H83jPnXPhqdJCiycTyZoxEfpEf2gTnq2QknodAO
        r9QRFm5MboA1sfx4MxhMJvEv9Mi0e1ZaJu3v1iDW9w==
X-Google-Smtp-Source: AGHT+IGBFOQDZ/FLOHx4eQX0TrxCST/Lcm8Wgkq/TBi/z9VXClA8uinIY1UsOKObcbRiMgqXosWjwm1f1lqji1HmVJ0=
X-Received: by 2002:a81:49d0:0:b0:59b:e855:1f57 with SMTP id
 w199-20020a8149d0000000b0059be8551f57mr19935171ywa.36.1696945147650; Tue, 10
 Oct 2023 06:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-9-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-9-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:38:56 +0200
Message-ID: <CACRpkdYBhGeTVV4LBD0YK+BCQr8yZaurhN_N0h9MbB3EaQmFYA@mail.gmail.com>
Subject: Re: [PATCH 08/20] pinctrl: amd: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
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
