Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960A27874F4
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 18:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242279AbjHXQMx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 12:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242441AbjHXQMw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 12:12:52 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8F619A9;
        Thu, 24 Aug 2023 09:12:50 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6bcac140aaaso16389a34.2;
        Thu, 24 Aug 2023 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692893570; x=1693498370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIQ9Igg/2vqL41c2PgdemJtzPYVN73XDB54b5bc8CSg=;
        b=S2cHayVIbWGwLFnjIGdG2YDT5PjNJ2kXm8MWxfye+DxgpnF6pd+iykC+mPwYKeDSfj
         oKyDdETUz0epUDSbi510qPlXtySRsTY6Hkao1eNyjXjteiy0/RtVYLyJJFUyGpoAsl7d
         X43OnKCGFcphdf0ssj7O4/cJLhDxl+lNZYJmSXgA2719qhM0FcBdsgblQ6jN4kdk+kC4
         P5CvglIBvAjsoGqB/GfDrFW5r2xqC2otDI9ALX7arQiM9rO2BMZdFiKUbO+bdRRHsE1E
         tR0iWzi5F6hxVOXUNPRhjvOSgNCF7LgtqgpMuSXDIg9C+oRPuHlm1XZG6xekMgbHi21M
         /1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692893570; x=1693498370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIQ9Igg/2vqL41c2PgdemJtzPYVN73XDB54b5bc8CSg=;
        b=HqRj0Y9km8xzvMpGtN2CzbyXj6q5GFLtH0JrZKdjgrN1nHM0nwclq6U/9vBXKXb5l0
         8IOITZuZ4PI3qp2ZLBUdS90i7NFYr98Y0aMtYgK9lsrlvzpOlzEf11x1SfPTaTroW4Pl
         +gWRU5lFgXEajP0sdlupsXVxr+/lnsW5ya0Ocx5+b1nXDOA9cajDp+nz+52C+kM1OFLb
         34YOo7Eo28z8gjD+QIy7gHPr898JT3ExFsFq2HGSVg6H4QlSldUvbORP16FxDU9oTUE7
         palIpqnWEUKPLyIR6TYmrWgN9UAXPBRaGnZT0CKCKsYQpAcx6AyeKX++65hBvnhhP7SR
         izRw==
X-Gm-Message-State: AOJu0Yx+xi4WW7cdBCBoN4WbNaVqa8y8M12c7kGjlNIXoi3zYGC8VyW5
        I9Ka46ctbo5Ag4t/tb/i1DOkinwES/uMaCpbnxC8wqWgwr0Vvw==
X-Google-Smtp-Source: AGHT+IFZusMY2GYTZCoXD3wu+fJu00iHpz5WwtTJUnvf2sQUQ6KtqVD0WrNCVoFblNNEqvkM4jzC0kQk0N5naaCgf9E=
X-Received: by 2002:a05:6870:d60c:b0:1ba:caf2:acc3 with SMTP id
 a12-20020a056870d60c00b001bacaf2acc3mr232581oaq.5.1692893569811; Thu, 24 Aug
 2023 09:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230824160017.368517-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824160017.368517-1-biju.das.jz@bp.renesas.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Aug 2023 19:12:14 +0300
Message-ID: <CAHp75VePsJKEWM0v4pKk3=oXX3W=r=O-sajjQgh4qKX8uLbkMQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Use i2c_get_match_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 7:00=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Replace device_get_match_data() and id lookup for retrieving match data
> by i2c_get_match_data().

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
