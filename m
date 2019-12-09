Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5246116DC9
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfLINQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:16:30 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35522 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727527AbfLINQ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2019 08:16:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id g17so16180197wro.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2019 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6JKjS8ULGOzUFR7zV+Ndftoq/ev83XREiug0BBdNIeE=;
        b=Fluep6Cy08Kzg9mPraMCdGJvXYVj7EnADOl1PYagnYKgrHsKt1Xsp9NRKUB+ooeph/
         vP1+nnfyracffXp6R4IWPuaA7oCZWLkd6UpAvbwPT8oMhZKdDaZDYxR8YyhaW5CtdN0/
         jQMOwkxHx0EfxlhkGxlS4Wm+dDO/tKc/uQdzSCJyN6rnJNfK3QiH4T3LcvbHymztIO/X
         exCokdFITCA6+DJkwR6Z7p+pwf7cFCKcyxsQ3LPAyLO9rtDkjaFip8op45XbbJ62+Bnv
         YtOSlyoy1OXRn487KoaySckqJh++QDJvxdhmXQLOe1XR0g1/u96bV0K5wTZYTF2bPDLS
         2i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6JKjS8ULGOzUFR7zV+Ndftoq/ev83XREiug0BBdNIeE=;
        b=BS5Ydm+a920al+7hTvDLJf9fndCn4LwCoDwT2Q+0vu2xSdidRw21sKtVIuZRKLAxMa
         MqY841ShOST7IGDRpmuXHGkGtwh9Ho26oJi0euIMZ8o/sbC7qdKodtkdiJG7j7NANN0j
         7YqtH2QkE/WjaRd83wLIY4W2BR/O0P7a1SxMrz9m5odlkZ1DO+dU4GGgsIdAMV9aRDXl
         zRUHWTLpE2xXQlcBd4KRXBAFJw+IaS1tQwlAxsnrFtF03bCH2JTr4MG8RLbOdanVaPuT
         9tMp9LGxZm98Eo3WGM+T3lrrV9oZFCW4efOFqpwftNkmAZMQnvwjhVFlctpeFuIZ1HM7
         YZAg==
X-Gm-Message-State: APjAAAUJoKMETMeSMjLZocgm9M9d4OBX/lKUHxDX45pk60d4HgU3eMtr
        aaxlPsQm3izRrRdvbxadpQmSfg==
X-Google-Smtp-Source: APXvYqyfJb9ulY7eYGRni5x1EoiZ65N/w4IbXiFtTbTgqXufBVfAXngFIBRVWJ/guKS6mVh9b6EFmQ==
X-Received: by 2002:adf:8041:: with SMTP id 59mr2019145wrk.257.1575897385263;
        Mon, 09 Dec 2019 05:16:25 -0800 (PST)
Received: from dell ([2.27.35.145])
        by smtp.gmail.com with ESMTPSA id d8sm26935218wre.13.2019.12.09.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 05:16:24 -0800 (PST)
Date:   Mon, 9 Dec 2019 13:16:18 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 03/12] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
Message-ID: <20191209131618.GL3468@dell>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
 <20191121170509.10579-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191121170509.10579-4-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Nov 2019, Srinivas Kandagatla wrote:

> Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
> 
> This codec has integrated SoundWire controller, pin controller and
> interrupt controller.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Change since v3:
>  Fixed lowcase usage of wcd934x as suggested by Lee.
>  Updated few if checks as recommended.
>  add defines for SLIM devic and Instance ID of WCD934x
>  Updated device name and compatible for gpio controller driver.
> 
>  drivers/mfd/Kconfig                   |  12 +
>  drivers/mfd/Makefile                  |   1 +
>  drivers/mfd/wcd934x.c                 | 306 +++++++++++++++
>  include/linux/mfd/wcd934x/registers.h | 531 ++++++++++++++++++++++++++
>  include/linux/mfd/wcd934x/wcd934x.h   |  31 ++
>  5 files changed, 881 insertions(+)
>  create mode 100644 drivers/mfd/wcd934x.c
>  create mode 100644 include/linux/mfd/wcd934x/registers.h
>  create mode 100644 include/linux/mfd/wcd934x/wcd934x.h

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
