Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D25577732B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbjHJIkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234270AbjHJIkY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:40:24 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AA71BFA
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:40:23 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d3522283441so599707276.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691656822; x=1692261622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsfGzEazIvdh+zNYAVihPe9QtlwCY0MYwB2x2viW83w=;
        b=EWBFug1jnG6lzfq51hRdwU5rYsH7IcSWd9b4d60fcdm4OSH/LvCkAb2BfZsGNbE9E7
         9yICcRi9ZoXreeTGaR1Me6hhiSSu43rwXmnhO9iPsL2UTUt6sQcqkSbCahEgJbhapPab
         xYFst8GrYNoaSLX+TAd/9lB1MiNmeGPMHrWU2RK+BYI0+Ws4VoradOKuVcwjSfsXHvDm
         CPKDZNqQ5blAB0bqIOJOU08dFNpC1xyaLoU7Uk6A42s6AuZIrSSZ2Z4/qHTlOdfF/qqX
         yHnlj7viHbbO9MWhAuO62WsWUFGx1obQX8s84ri1I4W61rXqcZh4+DLawjkF5a51HvAP
         456w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656822; x=1692261622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsfGzEazIvdh+zNYAVihPe9QtlwCY0MYwB2x2viW83w=;
        b=i5fFlnnIGHWchHfyKcq6kpHsUTpt77F2fM/M7AGxlCqMnN7OG2QQev7B/4YsSgAh+P
         hlTmbv5bERnYJGTWr0Ha1eZIffHtjlTpQCiD6E3bGxMLVkvwbS3D2zYgdVx/3gSpU2Jq
         a4RAOsQhJnnIjJ9dxXXiK13N0mSD+N6wWDqKWOohr4aa/QVM8Q/NMbs/evWJZb+5egCn
         JyG/+z5d5wTILKFlP1OzjlMUX+0EOR1m/LvKiQ/T0H4/xysmkxlr3m+OMFglDc47Qpxa
         fxvnk3TkW9a/7kdzLJ+xtSEZV0/v7JWiuQnmexJClyPssB+CpDCVyJ834MzHTZi1Igpi
         mJyg==
X-Gm-Message-State: AOJu0Yw9qStmVXEkGvnoTQcvxLn7Q/RIT6+ck+MHbWOAdqvW9bynMwXd
        sJf1LNTgaD7doEEgdacFWHajYMzZr0QUZnirMPbzuA==
X-Google-Smtp-Source: AGHT+IHKviWtzrJ66uP6FGal+z11qioZWVN6jTymBePmBR1JvwCIjgN6IOx0wvXIyFZOSthU9LO2Oxc2qywjuzIm15E=
X-Received: by 2002:a25:d114:0:b0:d35:9a48:51b0 with SMTP id
 i20-20020a25d114000000b00d359a4851b0mr1940220ybg.7.1691656822489; Thu, 10 Aug
 2023 01:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230808102207.130177-1-d-gole@ti.com> <20230808102207.130177-3-d-gole@ti.com>
In-Reply-To: <20230808102207.130177-3-d-gole@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:40:11 +0200
Message-ID: <CACRpkdawMNhWycA-Q-rTMy3LCh-AH2e+2V+HPJtYMBfJvxrT7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: single: Add compatible for ti,am654-padconf
To:     Dhruva Gole <d-gole@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
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

On Tue, Aug 8, 2023 at 12:25=E2=80=AFPM Dhruva Gole <d-gole@ti.com> wrote:

> From: Tony Lindgren <tony@atomide.com>
>
> Use the "ti,am654-padconf" compatible to enable the use of wake-up enable
> and event bits on K3 SOCs that support the daisychain feature
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Dhruva Gole <d-gole@ti.com>

Patch applied and I also alphabetized the compatibles when applying.

Yours,
Linus Walleij
