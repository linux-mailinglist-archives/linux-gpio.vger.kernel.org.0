Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F397BFE2D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbjJJNnc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbjJJNnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:43:15 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC9B101
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:40:52 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7a77e736dso18251067b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945251; x=1697550051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=m0xySG7cQ/UKqNsOr45kUMewc/zoR4WRkWdxwuihmzfvKSXLR2dD85VRmfa/7G0sci
         e1xuuDBTsDcd9dzMd5AoJkFtS5cfJiplKj7WkivEq0gNOWdAWrAbok2eLVXUxxA4N6oS
         mb0l2L3BVzcPz9xM50M0ETWmlNzbkXhWx6rZPJssHPWOnkJgeo4XXppyQlo2gy4exZBy
         El7h9YvZyBr3uWO+wovWTmbrlyCDMH/ldF1kIOcrXH/Hcs73GTjmZV7HBbniFPVhxwg7
         mJPxlkKB7iMBB+N7T86HyiJra3KcLBmq6pXK8ZSx/5lgZYIDVSu4pM2ITr9LuQVIqTd6
         nBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945251; x=1697550051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=v+dPMeWst9059BEhi1t40N6U4a2V/vKvRMX4oc/9iUxYzkLOpzWOGJwcS0Rnm9KBJ7
         xV6k+Qjz4EHsIZ4EaoCfBb6KIZm0rhGa/Yoq/2owPFV9jQfY/5QEKnj87OFCaT5yzm7l
         jb1HzSnJ2cRK85y1Pw6ACquARHq54f8oyuWk8w/NbId0j46Iqi3ppDUOrzjjr0ZiJfiW
         aISfqWzbqz1JDs2VcX0vjPw49HmxZDfAI54xLrRpRhdl/wmtdTewDOfQFqQ/LGDiX+B8
         SCGwZMswWroWbElEpYjvADbKOuhBwQvgXUKKur/JxUFzExiIWw/FVOODdvWJQO7wakz2
         1cIQ==
X-Gm-Message-State: AOJu0YzeU0Csf7Hmk9L/H8vYsmcUBDH6H2aqJ+t+gtO/jXKea9yhT1xC
        kKnCai0/zgQ3TbCPwEJKMj9adJcZ2uhr+wwIbLj++A==
X-Google-Smtp-Source: AGHT+IGOCL6NKf3nzx2Pa69/6i9SrcFhRt4AqwUpt0J5Zw5mg1OM29h2nJLtims1aZtxjvzoE4vGYhHQhmPLsY6MmUg=
X-Received: by 2002:a81:7c04:0:b0:583:d9dd:37fd with SMTP id
 x4-20020a817c04000000b00583d9dd37fdmr17710832ywc.31.1696945251491; Tue, 10
 Oct 2023 06:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-12-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-12-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:40:39 +0200
Message-ID: <CACRpkdaZmMXKFMoXLtv92Oqz9A2f_3TMqrdxwcZkWfgt=5OriA@mail.gmail.com>
Subject: Re: [PATCH 11/20] pinctrl: rockchip: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
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
