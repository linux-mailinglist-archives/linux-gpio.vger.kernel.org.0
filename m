Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8FC1F912C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 10:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgFOIQM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 04:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728829AbgFOIQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 04:16:12 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B50C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 01:16:12 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id n11so14919562qkn.8
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ks2k3rFOx4dlXObGXJhZwTdC2QELUN8WUaqANCpIqu0=;
        b=oR0SekK0lTaOSzhQhm3NVzAkhfa0SpTMN6fEILfsLxFaBYWpSetDd7sPHZPUqFseTt
         +djNWxLvdiqI7s5zK45K0gBO/eWabDbDou3csHCVptKlBrXFFQFVHk4fEiukWvr9CP91
         /FUC9cqYx7Vpq3NqWQa8U9pQVNwCJxzVBmt3nEWsQYCY63e0PdScNBok6/pNLMzTEDFT
         30gRH/C7UO4xbWv7NlvtzutoF5xAkAebZmo3otmBf29Kp0NhgkVfT3vNzeYRVCr5cQWe
         Ibrvy8kXQRsiep5lMwRUp/BBI3x9Ei0QqhbTYemZ8MS9Z8xlBP3Ua4ooIUT+Au1sLiBY
         gfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ks2k3rFOx4dlXObGXJhZwTdC2QELUN8WUaqANCpIqu0=;
        b=r2TSBMI7MXJPzJct42LwiWIf+LMY1guoLMRBoFl/VR5xiaT7YHwWPE6mzQiRKPfcWt
         0vxvCmaDBJ8CSUxlkL8IwS9tDUlFl9Ai3vezxZLs1ZiRCgxXuoU/+mwpJADiL8WxYiq8
         UkWnK8ytNkk2yZpueAYDl1RdWiHNihI/FvQTQW6wi8sz6NcGkSFZh6wftf9bvdE/zgd6
         nxK5S0PajzJ1Uas1sMguca3qbVxd9Q+iOWhf6HbXA4mmr8YqaMT016Ci2Doe64wWawzH
         FpVqo7CsotbIquSn95PV8GncQiLkeLfPyu/7ZJvB6tY1fQWyjBQY0eLTF2v9VGPww2yr
         WCsg==
X-Gm-Message-State: AOAM532f621/Ou94rrOQyakFHucQJG/pi6jpI2Wp52aHEVvZUTYODCE8
        TO9jyDhfabYRmjRt6nxSDL3noeF2rSd1KqOCCpNY6g==
X-Google-Smtp-Source: ABdhPJwFBN98NMpqmvYRdwb//kMKIs//wi3K/6j6KcI/70oz0Y0XgSq3+DgIBu966lDGXREPemn0TX9xNdPBs0sd2M0=
X-Received: by 2002:a37:4f52:: with SMTP id d79mr14333922qkb.330.1592208971419;
 Mon, 15 Jun 2020 01:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com> <20200609124610.3445662-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20200609124610.3445662-4-kieran.bingham+renesas@ideasonboard.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 15 Jun 2020 10:16:00 +0200
Message-ID: <CAMpxmJXboB0qkG637eoAabj1_KBe2inNgWG3aMagSar94UuaXQ@mail.gmail.com>
Subject: Re: [PATCH 03/17] drivers: gpio: Fix trivial spelling
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiri Kosina <trivial@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 9 cze 2020 o 14:46 Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> napisa=C5=82(a):
>
> The word 'descriptor' is misspelled throughout the tree.
>
> Fix it up accordingly:
>     decriptors -> descriptors
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpio/TODO | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
> index b989c9352da2..e560e45e84f8 100644
> --- a/drivers/gpio/TODO
> +++ b/drivers/gpio/TODO
> @@ -5,7 +5,7 @@ subsystem.
>  GPIO descriptors
>
>  Starting with commit 79a9becda894 the GPIO subsystem embarked on a journ=
ey
> -to move away from the global GPIO numberspace and toward a decriptor-bas=
ed
> +to move away from the global GPIO numberspace and toward a descriptor-ba=
sed
>  approach. This means that GPIO consumers, drivers and machine descriptio=
ns
>  ideally have no use or idea of the global GPIO numberspace that has/was
>  used in the inception of the GPIO subsystem.
> --
> 2.25.1
>

Patch applied, thanks!

Bartosz
