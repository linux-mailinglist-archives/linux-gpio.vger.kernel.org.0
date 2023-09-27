Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26CB37AFF0B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 10:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjI0Izk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 04:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjI0Izh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 04:55:37 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3F3BF
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:55:35 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59f7f2b1036so75051917b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804935; x=1696409735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rEuhWfGGpeiMbDXbtGqSA+/xxJxI7p+DAMTljVHvCg=;
        b=qpSPb/zQW+MEHzRhWGV+uKe8l6FQb6fiH/rTEduad9K3peZmWYx691tJq91grZxcW4
         xoWd4kwv/nAcwfll3FFHom3erynDdnNLXQZXXqyea0nnGJkQnD6SMay2ynqu1e7E8REZ
         H4xUy15Qd8NtMYqhaRrWdaatd33E4pLF99yPIxu6+eqb+TNCZsNUlH2OcIHJGQlPMa0z
         G6jj3J7zC0/DUs0CvoaBL0BxnmUEyw5AjUg/PnKBOhOxNRBnA6pwY4Yi1C0Q6klamoap
         OfXJ+tpWqS4BWAU+ZQRTrjESbYUXOwU80Ixc1L1umg2RKKZ9xHYUF0ge91zNgaPxsTic
         TBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804935; x=1696409735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rEuhWfGGpeiMbDXbtGqSA+/xxJxI7p+DAMTljVHvCg=;
        b=iXIZlRqJ5+CHKBgQGfcoTsU66qwAg0FFkAjwkcnxKYzEdjsgP1Yoota8J6Ej2wrOQW
         16Pzzt3yhtTe/9zG/3R5Dx0bVKIir0pIUejmGLEfniup8MTXgJmLm6gWuVprs/z5hPWX
         smXFjX8nKbeFXCc2frEPwwTjGp1Pf+A89LUG+ouDsH6F8i7z9HXGEk1dnFAOLIYLjqiV
         Bch/HyuVrypaTLS1TDLtldGPvx/GNZhgcGsDrMZvKSPh3BHWr7c2zu91ZrwSELUwxsRs
         Dk1Y6aqi2MvuSlPbli0c34WMAmXM4wInhZ5mM6jXFjvcMLAt8Yn+Bv88ulwYkdWJjksh
         njcQ==
X-Gm-Message-State: AOJu0YyW8acoQyYVqBBo/9MHqFZtwxcswVG2nN/SShPFhBlDXCUcmCRd
        lLNdHxcGFpNb1Tf0upYvvwtqnLZn9waardPn4sKMk9hTWDan2dDa
X-Google-Smtp-Source: AGHT+IEGDZNFq8Uqnqfe0D3ubILPKiVBAPL+coBrxNeyPsMnzM+oXkwB/+eN3MAGbFNSxFf5TJqiSviAyAxXhe31JYc=
X-Received: by 2002:a0d:ea84:0:b0:59f:687c:fb36 with SMTP id
 t126-20020a0dea84000000b0059f687cfb36mr1656040ywe.45.1695804935133; Wed, 27
 Sep 2023 01:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230926103938.334055-1-luca.ceresoli@bootlin.com>
In-Reply-To: <20230926103938.334055-1-luca.ceresoli@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:55:24 +0200
Message-ID: <CACRpkdacS=tfgd716OcQEaouGSuoCRdRW9Eo9S+KmM8R46J5EA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: add OF node when logging OF parsing errors
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

On Tue, Sep 26, 2023 at 12:39=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:

> These errors are not quite clear without also logging they device tree no=
de
> being parsed, especially when the pinmux node has lots of subnodes. Addin=
g
> the node name helps a lot in finding the node that triggers the error.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Patch applied!

Yours,
Linus Walleij
