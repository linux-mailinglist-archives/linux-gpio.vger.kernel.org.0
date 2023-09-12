Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8380C79D299
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 15:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbjILNpu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 09:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233774AbjILNpt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 09:45:49 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCA210CE
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 06:45:45 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d7d50ba994eso4905270276.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 06:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694526345; x=1695131145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edAT/GH43omVL1UuMQMjzc2LFcLi9s8ggYJhioq2FPs=;
        b=Ly8F6rqsZ2a/ErNhg3NQMZWYaGD0Agak2T0+J4VzKZwHG9M7brlS/uh5uGkqte86cg
         +y68uvKyW8L5/2tQdhoTtvy5iyUiTtPCOopfthH+7loeArwNWHC4fVVC/W+dNqdr7FUP
         fc71h42ECOy1+tcEexmvOZqWEq0wUFWMFkfKu9cJwf5y3GOBtkNo8KZSQ8TQDU3C2Bsy
         fHiQ3NyhjT/DL3SWmy7QngMllHo3og06F0phz7FTYzv2D6qb0LieA44eJnAn0oRZ0yJU
         rYfmGDNZcRSoNyhvG8SyLUJqpB59Hdds30Rmx5gkiJXKslMQX5fxMPLMD+ufQqJ9BLBW
         7TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526345; x=1695131145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edAT/GH43omVL1UuMQMjzc2LFcLi9s8ggYJhioq2FPs=;
        b=k1fuvlli9tgPIKSdC/rMDaTxzcgphvFdpeJRO2IYzyBXlhtn0w1i3BMX8/FN31r02c
         1ei4esYH/8zj0B20jjtAyBx5JwCD4jPvO8xzdDMUz+HVlZX/SQk9tFXfmyRPZNVRpwpD
         pp85yYllFZvhs7yE9JSEB6UjxZFDgldb7kOeMGbxVJ3TAIy/Lzmm8tb8YkL8TxnxSvo8
         e3/6DAjUmalf6lqVKimc7ghw0PGKO6V6XQjNoqbbr81vu9CIBIWafo2wbFpmvQLpyygQ
         ClPHnbLqoe1awzvmZKcnAbEuX1HRixKmebsGIsNRlAMLfbPvcWoaN4xhgHmBtDzDySuP
         yR0A==
X-Gm-Message-State: AOJu0Yyi03LB66FvuLVxmzQm7+PYCapoMcDIBmBz6xdfNGpJyF01XXBB
        4kxMryC2qI9cEO3l/GCUGVfvkSpWz30Ngzo0HpQNzQ==
X-Google-Smtp-Source: AGHT+IGJI2UveXs72E5STp7ztC3GYt6jLOW7Z8QEofakoyL0YotL8uh8fujG1uiQtOK+mJyjU2+03A8pvZyjiJB/Mns=
X-Received: by 2002:a25:ce03:0:b0:d09:f934:f2fe with SMTP id
 x3-20020a25ce03000000b00d09f934f2femr10648800ybe.18.1694526345012; Tue, 12
 Sep 2023 06:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230912122850.164150-1-michael@walle.cc>
In-Reply-To: <20230912122850.164150-1-michael@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 15:45:33 +0200
Message-ID: <CACRpkdYh1PN4mSmLQ-3SynhbjRs1Y_H=vaJHqv1ptf2UL_SQYg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: gpio-regmap: make myself a maintainer of it
To:     Michael Walle <michael@walle.cc>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 12, 2023 at 2:29=E2=80=AFPM Michael Walle <michael@walle.cc> wr=
ote:

> When I've upstreamed the gpio-regmap driver, I didn't have that much
> experience with kernel maintenance, so I've just added myself as a
> reviewer. I've gained quite some experience, so I'd like to step up
> as a maintainer for it.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
