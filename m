Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561DE223AA2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 13:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGQLic (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 07:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgGQLib (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 07:38:31 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BDEC08C5C0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 04:38:31 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id f5so12189333ljj.10
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFJatZiPd3q4Ge25iIBb4A6tpk6jKl9wVvHTvMggx0A=;
        b=VzvFF3daDT32SYArgEhQB8Gjc0wPG2zfX08NRmzcXVON+AAHHUZeORxrzsh2fVDOzY
         fwG5bZnYMDrXNh/LKe5BCQ0qKZNSFhlaEQZCocn0g/Li1r2GMEsNoCejCuOeqwyQoXjy
         Wuj9l2fNzTUuSQbryr+nzy5Wpq2ZQgFep6+ea+k9qb59XKGCeMJ48K+Nt70lgqiZCagR
         aG6MgOvdUool0/M5qm2Jlbt4SiECa6wLjKesF9W+3uYbN94gYqk10UPyxuW/BtPraztg
         cPXewAtvL44IUZunAMZaLT/BIT/IlJNXjpQIfXt5jtnjrcT00Wa0VMqVe+Ot0XQcXkm9
         mcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFJatZiPd3q4Ge25iIBb4A6tpk6jKl9wVvHTvMggx0A=;
        b=oXtWR4sArJvEA109eP+yzdnxF6fMqtzogOOKMHg6axHgrCHNonvg55oIOg8f87/Rq2
         xl2DX/VT1jyIwAgl813t72CgXnVBl8WcIemxPE/wGnkhuaE+w2Ynzb/LkLd8BxjuPvfc
         E5Janm820wsZ34S/Ejrpd6PaZ7+TPM5tQ+xOAA+8IV1cHd/6Lt2OwOseQUZ0njdSfFTO
         OirKQwQ62YRjvHcqnZiL3NyID4Oy4GE0S47/PK2YaF8FahPchv3YaOhn/4WMaWGi0h0f
         GI5Dtb9mnlayfzPGVS/iLq/iUQzgGPi+ZqoZM6YIs4b5ksVhXbm7+L2lmAmfhjEBzxI7
         QEXQ==
X-Gm-Message-State: AOAM5305wW7l9eR+W/ETJvSwd7XSAEcSqtRXqOXdJ5WrZEJI0wFLHBns
        ZPHpApw8aeeTssHTC3BhjGIICbK1iE3/0oKO93CmODzGmZY=
X-Google-Smtp-Source: ABdhPJxGGqTq2L3ZGRxA/ALVYKMO3cg85lXJmKN6Tj2s0ZQ6g83NJgrXBF5hKYSVUntqiyaBKDe+U0cXUxnm/PxBw6A=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr4596515ljg.100.1594985909292;
 Fri, 17 Jul 2020 04:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200717100944.15966-1-geert+renesas@glider.be>
In-Reply-To: <20200717100944.15966-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 13:38:18 +0200
Message-ID: <CACRpkdZeFA2DkE5WxOD_2Sq4p0Xnww7wPUhfqGR8rK21RS_R8A@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.9 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 12:58 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit b2fc9b4eb1d79c03fd78e50b810c2ea27178e1e3:
>
>   pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions (2020-06-22 16:58:23 +0200)
>
> are available in the Git repository at:

Thanks, pulled in to my devel branch.

Yours,
Linus Walleij
