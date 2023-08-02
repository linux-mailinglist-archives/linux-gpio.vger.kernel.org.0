Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20EAA76DB54
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 01:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjHBXPI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 19:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjHBXPH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 19:15:07 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA9D2D4A
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 16:14:47 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d16639e16e6so286819276.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2023 16:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691018087; x=1691622887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCAUHX9CMj86tQNhShQNA9P7+c+YIDPXdibh9FXsZNA=;
        b=FUQH7OwFUOLN5x+o+NClbzaI5s189I4zQIU4r/Br6QTAYN/tUf3omazOop92EDLo96
         Wy1SWk3+1DwZALTa70/xMUTVEvsfIg57ddvVgKg4WEg9a5FxGzJua4mrnH4rqeg7eeDg
         A86ZS09Xae7IxaZjsBdhNtvi4HSXT60BH3F3n/L4lFQbYlyMhJJxaUgXxT8NmP2e/d02
         gJsRf28B7bgUJHpvXGJQxDM54b/mv+F5kLnuZKwLMnoGLczCH8KAgY+qaZwQE/uWKnMR
         LOIsT6dyfCtUETSMPdFw3Ste93BRT5sZxEp/l4YpBRotEwHSeA/fUryYrNmt1F6CExcV
         qwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691018087; x=1691622887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCAUHX9CMj86tQNhShQNA9P7+c+YIDPXdibh9FXsZNA=;
        b=L33MXHcLh7a/HE9TRkxcCalfx9RizG0kDjkWi3hQenHV87i3Wye1iivQQxHebv/EXE
         3OrN9FhZeH05DT/Lk9I+Mq0jrfau3QUv5JfN8yVwqjo2VouESi2U/rDaSvM2We0xxNEm
         qq5jJtyGaisvibpdnII8Zrt6KGDN/aXsfM/XIEf5yaYzFFeUmYp4cN3vRxuGfIw3a0rX
         GATtwtHRH7G5aOWcOBxs529LcWZGLDaSfBfo7Phowk6wHsTA9Vg5SZqWjMJIcDw3Deid
         b7PTWjaubJBGMRZwHxkeK8sH7hswB5aXWFPURpMUUzGL5Kxu2X49/HjcFj22hV11Cz5C
         CIsg==
X-Gm-Message-State: ABy/qLbZCw5qb7T7o0mFdEVkK7ukafbvQUcLGsARApt5Cj2StN4ZvPaS
        7E5nvdBrXhyxpC2RBtlCDWpTVNQ2IgywczLmv9yKBg==
X-Google-Smtp-Source: APBJJlEpLRJa1zHGSACbJNxHYKAVMd8d+GTqG+SkXFtOTRezcnrU3BhmfTEVkyw7dLhhmo/wqVNrvvbcJ8tKw00jNmE=
X-Received: by 2002:a25:d394:0:b0:d00:7d6d:4767 with SMTP id
 e142-20020a25d394000000b00d007d6d4767mr15011382ybf.44.1691018086791; Wed, 02
 Aug 2023 16:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690545605.git.geert+renesas@glider.be>
In-Reply-To: <cover.1690545605.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Aug 2023 01:14:35 +0200
Message-ID: <CACRpkdbt0vZVCF5K_a2Sy0i2dWchvAZCtdAp2Z3jtFkqzsqXAQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.6
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 28, 2023 at 2:01=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit bfc374a145ae133613e05b9b89be561f169cb5=
8d:
>
>   pinctrl: renesas: rzg2l: Handle non-unique subnode names (2023-07-10 10=
:00:27 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.6-tag1
>
> for you to fetch changes up to 95eb19869401850f069723b296170b8b3bd5be9e:
>
>   pinctrl: renesas: rzg2l: Use devm_clk_get_enabled() helper (2023-07-25 =
12:28:45 +0200)

Pulled into my devel branch, thanks!

Yours,
Linus Walleij
