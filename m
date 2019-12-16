Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB6F11FF7F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfLPIPj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:15:39 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:45240 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfLPIPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:15:38 -0500
Received: by mail-vk1-f196.google.com with SMTP id g7so1367413vkl.12
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 00:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qu4go+LfnKNu76tzONlM/DXLfpoLwvN/WGMtsTcLNx8=;
        b=leqpCm4mwbX2Ey94U37p2i9Bbx2RkIfvb6WvQBDRNgtT+BR4hoBJgsQ9ofMZk5fgW5
         aqxcfB+w0CyBiGJxW4/iwcSMgOronAmehBnbN81GmoJ70EOU1PUCsHaWHY98vwPhJ44T
         TdoXMzTniNcKi8V8AEo+GkUhJ0dLg4ypg8jqEqpplE+ltTEnK5qErmotbHGqAkodjLG+
         tf4Q5K/uXylKQEEgLK77AIFTtqOg0tNi8n3CfamBgzRNKyv2g7Jq9h57fPnhyJlcrrzm
         cwEcHY9vODoelw/MO0sk05APT3/mfurBJmYf1ri/44TwKzvTZejfR2XBWGKUVsGLVaZ1
         Eyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qu4go+LfnKNu76tzONlM/DXLfpoLwvN/WGMtsTcLNx8=;
        b=KZJ725iUgilKvzdyuAht8arYwh4yRKz1zGi9+kDyMNjxb1DI5Nusu/fvQlRMQueI39
         gned3I0yi96SBPF0UFOvbnNhROnXcSipdJTfW1677+uTJpRG9V4OmWHm02BZWq37ucMF
         T6Lq5KIr9+WZCI44DpcJtZBXzSu16IqLpv/Qk/nKcC8RVcbcAXt0866mkp0iNJWDCjmc
         Ugp1PGHBncbINk0XCfHaVJ/mHZaIDdeNVXpFL9HpIDSHbhD0B+YmshgnIb8GDaGv2twv
         PwcSG7YEwUkTQH5oBZTDaW/W10e75NMl5uH+AAnUe0dsA+klisbQQRZ1jWK09TabaQUe
         d+GQ==
X-Gm-Message-State: APjAAAVN8GQqH2UHDBNnfdnmre3tKWV+qAf/oVxyAuq1CX8/+KQDpT1N
        Z3tgf3SmVmcVmf8n+JWDPcD6CygMmXmsgsz16J7BfA==
X-Google-Smtp-Source: APXvYqxsLIGSSYoLhqReMPk/ckHJ7XR9h2vXGNBZs6Z+b9XI4Prqv4oOpdbXnDGHV9aGiX7g2AlfDFsUeaCDtmU0zBU=
X-Received: by 2002:a1f:ccc6:: with SMTP id c189mr12309632vkg.5.1576484137990;
 Mon, 16 Dec 2019 00:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20191210164446.53912-1-paul@crapouillou.net>
In-Reply-To: <20191210164446.53912-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:15:26 +0100
Message-ID: <CACRpkdZA=0vYhYUXYYNtjkaWKRbm9Y=iQLyjcNWLStpfd=LRAg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Fixup PIN_CONFIG_OUTPUT config
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 5:44 PM Paul Cercueil <paul@crapouillou.net> wrote:

> JZ4760 support was added in parallel of the previous patch so this one
> slipped through. The first SoC to use the new register is the JZ4760 and
> not the JZ4770, fix it here.
>
> Fixes: 7009d046a601 ("pinctrl: ingenic: Handle PIN_CONFIG_OUTPUT
> config")
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied for fixes.

>  The commit it fixes was added in v5.5-rc1, so I didn't Cc
>  linux-stable - I wasn't sure if I had to.

No need for that when it is fixing a current -rc, that is what
-rc:s are for.

Yours,
Linus Walleij
