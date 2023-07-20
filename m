Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E2575B24F
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 17:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbjGTPTK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 11:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbjGTPTD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 11:19:03 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C294272A
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 08:19:02 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b703a0453fso13719181fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689866340; x=1690471140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TfiF7Qn+rHGOgsaYz2UyOUxB3qdJrasp6G+WcSeqtA=;
        b=45fhlifF6v1d3ZyUsi1kC3ATh/3q6TqePAA258OsLMGwcYw7iA7CIikhCcu6Y3PQbl
         7bMiw05Dd/oUUElFvFezBx485JoMM1bz8n7r5eJhfFHaLewkTMDt+Ep3gzehjjzacwKs
         /+cbwlyX7RJ91At3389p6lg3xjBTvPRuUl6a9tKCpZX9/gm8e8BFLJWm84iMD1E/ejjT
         bT5gp5JH/BQ+j0AiSL4txJzMkhLn0pA9nLs0qQnnddSpBaipuTYfgA0UBi9IhtorYu93
         zsfkHjGGE2BsGsjjczhaj9Q7nyZzWGRtuPK7wdqhU0JsSQCTwviETuXpvCVmpCrO6+j6
         +2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689866340; x=1690471140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TfiF7Qn+rHGOgsaYz2UyOUxB3qdJrasp6G+WcSeqtA=;
        b=l9Hzg650V6vFvU0c6VIIx63tFkBfY4R3lLeaM2XGZ4hklInXVSzdSI/brELPRnwlD0
         nJ1s8BGv0EWzvdqIofrjeBzEZUtJ0nO1qb0wl8ye25TxjFyLcpARcnokT7VFweIQAugv
         qsAuKxwoCTEo65JxOvHyZkEFGTHl5A2qSkPRPGIRIadjFXsxolk8kvybvYGrrzDhlZNN
         IX9KRb6/9FZbGOee9YHFPTxBrwFWl+iEpJPB/mb3rST/Zhie+5nwBH9Z0tO+LXSSwht7
         pINK+3zc/3V5f53CfJd6GkKDE9xmAz0uY9UhLyn/2/Ryoh4o3nvgEVXhhmbzSh7+XvpU
         BccQ==
X-Gm-Message-State: ABy/qLZT3Slp1u38lOf0Zcx22Gkc7EQ2h/x1c15RREd92ppN/GkkUYyl
        omIP8JuMQTiIcakaZFhnVNo1bel+5ZHj/uWd0muQ6w==
X-Google-Smtp-Source: APBJJlHf1SKa59G27cQXDIDWbUR12EsQTDOby+CG1JeQpqn8MIsSXvPGyVTklxUbOVeAw++zblRfzduN6+coAIcoGh8=
X-Received: by 2002:a05:651c:92:b0:2b5:7fba:18ac with SMTP id
 18-20020a05651c009200b002b57fba18acmr2598533ljq.48.1689866340520; Thu, 20 Jul
 2023 08:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230713202046.150986-1-afd@ti.com>
In-Reply-To: <20230713202046.150986-1-afd@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 17:18:47 +0200
Message-ID: <CAMRc=Mfjhn19u7R__OWpH8=iuOXKOzCvnYfCAoGQ+G2hODXrqQ@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: pisosr: Use devm_gpiochip_add_data() to simplify
 remove path
To:     Andrew Davis <afd@ti.com>
Cc:     Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 13, 2023 at 10:20=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> Use devm version of gpiochip add function to handle removal for us.
>
> While here update copyright and module author.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>

Applied, thanks!

Bart
