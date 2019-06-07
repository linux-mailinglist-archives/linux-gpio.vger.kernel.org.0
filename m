Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E0239723
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 22:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbfFGU7L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 16:59:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38095 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730251AbfFGU7L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 16:59:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id o13so2890704lji.5
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tEZvWJsFue7fCIY7RY9rcYSd3HaVbUE9nAN1OkAVWME=;
        b=zKZercwpsPXX2K9QFr6z2ZW0wE6hyQk4g2lpewtU9wiouEVRmpfzXJ2VygkU4n8H8m
         8c2xBCQWDSy8rslj7GVT82J32G1k5dUcZSQK2StFiSRstoq08PXTblGP+tmvyrO61A+b
         cUzpdTPsLrJAHqZWd9LirbPd3tNmwJh2c114GMeFGiCu6OtXeVfiaRHVKhr8sT78fYz+
         +y6Z2yxXoy/wbOz6++aYBeQN5aX6qabuor2J8GbgWvnRrA1Mh+zwhfAnqWcti2HlOolw
         MLOw7T6JSlZRCbJxHvpQnTmpwYKOZvuyJMa49Yu26JrfN22afylMLUQ6pAjek5Lq52u4
         YmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tEZvWJsFue7fCIY7RY9rcYSd3HaVbUE9nAN1OkAVWME=;
        b=X3ubOzO+jOphTPUrwRXGBrBDpxWE6AxEASwPDKiJwRaMCFczP+Zn19/S/iPpKceEWy
         9o72rsI34Q2uNbQFILiRH14pIdtQfSD4Bpn5a9keAaqzf9TcDETAkRaVwvmZT7nigC4b
         iKVsDHQx7cSwp+K9k0NUvBOp3XTSwnwtFtDURThC3Q2V4CkGC9izoEIKfExFVU82Bbh1
         Sod40mvZH5gzbWz2gw00PqsZ3o60VvsXvxy1lM1Mvj70AGKGSKlZ7KwC129lbuOt3ei/
         22dUd2/M1XlL8/N+CqgKoQJ9OA+vxwQUwXw96scXLjzO9hyGrT0KcXqnOU9TzAL7AZth
         vzDA==
X-Gm-Message-State: APjAAAWSZfX3DET9w9qFkySKN1o6S+Zc2zh2sw5DXIn/4NwM9c+jMQhE
        5AfQQkTFLQmc9ZVhGSpZbLNziZ8kNdFpChP4lMPx0Q==
X-Google-Smtp-Source: APXvYqybb7KzOkDvVRauSyZjrruBmBWId2yXwpYH1HIMQi6UsJ2mD7CwnPWMbaLG8x56HQlC6vvpZipHjgVXHICJWec=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr5258986ljj.113.1559941148941;
 Fri, 07 Jun 2019 13:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190530031357.17484-1-Anson.Huang@nxp.com>
In-Reply-To: <20190530031357.17484-1-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 22:59:01 +0200
Message-ID: <CACRpkdYmX3GRmXCuPe-zoQE6PEYr_TQruj_ymR3G_jBjtjrwpw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: imx: Correct pinfunc head file path for i.MX8MM
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 30, 2019 at 5:12 AM <Anson.Huang@nxp.com> wrote:

> From: Anson Huang <Anson.Huang@nxp.com>
>
> The i.MX8MM pinfunc head file is located in DT folder, correct it.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Patch applied.

Yours,
Linus Walleij
