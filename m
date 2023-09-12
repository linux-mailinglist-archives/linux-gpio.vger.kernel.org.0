Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2A479D1BF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 15:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbjILNEq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 09:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbjILNEO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 09:04:14 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8382D4C
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 06:03:11 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4943862e73dso1643881e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 06:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694523791; x=1695128591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkcoSVYDruA/qmpGaJ5vnx7MGyWqZ9urtmfgLocJjQA=;
        b=fQXLJSQBm5nWWxv77/waYpfsiYoyV7vBVQ/QM7paVziSr5p4nCqrVYwaNn7FY0d+Bw
         MeqxNYUqerNkN1+64hS8UZrB2VaedZiP5D3cS54QFGScKa4VU/j/bAKXaN45jvRow1pr
         qNJFin+toFYOQWj3HYQwthDKRUtdc8g68WpTk5Qhxx5ZCTXJtaxgqlIMNRJwWJL3rsAv
         9q55pPBzwbI+9yh8hmgthuFPbq7aV6qTkpXDAuk6MrwUYoI1TGLI0ZqIsxT1OdehR4SI
         ScsVzICaFsxTo2nhvsCij1mlB8oJGggGf5COONSGDoAtUc5w+JzMITvBP29HDpYs6kfK
         /6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694523791; x=1695128591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkcoSVYDruA/qmpGaJ5vnx7MGyWqZ9urtmfgLocJjQA=;
        b=htZLheiP+Av57KXdZUakjQkp6zeyFw4C432JY7+ifEXl9Z2j4myCSzfXrqxYR53olZ
         nGIpFasAgpQqLCvY7NUqGQqX/ymI0Sfxb/JC/2G+QvkK/EICoz5H/wjvXt22tOyVqHO0
         iO4YXeUIG5YG9E2IrSGcFI4NumC68/6JOyU5IoAs71sumgYtHaFts7OsiDI7JEwz5RSU
         nWshyo79/k6w4XTT56rRlicQvZm9nnZTc+LQ/9MxEFXjvnRazEVNtsAdEqfr/y/vVyPq
         CED0zB/zfQXcPlN/W/VzGAJL63Mg6q84b5pzQIyzepJ2O/hqAydY4PskdkUF2CBHeipU
         luYQ==
X-Gm-Message-State: AOJu0Yzs4dgEx7dcVuMXfbJnAUPNS8XXH7d9LytXPbuEl/bq0pbkYFQu
        7GyNI8IJx4U7IRFlYapgJ5EDfDejhhLDhuf4dikXQw==
X-Google-Smtp-Source: AGHT+IGFYAaDury6GsCP+37CISQBeDw1iDRJzFTfX1VQGoM8F5nNWz7qd+oSpvqVYslRMMiHUr9578+TYRKtOgTRUY8=
X-Received: by 2002:a05:6122:ca0:b0:495:d5a4:513 with SMTP id
 ba32-20020a0561220ca000b00495d5a40513mr7363412vkb.14.1694523789337; Tue, 12
 Sep 2023 06:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230912122850.164150-1-michael@walle.cc>
In-Reply-To: <20230912122850.164150-1-michael@walle.cc>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Sep 2023 15:02:58 +0200
Message-ID: <CAMRc=Mcj77F7SZ6BxDimnD=2iXe-g02yG9KuFCKTj0m58SzOTg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: gpio-regmap: make myself a maintainer of it
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 12, 2023 at 2:29=E2=80=AFPM Michael Walle <michael@walle.cc> wr=
ote:
>
> When I've upstreamed the gpio-regmap driver, I didn't have that much
> experience with kernel maintenance, so I've just added myself as a
> reviewer. I've gained quite some experience, so I'd like to step up
> as a maintainer for it.
>

Do you think about maintaining your own tree and sending PRs to me?
I'm wondering if - given the little volume of changes to gpio-regmap -
this wouldn't be unnecessary churn? I normally wait for you to Ack any
changes to gpio-regmap code and drivers based on it anyway. Otherwise
if it's just the formal role of the maintainer you're suggesting, then
sure, I'm all for it.

Bart

> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69de688907ca..405f616e4960 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8872,7 +8872,7 @@ F:        drivers/gpio/gpio-mockup.c
>  F:     tools/testing/selftests/gpio/
>
>  GPIO REGMAP
> -R:     Michael Walle <michael@walle.cc>
> +M:     Michael Walle <michael@walle.cc>
>  S:     Maintained
>  F:     drivers/gpio/gpio-regmap.c
>  F:     include/linux/gpio/regmap.h
> --
> 2.39.2
>
