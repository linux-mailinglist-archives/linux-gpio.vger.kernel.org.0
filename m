Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3253420473
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 13:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfEPLUw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 07:20:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40167 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfEPLUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 07:20:52 -0400
Received: by mail-lj1-f193.google.com with SMTP id d15so2730119ljc.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 04:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kRLI+MRqPWEOi6+o0bitHVCl86C8o1gF6OGgfhSKZS0=;
        b=fm2+0aieraFIzy3CJAw7U/aHEhKeSvaIaVGCGnbl3r8p0fCdl8xR4qJ7SKMk93a3U+
         Mx05fbk1+mevXVRsvcqJWcyNWwoCkWRS6L8BLaSRBAF8lrSvqqO96bUr0JyKAeHPerbt
         hO2aMUcN91gYzMaAlkG4FmDWEI8Ah1TPy6iLuNKgBEpMlKZ9KNpMIo9cB4Djq0nlttJP
         CMBShp8NJrdTlQSYXGoDXgoRLeXqGS16vveCHBpAtS2YJS458XcUeygNvyJbyzBGRoUP
         4jKyZs0gOHomGQS0cD2nSCZuOty7CtU6jsQNe0hFzixUBmPcgqzNEIP5GPr1Uear26xV
         7pLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kRLI+MRqPWEOi6+o0bitHVCl86C8o1gF6OGgfhSKZS0=;
        b=EajCQaGTCH6KzwHwJYSHR/+/IHBX7goqXkK2ApqPf7lext2JVOSQta2Wn4zdIqC6bN
         8DB4wficNDwMoq2Qv4wNw+iIV2W8l4ei7buI5TcJ8Jzh1TTIrqetBLnq+mf/Zm3N4GeD
         VynAd/uEMGu1Z4pyB3lEaAg+qPw5fESulc1Slarz8icS89klQ7hO8x7BcaEHyKdJIkm/
         IGiTIHbovWQ7LBJQBbMZxJijpKJ4OxqwsIHMoy61SHWwwi6JUWUaRFC4sSFo1rmRMvJy
         qg4lHYmDojZMaieMd2Xvf9BRpgMPij9RpfblB32Vow8cOF06yOsZAKStgyaDuBHcB2fI
         ZVsw==
X-Gm-Message-State: APjAAAW9gLpxNgeOchePS10SIxn06Yp2UoLEAcDfCfstGj8Dg/lUynnS
        oGT8SGYARyT8D8XfeodLf5RYeQsPGh4wa0xBFOm/vQ==
X-Google-Smtp-Source: APXvYqxoArGUQbAGr63yz6qrvWdCjECvzmeE+zyvkueJJAumhxuqD6UH+z3ce8w6hLlTFJ9RXibf6Pkh8utF9aNv1Wg=
X-Received: by 2002:a2e:301a:: with SMTP id w26mr8654844ljw.153.1558005650599;
 Thu, 16 May 2019 04:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <1555309442-16039-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1555309442-16039-1-git-send-email-wen.yang99@zte.com.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 13:20:39 +0200
Message-ID: <CACRpkdYghGih+oxXwNDMLVZBAd36xJWoJR76JDycycczRPuGHQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: rockchip: fix leaked of_node references
To:     Wen Yang <wen.yang99@zte.com.cn>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        wang.yi59@zte.com.cn, Heiko Stuebner <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 15, 2019 at 8:23 AM Wen Yang <wen.yang99@zte.com.cn> wrote:

> The call to of_parse_phandle returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./drivers/pinctrl/pinctrl-rockchip.c:3221:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 3196, but without a corresponding object release within this function.
> ./drivers/pinctrl/pinctrl-rockchip.c:3223:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 3196, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
