Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 538B719A0A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 10:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfEJIwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 04:52:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39216 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727043AbfEJIwK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 04:52:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id n25so6480308wmk.4
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2019 01:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aaM8432jFaEmhAAs5kJRzcW3PtFv9V/mPFGHY/gVINc=;
        b=HC9GwhY1KxcCvquoeRmAWTsEHBkGlMjC2GOSg6QgSOb4NqeO9tQazouSymWwoGOCjA
         9JWrMkzWVeVEGra7oAVM1kJhEEZM/PhqiogQbhTl6twBJtLpQ0/MPg56TCYYAt+Nvv1o
         mCJg3YB/RHexlJfjgBa+KFzqJ5FvXDDHsnnWtvdJONcsi/MDywBvcfou5mimKwOEo1iZ
         aCqw/BkOF0tmUEWP1PK3VYzCYHdrfLvr1cLVaGotwWbUkfqHza9nLRXR4qX182qhGhEq
         TKz1aA9ZIVvYWW+B6qEF292a80KFSQDyuElD+0kAVBqsrRz195OMy7ClsyOwrwFgKNTG
         4aNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aaM8432jFaEmhAAs5kJRzcW3PtFv9V/mPFGHY/gVINc=;
        b=qpawjQ+D4ZA/IVSLc373VulY/W/k9QR3W5XJnL3g/nMv4bimXMX8nRgWwgWljAezyj
         1zTBXqxxpjOD0u7sI0iccC5yOLTG/cR8y5N/0zn+SQAl16UN2wpbmfycn6W4lfXWsqPt
         7duH1XND6VfXluhwBplUVp5txx4ScMy9saYyazHbJ9A0n3rkEH9gOPKirxMjylNswquX
         EjIZn4C8X8+kpw/veyZ5ny5cHw0mfIebCmM1FoAlmXdU2nGNVLnEpmdb9RnAgNzZx9Ox
         pHr2aNYiohYcYmSSwRMckDp1XQkAwLXQP0XwiDU4gj5NcsoInakXQpP8mfJyWTzUOKbw
         ECyw==
X-Gm-Message-State: APjAAAVaLJ2B6rXHlT75aSWmpoLox6Ywk4KuoPmun4ls7H398RUWasix
        5bllMCUT64e6x0NF/ftk7VxSRw==
X-Google-Smtp-Source: APXvYqykj1mHG44y8+cSJrOUjhNqzrgeo1uIXi5+tTVxFFhizSUvTXk2PbGt+OXdLaVSil5RdqYKuA==
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr5910297wmd.48.1557478328921;
        Fri, 10 May 2019 01:52:08 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d4sm12281121wrf.7.2019.05.10.01.52.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 10 May 2019 01:52:08 -0700 (PDT)
Message-ID: <331673da2c1cad1c72d61b45e0c614961445ec90.camel@baylibre.com>
Subject: Re: [PATCH v5 0/6] Add drive-strength in Meson pinctrl driver
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Guillaume La Roque <glaroque@baylibre.com>,
        linus.walleij@linaro.org, khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 10 May 2019 10:52:07 +0200
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2019-05-10 at 10:23 +0200, Guillaume La Roque wrote:
> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
> 
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-microamp". The change to do so
> would be minimal and could be benefit to other platforms later on.
> 
> Cheers
> Guillaume

Guillaume,

Several tags, such as Acked-by, Reviewed-by or Tested-by have been given on this
series.

Please remember to collect and add them to the commit description when posting newer
revision of a series

If you didn't already, please have a look at Documentation/process/submitting-patches.rst

Thanks

> 
> Changes since v4:
> - fix dt-binding documentation
> - rename drive-strength-uA to drive-strength-microamp in coverletter
> 
> Changes since v3:
> - remove dev_err in meson_get_drive_strength
> - cleanup code
> 
> Changes since v2:
> - rename driver-strength-uA property to drive-strength-microamp
> - rework patch series for better understanding
> - rework set_bias function
> 
> Changes since v1:
> - fix missing break
> - implement new pinctrl generic property "drive-strength-uA"
> 
> [1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com
> 
> Guillaume La Roque (6):
>   dt-bindings: pinctrl: add a 'drive-strength-microamp' property
>   pinctrl: generic: add new 'drive-strength-microamp' property support
>   dt-bindings: pinctrl: meson: Add drive-strength-microamp property
>   pinctrl: meson: Rework enable/disable bias part
>   pinctrl: meson: add support of drive-strength-microamp
>   pinctrl: meson: g12a: add DS bank value
> 
>  .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
>  .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
>  drivers/pinctrl/meson/pinctrl-meson.c         | 180 ++++++++++++++----
>  drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
>  drivers/pinctrl/pinconf-generic.c             |   2 +
>  include/linux/pinctrl/pinconf-generic.h       |   3 +
>  7 files changed, 193 insertions(+), 53 deletions(-)


