Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BDD751335
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jul 2023 00:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbjGLWGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jul 2023 18:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbjGLWGj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2023 18:06:39 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAF01FDA
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jul 2023 15:06:37 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-579e212668fso19452557b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jul 2023 15:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199597; x=1691791597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXcnS3+Brh/zcMCdgYvFc36lpkwYKM3nn9wZrxkeRlA=;
        b=a5xAhDJr0zU9+JM7cEgsfuOVAkrJfODQNYZQKqzRLVbqlF+zyopP3v2ONq9zMMbhdA
         7Mk1fbJjZVhYbftcDz5nOdxzTx5CzUB8uz454+F3zuymBbKc3vwtsavwT1zdwoZ8W2X/
         6/0/5CdnoNib/abXHxnsj4GZVadnExLESz39qXeq7v+ZuJwZW/KginVvflfM97gRKH1E
         +X82JynxwwVzzIQDp2Z49SxE9IK9bwLoFDCfaq413yvZfIS9kTQxE9iwaYLWsSaWlbE1
         fWRDqhnOmZ06nW3sBjC6c7rp47RUGk28bsc1kKeCZXSVW2M+aSrMttcDgzu/uTVzQrF7
         CZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199597; x=1691791597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXcnS3+Brh/zcMCdgYvFc36lpkwYKM3nn9wZrxkeRlA=;
        b=MS2s4IW8syzpzgPh0c4Z3uBn6b3CBxUAXcK0UiRMXJQs3vbptreduQdgAdjTauzPbi
         BhvUMnuwoTa4IzKFIEtYOY8K4DWeeYV/r8twZQmEfbD8wdbGeb8T0DYeUfh1fELhamgf
         89VMIKdPejdFY04SA3wfw0CBVRVKLtwWJZ7FI7sBiSUkkcsKT1ATJTTqcRx+4PXfDzIs
         cLfaHUhrb2DH5ukgqWUokkhvqELve2E80WldMbRailHd0vLOcTbSOEElQqmhdNnUhkw9
         Z9IsVXaOAnnZ/44oHdOm2mE+Db2r11dnpBdcYpnQ21hRpy3fy/txh7uuIOVqap49U39J
         p8lQ==
X-Gm-Message-State: ABy/qLaplZRgpRb+oi3k+t/ney07sWsyfVaA0ssa7vl5nr4ggsw/DgGq
        whFcmZjicNypH5DnnwfRorxCjTJqKdmc7YJ7Aqd6CkpgPp5muiEo
X-Google-Smtp-Source: APBJJlEvTnLFO6VfV/+ILTmkFN2p45J0nsymqxZSyfhwvn8b4o+wSfbIQBCcMPjEzWl4GHqOe7kw8PnrfVwlhRiiVSM=
X-Received: by 2002:a0d:e6c6:0:b0:57a:8ba5:224b with SMTP id
 p189-20020a0de6c6000000b0057a8ba5224bmr3909900ywe.9.1689199596908; Wed, 12
 Jul 2023 15:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689165422.git.geert+renesas@glider.be>
In-Reply-To: <cover.1689165422.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Jul 2023 00:06:25 +0200
Message-ID: <CACRpkdZy82ZdRkFr0fMx6yJWkzY2rWOT7ozG1G3x5476kcPMjQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.5
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 12, 2023 at 2:43=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.5-tag1
>
> for you to fetch changes up to bfc374a145ae133613e05b9b89be561f169cb58d:
>
>   pinctrl: renesas: rzg2l: Handle non-unique subnode names (2023-07-10 10=
:00:27 +0200)

Pulled in for fixes!

Yours,
Linus Walleij
