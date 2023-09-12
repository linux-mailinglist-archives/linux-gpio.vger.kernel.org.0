Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD4A579C7AD
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 09:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjILHGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 03:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjILHGl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 03:06:41 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4F310F1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:06:35 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d7e6d9665bcso4701776276.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694502394; x=1695107194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzLy3CeHuyStEoML6KUoaK0mtulfqNSCOCfn1i2FJJI=;
        b=yRHqtYzBLQjgJuWE9K4sQopizatvQBSN4fNM08BcmBRCXYMVDF6BY4gKKgEjbH+YRu
         wsSLsdJigci7K5o5uqSflL1dXiBqXfajOy70GYnDh4LhVkSEbwoTMC31WkGUm8EzNs4Z
         hazGAxXQ6UCiYR8tesQJ0Mo6ECDWqYSe7KBQKh13ZAs8ZgFP3XOjPqSMA4jxTg5BfF+S
         DTfmKL76qHXR6U4t2zuiWyTzZpwohgh/21wGFnmGpCxrtOm3tSd/XaM4U+cSrqs8fb5F
         vvhs8y7XcxRHDdlgemgUCNeZgKNW8CTBcm/qSgHTtmFNow6XGlipSHfmjmRe/tyNB2Hg
         BwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502394; x=1695107194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzLy3CeHuyStEoML6KUoaK0mtulfqNSCOCfn1i2FJJI=;
        b=ts/ktE18Zyo/pAMezuM6Wqi3MNrWgtoCopr/uZNGuLSSEB7DwEnSwmh2psRDXMIrUI
         TbqL+kLMbL7RSoi4ETXh/StMTLsvPbrPodakoTkUKSSrCmdnwXHDSrvQiSKygmx2QJ66
         aRAggX4OX2uhcyAzl9mUu+uYzRworSexK014yeGLi1dPZNxDMEyHAEZWjztZBc6QjLch
         eKsuOGREuy0EJEazIVs9S5/jnDtlA15rT3l3q3z0EqTWgIFPxnOptxIReodIg29jv7tl
         3GgSooCxS/pH5f57D5MhzeP6kVTbgSivrsuei9aW2ck7iE+QJZ/tF2WMzZrrwcQB0L9k
         rQrA==
X-Gm-Message-State: AOJu0YzzGOWWLlxH+NADc86LmhZq91ySl8l7ZaTPVlQ8FGxm87ncqs86
        gsRC+/hpPnXXj4ydqEXeIs3Ju4r388VoU4rglhDM/A==
X-Google-Smtp-Source: AGHT+IFqwoCb2FlczC/jSfpRBfdCYvJDufpy2nX78o6xucJlsetiHtnY5ED7GaRC6DZThDKLINyW0KpFkVXeS7DJZzs=
X-Received: by 2002:a5b:709:0:b0:d80:68d1:b826 with SMTP id
 g9-20020a5b0709000000b00d8068d1b826mr7109521ybq.6.1694502394406; Tue, 12 Sep
 2023 00:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230829123524.17291-1-zhuyinbo@loongson.cn> <20230829123524.17291-3-zhuyinbo@loongson.cn>
In-Reply-To: <20230829123524.17291-3-zhuyinbo@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 09:06:23 +0200
Message-ID: <CACRpkdYrePd+m_ZoppG_XKVQEcgzom31pXhKHisCsFr=9O2NPg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: loongson: add more gpio chip support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 29, 2023 at 2:35=E2=80=AFPM Yinbo Zhu <zhuyinbo@loongson.cn> wr=
ote:

> This patch was to add loongson 2k0500, 2k2000 and 3a5000 gpio chip
> driver support.
>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
