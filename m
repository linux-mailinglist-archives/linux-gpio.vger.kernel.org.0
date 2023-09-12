Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4EB79C990
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 10:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbjILIP4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 04:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232577AbjILIPr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 04:15:47 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EF210C8
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:15:43 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-58c92a2c52dso50276057b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694506542; x=1695111342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tghVFyIVhGX7gYPr6Xj0nI/BEuj6kidnkTNQDfpOQPI=;
        b=U9nCW5ZbT8ShIHJFZi93YCEvs2CdMeYP2+a1cL715L/re+nSH1CO43I6hK0h5Y5d/e
         h9VO/B0dct4DrXiD6xvkg7MGCYQWNmHcfck9dqtnAWLctv3ACZfwdRo1vLxKm1voC+aJ
         w/hFIMpp47OW4w6XNZ8ErKG/bUE8tGgy5J/I5C4pcjVeTdRwkuDP81lHvqwkatisOTfU
         PzV2i4UI3q2W1J55oUABuhwraycdKejnPTIVmUMuy1TuTQEX4ZkaWphG+Xylcw+Oywik
         4aj56Y02olVCRG0TolnLnlRBZ9MNPndwhqMTxW3MNzBplge/6QSvEuf15i1BI8kV2N/M
         jS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506542; x=1695111342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tghVFyIVhGX7gYPr6Xj0nI/BEuj6kidnkTNQDfpOQPI=;
        b=KWhIj6w+VByVFpMolnlGBUjfwRuh29Hg9T+iLHyc6bB36pYZveHiu/r01yiefBpEkI
         e71MzDivBrf84d8brczbc4VU4J3vX0RunVagMzJaB/hiThxeG9GdBHv1NyLilmiiFK1M
         dkC4FUM0ZQcknvdGh719r/pvO7eT6gLqZQL58EhbTfgD+4llvHvQpck+LuvPDhP0ajTB
         bOKM1TiUn4VJdZp7Q0CY2kq5vsHayE28nScWHSmdanPYAi8onaSGlFO+CjcHf5vWvAMl
         jR3Ojkd1EtZ3k9y81F3QN7F15utrfvfx6ZMoc4QxWmCTRx5PJDWPBcvYcuhl7VoWRL7l
         yhaA==
X-Gm-Message-State: AOJu0YzRsz5xfGz5o1eAJ/vkOBvFTBLG6JpMwMqrc1lzENQRNmKknDNP
        S28dCOMNifi8VoCE4K4e2Xnd0hXdR8fO6yIm+nP2Qg==
X-Google-Smtp-Source: AGHT+IF9JdFOEbM9cB2dJiRJKc//HeRrwq0WKN18VB7VbjHOfLCYipsBo+gHvg02bKHENmMSmNIRGBLQIXk/n6NrARc=
X-Received: by 2002:a25:aa69:0:b0:d7a:e0f6:54cc with SMTP id
 s96-20020a25aa69000000b00d7ae0f654ccmr11152715ybi.26.1694506542714; Tue, 12
 Sep 2023 01:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230909063613.2867-1-jernej.skrabec@gmail.com> <20230909063613.2867-3-jernej.skrabec@gmail.com>
In-Reply-To: <20230909063613.2867-3-jernej.skrabec@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 10:15:31 +0200
Message-ID: <CACRpkdbTZYnehWiWFgY3KJLFdS47RpxOp-Cct4BDqgYCYtd2vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: pinmux: Use dev_err_probe() in pin_request()
To:     Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jenej,

thanks for your patch!

On Sat, Sep 9, 2023 at 8:36=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:

> Use dev_err_probe() when printing error message in pin_request() since
> it may fail with -EPROBE_DEFER.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
(...)

>         if (status)
> -               dev_err(pctldev->dev, "pin-%d (%s) status %d\n",
> -                       pin, owner, status);
> +               dev_err_probe(pctldev->dev, "pin-%d (%s) status %d\n",
> +                             pin, owner, status);
>
>         return status;

That's not how you use dev_err_probe()

Just replace all of the lines above with return dev_err_probe(...)

Yours,
Linus Walleij
