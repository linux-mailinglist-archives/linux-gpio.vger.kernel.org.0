Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79A5A3979A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 23:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbfFGVTN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 17:19:13 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33613 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730700AbfFGVTJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 17:19:09 -0400
Received: by mail-lj1-f193.google.com with SMTP id v29so2958123ljv.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/uwQvvBLZhDAl9yhIggJq/EJTAtf+ICqBP+94QmKvpM=;
        b=N/c1f5tuWKYL8TC+mpD5tnEP7gezj/Sv0CKNXvK+vVV9p3HMyq0wWcteem8zBam5DR
         2XbGICxpKnalTKAESEL7c+epE+t4pCo88A27u4LOFET0um8g3iWYnRb4Z/5L8rkIylPi
         2jcYbG4YVFXcQkQ4q3ja1Cq9gYsYE5YNTR38P0gQDlZ16R2rHS0QdwGkOhpUJwIsJ5Am
         tWG0ZA9d55ys6+uAgGiJT/e0pgaq+cFehEqRSjDogyfw7AiX+d1jGhDPOni65wlYf/es
         rB3OsOg+4YpCsJSh06Xw88BD/TiZfHR4V2FBbVKphXXzjJXKekeEuRCKgDzPi/TxNalg
         cOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/uwQvvBLZhDAl9yhIggJq/EJTAtf+ICqBP+94QmKvpM=;
        b=BDOAQcmMvp+5W4vqcJFjEWKtbSd8MFyVc6L2h8vbINv5KeTRnvdcMFXX4qOo2lc/3a
         O2lW/Id4VxA2xQxhIXVABIR+Agp3IUaYkzZJCrNiin2/+ihqukuACXfoxdAE4S/mQ6hn
         PK/yeuXJ2CsOCZjR9owF+p6/1QpllMC3becrRtPy4x8VudXJaos0iuKFUHJgsraFjDGW
         hhYucFiAD8LgiIcGGmAxxVKXUeD+45ZHV5dr9hcBFOv+IJ2bQu88ASef8Rp+ub0XB7P2
         B/T6yq7u77dDSG3Hkl1o1rW9jQ0d9+Z1dEZ0yFY78mgXsR4ZwITVtNrDX5RDhnaetvSl
         CTBw==
X-Gm-Message-State: APjAAAVcPdUZD+A9Dx9iB1ARG1UgfIBpPHm0o9B/zkQl0KyjLECIt0Gz
        AxhG9zNaE+ND8jIeLoWaH6uJQL1Y+sjt9I6J75AjnaU3
X-Google-Smtp-Source: APXvYqxoSrFtpdn+Y/8JUdQf+IzKlqg5LfxsLNBpOURN47jOXNKje3csy/VgjGKZFSN/pgipJ/qQdxmih3J6j1aUAJs=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr5296121ljj.113.1559942347590;
 Fri, 07 Jun 2019 14:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190603073421.10314-1-manivannan.sadhasivam@linaro.org> <20190603073421.10314-2-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190603073421.10314-2-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 23:18:59 +0200
Message-ID: <CACRpkdY9j+4PGGyMC-bCKuhP3Cg6xj4mFBt1VuSOi_14JcphPw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add drive strength support for BM1880 SoC
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        alec.lin@bitmain.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 3, 2019 at 9:35 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add drive strength support for Bitmain BM1880 SoC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied, no point in holding this back about nitpicking.

Follow up if you want to change the below:

> +static int bm1880_pinconf_drv_set(unsigned int mA, u32 width,
> +                                 u32 *regval, u32 bit_offset)
> +{
> +       u32 _regval;
> +
> +       _regval = *regval;

(... lots of fun with _reqval ...)

> +       *regval = _regval;
> +
> +       return 0;

I would avoid using any _names and __names because of ambiguity
(no clear semantic meaning) I would just call the variable in the
function *regp and the _regval just "reg" but it's just me.

Yours,
Linus Walleij
