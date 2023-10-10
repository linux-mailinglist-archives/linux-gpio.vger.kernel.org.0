Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CB37BFA6C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 13:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjJJLyx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 07:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbjJJLyw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 07:54:52 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2608E9D
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 04:54:51 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7b92cd0ccso11438297b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 04:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696938890; x=1697543690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gx4FwWXRr3mIQseYEcpUQwYRu1NYJR8/WvHVh/sU6vE=;
        b=T7yjaNU1zrtURLfRJ2Mn08cXR1Q8l8B5xN1czchH4h4XJnoCqaUEk94jOuJscWV91i
         GxT3l05CEpb52uzzILZdFwsEdN2BwD+x/D3Dz/jESXsnEuiEzfJyzUmsfuGlu+6dqOVy
         AfXGQog2pHgxRUzrtgXb4SOH4m9WeldAtNqzdtVMoG/k4Lzj75D4Ra/HR8GnR/rLIAqC
         QrQ5uxzzVHDd3upCE3Nmwjrk8yavtHo5RJ3sN+r4fuLclsBCu+svgSOhJ/k7LFWklcE0
         QJEgUqJ6mxvAqTXRuVxrc/a5punyTHGoIf7OQh694oEy+vcwCGQEm9ONUrfzH3lOUR5X
         e5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696938890; x=1697543690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gx4FwWXRr3mIQseYEcpUQwYRu1NYJR8/WvHVh/sU6vE=;
        b=agWo4CjXPNOqPY6ERNnQqXNSW8wr6uyxAHXvH2ImaR2dn1BC8UJNdkKS+0wI2yh1wc
         lsx8+9t0+espNl4epKS5MuuBgoW2zdiU5DqnzG42SxO0t+pQEAmWp1BUABU9ziWl09EH
         M0IMyAf/RzIUg4cfVY/ynVdYS4HGpNhgaYDhEUwESwq05RRCcgxeUtFQaaEsCAMI/A97
         47N4StgVIKLiozRoXFh8ZkPNUJw6e6AFjCKssXeaXSvyoYsB5pNhuH8QpGm/25G1SjTt
         /iiY8vh0it3JgW2aEv4XArSPGS/+lPFNl/rQibeQLRqXkOXnN9Je1RHszKmXESSrbPZE
         vodQ==
X-Gm-Message-State: AOJu0Yw8tjZLwPtR1zB5b0om0j42rUGcEVUEy/NmW7MOZhpWil6/1gMJ
        DXqERbEFtnr0XTr85fsmSzfhVS+rxMWCNC5oPK4BJg==
X-Google-Smtp-Source: AGHT+IF+Ui62wT1xAsT+Df1TzBYq9Im/mGBXcOB7wAhOIyv8/EVQH4bebQZ/910IcCaqUUZC5gFA8li9Vc4z6iCnfdg=
X-Received: by 2002:a81:bf48:0:b0:59f:72a6:da0e with SMTP id
 s8-20020a81bf48000000b0059f72a6da0emr18093517ywk.41.1696938890394; Tue, 10
 Oct 2023 04:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231005025843.508689-1-takahiro.akashi@linaro.org> <20231005025843.508689-3-takahiro.akashi@linaro.org>
In-Reply-To: <20231005025843.508689-3-takahiro.akashi@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 13:54:39 +0200
Message-ID: <CACRpkdbavrEKEVUVvxhmX+CTOhHraPDJv-Q0+OGUEiq_YmA1Jw@mail.gmail.com>
Subject: Re: [RFC v2 2/5] pinctrl: always export pin_config_get_for_pin()
To:     AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc:     sudeep.holla@arm.com, cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        Oleksii_Moisieiev@epam.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 5, 2023 at 4:59=E2=80=AFAM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:


> This function will be used to implement a new pinctrl_gpio_get_config()
> outside pinconf.c in a succeeding commit.
> So make it always visible to avoid a kernel test bot error.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310021320.gYfm1nLQ-lkp@i=
ntel.com/

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
