Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BED7465BF9
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 03:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350356AbhLBCFd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 21:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344707AbhLBCFc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 21:05:32 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39048C061748
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 18:02:11 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso37905762otj.11
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 18:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=312E8cZrQ5xrvaZwf9TgwEDA4CW6oVfCqWWlc3o5e6o=;
        b=a0aRS3IYiCOnNER5hhEkr++x8ZAKI2D8m4atvGtrFnynkIDcLq46sxqQhPAsKgi13U
         s8P5yM3ywrOfu5nvCM2+iPAwAIEL5BOj5IEegX2LtVZv20uVxsAafEwaYULgpauM/Ujo
         2IM02AA4u/3zi1Csa22rerE1p9Km5K9W8cr96G42TsogJoVFpmPaBCjE+wUN6SjN4hk1
         idxMyYSM/ZCIVYWgev7G7dAXZOruxb+BV0Hy0OtUkhecdUGYoN+t46Gn9P15Ddf3aZ03
         0pEwS/zraF1Tni2Q8ARhU+Dzo+EDjj6vunA2Yu5RkxlryJAkTZ6IZYIz5rWXtlaxUsXB
         e3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=312E8cZrQ5xrvaZwf9TgwEDA4CW6oVfCqWWlc3o5e6o=;
        b=Dig8atX5lKs/l4OVIye3RxV6YTpDo60Utd6jyWUILgAtmeXF7vsHZ4FL6MAS5xy4Tz
         zCwzH4vawJf8mSMEzw8n4oBhDHBz/Vjr3HNTa7GZ5MtvyGJndET6OV5spuoMIeS9y9J6
         MreWz1EoazMZHl3S9DcG1206M/i2CTef4Vhle16Cm7llcVIt3LAIuZ6zy46Wa0DzHHVR
         Fm9D1SZ8NSkpulc7vnGTkIFYOpCZOld5k/S9QtfJkzRHu+h1W+Q+69K9PP+9zXi342Fp
         JWKSd5hKxifnuxxhBfkGJwJW32Y3Bo0Jj2Gk232+wPBedozOh2CXqnMXBy3JtOI+ZHyv
         HAXQ==
X-Gm-Message-State: AOAM530zT1ZOamRrZbVTULQDxchn83m9bsPUmyGorXYJhsynDNvVr2Gi
        Es2tkH33zW9cE32UebBMfencA3pSW2ClUyKS8FzcIA==
X-Google-Smtp-Source: ABdhPJyno0Y/OQDmQ7hYJgd98TKCAem8WoKcB87RGMejxUCsR3jJu+nnaV9TJLXT2Z7jZm70pKI/i1FEe+Kx9L8lT/E=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr8844708otl.237.1638410530597;
 Wed, 01 Dec 2021 18:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20211110165720.30242-1-zajec5@gmail.com> <20211110165720.30242-2-zajec5@gmail.com>
In-Reply-To: <20211110165720.30242-2-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Dec 2021 03:01:58 +0100
Message-ID: <CACRpkdby+9qwGJ4LqwMw0tQZHSDCBRVtH+FXOYW1ob5tii3pOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: use pinctrl.yaml
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 10, 2021 at 5:57 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Also fix some examples to avoid warnings like:
> brcm,ns-pinmux.example.dt.yaml: pin-controller@1800c1c0: $nodename:0: 'pi=
n-controller@1800c1c0' does not match '^pinctrl|pinmux@[0-9a-f]+$'
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Unfortunately I have some changes in my tree colliding with this.
This is the development branch for v5.17:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Do you think you could rebase on this and resend?

I would normally try to do it myself, but I have very little time these day=
s.

Yours,
Linus Walleij
