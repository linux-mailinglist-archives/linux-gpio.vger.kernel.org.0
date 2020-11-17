Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C012B70C2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 22:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgKQVNj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 16:13:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbgKQVNi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 16:13:38 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D6EC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:13:37 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u18so32089410lfd.9
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZ7WPMHyqwF44S8WWyDoE7tx2qS4QantqVQqQjgRUIw=;
        b=XbG6rxI0CwUbM7fOlgRiz7dajvImNE3Mvm++c6bunOn0ZVROojlCHlaLyT1bcEVNkU
         eZGbG/VerpOxef0YX1ytyfa5aWq508Hy0fTwXwcHadlM8gEV4xBO2IIBh8EhEtPS/5eI
         rdDMBONSZnH3K0tfw+ehDhyomMIPXZAGgCXiF2EOUonDWbOYpIYoUHlLbV3n9/IhAciK
         BRguyRaHaMLHf3xILCJHMIT4MRhLNA+AGpKpiCxjSWOxNpMXs9C+NZiPY9nXFI/EInJB
         O+pwy8S5v1ac5b2/cWf4+vYn/txsnmFua43GqPa3Dq3vHvi42ioxPbKTtu1i0WyOcLI3
         smBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZ7WPMHyqwF44S8WWyDoE7tx2qS4QantqVQqQjgRUIw=;
        b=SNzf6Lah/pAQxUTva9z9xHJahgZG1Vicg8fwsxlg3d0H3a8MjiGngNxkb1DCJFPL69
         upTFwOmLbmJ3NfCC09R+MnJAjNJRyNAt3Ue4fgTxZxD170+YoC2qrxEE4RFBsI4k71OF
         JOfAMGhPgk49F8iwKHrRUtqRTAA8ZX54Tp+wB3EDM5F2Dve8Rqt4IJJgzseWAhEVhixC
         fyOvzqVcyc1P8svAxzOTvim9nzrbEO6q4q7k264O73viXTP/iT9A7/pmbstkU2pC9arQ
         +vJwaA1RFQ1FUBLmkQWKB07RSK3D5APUdGG2RtsqjFW/slrXDa9MRV9OyH+vuZtSQzGa
         PYVQ==
X-Gm-Message-State: AOAM5316MunAxm/15PkTqJq0RQ6ohUtPFgoKjn93fmNDsoI26elVhqah
        hLiVMS7CuGuN84JH3M5/eA2ifojgvIb4PBFZq+/nDA==
X-Google-Smtp-Source: ABdhPJyNq+CNHh1MAduEMfPP7Ul1VV5Ez5vcF97b3xt+N9lZ32bKtHEMRP0oKBv4GT8nKsinIMFaSkaUnbaFWDs1JGA=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr2616415lfc.260.1605647615825;
 Tue, 17 Nov 2020 13:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20201110190210.29376-1-festevam@gmail.com>
In-Reply-To: <20201110190210.29376-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 22:13:25 +0100
Message-ID: <CACRpkdbah9AnHi90-FVbmdi0EHo4JrBj8bbkqpFik2PUaDNE9A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx21: Remove the driver
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 8:02 PM Fabio Estevam <festevam@gmail.com> wrote:

> Since commit 4b563a066611 ("ARM: imx: Remove imx21 support") the imx21
> SoC is no longer supported.
>
> Get rid of its pinctrl driver too, which is now unused.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Patch applied.

Yours,
Linus Walleij
