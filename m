Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF96D50E8DA
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 20:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242502AbiDYS5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 14:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237656AbiDYS5K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 14:57:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5DDBF513
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:54:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id l7so31476988ejn.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ijmGFpui4kk1+i77U8TJDE/cYVxUEWnRVqYSgVaIa1w=;
        b=TGqP+ZnpCqfxPGQMb1RSvJB/1x/j/BEDOr5MUeAwoFvf6GwYH3vk7s4ySkSl/bR47C
         gAPiKRi379BODi8ou1RU1EYt5sZ0zj9WrpYdgffw+sTth5WYJVEbFO5d1cz7uFGdhtK4
         AAhrr19nY//6TChPJBrcz6f5GjPxJHbAqi2d4OqPDUCVUmu+jfBVFVtm//sPVbK7ElBn
         EpYSa+toZmA1y/aL4UaJDIBFFINgSZiaFO8uN0KtBZIC4AOKf218estYj+OyWw7xm5JO
         gTiXHVoKh2dBpufRt59jkLp1BEijrjFz1geiplgjfWFTy8RMa81jVrOq3NrsRApo6yim
         uY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ijmGFpui4kk1+i77U8TJDE/cYVxUEWnRVqYSgVaIa1w=;
        b=DYBeTKzAvHlP+V/G2nKYck4X+R5G4HGlhzK6xP8Fhbj625zrV2cNuPp5x9ec6ylJ22
         7ND1JS1gHcJqYOOLHFu2erRbUb3zAkCZrUNjgS9spBRJ94PKaMAftT6fJmtwsigrAA36
         ltxJu+i3j4OEDsuFHF7o8tieEd3AdPzlRWtFC58O6MkHxEMDaClUxHyMeNAHJkCYuDrg
         +DqlHFmPn2BB0RyJGDyfpqrNRt2VYfCaYFJBp3uwo8f615Glv/jBtnp3aCKSUXzVW3u+
         dqqcg4SCu/yngnBC+ytfFXutFagLzFhti8JqY/yn3Md3xxRn9b+zedQpGEjbkHoNRM0R
         P+jg==
X-Gm-Message-State: AOAM532zdgnVwBc5RqsjljdSVu8FZTrVlCeFrZIFOKcJHjLR7NhpKkve
        4tRtFXG2/h4CI9Za5gPfyP0dxlHcqUsn7IZ1aKvPOA==
X-Google-Smtp-Source: ABdhPJz4U/SOnuJ/PwbM3gExth1RpnI46Rm1FgwxRlGVZz89k1REWRLRYs/xVWm0mTWIRqZup9lxlLk6MZe+2bd8ksk=
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr17918220ejc.286.1650912844595; Mon, 25
 Apr 2022 11:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220421200654.1132629-1-linus.walleij@linaro.org>
In-Reply-To: <20220421200654.1132629-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Apr 2022 20:53:53 +0200
Message-ID: <CAMRc=Mf0i0VsGOpu7UG0reJWJRxNXPLYkv1iUxANnjTx-NfZcQ@mail.gmail.com>
Subject: Re: [PATCH v2] irq/gpio: ixp4xx: Drop boardfile probe path
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 21, 2022 at 10:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The boardfiles for IXP4xx have been deleted. Delete all the
> quirks and code dealing with that boot path and rely solely on
> device tree boot.
>
> Fix some missing static keywords that the kernel test robot
> was complaining about while we're at it.
>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart
