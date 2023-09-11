Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3373E79B134
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240706AbjIKU4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238315AbjIKNx4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 09:53:56 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186ADE40
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:53:52 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d80211e8df8so2818081276.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694440431; x=1695045231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLvWZ52i+dyCSAmh4Y03SqBKrmy28LwkDvJNO6anitE=;
        b=MvHG5vX14o4i5NGt/nQqLnCm1YkFABsbQAx/8kX+mZjyKehzpB1ENwYPKw0tQ9sKbA
         O9deuTjEwYtO8kqzzHGN+fAnGtytiJmIzZkVOqEEqV/AuIdijqul0pr4swVu6UehNIn7
         mxrvC8ShDIjp9lQk4sH09Ygf5zz++yEv3OKWhSnsJ6LIOYjCbzqoGRUdfXnJWh/Ehct/
         OsgEiFtrQlpAYyRh4yWcRVcY2kq4Ln4l9WpPP2YVABsmcKHZ6W88UxaLbdos6ZDRIMsO
         ey+dUOMcx2MpY0oWkJJA8e4bYE4pU9JTSc9Ys6U1tKCr0o9Hi0FaOVnv3X+g9CxW4jf+
         Zl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694440431; x=1695045231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLvWZ52i+dyCSAmh4Y03SqBKrmy28LwkDvJNO6anitE=;
        b=QIdHHoY4uiZO4Ip38r2taCTPtpknF8pedhHvwij1vKJ4Ft4Xh4Oh20a3Vm/Hdkid43
         lXC+mLlrWX6Z+DWC05QfeNbEKDNIxMr9hmDvPRYh9qytgfOGALmbN7ZGo7gy9ceACOkK
         tJTsVjUvvEHh1x3wpHVRp3IIsQX53wD8j0Qyv7xEKO4cvslsIhNbI1HeeF1h/lOem3PN
         j5t5q4Dp1ykiGgpyZYW9i3+YuQHV07K3ojZ9D1rjv9FwqENlsUnQtIxAdnUpXjgBXhBk
         2EOllm5dn5CKqbstf8VrE3vsoZcguWOXiYIAQ7w14KGTcT5YdGDH0w7xBX3oKqavzSWf
         PXyg==
X-Gm-Message-State: AOJu0YwcPd8Cn0HvAuf1BKxYOf6UZE863sqHSLGO1cKjaivjXgUxe9o4
        F1YrccpXgdrT3d32qivE95d2QvANF/S6qenFSY6W/Q==
X-Google-Smtp-Source: AGHT+IHp45MYsPkvvvVaXHQ4k98NIkrWPaOBthFZdZy9COqTKpRoYFrEK1u6n2IGbrTU5QDj2PG6u+wrSp/eBuXoh44=
X-Received: by 2002:a25:502:0:b0:d12:ab1:d88a with SMTP id 2-20020a250502000000b00d120ab1d88amr9001432ybf.40.1694440431348;
 Mon, 11 Sep 2023 06:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230828140849.21724-1-tmaimon77@gmail.com>
In-Reply-To: <20230828140849.21724-1-tmaimon77@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 15:53:40 +0200
Message-ID: <CACRpkdY0C7S_VjZ8CKxj9MOv401jUPesvwKwHyCfHM+p8jRSOg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] pinctrl: nuvoton: add pinmux and GPIO driver for NPCM8XX
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com,
        joel@jms.id.au, venture@google.com, yuenn@google.com,
        benjaminfair@google.com, j.neuschaefer@gmx.net,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Aug 28, 2023 at 4:08=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:

> This patch set adds pinmux and GPIO controller for the Arbel NPCM8XX
> Baseboard Management Controller (BMC).

Patches applied. I can send some more nitpicky comments about
patch 2/2 but they are not serious enough to warrant a resend of the
patches, it is better to touch it up in-tree, if at all.

Good work with this driver, and also good patience since you
iterated 7 versions and polished everything up so it's really nice
and shiny now!

Yours,
Linus Walleij
