Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B323477CA25
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 11:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235884AbjHOJPK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 05:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235973AbjHOJOh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 05:14:37 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C80C9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 02:14:36 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d6a5207d9d8so2749460276.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 02:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692090875; x=1692695675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GyKzeoNrkKCtptNnkMb1Win6meoNikolvNJpv26RGA=;
        b=YQyehcNWH/HXpaISmk4MT8R99KOXRRZW4YRoiwH+pvau1FpjGujmlec535XaaInKnX
         T8wnh4N9CUWhF2ApegkyjAcd0jqcFqIu1YlAe8af1ypYIJqaxvNS8spRHjVMAJo0H6d0
         KAteL7WYKI61vV9hAP46D/BL6YvDmaer49NgGJvzs8i/Rj3MirqNNNco5h8JXuUx0RMs
         L7WBESo9xtis0oFeIqB1lU+fNQBIOtun6lKyWYmm8RtgV/tHPQ5sKeAv8GHui9QOvEZH
         RpCfV3LQ8Im32sX7LyC5Rkq1TKY74l0ehZods3gZdIhr5liRDrO+7mSrGZ0Amk1LuFHv
         EvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692090875; x=1692695675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GyKzeoNrkKCtptNnkMb1Win6meoNikolvNJpv26RGA=;
        b=hStwQnGE/gtTgbBH42ut6scebS4qWuzVmOw+G3HpNh0CubTNvTFSRpl/GrofXtSANE
         U9JAzatF6mZTKqhOMMRf26lvDBowT9BPuFGk9/jF94JWRf+aA3gmbm/BFyLnVMS3uCVN
         jaQPi4TdHhybff+pHuCWQo3y6IMo1Dj0+dm8Xz/sKsXlWu7/M8RSpId5zzMUKx0mL6ou
         I1siy853xEus3JClxn1SM7NJcYtZ9uR6RbdDmXyZd4Tms0b4vIpadY06Z5xVaX73PLuH
         c14vkJCNUbMGDSoYiUXiU5ggyuWIYQ32fOqCxuoHEsWdgndLyNpeEXLg8XGgNXVxYLsr
         BE+w==
X-Gm-Message-State: AOJu0Ywg6Y6iavLN18U6cN+ddywWQuxYNA/7nGi/nLc+dG1g5idp5ZUV
        YqQsDkMJLUTEEDN1HJtXxykBgguljIVZGmtrOb9Ie21INA8puUuyvl8=
X-Google-Smtp-Source: AGHT+IGIkUXHnDswHZIYR4qRhuzq75a8JNyAXGmCuPxIzxsVXoAnNQzpwCSP8OT+hs+7BQPT8z4xFTpzecW8/v9iAEE=
X-Received: by 2002:a25:25d8:0:b0:d47:7448:81a with SMTP id
 l207-20020a2525d8000000b00d477448081amr1452994ybl.23.1692090875676; Tue, 15
 Aug 2023 02:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230814072436.3757-1-biju.das.jz@bp.renesas.com> <20230814072436.3757-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230814072436.3757-2-biju.das.jz@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 11:14:24 +0200
Message-ID: <CACRpkdaZGrnV6bp0Sz5_yxG6y0oAqBeZh2UAz+pM4ULtpWq30Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer dereference
 in rzg2l_dt_subnode_to_map()
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 14, 2023 at 9:24=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:

> Fix the below random NULL pointer crash during boot by serializing
> pinctrl group and function creation/remove calls in
> rzg2l_dt_subnode_to_map() with mutex lock.

What about using, hehe, scoped guards? Bartosz premiered the use
of this and I already like it a lot... see:
https://lore.kernel.org/linux-gpio/20230812183635.5478-1-brgl@bgdev.pl/

Yours,
Linus Walleij
