Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871F8658837
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 02:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiL2BEb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 20:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiL2BEb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 20:04:31 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4755313D3B
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:04:30 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id j16-20020a056830271000b0067202045ee9so10737770otu.7
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzEhgkdyDuJ3+vX7x5H37wQOzXYbnByB+nVAg4A6ERU=;
        b=Ir50aeIR1Nnr2aKhWc91KqTqzfaJBcOqFAp2U/XpGfGhLxJY8oka3xtqUAVO38TtF/
         L1v7SaeqKscNwViAF0eBvYigPJ/cquGMlEJCUU7af1EomSqIRbg+kv0jjkDa7taMLMun
         ZqfWkFqx9l3sSb7COqOpDPh3WrTrHsRwcxrl+NouM3m8L6ZojVTfGYpf3sXvtupdSjBl
         jT4KUcVlRSo6QjNvxo87UiPPFoh1HcyIRi8l4PLk1NbAZ5IHiJVlsQ4phBZWoQ4PQ74L
         utOrQz6Jy7RotqDVH4sO1CI/8hkETTGYWQ6/6jTRgBhH9kJ+B50Ii0dlWdKaKpWt4tFc
         79mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzEhgkdyDuJ3+vX7x5H37wQOzXYbnByB+nVAg4A6ERU=;
        b=VZW30HZZmvENtW2nrS6I+taopqs0BaH85kFIdNFMgs9YHoQRld7KGP6miPu+8nOGer
         vX+MFO8JUrI+1qaXaQ5rIed0AjSFuiASRAXRXcyC6srqPG793EKvtLmW/HA6Hf25sLDc
         kWfUYqGjVVtvjImpSiNHIY8ESbD8908EBf6NeWE9PtUUUHsGRjPYA7CJqQWuTMtJ1FQr
         seRsuj3UdHHUuHkRS1R+Gud/pPQsGUDxMWnQu+UIJZl0S8cNJokkR589vVTs5oZHynce
         gUJzcC1fM4nMXFuHTfICooxQBGXk8ZMl1Tt04SJe8F+/OPJRYFjwxZLnI2VMtqsrRq22
         4VGQ==
X-Gm-Message-State: AFqh2kq49mif/TjXgTuxrU705CfzFNGsXWSqolIucqjIozKW4tUPznAF
        YvsX8yPICAgmnr8zrjtWM+42HsrYAeFQdsiiLTkHrw==
X-Google-Smtp-Source: AMrXdXtL2Th7NQKGDR8zGKiEVM+c1iUzyt7lamQhW5jkc4Rz+8S70VUDuoHVGhJgYg3OrwdDRWEmfocSlOAD3wj/RK8=
X-Received: by 2002:a9d:750d:0:b0:66e:abbc:cfe4 with SMTP id
 r13-20020a9d750d000000b0066eabbccfe4mr1774343otk.102.1672275869664; Wed, 28
 Dec 2022 17:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20221213182322.962345-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221213182322.962345-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 02:06:24 +0100
Message-ID: <CACRpkdaLreuqydfSQqZVGM4UK7inxofiRAkOLLFtTgKzK-5D0A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: thunderbay: Drop empty platform remove function
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 13, 2022 at 7:23 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied!

Yours,
Linus Walleij
