Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C53678273E
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 12:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234801AbjHUKkc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 06:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234800AbjHUKkc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 06:40:32 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CCBE7
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 03:40:29 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-58d9ba95c78so36902067b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692614428; x=1693219228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlC9WzvPLj1udXhDgs5mN/rA7M/i5witjQfQthytlpA=;
        b=lEGYS0+/m2RXDHmGzNT/IeCYMT2c4iKzkEHrfthtsslruS/BGNSt9Qw/hAbsmwooGd
         XDsKaaQvYKJjlAoALNP+YXz0uNkdYv8kP5/v3FPxaI+VyKJuQBs6ZUW+fW2iJhMw3thl
         oHEEyCXKhlU2yBr8RBNSjDOk29vg3CmE6B2e4Y4Ry6RTmtJWFXmW6z4vttjeLXCMuF9/
         7TEvzE2cQIh6tWhypp3SJoP3PUBoB9b21SLyD490RawRd1uqVyaYb01cwKFFiKQ836X7
         fB11AS9c/tfm54SzK5PW0NUq3z3XKXKoHQgAB+nwIBqxWIXYLyzkHhEuV4vIpWG4YuGx
         +bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692614428; x=1693219228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlC9WzvPLj1udXhDgs5mN/rA7M/i5witjQfQthytlpA=;
        b=HadBCyAE3dKBSHw9H5lR4u1+T42YWMsGw0SGfMwVVqXkIL7u1xTuGpomjFLDmljfiN
         eTo4/SFrh2Uq3bnGeleqhuazKkree+O8Uq4gaI3aC71diSFwiqyiPHSrMQZtYb9ih4Ie
         8aY0fNVg9SQ6EW7Udf/TKW4dUMRtgKMli3ogYu189OjIqWvUWPHgWhhiF07UckdUDrYi
         j7Sm7mcfnsQV2Fi1J5HPphCJ/5VkoyXLcbAqw8nPT32Y3K7Z+j0NKKJGAYeCC+gpTZHs
         DGv1wON9k7pPBA7b89EOXhiw58U3rUYjBXdPYvyDbqPCeJuIp8lbZVuO3ZCekkjU7a6E
         QyVw==
X-Gm-Message-State: AOJu0Yxgr8bTJCikqP7C/4F6ronDGTCiaOAQZo1S9hjTeXQzRNYT4s4r
        7VpL9gr1zVJyoOxNCj0e3hmoN/YFgkQyRYs7WgM2/Q==
X-Google-Smtp-Source: AGHT+IEij7GtqhbEmiG1OmAYGBYbDU814/39PfKVABeSfeoimu6g7FqhFvg5sPRBjX8bW4TgvYUsOrRpqYZU1N0XD4I=
X-Received: by 2002:a25:abe7:0:b0:cea:6760:d2c6 with SMTP id
 v94-20020a25abe7000000b00cea6760d2c6mr6144912ybi.41.1692614428225; Mon, 21
 Aug 2023 03:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <7bcc8ead25dbfabc7f5a85d066224a926fbb4941.1692327317.git.daniel@makrotopia.org>
In-Reply-To: <7bcc8ead25dbfabc7f5a85d066224a926fbb4941.1692327317.git.daniel@makrotopia.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Aug 2023 12:40:17 +0200
Message-ID: <CACRpkdYpLkPp0-3rT5xxbzO9Lf35020Aid7QX6iqZGaW3C5x0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: fix pull_type data for MT7981
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Sam Shih <sam.shih@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2023 at 5:02=E2=80=AFAM Daniel Golle <daniel@makrotopia.org=
> wrote:

> MediaTek has released pull_type data for MT7981 in their SDK.
> Use it and set functions to configure pin bias.
>
> Fixes: 6c83b2d94fcc ("pinctrl: add mt7981 pinctrl driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

This looks pretty urgent but I applied it for v6.6 (non-urgent)
for now so we get some testing in linux-next.

Can some maintainer step in and ACK this and indicate if we
should even put it into fixes?

Yours,
Linus Walleij
