Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3930020728
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 14:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfEPMoo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 08:44:44 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39502 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbfEPMon (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 08:44:43 -0400
Received: by mail-lj1-f195.google.com with SMTP id a10so2963040ljf.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WAcJqFUogOC+q5kPPB4TqPaHzS2NFJ0eM8JptnvXwCY=;
        b=lSbRP38AQ6SFgZe7kefhpxx8/TDZSnH2lvUSx43pHjMx7U+pNW/gkPtChmN1XxMZQF
         aG2GYCNFQE+Js4XFSeeF7MJ/tiTkjkFTJRM70xPIljpD2HgNUhuqx8SA46t1GmT6Rdl8
         3RLaQ2GRTITuwusHV0tg0yumSCSrJF5QL1iHC65CT/k8XNcW8NDZ/jRf4dZGVELvQS4s
         s0DL/WgyqYOS3VbeBY3JXWXLvY2aEWcwuTp77vIRTQs9uxgH3+45Fo/vPNGdEM15QrZ0
         b5P0PZA8CP9nS+kTyJv9NupA/e7XY8Px9gHOg0Ite/fQTuPpCEO2N4o1Y+5S5IEtTBBw
         9EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WAcJqFUogOC+q5kPPB4TqPaHzS2NFJ0eM8JptnvXwCY=;
        b=jWFIzTRpBHmFnBzuQU4dUS4lf8XBucUlbtbQ/041553O7NxaAxMjAsnexJ6JV5KgEn
         LIskaGMewNGffPz27UwGUUxx2eKWpj9WbKMd+YDpBVKqE822fDdyS9pd1D8lhXz/RlOJ
         zk+zRNfmiyHnxpLY3UUeTbX8i88eU+D4ZZ3BEa7PZ5MqehwNfB2CiVVSy20Y7OGUmYO9
         3be/pOqdusHyaDnGPXdkvBA14xklz03/WqYCSqqxQzD+pwOUShMbVG3jJJxJupqc2YDK
         1qxtqIwjX59KMOhl26L3/+DWD9K3MRAHvIkvMwVq6BPiH5hC5BikBnoi+seX5hig0ya/
         hA/A==
X-Gm-Message-State: APjAAAUKlaoYQPg9beN1pJ6s5Eb9J/fB5+KTAmgjdXi+T/l053FLI7Am
        8ptOv5xCF88LEnQZAfgkjNDYuDYHPyBoMgwFw9ypwQ==
X-Google-Smtp-Source: APXvYqz1nKgkBL8f+HFCe7nXbFNOicCiF9Au3HD3bQcJw9TF68xCQ8lq2AMz/ruba3dbZXK+AF6xyEkmAFuQTpMWTEI=
X-Received: by 2002:a2e:301a:: with SMTP id w26mr8899681ljw.153.1558010681900;
 Thu, 16 May 2019 05:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190428150822.13935-1-j.neuschaefer@gmx.net>
In-Reply-To: <20190428150822.13935-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 14:44:30 +0200
Message-ID: <CACRpkdZcP3gEsudT0rpzNuBe=4Mz0s=KLPd_y-38E4oxVeQD0A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Fix spelling of bias-pull-up
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 28, 2019 at 5:08 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The property is spelled 'bias-pull-up', as documented in
> pinctrl-bindings.txt.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It appears from Rob's comment that he's applying it,
tell me if I need to apply it to the pinctrl tree.

Yours,
Linus Walleij
