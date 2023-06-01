Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07A34719AD9
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 13:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbjFALT6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 07:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232681AbjFALTr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 07:19:47 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3CA134
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 04:19:46 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-565cd2fc9acso7231947b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685618386; x=1688210386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc1gvvNoSBI2tzdoTdpOC6Ebsf6vlV6a+quWRwBr/SI=;
        b=eWnsa1QlomzwUtjE+vwspjnzg6+XxtFErBZxrv6MU+OtRkzI40aQvrRh04coJN1xOb
         2jv8D/1vJvEmt+EIIjBnJOEstHiu7rgo3Cg1aQfI4iGdX+DqNLeCOUhWe/rc8/mIOp4g
         kF32ciMzO/GLLHw6hThpARXahcRq+LXgBEJSbLqsargUMuhznw/M/e6/zHKHplOSXTce
         /7G8ecMLLVplumMveYayvutaUS+47pOXz6aXqlvIJq1rKSaWZfPbYi8DTSXVGGMEDv70
         OtsFO016sfTDKIfAufs1O2MBuegndnljIm9BhevPeM4R31/KG8me5sDYZq/g/SWiZ0pl
         Qf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685618386; x=1688210386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cc1gvvNoSBI2tzdoTdpOC6Ebsf6vlV6a+quWRwBr/SI=;
        b=X/fzWM2msMVqnvsucYa4sqaZHva5ZGu0iLH7MQGvsmlEKGgASICYoxzKchN9MUb5yo
         Tjm6N74+HgNvbHIGAHxo5s8Np6RuL3BGb+RO3iF/5LXWUCsTYiXQF9vvGkro6Vf+SVJP
         IneOUb8madtJcMQ3bgiyrep1+f7VbQX6Ltt8UXlEkss3V+NeW4BgqRuP02V7xV990NSq
         dq8fhRlzlaDK9Q8u6FjZyl9GzN8s1/bvI+CMtSksvAr2Nmwi8bO0Q35Eg7fmv+JdBS/E
         vR0FSxZ9AFqdgLntob0hNL0KnUNMEcsoaTD8/69TMnXAoV4rFActiAon4xgKS/Ey7O7W
         BPAg==
X-Gm-Message-State: AC+VfDwdF0SzASj0rEC/UbPK+PdDc7gm3Y81JGVZLH2RF87Dwctcz4h4
        6ycdX8d4O92qHWw3dXNG34UDv/haNSa3iT2F+7s1oQ==
X-Google-Smtp-Source: ACHHUZ6I0Oa9Q+6MibzjA4IHFFtZXP0bOIuhSlnDFHL3F+WiQ4GjqjvyhGRDyufrvvNoyZDQ0KFnULZz+1bPg3MAmhs=
X-Received: by 2002:a81:7307:0:b0:565:ba06:6e36 with SMTP id
 o7-20020a817307000000b00565ba066e36mr9015923ywc.33.1685618385888; Thu, 01 Jun
 2023 04:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230530105308.1292852-1-thierry.reding@gmail.com>
In-Reply-To: <20230530105308.1292852-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Jun 2023 13:19:45 +0200
Message-ID: <CACRpkdaN2r24QrL5t-_SsUQ-9o=BhZx0eFgpbsA+QiFTicPnKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: tegra: Duplicate pinmux functions table
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 12:53=E2=80=AFPM Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The function table is filled with group information based on other
> instance-specific data at runtime. However, the function table can be
> shared between multiple instances, causing the ->probe() function for
> one instance to overwrite the table of a previously probed instance.
>
> Fix this by sharing only the function names and allocating a separate
> function table for each instance.
>
> Fixes: 5a0047360743 ("pinctrl: tegra: Separate Tegra194 instances")
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Both patches applied!

I can't figure out if the problem is urgent or just wasting memory, so
I applied it as non-urgent fix for now, tell me if this needs to go
upstream pronto.

Yours,
Linus Walleij
