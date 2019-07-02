Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA30F5DA0C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfGCA7y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:59:54 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38088 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfGCA7x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 20:59:53 -0400
Received: by mail-oi1-f193.google.com with SMTP id v186so605784oie.5;
        Tue, 02 Jul 2019 17:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B0lnG7dVUXOZiqirpp6Pr4IxSipe4AyPJyRnbU/UDbM=;
        b=gEuizN8LAKvRau0Nsuxug6F+9pl8chEcIGAI5O4AI/JNeuPd6hjSef8K61p7hSZVvH
         mMxwO+OzaYdILethk7IDWi09fPmKhSZuXzolOc97Z/n6asWOy4dyN6eYqM3VN0NkrX1i
         xcLZRYaqGuZCMvCwklujmvFtShLseiFoXVo3URCIyq6KDilYyFOpIWKCvpJFxM5wcN/n
         d9ykGI+60ctT2KPg7Grdo5ugdrj+MeanqpwmMNSLgSXPghFpS/Vv1dCd4+QrVNnOgypD
         tRmGj/QLtZJXt3jT+OKJUCo784fIwbWBMvkMSWLYUlp/6exliELY1zzEebgUS8/gSu83
         Ib1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B0lnG7dVUXOZiqirpp6Pr4IxSipe4AyPJyRnbU/UDbM=;
        b=Ugohw6xl2twNtGitTDc78giNQZ2vHoPKN8GFDEBaD+3Lpy26b9XuNV7D5hNXTzlQmB
         wPV/xFuq1tctjDIg1QUjqyXVn3utMhPyzPYdI6BXhsKafUi28InPpLDSWHQEuOQuuExV
         JodjFPz2IJDWuaFSNVh4RLD64BdPtp8V5sOFhHd6Gb3pD3sTdRNdU/gzBxBTPVFDBi99
         1sTMlxsEdMVA1hGvwJem/i8RKVlvmq1QfyrRwl9vFYGqaHTA32A9AEGC8h+X8FFZrfVT
         229FJESPleh4PeHi49g+x4hBRzCCOJu/2pQ+i+za5xb0am/jqFkE4WlJ5lNKJoJinvtw
         Dpag==
X-Gm-Message-State: APjAAAWaYihaGEhcDtrDM2FxLTPrWVOtr+7A/NKBvZdY/ws+rXS4n8Ng
        Yo8LOoAINz+6v0re0PfFq21pe3ZP4fasMkkSEu6w47DX
X-Google-Smtp-Source: APXvYqw7GqOpvPorcRhCyGKe303y7lcoPXIyo8PqNByOmScgMMCuyG4n9Vbue28pMqX8fvDoy9he8KbkXktBPfB7h38=
X-Received: by 2002:a05:6808:8f0:: with SMTP id d16mr1422412oic.47.1562108171246;
 Tue, 02 Jul 2019 15:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-2-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-2-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 00:56:00 +0200
Message-ID: <CAFBinCDNABG5BpAu=aXjTuFAd4YEgX2OvtAfFEGBm8NfVHu_qQ@mail.gmail.com>
Subject: Re: [RFC/RFT v3 01/14] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the missing pinmux for the pwm_a function on the GPIOE_2 pin.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
it's not documented anywhere but Amlogic's buildroot kernel (from
buildroot-openlinux-A113-201901) uses the same bit so it seems
correct.
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
