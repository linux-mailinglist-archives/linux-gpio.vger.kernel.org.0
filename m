Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDAE3755749
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jul 2023 23:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjGPVJQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jul 2023 17:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbjGPVJP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Jul 2023 17:09:15 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30661B3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 14:09:13 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-577412111f0so41552677b3.0
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2023 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689541753; x=1692133753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCEUaKTw0USB6po20NzuaniDL11J92pg4MyMRkZkqoQ=;
        b=FxMQKSpH3KFIaRhkN3OYkfG7ElzSnssg/zFSWXqxyYZ6b7iH+856H5wltcDBG2gvr7
         3JjDe7k+nsll1OzOWGRsmYaUlJqvTZv4LWB+59WWgKil2C3rbHhDkRh0c6w5Vzq86q00
         OOUy0tNncooPTk/TDkU763ICBaWdwfVRnYcqjUasTvAuVwXZgeK5AzDL14kg7kGqkH8m
         bdOPetEKf3+gX1xzjyNGsVkipW48JAAxeW+DRwg/FVOVfM4wEeVelRLQOgxQKzx+njFW
         sQ4yb5lNhMYojUU3Mq41i5gj/+cZsnZW8KkOPlurkdBypcn7jVMz949ZuMIZvT2SYdqH
         VHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689541753; x=1692133753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCEUaKTw0USB6po20NzuaniDL11J92pg4MyMRkZkqoQ=;
        b=Z8pbioABGy2r7/EjogbrDg2t8j8svdgFoZHPTccz1qfTWzhZ89Vx/NwdJGO7B6NPXu
         EBwxIxGAP2msXx3m57i/7Djn7M0YSgefzr5Sph3Mj0Ntb6yQib93XMaFo74L/iDGnM3z
         ImMATeQsmGfzJ/v7ZD8vzJDb5rSyjdFbY3WfX7+OkqyIAogJFG/fdnKHSEK5ZKMiGNFb
         V+cQqHpHttFHbp385sePvSX6HS4D9ESek33AZQEkbabTy16NuAybNXxpgQL4FUvS8Tfj
         jddMjSN5xCwHgN8ajSVl7LKbqO1hrMe9ms+fNGZe4ZJ1XJysLVo+5oYjFU7QWLx4zLp1
         KC5Q==
X-Gm-Message-State: ABy/qLbv5yxG4zePFX0Y5Xoa3aFgBWs2mUQiByt4jJ1LZg1CVzhxyArC
        rKypjRKEuwNV3XMwsYhTm/WwunhjjpVG7pJOKBl1Ow==
X-Google-Smtp-Source: APBJJlF4Ah3LfGxe2NfdzIlKjKDyGT1Pjw0qor5qSsnjJq+SRixw8kIJIIIvUO9qxfA/RuFEOkge0Q0X5eN9oBKTTD0=
X-Received: by 2002:a81:730b:0:b0:56f:eaef:9d40 with SMTP id
 o11-20020a81730b000000b0056feaef9d40mr13956898ywc.46.1689541753208; Sun, 16
 Jul 2023 14:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230704124742.9596-1-frank.li@vivo.com>
In-Reply-To: <20230704124742.9596-1-frank.li@vivo.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jul 2023 23:09:02 +0200
Message-ID: <CACRpkdYej2TBOFTKWZbp3rAARyDq=RVmx=eNR_48XsEUipbLAw@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: berlin: as370: Use devm_platform_get_and_ioremap_resource()
To:     Yangtao Li <frank.li@vivo.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Yangtao,

On Tue, Jul 4, 2023 at 2:48=E2=80=AFPM Yangtao Li <frank.li@vivo.com> wrote=
:

> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

All 4 patches applied, nice cleanups!

Yours,
Linus Walleij
