Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C333E7BFE6F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjJJNwo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbjJJNwk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:52:40 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171001AA
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:43:03 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a7ba0828efso12089637b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945382; x=1697550182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=WRFEmVFsknlCGJv2ck7WavA3XMp6eliKBgx+Lq2kq3w8M2mUcxcETJNKOGDauQX2XX
         +xWmDcjoYlq/3cNWgC7l0YB+pDWuCTSnhDzffnroS0HJ/pf59/Ns+kOe/WgpP1944CYp
         os8SH02WNTT93fqghJz4apm6Il4IQbWIMNAhmMQkOm7O+okL6oZ572ydkNxyIuu48GRq
         4yHYM9uWawQraJyEizwGE/RJC3ZtQk2pv/IM2QFBPynt6qJsTHyPRHslk0nJQ/1P/IhM
         a7M6ZcvaZN+OlYLOeJKcPDDMP1hzoErv2yNdNWcqwpeGPmRwU4Sd2D+EWGAo5IbDpi4U
         I82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945382; x=1697550182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=c1ZAoFMIyQ40DJPGAVbwUoIBJvUtCrn2+Ov9kvpWHH2EeOSEBU6DueFtRsp2tKlTii
         K3cFSk1HoaoK9cyq6QM9tgaml1IEOu1It1jrrBUnmjG1oqKXjs1KM1duilz+clA12eV1
         jOc65ljy+oMzs3aVHcYw3cnMsYUb2c+egPilvVGOSvfPK7UF9yk/ia2hDLxDAICfMSbp
         DATXd/OOyrMW6odH7cICJNmrwQgGzbM1zNgBWih387gXfVCAtqchWoYHOmD+KBZca/q2
         wswQFhDc2SuQNI6Eynji2/uxjoAbBssbbdhvl5GmsqHB9SVpsoimdjDJMxp5+XtR7/2p
         5/yQ==
X-Gm-Message-State: AOJu0YwQLh/ZAxOu/nC60436lWpqOj3jxdDPZ1v1tV7ZcAjpVBmci1Nz
        izLJn0cktxVCAAN3rCIl2qOklUtNv7R+q6Gqw77VgA==
X-Google-Smtp-Source: AGHT+IF3/Oc+ZMdiZnISZs3ojNA1/qjGKd9ter8xI5PkhihVk+K7E1PuGuRajQjSiV73X4edO0mK80JDDKm5xBon1GA=
X-Received: by 2002:a05:690c:4813:b0:5a5:65e:b847 with SMTP id
 hc19-20020a05690c481300b005a5065eb847mr15101159ywb.34.1696945382211; Tue, 10
 Oct 2023 06:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-16-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-16-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:42:51 +0200
Message-ID: <CACRpkdaP09Df=i4dtrKFtZmhN1EVX7OqxddRjHXMggPt4T3W8g@mail.gmail.com>
Subject: Re: [PATCH 15/20] pinctrl: qcom: spmi-gpio: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
