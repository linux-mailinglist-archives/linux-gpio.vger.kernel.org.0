Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AC27B72BA
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 22:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241080AbjJCUt1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 16:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjJCUt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 16:49:26 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9973BAD
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 13:49:23 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a22f9e2f40so16417267b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 13:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696366163; x=1696970963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FJPUi+MyKd+dVlpPJp8bCnu+4EByJ0OLEwCa+47Woc=;
        b=iQuYNBszchRggbd6WjC55XwIUE+gyP/TU5N/kmIZaDYm70LI6NqGfn1UzzGQi/tXaC
         unkpbqBS7c5TR0yJ34a/OdFb6FwQGjNMHrtiChKmpUdtQCegM+xuJFjXIyxhogSnEOVx
         f26/hvizaKpAkmFIm1A/4kf2HJH2EeK6AnHz6qFCS4zZ0nSd4HzZaJKAsangJS+fKZpx
         NKdPdSMYeri8z2PiYed0NaWLcGBNQxM0in4EPXL9IXKevIrM+Hq9rt3RT78KM/x6JGBa
         Tb3y3iF37kLVIha2+xdHhdSURKn9Am1vl3H9Sis0/kn4+jXgoo9p7wHMJQaFZZFxHdBL
         Dspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696366163; x=1696970963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FJPUi+MyKd+dVlpPJp8bCnu+4EByJ0OLEwCa+47Woc=;
        b=tb/nwAIVwzx0Uk6DizfRgw9IsKzYdFt56ZOaZp468rPmZQugTTIUbonvLqSmQLUaoc
         52zBsbO8l3u6wsEPJcMg7RQpM0lhIZ9FHWsupxStQjJ2p53IaJhsjq6pWuZ6FamixfPu
         4+RUeHqrZSpEVhJdjwqnp5WOoaJxuBDb24YuyaOWQgNuaw/bCv+2H6OPNzXljwY/xFK5
         nYj9isU38GdMOHIo8ziyKrnZZG3D1hvuJlD0jagM/2LOoTLij9sswWHypkdeSKms/ZYW
         txnXwRcuSQ3uXWI/putP88T9pTykG9XhfAw3FYwPf/9QHhi8IfabPd09Y4VxR/xthYMW
         5wxA==
X-Gm-Message-State: AOJu0YygUj1lkk/DaZ5meRdlYawqjm9+JF4C1mzZk/qjGbv2LYz3PkZR
        qMn1TchVEGbqpEhVsH6zZ+FlJk58FrClx9apJlJjPw==
X-Google-Smtp-Source: AGHT+IEreLlAAb1BEaIqmVOi80nv6yIE6GNZPrSiU+SaEd9snYNzmyb1GnIOcQcstQN89h5TnTmEDXhfiAWNkiQFVLc=
X-Received: by 2002:a0d:e215:0:b0:573:bb84:737c with SMTP id
 l21-20020a0de215000000b00573bb84737cmr740029ywe.26.1696366162811; Tue, 03 Oct
 2023 13:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231002021602.260100-1-takahiro.akashi@linaro.org> <20231002021602.260100-2-takahiro.akashi@linaro.org>
In-Reply-To: <20231002021602.260100-2-takahiro.akashi@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Oct 2023 22:49:10 +0200
Message-ID: <CACRpkdZsQN5V0Nt46dQmUiQo-co81Z_TrzWW_9CPJEbF+X-vnw@mail.gmail.com>
Subject: Re: [RFC 1/4] pinctrl: define PIN_CONFIG_INPUT
To:     AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Oleksii_Moisieiev@epam.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Takahiro,

On Mon, Oct 2, 2023 at 4:17=E2=80=AFAM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:

> This allows for enabling SCMI pinctrl based GPIO driver to obtain
> an input gpio pin.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
(...)
> + * @PIN_CONFIG_INPUT: This will obtain a value on an input pin. The retu=
rned
> + *     argument indicates the value.

We need to specify that this is the inverse of @PIN_CONFIG_OUTPUT,
that setting a line into *input mode* requires the use of
@PIN_CONFIG_INPUT_ENABLE, so the config can never be set
but should return an error on set, and that the argument returned is 1 for
logic high and 0 for logic low.

Otherwise I think this is fine!

Yours,
Linus Walleij
