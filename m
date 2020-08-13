Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E673B2436D0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 10:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgHMIoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 04:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgHMIoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 04:44:15 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B127C061384
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 01:44:15 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id i10so5311315ljn.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MpKzKk8wGOFjAtVPa17BCRqwuTJzgLU2zdpuBahdHkQ=;
        b=dbgrU/KM6aDeln0roA20eNSMNbs20svp5M5CrJPMou5qqcaQfIJ4aesc+Xz6dS1pMQ
         DJjgZONExrMDWOIQWQif48Sv7B60WSZCHxT4JxKpLm/xepaxLPrmBDZorzowV4CunqZa
         qEnL5JMCZrXcWq9plACMPwx8lxABB8einuGfVVtg0q4WVq7jh/wfj6dcokW9oc1FL4z6
         lHednhWKbqcH0L6kH9DYiBdU6FX4AXhrxOzrbacsDlOFxft46GuFyqwRyswY82WVMv4j
         W2hMZInhkBBYRe0BSzJdr5gR/XSXS8xJbaCDISQDD/ujwnyO20ZDeK47ETuiZQiWCt7T
         GTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MpKzKk8wGOFjAtVPa17BCRqwuTJzgLU2zdpuBahdHkQ=;
        b=ShlI2+BW6//xexnI1osr9VA4objhgyrC8UDnnDsaTeV1eFH0CE2qKXWWCqjNtLCMLD
         uXZH34JIZaNg2xIwVxk80ToCs5+rIlryGlesFS1R62APNv5Zy8lPSYRvhsty1VgOtI40
         qoTvuTt/CTPzqHWWWg0dlz0vKUtRjCprnTeBw1+Fz8jKdV8Ul1Y6RZn4rXc1xuHdJuGN
         nn1SlsuyXLXLwTEgZ1wJx/OaqMY1lR20vqCbY9I1VzNbMkqdtjV+JV087n4C1QFXyKji
         GK6J/cf8TrM+VGnXiOUPYSMz/oEfu7tkKA9ocsUnic8LBXmVIo/jRt5LPe7S4EPVRQCA
         LGpQ==
X-Gm-Message-State: AOAM5319qG7bbVsDowVQzkKepdYfNk20UF6N76+7KL59PR8iNSyldzzg
        1XDDMbT0wX8Hw5BIsHMONu2PbnKULKNYW1nhCpS7vg==
X-Google-Smtp-Source: ABdhPJxql5a3MUGD32ehFulTJWCwyKdiNDcsY3MR98fi6tYpCu3pQ6oJYcPd4vs8uKqQBrc/5eML6TkOvAtC6lipKPI=
X-Received: by 2002:a2e:90e:: with SMTP id 14mr1554489ljj.293.1597308253729;
 Thu, 13 Aug 2020 01:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200724132457.7094-1-pali@kernel.org>
In-Reply-To: <20200724132457.7094-1-pali@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Aug 2020 10:44:02 +0200
Message-ID: <CACRpkdbUtG1vfqu=XViLGqirk2-yvBGsM4VOsA9Kymnauqv+QQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: armada-37xx: Add comment for pcie1_reset pin group
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 24, 2020 at 3:25 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:

> Group name 'pcie1' is misleading as it controls only PCIe reset pin. Like
> other PCIe groups it should have been called 'pcie1_reset'. But due to
> backward compatibility it is not possible to change existing group name.
> So just add comment describing this PCIe reset functionality.
>
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>

No reaction from the maintainers and looks good to me,
so patch applied!

Yours,
Linus Walleij
