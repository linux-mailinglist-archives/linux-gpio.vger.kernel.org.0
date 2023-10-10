Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8262A7BFD9D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbjJJNf7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbjJJNf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:35:58 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91404CA
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:35:53 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7ba0828efso11991767b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696944953; x=1697549753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwaODl/6SngYIesq4fd26Zf7cKEGOc6/vuChneskjdc=;
        b=TK7X8dOdEsESKx8042hUKWzOw0x5zA3eiw59WcPmrCoaEDsT7MmpVGSK2kQ7B6+/jF
         Vw/bLol6Dtv0H5dBDfOCOvtcuvCgwid6pokEFJQWFIZngrUQ9Sd1FzCSBmL74ocmh17P
         F0utXAIHCZhi5mR1frIktCqs50HhHpYS5hiYYfBAugU85FSRGcvdUGF32XtBjw0KTWhC
         eGF5uN+3E7BsTf++aDvo5kywIm74fIVGk1M+7yYMphNaLTgvCnPmzvAf0nEOQL85lvLL
         cooEvDiLgGHVfyt3CJQv1CZHcfMTxSeeq+uhEgVhztDiBtz7pr8opCuXv5fyL/CpwMQ6
         jr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944953; x=1697549753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwaODl/6SngYIesq4fd26Zf7cKEGOc6/vuChneskjdc=;
        b=A2YERexwKCFigluAbe327JnL5TrZj+oMCjj4hqh5XB1+jul9FC5PbL7pyr53BV4UA0
         ToY+RizQlZrq3ZBl5eipvnqMEdAkhJuJkYnyjQhPkVGZllQgETDhlC5EIWl+UQar31Bl
         qwZCoYTo4YM9JpcJLbl/RT5vcGAUGCubafjbmMBf/RD0jTLSHqM5DACP3d8ndcNYMb8b
         sFDci6Dh5sLpf1wmNkhPX0Aro4YKV/+8McoYaMjgyVFib3XoKjS6i78JNrWKiPyQbgTE
         /zTYMC7jX4b0ujqXBVSagiFF2lsJAJJ29tc32WUqcslhXHvS9lI72viKNig9YGjF3rUW
         yc3w==
X-Gm-Message-State: AOJu0Ywko/ImQhWCoKbmPmC426uBX7wixcW8Yoq8cVW65QhbZQChw3no
        yNfyXaTRMeZgoe9O3Ug5UXnN3JNk0OBXPAlfW1npfQ==
X-Google-Smtp-Source: AGHT+IGG3gi8s+Fcz5VP7yTY/DRWNo6Zujz9HnOJaU190QxNyFwVrfyV42NA8H4la4b2WLErva3zQYndcUdDa01huh4=
X-Received: by 2002:a81:5cd5:0:b0:595:2094:f87 with SMTP id
 q204-20020a815cd5000000b0059520940f87mr19266136ywb.47.1696944952747; Tue, 10
 Oct 2023 06:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-2-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:35:41 +0200
Message-ID: <CACRpkdYoqxP89nC=e8Yrt+Jxs1je4jnBBGtaUQfkKpjcR5vQ6Q@mail.gmail.com>
Subject: Re: [PATCH 01/20] pinctrl: stmfx: Improve error message in
 .remove()'s error path
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:


> The driver core has no handling for errors returned by the .remove()
> callback. The only action on error is a dev_warn() with generic error
> message that the returned value is returned.
>
> Replace it by a more specific and useful message. Then returning zero is
> the right thing to do, the only effect is to suppress the core's
> warning.
>
> This prepares the driver for the conversion to .remove_new().
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
