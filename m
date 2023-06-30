Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4482B743B1B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 13:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjF3Ls7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 07:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbjF3Ls6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 07:48:58 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A133AAB
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:48:56 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-c14476f8401so1721075276.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688125735; x=1690717735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhPx8Hh7M7YH2J3WFDsXt4EqPndUN6y8De0tyQm/k4E=;
        b=LJ2jAot5pSG+gTYVJX8fDjg75kz1nugO/4ywCuOzL9SfpdNfK6+ka3mXQpCsybMvNi
         tTh2Noxd61oD66W6L08Ur174fW7LAmmHVhwjR//RgnfFP38UfW0bYaJDMc3FlBi2H7r9
         VhJ0Y8Fbs8ZTSF8/+pN4tsiWeipBWUQzFKRhYEpkeq8AuRDE073FkqWQVxL6S0Frlrlm
         mS08R71iEQEBoER1u2caEDZy23H9/k1wv8UVUPB+QdBTRMiaa0BJk9oGc533kTKEn0Ng
         H0LD2RY60hwy002Ga7PqODwprhmSoO+td5O14VZqRpI/nkWNDdNYvTmzhe7A/+CiryUF
         hMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688125735; x=1690717735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhPx8Hh7M7YH2J3WFDsXt4EqPndUN6y8De0tyQm/k4E=;
        b=PxzEjiiMMmMqLd5b6SruSltmYSiDhUotnocteX0z2YyfmggvYL1FavmJgq6uSQZLtr
         kffnx26U4p7uPWLRwrKYNLssdDdVbHTRAwoVqf1zJXPD+XAnRKr54fpeA5aVJmxpdGIS
         AALhzIsqVDpX8fnaKPu0kSWOJlEeKa6biv1jqB/KHph+avei2InB7rCPuVp1nTC+3rqk
         ldu9frDJVzeSnDqk3pKwDO63ygbxUUxgt4EJzpqfAW8sli7tUOlf6dPsaJeVhsw1XVn5
         rOc1fkpC5WhCn2tEuSgiSHAvkIQZVZCj5Gie/QO9emYS2USV82Aei+MTaScvJBue8yqY
         lYYg==
X-Gm-Message-State: ABy/qLZpnpRHIC3ppMHX720CYwljcoMWavGgaC7hq4h/IHDzNXBrxJOw
        fZPtd1BFUzPZnUfe5kPgT15L/u8pIlXsd46Qwu/6uQ==
X-Google-Smtp-Source: APBJJlFseWNZE0jgDgce+tEtRmGuGFF56nVMUZU7MLkCT4lM7cJTLHUcM7VU1LvLY1VR7MkMNtkDKZuvDDX/VaTmcR0=
X-Received: by 2002:a25:6884:0:b0:c39:8036:e3f9 with SMTP id
 d126-20020a256884000000b00c398036e3f9mr2551934ybc.26.1688125735691; Fri, 30
 Jun 2023 04:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174943.30302-1-andriy.shevchenko@linux.intel.com> <20230621174943.30302-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230621174943.30302-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jun 2023 13:48:44 +0200
Message-ID: <CACRpkdY--Mg8VORij9u+ef5KJ_VGyVnP_qeSVVQ_k3WxMr4U+g@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpiolib: Do not assign error pointer to the GPIO
 IRQ chip domain
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 21, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Check domain for being an error pointer before assigning it to
> the GPIO IRQ chip domain.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

And this concludes patches 1,2,3, nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
