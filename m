Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E09317920F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 15:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgCDOLs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 09:11:48 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41624 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgCDOLs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Mar 2020 09:11:48 -0500
Received: by mail-qk1-f196.google.com with SMTP id b5so1680756qkh.8
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2020 06:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RjvQ3OcnTVdxhTWVVbPbw3jQ/x/6RLQyYLLkFrMFFyw=;
        b=xknSEI0a5LtgMRLHayPiu5S9manH9X7mK4IBeL+c+a6ZcSud1n/8sPjCkM2NvpJtFq
         zP3ivOV3F+JqCy6mhH00Ab+ztQ63s8e6AkMYPq7z/FwOoeP01FQpysaeTjpe6ioNIjG9
         GQeQGWNkalHxc6G6vECl3+jFV7NksUhSnMgBo+m5N6bYgevR96iyZjEun9BgJP+DqNTp
         NMapld5Oefg73raghUo3xVv1LkrZkROZUz+jPvGBENqtxtyGU0r6/GuIGqtb51aj5zug
         RLPuWaSf8GC5okJ63bUB5Rqan5bi5nO055fqINvBtdTMqovmKgTVy/dHWpyL9TPXfATC
         +dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RjvQ3OcnTVdxhTWVVbPbw3jQ/x/6RLQyYLLkFrMFFyw=;
        b=f3fGLp2bxIiWrGlO8ko7G+hE33z5Fw/moPizqim+nllYDgBwoEDtOTGyrHpzuW4Avs
         zSuHFSelxMcCRPxD5tPKXGhYlTTzuHuFbgjDTdhXKJy6Em4JYMkIv+QC9OuxAFrW31Wo
         d7Fj9elGek1folIt8deM16m3qzTWLFWdTpJbLLKoi2qws9cGzhwybl5IkJ2j1v0BXsg0
         ld5p8B05vt7Kxdj66FGZWOsFdnfkP1CNmpXzzZ9bSsFttsn7yPMXOzBo83zgbFwbtl38
         F6UsiadeWOnjQ/2v2Di8HCX0GDLsRTUC3Ui4zQxQBiXHXW6dbRrtLxVNaOTS5zg70zT3
         rq4w==
X-Gm-Message-State: ANhLgQ0I2B3w7fXYHDsZXjGH3/XKu57PXPknE9wJpI9jV9lnixxJ62LT
        PVfZqQ4Z1knFC9+pXC8SAfNpvaSWhPvJbdMzDlm03w==
X-Google-Smtp-Source: ADFU+vsA3n4BaKpliKkFsm/cu9cRnG2g7UuR3MmeFl79PXd1ENm5985cxw1N8F+dhsVjTkPQfABX67ZH07OYFt4DV3A=
X-Received: by 2002:a05:620a:1526:: with SMTP id n6mr2180188qkk.323.1583331107187;
 Wed, 04 Mar 2020 06:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20200303200149.27370-1-j.neuschaefer@gmx.net>
In-Reply-To: <20200303200149.27370-1-j.neuschaefer@gmx.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Mar 2020 15:11:35 +0100
Message-ID: <CAMpxmJWJrQ_GAmv1snRPCL=CA-zbHH-2ZKi5ZNAgUASQ3K11tA@mail.gmail.com>
Subject: Re: [PATCH] gpio: uapi: Improve phrasing around arrays representing
 empty strings
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 3 mar 2020 o 21:06 Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> na=
pisa=C5=82(a):
>
> Character arrays can be considered empty strings (if they are
> immediately terminated), but they cannot be NULL.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Makes sense, patch applied!

Bart
