Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C0A77245A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 14:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbjHGMjj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 08:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbjHGMj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 08:39:29 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8372100
        for <linux-gpio@vger.kernel.org>; Mon,  7 Aug 2023 05:38:54 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5844bb9923eso51389127b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2023 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691411917; x=1692016717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXHryVI73wJZajWQdtZdeOA1bA7vsuYvfEUOkG10pjM=;
        b=AqnpNcvlh4sds/xSatKCl2xVyvy0hZTCsSRIHJWRkhi4gXQh5XYOBErLnsSSRjPYYA
         DtoGOjX31CHvvksJ5c2oWv07QEkcWeSC7rmUtq0hIrzmxro6e+ZAMMfkvElT/kzJPJlc
         t9AuoFHtoOwwNzJmmmQmK5MuONx3kD9dehEunjV4UrwnGfxaV8yPk4o8z9OzMt5h0613
         5w+LsJ9M+J66JAPioTVd0vJ780jnYycbkjRgUCqlBWQUXuWooqelwI3y2OaYo/3DSrOC
         +vu6+XJj4vzfd9zgEHtlJVX20OZphLNar3wo6lLJyqaapiO9RsQnl13GNPLaxzqURbp6
         pQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691411917; x=1692016717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXHryVI73wJZajWQdtZdeOA1bA7vsuYvfEUOkG10pjM=;
        b=GRR0NxPf8iIWM8BkzcQWzTPd3rsYc3vSNaBN5lHHFJh119ekpF3xBdOub40Be7+/9R
         ZTGhuv8fHkwIsTLYQMLTW66UMl/onmxVYslYx3N3eQNZccMOYmXyMJwnPFWJC4t05/VI
         M2xfXrEnLrgoT9LYkbT06U5aPyUfwv4BAqzBR9H+/URBIzaWV5nWvcotp2G+w9w9EKgj
         dljouiGS5At5yU3EQ7/x6bZj/YtpF/SDEO32iJXebeO0LxZsJOmI3pVPIYrfjMtpJ9is
         ilnYvaI0qhWO1/7OHMhs2aJfIF1yJycGVXUSo9zZiDoQ4L7ltIS7irxgjZTWFko2HBao
         +FUQ==
X-Gm-Message-State: AOJu0YxSpSCo7IiHvrjdT39eh+f3S3b0oPoaJqyRF3l4yUffGFgKZDRE
        QPiNmkgrFrrPMlYK5iJ5hrGquHwD1mt+iKfVqSimIA==
X-Google-Smtp-Source: AGHT+IGXtX8kyUWlc/nPtBroLcm+XO3U3aTNFbrBNBbUQrZKvcnLrSkqNj9OxkRfxLPtO3c4BvLombwNR/1DiZYcvcY=
X-Received: by 2002:a25:8404:0:b0:d3f:2238:8872 with SMTP id
 u4-20020a258404000000b00d3f22388872mr9540358ybk.63.1691411917691; Mon, 07 Aug
 2023 05:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdYzytbM0sN7Q-Niwq2jUgbeVPpREmwUTbja86eGROOB+w@mail.gmail.com>
 <TYAP286MB03159367B2B1932DD38252CDBC02A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYAP286MB03159367B2B1932DD38252CDBC02A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 14:38:26 +0200
Message-ID: <CACRpkdZgPNQ8HDrS95qcAisEN9m2oush1eg_FL72ndqRk=VaPw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mtmips: do not log when repeating the same
 pinctrl request
To:     Shiji Yang <yangshiji66@outlook.com>
Cc:     angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
        linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mips@vger.kernel.org, matthias.bgg@gmail.com,
        sean.wang@kernel.org, sergio.paracuellos@gmail.com
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

On Mon, Jul 24, 2023 at 3:31=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> We use pinctrl_select_state() to request the pinctrl and set the pin
> function. After searching "include/linux/pinctrl/consumer.h", I don't
> find a relevant API to reverse this operation so we can't set .enabled
> back to the false state. If I'm wrong please correct me, I don't know
> much about the pinctrl architecture.

I don't think that has much to do with the pinctrl core.

I expect the driver to set this .enabled variable to false wherever
the enablement fails, note that this is inside
struct mtmips_priv *p, i.e. nothing to do with the pin control core.

This patch appears to paper over the real issue.

Yours,
Linus Walleij
