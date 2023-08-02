Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFCFF76CFD5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 16:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjHBOQR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 10:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjHBOQQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 10:16:16 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163D410E
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 07:16:16 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bcb15aa074so674611a34.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2023 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690985775; x=1691590575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTXc801Zkj1ri6CZmf7N0ApmopmFtqSujE6yq8vHkxw=;
        b=LcoQaPA1dj5aSK26JOI3wL5P7fyZgWqrRIdoikmHqaESrmwNGh6pkJGX+ZeV7CmMsF
         qwL1qOsuuNowee7gVzGhbOvfEdLNy3v9A3RavBobHLEgovrb38bMcAAyLKMPOOJ+Q/OW
         j3gPcgK+cTV4XyHXuZZB9aOXiV+V9PV4BLA3DwVA5XIXXv1+WTLBXPlvJ+mEd58A4Lg/
         XjVF7wVJJJDLQlWlb0aAW7wYiPsNNY9uAYbwxCZZxJfkPU/XhlEK3C2TFxhmtfEZTxb1
         jlO6nYLPZ2wA3RtPtXmTFjshbmCZ+0HJkBdPUUJL0DlD4JMRKJhDq+UMRaXqXN7NqY3r
         eIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690985775; x=1691590575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTXc801Zkj1ri6CZmf7N0ApmopmFtqSujE6yq8vHkxw=;
        b=adYEr09f4j105P7uiq2CTNUI/RDBsPbVtv4qj23mdBVi/78KfW3HSEhht7j1jfGVt8
         56xNXt86jluAhdf4utHS1OQ51mlkIUpgeOkUck+8iBUf2MTjmUFq1zJ1+IQjzsO5lsa+
         L8nwe/IGReUHgTkUyIbLaCXWs/ncoKSqysL9iS6TUlLMFHZZZwlJLoBIyWqlyDegUUQW
         F40u7eUrKmtPMIeokgvoi4x/8azTSmr8RNM01/nTOylNIRx8EsMhvUBdvVKwt1lT8GDv
         a2XNPrTiYTTrBIwP0djYkvNS14ivplVoZk4basZdBIM4jtOPTLV9VWRalZgkIdZP9CJK
         8j5Q==
X-Gm-Message-State: ABy/qLbTQ6jqHo30QqoNqtxrhpEeShnJDvuVOKv2IE5NGBPGSa2d5uUh
        x4pwS8nS8EfM3x3L5VQNtMcAsGiV6VoJMkVF86MBhO4p9MM=
X-Google-Smtp-Source: APBJJlGuZHyb1sohqIpIE0p1rg2nuQFa6n3677v8GRa80xXdErZ1y07LmrmJWDrbTzOoivMzMHR3Y1zfH2wBuzZz6+E=
X-Received: by 2002:a05:6830:831:b0:6b8:6bd1:d0d3 with SMTP id
 t17-20020a056830083100b006b86bd1d0d3mr16062885ots.5.1690985775281; Wed, 02
 Aug 2023 07:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230802035237.177306-1-wangzhu9@huawei.com>
In-Reply-To: <20230802035237.177306-1-wangzhu9@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Aug 2023 17:15:38 +0300
Message-ID: <CAHp75VfPQu3KwLacY8QqnvZmNmUAZiYHxKDQ=TXDT2neZ=obZQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: tps65218: remove redundant of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, andy@kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2023 at 6:53=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr().

...

>         .driver =3D {
>                 .name =3D "tps65218-gpio",
> -               .of_match_table =3D of_match_ptr(tps65218_dt_match)
> +               .of_match_table =3D tps65218_dt_match

Sorry, haven't seen it before, but it's good to add a trailing comma
here, while you are touching this line. Perhaps no resending needed
and Bart can amend when applying.

>         },


--=20
With Best Regards,
Andy Shevchenko
