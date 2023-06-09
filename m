Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23AE37290DE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbjFIHXi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238733AbjFIHX3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:23:29 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BD61712
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:23:28 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-75d4a4cf24aso137731785a.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686295407; x=1688887407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leaPsFnX/m+GvKGWxTJ4Sqn1wYZfSdB7I0AWb9xZK4w=;
        b=AhgUDWD6EJTn3LSXuXqBGYVPSEU9377WtOyGMK2P8yLBa/PVRsfvov3aE5koJomUOO
         avII9KHbTDavMnv10K5N63mlCSfrJlEeCUeSPBoA0B6/AF+clXLcbDU6KOWyPSGhc7BH
         tbpZmO24JWxpXC+NX0yuYu3o4FAdB937jBJVgqrhxIEdreJBzStg6PpR8CVq9DIUtcrW
         TuSz+ijFzO+7tLO4tnL3aTr2b8Ap5+R0SaYRWLw5LBurl0+xT2e07DuLjeSpQy0N99dV
         OUidmAJZl5PNpnRLQeQfywEngzsLfknJVP1mICh8cTTkUrtBIx9mseOSrDs6afHU6v1F
         KIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295407; x=1688887407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leaPsFnX/m+GvKGWxTJ4Sqn1wYZfSdB7I0AWb9xZK4w=;
        b=KAL3TOF/dWELgdU+IQx1wWAz5XjV2BMWGVLSB1TdozdCw93eyJzLR7jBcfy4XqOgNf
         YEH78Ux9kWBshIkouD3v2oH9xbA9hwCawyjWmh2h4+BpVm38fHFgLVZ7AnFTMcLABFPf
         M/ZITkZsGOsBZak4byNQFt++XNAb8dcpxm+xD8ptERplMmRoz6Ixu4TWJG8e4B0uAcWE
         c2pWK61wH2Kr3NKhUuBMsYeQR/jySQTRmpfSFCXYREbUm2078ScmEOZSupJG0eT+y86C
         YAiakqsmY+GMh7nSGnH2L2VmZNi9umLsI3NsGoO3JqiBuGvyOnXHwpF3uZCL7Rh/ERqz
         y0zg==
X-Gm-Message-State: AC+VfDwEkdd/mwXHYsGfnpbm7SgK12owxdJlWnmCDv9SfD1dIu3W0OUO
        ej8/FcyLpGlq+ypWiyqOvcKoYOKuuP+ZfI65vfsY5A==
X-Google-Smtp-Source: ACHHUZ7Ke+nFi19xwbXfmutQZQv7ZMQU+lOtlMYXZVXQBRb0S0vSHpqq444ZsFfiMeJrsaJS9cmm4f1YzSgU9nO7Jxc=
X-Received: by 2002:a05:620a:268c:b0:75b:23a0:d9d0 with SMTP id
 c12-20020a05620a268c00b0075b23a0d9d0mr366595qkp.38.1686295407496; Fri, 09 Jun
 2023 00:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230605125810.61456-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230605125810.61456-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:23:16 +0200
Message-ID: <CACRpkdayWaSTAP3Us6_3O0qy8SqOY35d5AfD7EyVkdFkGegs3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Do not unexport GPIO on freeing
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 5, 2023 at 2:58=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since the legacy exporting is gone with 2f804aca4832 ("gpiolib:
> Kill unused GPIOF_EXPORT and Co") there is no need to unexport
> GPIO on freeing. Remove that call.
>
> Note, the other users of this functionality do that explicitly,
> except one SH and one OMAP boardfile which don't free GPIO anyways,
> so it is safe to drop the call.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Yeah let's kill this off it is just annoying.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
