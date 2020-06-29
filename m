Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08CB20E1BA
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2020 23:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390024AbgF2U6o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 16:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731251AbgF2TNC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 15:13:02 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E6AC00E3F8;
        Mon, 29 Jun 2020 05:16:09 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o18so11889056eje.7;
        Mon, 29 Jun 2020 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soXbhE7fjamRPVpZww01jKbOBo61CZjTIZgKR2wcZEM=;
        b=Es+y1ZcaFE2vyCcFPTaEYe17yllLj4xwPgelB6vNVhT6If85EMMEEoqcEXGHKlO5j9
         r9I7EmCPe2amg3d60HJp9VhsfrvguLKNGZxpFyaJnNYmAMWlc22X/9D4KnoMJUkKpIk7
         wVkcc9u2zPA3Woe/4vuUiI+eZzUSE/zj3U/shduIu+ZaZYvzjzxZ0yjKmuWfC63Ia16q
         VUD/BrbSbMhGRCd8+q5RVU8LDnvePf0HL9m70oPYoG09tLusSgOhSCFM44UoTQvie1cL
         De2k7jXdx3A4vDrzulA2jsFfkVGWbqnvjG4/ZDcGk/yTg6Tx36oChwqyqphcb0laxjeY
         Xhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soXbhE7fjamRPVpZww01jKbOBo61CZjTIZgKR2wcZEM=;
        b=L0kdPZ4uxOA3be8s1CDoQsFWc0Q/y9qgH+r5gBpihg921a3ACsCFFXCi/FVMJvxlWD
         hgnqXm82qxf5kC1cM4BBI9JRPDHNQKn/hw/9PYzZ6eAa9V3w9RN3bIlQk4s5vmtmUQY1
         JC8T+d6OxZzc/o0Q92+22fh7az5e+Zw4hBLSrTdxm86FQJnfzZcXNTA3iPWgzv49Lg5L
         4rNAydAa9poxcKfN5+VU/LvHZ4SNz4cUpCrg2pwbmXW29WmaOU0sWNmZpPbuvDC67Zvy
         a5VycNsNZzykZbaZw7ZsrDVCrNQrdAHBfJATmGae3Qg/4O6r2cLKdytZUHRpEXogSa0Q
         PGQg==
X-Gm-Message-State: AOAM531Nh+5nUTMZjkk5Mbwj8F3jCo4n+GvUDJuJU7R4GTgEd/1K5VH0
        ynF8pYguCDtcWObhMfhFDw1h+iasPuGbEEH2GZk=
X-Google-Smtp-Source: ABdhPJxibo/BsVYpl4Oy+gCRpolTV0ZDAlF/gJWHHVyBTDNjk0EwwwBF7+zdsNd3Zc80ngr8WBE4JutDoPOiK7iCNno=
X-Received: by 2002:a17:907:264d:: with SMTP id ar13mr9310992ejc.504.1593432967918;
 Mon, 29 Jun 2020 05:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200621213806.551879-1-konradybcio@gmail.com>
 <20200621213806.551879-8-konradybcio@gmail.com> <20200629120911.GA1319@bug>
In-Reply-To: <20200629120911.GA1319@bug>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 29 Jun 2020 14:15:32 +0200
Message-ID: <CAMS8qEXdoX1Zpm660sOMM9b2rni9qXM_7rAi9kkzFBQYmL3EgQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: Add support for Sony Xperia
 XA2/Plus/Ultra (Nile platform)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Do you really want autorepeat on keys like camera focus?

I miiiight want to reconsider that when it will actually be in use :)

> No volume up?

On this board, vol up is managed by pm660 resin.

Regards
Konrad
