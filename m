Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F18A202DBC
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 01:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730918AbgFUXsw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 19:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgFUXsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 19:48:52 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747BBC061794;
        Sun, 21 Jun 2020 16:48:50 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y11so17256375ljm.9;
        Sun, 21 Jun 2020 16:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qaq0ziqhM6vKmk7QeOoWqHQ67riZN5t6NkqmIBKUOe4=;
        b=tYBsk3/YqSVg/GrD1/BRa1uJEctAz/q/aHja7fR0zhkpmSEmOFaOCoRo9T5wPWF5Up
         5YFx1OACwJnLcLtcZUaeA4l/E0pB8dFY5yh9iSAJeVroL+6etwpGD7O+1K0lJdtfh+eS
         5t3w8S0aAFa0fSC6RVmzOqu6F/9sAd1plDiz6vHbr2L8QbYpxnYr/ryL1PlY2uApMLPx
         ZbHMTaIlk1l0/xBDLGDi5gPptaAwbfjv7mTDzs1NDGr8FrFvwfawA5CrbbmZKW4bq2gt
         BVAtHkc0modgDPwxIaFz8hWxdOIGVEUDTOrQHorYbcoMBjiy2j9S9HdS2TdNLB2FtwFg
         vMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qaq0ziqhM6vKmk7QeOoWqHQ67riZN5t6NkqmIBKUOe4=;
        b=Ded6PLvm983tAn+cAGsarcwWOunlUrvnimWH48/DCSG6biqlMbncHdXl0u2hjjsLJK
         g3R2/dTdGgtj2Yyxyw3jkHpdXBLOn49ZFzzWvd7c2RqLKbHYRQjmr5kjklhOaIV6fr+E
         dap2PYAcFiLr0xSnwxSkNqpXXMPizIKe/oUsoCuVRCiXt/bcs1OfFK0K66oRmIuOhRi+
         OzZya2cmm/FFrJEBIhP65L8+AUo9Vm2Uzhwc+powR3sZoBfAMJ3pASzimSMmzIOOQjN9
         c4zRmNYCTmvH51eLcgeXFUjWxTgE7zoy0dHDH4s9/lOLEivQUXG9zv+cJq6+26WuqwU+
         O08g==
X-Gm-Message-State: AOAM531HEJf4i9Os6SyXrcA0HiKgfXjAHIcLV3bqs9D2xKvAU7VOhqhU
        iP/ANa3g8OJP9gfk3Mgnu7KU396wTJ2crzZ23Wg=
X-Google-Smtp-Source: ABdhPJyC+MegsWHN2gcMUSUABJleCJhX0IDQCy5a804hBDAUgkv5+Pl2dvhGu8J+Hmg+6ozLOvxKFdkZcQ/5UZxIgkk=
X-Received: by 2002:a2e:8345:: with SMTP id l5mr6964024ljh.154.1592783328849;
 Sun, 21 Jun 2020 16:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200621213806.551879-1-konradybcio@gmail.com> <20200621213806.551879-4-konradybcio@gmail.com>
In-Reply-To: <20200621213806.551879-4-konradybcio@gmail.com>
From:   Alexey Minnekhanov <alexey.min@gmail.com>
Date:   Mon, 22 Jun 2020 02:49:04 +0300
Message-ID: <CANi4RBR=jYva1-c4fJgNUgRF6g1pNbKR8JmEg_kBfv+QOdLW2g@mail.gmail.com>
Subject: Re: [PATCH 3/8] soc: qcom: socinfo: Add socinfo entry for SDM630
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,
I also wanted to send this, but in this form:

[PATCH] soc: qcom: socinfo: Add soc information for SDM630/636/660

Add socinfo support for SDM630/636/660.

---
 drivers/soc/qcom/socinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 5983c6ffb078..398a3c77954e 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -202,8 +202,14 @@ static const struct soc_id soc_id[] =3D {
  { 310, "MSM8996AU" },
  { 311, "APQ8096AU" },
  { 312, "APQ8096SG" },
+ { 317, "SDM660" },
+ { 318, "SDM630" },
  { 321, "SDM845" },
+ { 324, "SDA660" },
+ { 327, "SDA630" },
  { 341, "SDA845" },
+ { 345, "SDM636" },
+ { 346, "SDA636" },
 };

I think it would be great to have all IDs of compatible SoCs at once.

I've tested it on my sdm660 by adding some printks in probe:
[ 1.609040] socinfo: family =3D Snapdragon
[ 1.609043] socinfo: machine =3D SDM660
[ 1.619712] socinfo: soc_id =3D 317
[ 1.630347] socinfo: revision =3D 1.0

=D0=BF=D0=BD, 22 =D0=B8=D1=8E=D0=BD. 2020 =D0=B3. =D0=B2 00:40, Konrad Dybc=
io <konradybcio@gmail.com>:
>
> This patch adds missing soc ID for SDM630.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 5983c6ffb078..705f142ee588 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -202,6 +202,7 @@ static const struct soc_id soc_id[] =3D {
>         { 310, "MSM8996AU" },
>         { 311, "APQ8096AU" },
>         { 312, "APQ8096SG" },
> +       { 318, "SDM630" },
>         { 321, "SDM845" },
>         { 341, "SDA845" },
>  };
> --
> 2.27.0
>
