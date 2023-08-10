Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E91DC77730B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbjHJIfI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbjHJIfG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:35:06 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7FE1BFA
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:35:06 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d645b95c7b8so184648276.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691656505; x=1692261305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBXqYzOT2OtPb+NJDZ3f7HkpKe+WWTIF/B2MNY7bsD8=;
        b=w4hvKtqd3Qwf61/p2oVORO3crFZ6QUpJB9KB3vTijhpiaInY3G+ts0d4W6G4Zv5eQN
         9ysVcS9TtN4UsKUhnBV7IkyiN0VCzl92SgwDMwL9qY5zKZrleGDuy2Vyly6vRj3YSM8M
         oAm0GQrvoRhBgtFyreTILO1Z9TscwikMDY+QM/D4zuc8kfarwjVyMD53sey6Sok/3G5r
         QzJvJ3He+W3kFu2E35NFfk/+yG7f0k8fpcb4DnchMbrheeB9QU4j6GeOeAXtFx0hLFzz
         gYUC7pjjxBrZBbpdVWgCKn8iygLyyQq3HXtXjh1XOxTrIXz5jHRR/cPGmzSks2fq5YOw
         UeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656505; x=1692261305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBXqYzOT2OtPb+NJDZ3f7HkpKe+WWTIF/B2MNY7bsD8=;
        b=eC1+VaN5HevZXeX3BFweYzLOgnglhxYvFvJUBl/Cs6ktO7otx1+KMXZluymgMWOSL7
         0G7yL+TI7gAp3lGOhXVyF+QDXZY1sNmDtohq3ZJ+YlXbSVZoaIt/CXtg210zMNxDkkUP
         FtxLMYxA5KiCTg/kl6nH1wYBc2UXFKUcblC6w5bjYET9sN4XS0ssL6ng/04VzvoHUw8l
         LZE+E9tV5dnNBZDrHXu+xHowsYnTadWavoAj1BDKz/Fq5OMBcF/8U1Q5RuLHQJWpUVli
         9smOsajzPNJKdRQcUAz8r5J2WE8oSxCBNaWBq0M5dOFXUmV+pnbHDCtzMxTQjL87KO+X
         fjfg==
X-Gm-Message-State: AOJu0YzI0nnWrXy0rufASjoUHmMDheT4eKpN54nmUfdbqhkJGwYnq+9s
        7h8Ssyky9fmI2zAZYSn7f8rPHJ2kQ0Q/bio67N8Sxg==
X-Google-Smtp-Source: AGHT+IH/F9H/BlNGdJX2HjqnmSIeBaU0d288rlMHVZoZGxtbwTJzsuzbfcSMjJlNwl8h4xPDy9C2ezZp6rc7/C0l3aM=
X-Received: by 2002:a25:684a:0:b0:d48:a723:6d2d with SMTP id
 d71-20020a25684a000000b00d48a7236d2dmr1836621ybc.51.1691656505582; Thu, 10
 Aug 2023 01:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230808102207.130177-1-d-gole@ti.com> <20230808102207.130177-2-d-gole@ti.com>
In-Reply-To: <20230808102207.130177-2-d-gole@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:34:54 +0200
Message-ID: <CACRpkdYWCO191t9FgZtyO-r==OPXkCtYMo3BGncP7OZKJTKqJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: pinctrl-single: add
 ti,am654-padconf compatible
To:     Dhruva Gole <d-gole@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 8, 2023 at 12:24=E2=80=AFPM Dhruva Gole <d-gole@ti.com> wrote:

> Add the "ti,am654-padconf" compatible to support the new wakeup enable an=
d
> status bits positions on K3 family SOCs that support the IO daisychain
> feature.
>
> Signed-off-by: Dhruva Gole <d-gole@ti.com>

Patch applied.

Yours,
Linus Walleij
