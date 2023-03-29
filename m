Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701F36CDCBE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 16:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjC2Ogw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 10:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjC2Ogj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 10:36:39 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973597AA0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 07:32:34 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id p15so19527614ybl.9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680100321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKq2huLtS3barGvNtOvJ2P5nzTfhceB49J6rxu+GgZI=;
        b=Adh6gr2GaXkjuEr9RS/FyMBKnDEdugXHj2q4WIVyKJOQMXobxKmwr96eFuH8+yRoju
         4Yn+YxsmDsePZQ6SCw2TAWqebVrIFbcrtAUO2Uuah1Iflo+saOp2Br0KbPcFi4NlKD9d
         bfUmnpajAN36676Hq/0bObwYF9NC8uYQqZSoQH0VFmx1kpA1ZFYdpoxon18SRFMJX95J
         wYhii1rwtOJjBkaLdDnT9SarQvdQ6GWfFDtg75Ir50qcX3JPG1POYusBk57VN58PQ/ha
         wSRIbnClBi34+/sLL0kziHFpnU9BwnzFUeEhH7XfD0w/JZAxe0bVVSZAinr9q67g3+RN
         ZuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680100321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKq2huLtS3barGvNtOvJ2P5nzTfhceB49J6rxu+GgZI=;
        b=J7wUeBriJRAI4Fqq+/fM/LZxjNysyySqkHFS0EEjvgg5nmnygQUzvtybj6IfyOMOQo
         tj+H4SiLKnWrWnO7Siw5zojTufMoLM1Okh1eW0ikFThZR27uCjghzmeA/XEsQtBILEjL
         ZObhDYWFXvIsly2HoGbTYKe44mLjKbi0f9JRWGH/mMeYFmy8A6P9nBxMxt8+chlwgAkP
         EYiAFMkffyu+rwlTAM6oYLABA6oBRk4IZ2RDzj7l9jSZwRfxbjX1wcacr/UEpu4xpirJ
         FJTGe8yxFtvS1LDt6oyAy9iKu5Ey9fDz9uECLKp7MvTBQy5b6cl0BnVW2XWZL8jTP0HN
         RrDg==
X-Gm-Message-State: AAQBX9dPVjqTWFmDaCgoWuUU+baLaPnSvVnmIZY5NuHiTeoPqfeb14Me
        qd2QHvukZP1uLYtGnbz9CBUYUZ2x0jE/96VUxGAXqOmSeGCQygLX
X-Google-Smtp-Source: AKy350ZxqYi11HkQO05jqojzo/Tu8AGQL+c9Vw2nipChNXwmsZv2V8ZIcsGdqbGUCdY36CaKy8CdTklEsT2l2ZZZVVc=
X-Received: by 2002:a25:8712:0:b0:b74:3236:2fac with SMTP id
 a18-20020a258712000000b00b7432362facmr12438152ybl.4.1680100321684; Wed, 29
 Mar 2023 07:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230324164957.485924-1-u.kleine-koenig@pengutronix.de> <20230324164957.485924-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230324164957.485924-2-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Mar 2023 16:31:50 +0200
Message-ID: <CACRpkdYCkY2Lxedm9mKdghT6B8KuKaeqKTpa7W=sH0V_XX9Evw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: mcp23s08: Rename and change function that
 wraps regmap_update_bits()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 24, 2023 at 5:50=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The semantic of mcp_set_mask() was surprising to me when I first read
> that driver. So it was unexpected that in the call
>
>         mcp_set_mask(mcp, MCP_OLAT, mask, value);
>
> value was a bool. Make the function a thinner wrapper around
> regmap_update_bits() and rename it to also have a similar name.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Both patches applied, thanks!

Yours,
Linus Walleij
