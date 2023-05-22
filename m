Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976CB70B676
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 09:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbjEVH1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 03:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbjEVH1J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 03:27:09 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4849B9
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:27:07 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-561d611668eso72756397b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684740427; x=1687332427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMlFZlbI4ySF1wdTEg09fhaUlUaIRMv07rpw84NY8QE=;
        b=n/c7dpTJe99PSONa4M7CzWpYeAMu22CHoj4aR5/8iS++KFtwjo0e9VQDFOjpUmVGHZ
         dBZ12ofGHLbwzOmVlx9WdmnECa2q9WZ4CsVXoCK5BSE5pJSTadSGID3CFZvznXaJv0Zl
         o7wNqRdYs34dK88QaDnNUJL9DmfK/TLRrw+eNwNFeoM7+9gkYSRbH/Jc9rFXdb4GTSbB
         dtrV+aY8yC64QDnWUiofqHNO7/LVJ1g+Ra9lUThE+uYpqyPsERVXuB419kquH83RvyBb
         5MX7YxaBpRXB+KSzAfTptp4u1Sa2AkfOKy6xoP59Spe4HcwX+cBJbBMNETIvAr7H9YO9
         sXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684740427; x=1687332427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMlFZlbI4ySF1wdTEg09fhaUlUaIRMv07rpw84NY8QE=;
        b=HVluMiVuuMiS80pXSsQtpQqfL7efu87UoiViebK8wiqU7+4Hh3jAViC5jvQYfNKhyS
         abG/JK5TX2002Tgof9zmpY/hMDz/14QgSM6LtakioEWTVaBYfz+fH+tMJG9wyqhO+DDY
         vZAEZFtdY1SFvl5KnDgGc5Gn274a7AodXWqblRASQrVMyGxF4BdWPxzmiEyXbV/n45hA
         yZ2TNdhKIfu5XoqGN4a7w9tinDcYvzbY68hd5sBu6+Nslex+9e67AcH/NJLNsHzT4sOg
         8sLp1tuzXS8IPjofmjl6WNtAlyJ7ghkmH17zbmqa+Urxl6NJGl1ierIPXtXHAi6sT0DB
         2yFw==
X-Gm-Message-State: AC+VfDwLE12dQLhNJF6YYZQGiJRbkkg9+P7faKjTfMNw3MkCpkKgNm1n
        3WmuIYpINMQN02jmhTkcuK/zvOiEFoUgudDyQBLrkA==
X-Google-Smtp-Source: ACHHUZ7LHYViD/+rr9bjm+Sh4tyfdpg3jtfID7OXXNY78Gl3n9A/T/AurUd2Uf4zuxpZGD81Eho89mF1wDhxi0gasuI=
X-Received: by 2002:a0d:e654:0:b0:55a:30f5:3d65 with SMTP id
 p81-20020a0de654000000b0055a30f53d65mr9648470ywe.41.1684740427039; Mon, 22
 May 2023 00:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230520174735.364367-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230520174735.364367-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 May 2023 09:26:56 +0200
Message-ID: <CACRpkdZRNGW8kWH2a2V4waoYa6hs=wo7A5o2sq18kqNMThm4nw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Switch i2c drivers back to use .probe()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
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

On Sat, May 20, 2023 at 7:47=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() fro=
m
> struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Thanks for your persistent work to clean this up Uwe!

Yours,
Linus Walleij
