Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400CD526BDD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 May 2022 22:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384477AbiEMUvf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 May 2022 16:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356811AbiEMUve (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2022 16:51:34 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AAF6554
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 13:51:32 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id r1so17267230ybo.7
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 13:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q1lUeUaxjxAnhoOvbl5ZUVWNHVA77t2uWF+2X4IoyPA=;
        b=cHfwau7y/FPCH7f6UNMmfoTRwNQhBKraErEQFbL4UMlr8D19qd52XiN97fGiyRRcsR
         V3TpQYM4GaknOfyeqkInhEWStX+JHJ/WrcRdKdpIUL0ZyNhkI6MGvvgN54LhfZ1xJTBh
         33oSENmqBqZVIvGd+3WqXF/jqj3Hb3+NE8usEaI8mHgV2I3uB3+6BjbFj0rpq9pIRt6g
         OteVPi3Q6Hj+XVq0Z8WfURFvVtXKIhqkL8maORr78SO3oOU7qC93V3oKDjyq3ys0to7f
         2Y294w6LXLOVqAzwd+6RZjOMB3xuML4RHhvv0OlLffmSC7oji8RULuqVC0pOCp9sJxZi
         uYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q1lUeUaxjxAnhoOvbl5ZUVWNHVA77t2uWF+2X4IoyPA=;
        b=2KAm+MYCf5V3kT/d01ubP5nTmlTyIQPV1W4o08mNvCOo9UYogjCec9dpSvvZZ9rY3S
         t0P40kDWRPVSwKgLSAmgjBtgoSO8ic7kgm8wqWm/5pJA1fJXhzHDfFk2bxjCHOxE/bCV
         zJ57lohkYTu+XNIWaRO8/JW0e1ekgg9uK0vzfX1gsW7H5EmdJ7vPi567GASi5GiDV0zA
         BESmeFLwWGnNH92DusVOiVgRLVvon6/MV+1Ka9UvSgx6XRLuD3awbDfHBr2n6kSjWvYg
         uzaZuLBMA/3E+PMRDjysHgsJSj9p/Sg7NG2HpJCyw/NKxTkyUIj7sFTR9tzqWBanOnKV
         uUew==
X-Gm-Message-State: AOAM532p0NiWfOmXCBONq9itzz0QNMdkonVdanZ0aLA0flTvjDZFE9TL
        Q1HUmQMx7ILkprRPvS1RIok+4DQqRdm0hdrJXMyFwA==
X-Google-Smtp-Source: ABdhPJxzWfxcpJX1h26azJfPz0/Orz9nry4uuChl6eqvoECZKt8El5KnYLZ7vDZYwgCD9hXs3qS9WmEwLodLxlsirYk=
X-Received: by 2002:a25:2c82:0:b0:64d:62a1:850b with SMTP id
 s124-20020a252c82000000b0064d62a1850bmr148021ybs.291.1652475092218; Fri, 13
 May 2022 13:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220512142910.328995-1-dinguyen@kernel.org>
In-Reply-To: <20220512142910.328995-1-dinguyen@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 May 2022 22:51:21 +0200
Message-ID: <CACRpkdasJnPikNPw0N-1C_e6i0wuKfxAtyNj2m96TxaMORz4-A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: altera: correct interrupt-cells
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     brgl@bgdev.pl, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 12, 2022 at 4:29 PM Dinh Nguyen <dinguyen@kernel.org> wrote:

> update documentation to correctly state the interrupt-cells to be 2.
>
> Cc: stable@vger.kernel.org
> Fixes: 4fd9bbc6e071 ("drivers/gpio: Altera soft IP GPIO driver devicetree binding")
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
(...)
> -- #interrupt-cells : Should be 1. The interrupt type is fixed in the hardware.
> +- #interrupt-cells : Should be 2. The interrupt type is fixed in the hardware.
>    - The first cell is the GPIO offset number within the GPIO controller.
> +  - The second cell is the interrupt trigger type and level flags.

So now this says (A) that the interrupt type is fixed in hardware,
and (B) that you should specify it.

This is confusing, I think something is wrong?

Yours,
Linus Walleij
