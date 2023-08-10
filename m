Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9202777330
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbjHJImF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbjHJIl4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:41:56 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB452115
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:41:54 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-585ff234cd1so8145937b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691656913; x=1692261713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wiJG9NbPC7OGaF2OmU2biGegrdBZQOQEgLv/i/dH+c=;
        b=DmFqIVhQcTRoh+jTQqmhYhy16rhHsqRZ+NDqgZW5YAaVzPHOkW/BF5PQxtvRhvwSUB
         boI5gT8A4791Lxkg1+FLqopNuy/lZ/ZvhXsYo69Cnv57di+eFL/9oZ7/La8GdKy2qgRz
         7yAvyAgjeaO4qb7OO+8TaZE6FuAq5BIuQlnKwLFr+O+r/a9bGZg7AOXI7qoc7SAc8xGR
         dSwhr+yBMIdVed1wjeCx3Qby+DYHUnZUzlBZYcyN40wjEuVjnRaZ6stS1Iuc3HCJjru/
         33M8QbnsMn2Msf1TLjd/ounNYE/r7AFiiQMUpu4GKTshxYEMFiSzXwynhN5L85mKOt2s
         BQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656913; x=1692261713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wiJG9NbPC7OGaF2OmU2biGegrdBZQOQEgLv/i/dH+c=;
        b=Rc5uBbudwOV1SEt6TdeUK40dwjNUfOij7etHhhuZ7ssQv1eb4/IYR8l0oIDBRx4AQO
         ojjsochZiYrhlOMMc5CGkwl7U4p+5v9GdOooosSP4+FhC4HxZp4ZlMIfHhCQPAHySAqQ
         6aYf/Y0u1vGFCCzC8tcTdVrY6F+XXf7/1am4CwuQysrF8iduzyZ0pT6u2WJPXUKiq69D
         5P5f6dj6hoqP4+p8bsobrmK4aCq7ct/VBFK2pdpieY/AF4qFmAgYn2ZK/LtLTLFJ4Pzw
         w1m4NaI3C+/MleivVWeiaxLS7ZrD/otmEfmY5tb1CMfPxr8bVvRQn3ycAYiQaTJO0XOu
         NJgw==
X-Gm-Message-State: AOJu0YyrFMuhejr1a9VB4E35hj01Imu9JC1wViyPkrxgfBtr9qGAfO+0
        uQy52F5GxhwJdIhcoLhZlkC16/TwVfA7GuWU3UmHrg==
X-Google-Smtp-Source: AGHT+IGkNARbuoPeiX84NxnZFSTSz1Es36FsyS+0adfGq4IvlUULrfCaP8gR5ZalFxdtCY1JxX1lefF6Tjjr4O1MPSY=
X-Received: by 2002:a81:5292:0:b0:577:257d:bf0e with SMTP id
 g140-20020a815292000000b00577257dbf0emr2000330ywb.22.1691656913198; Thu, 10
 Aug 2023 01:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230808180733.2081353-1-florian.fainelli@broadcom.com> <20230808180733.2081353-2-florian.fainelli@broadcom.com>
In-Reply-To: <20230808180733.2081353-2-florian.fainelli@broadcom.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:41:42 +0200
Message-ID: <CACRpkdb7wCgJnCGmMd2AqPEhC5Qz_uVttd2S6suxf9yEPv53yA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] pinctrl: iproc-gpio: Silence probe deferral messages
To:     Florian Fainelli <florian.fainelli@broadcom.com>
Cc:     linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM IPROC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 8, 2023 at 8:07=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> We can have gpiochip_add_data() return -EPROBE_DEFER which will make us
> produce the "unable to add GPIO chip" message which is confusing. Use
> dev_err_probe() to silence probe deferral messages.
>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Patch applied.

Yours,
Linus Walleij
