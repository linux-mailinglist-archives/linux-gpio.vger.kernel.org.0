Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DA97331C7
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 15:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344273AbjFPNAb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 09:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344818AbjFPNA2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 09:00:28 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458F235A4
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 06:00:26 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bc4651e3838so569979276.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686920425; x=1689512425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvdWMVWle3D0jO0S4SA/HhQT1FHM2fbq6dlchswpFvQ=;
        b=Hx0wJI5o0/Ql3BsLN/+xlaxPAaYG1vT0wNGM833HXlLHTV4nFSvJwjL06xrMfUDkaE
         +qawKe3EliuGv8MhIVu6FQQmnth06j73ZoHKjhT7xs6bhghiawdCS6VzLvoM1JVuA+IM
         xlPVWcxgYcGtwgDXG1yJJJMKAEQNLFmP+ub+1s9H4tyepnPk9ze6+PMEOHyaLEChBe0a
         f5E5TraslYewcPNlC6i3U7waaJQnW2nenVfaixr8AWZPMGoVgbCJfUSh+M62KSc40xBQ
         +jxsA/5DhAF3DPJl+XbTUPGH1rRnKa7tMIbMe2gv663TVs7hIoyJhLDe73LgRonnmRqQ
         afNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920425; x=1689512425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvdWMVWle3D0jO0S4SA/HhQT1FHM2fbq6dlchswpFvQ=;
        b=QYMZkWfRQQxBdBSRqWhm8GP70pYjCUOg/rNNaNsaApI8FGK6GYhRU/ymCZdMMnfaE5
         xjSL4tbYA6jZLKckJVLIR9kWIjPy6YkWJB6PO6kth0tk750n975dui5ab71DifR7lSma
         dpyNG39JuJJ2AmNHqEaTzWtGhZ29/HiF0XD2L84PLITPVTXWvj3lZPt9nrHW2NUIY7g+
         wX8Hke4TrhmPMtC69+SoLWPkxH6QVe90NAtiKWrt/NhPyVFVkh0YLexg+bPI78ki9dOy
         vltlVaIBKlHMO3ubYyxIgzWHUSoJNm5b67CzGRliQeeBk/NFXEeOIWZTXqJXH7+7cQ9X
         YHEQ==
X-Gm-Message-State: AC+VfDx6GjJbSPJOss0BAIMkQgB+Q3oLaRRu6VT3WxpS3/+zPUvw3eeG
        HWMTkcCJp6jXCu9VJTzrmQALUYKRCDkOCq/t9nxgEG5JqU+v+p1d
X-Google-Smtp-Source: ACHHUZ7qjLee8UemepLrygtLsZQpGNhbY9ZvMJVXMC8Mih33ncS0FsCdggjbyBeUEMLxw22yEeijYtiXPtuxj6l8ehU=
X-Received: by 2002:a25:8908:0:b0:bd4:e6d6:2b8e with SMTP id
 e8-20020a258908000000b00bd4e6d62b8emr1267863ybl.50.1686920425258; Fri, 16 Jun
 2023 06:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230504233736.3766296-1-xiaolei.wang@windriver.com>
In-Reply-To: <20230504233736.3766296-1-xiaolei.wang@windriver.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Jun 2023 15:00:14 +0200
Message-ID: <CACRpkdbHzO-Tc7s0aGMy7QxHMQ1NhN0tXF5U_ZdnVcUGn8rjwg@mail.gmail.com>
Subject: Re: [v4][PATCH] pinctrl: freescale: Fix a memory out of bounds when
 num_configs is 1
To:     Xiaolei Wang <xiaolei.wang@windriver.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        ping.bai@nxp.com, kernel@pengutronix.de, peng.fan@nxp.com,
        shenwei.wang@nxp.com, bartosz.golaszewski@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, May 5, 2023 at 1:38=E2=80=AFAM Xiaolei Wang <xiaolei.wang@windriver=
.com> wrote:

> The config passed in by pad wakeup is 1, when num_configs is 1,
> Configuration [1] should not be fetched, which will be detected
> by KASAN as a memory out of bounds condition. Modify to get
> configs[1] when num_configs is 2.
>
> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
> Changes since  v3:
>  - update commit log, delete call trace

Patch applied.

Right now I have applied it for the merge window for kernel v6.5,
tell me if it is really urgent and should rather go in for fixes.

Yours,
Linus Walleij
