Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9EBD10C5D6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 10:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfK1JUN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 04:20:13 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37972 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfK1JUN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 04:20:13 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so17139897ljh.5
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 01:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SKR+fGqhagGvX2eqNQLxdhFJr4K9V1rTJpQxJ6x3WKk=;
        b=xVzjp37ouQN75mH6Dt3mGkMwNKrRX6u+HpSWcYWq2CKwOIVa4TeQWRlVLMbh5GYNWS
         rUaE3h/xK5KaEsNpV8oKQKfEA7tB9HaWB59KyDjgjsDWhiAIpLrkHa+IVaUnHmNXtKMI
         JcgvsN6kBKLnN/fbkdSSqvrCGbbl7IENhcYoXSr+B67mJTdgn/uGRaCbqwn57whuajhx
         igP/yRCKxskbgKUkTlTi7gxS2EFkBG6Y3d8IATowKofWe+r9nttIBFOZL+KEJfaiu8lq
         L0Y7uuR0GIisTqKWLlcsxv+hOAZqCm8PNQc8ldrfVKyLEkiwuKFkg0mCa+NdeqeZiz2w
         sq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SKR+fGqhagGvX2eqNQLxdhFJr4K9V1rTJpQxJ6x3WKk=;
        b=M3xooBVXQGHqG4fG0mbjCfuKE0yZFTGFeda+9Qrp2vg3CzucoNeodlQx1nQSeFeoWv
         OajDgGAUEDYyK+N301H2vBMzl8GS1RCXNS1XcCiEKrH/ZdE/l7qvxv4WLcGu9rPatvx2
         pOgVu81iq1lI3EYWGEbyzrUT5J9HnCwVxFW4LWlNcbpsJTZfL0x4j0zd51JTWCXhpjsp
         SKxng0nYYO2UltEItSzXxQH1FBxRnFz+u0p+3irA1991zcijxW4WCBNzGP4HgnAlNKdo
         gH7a2+0FHYE2xi/UzwsZIipEMVWZ/Tykf9cVLIEvhNS7Wc0BgAxNSBwaGElvwHl5oqIA
         wJ+Q==
X-Gm-Message-State: APjAAAXn3tqW2lr22CZPkh0JT7YDYd1k0eej8/PtPY388HZAEXJ1468g
        HXZFfxOBhFCSFDDftnDDdUbAAXqf4cHnuSfljlXNFQ==
X-Google-Smtp-Source: APXvYqxZngPrEEmUgnY2zxc0OBJBb0pB01VZiWH9/1Zz0lACCnn4dlER3/eAp847pj8LENQxBB3sJsaZ+TqR8fP3EoM=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr33968538ljd.183.1574932811602;
 Thu, 28 Nov 2019 01:20:11 -0800 (PST)
MIME-Version: 1.0
References: <1574533806-112333-1-git-send-email-zhouyanjie@zoho.com>
In-Reply-To: <1574533806-112333-1-git-send-email-zhouyanjie@zoho.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 10:20:00 +0100
Message-ID: <CACRpkdYZfwXTfdiVtZgbTy9U7VxCE471N2ysWF7Vo7Fasn0Uxw@mail.gmail.com>
Subject: Re: Fix bugs in X1000/X1500 and add X1830 pinctrl driver v4.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 23, 2019 at 7:30 PM Zhou Yanjie <zhouyanjie@zoho.com> wrote:

> v3->v4:
> 1.Use local variables to streamline code.
> 2.Prevents processors older than X1830 from being
>   configured in HiZ mode.

I see the buildrobot is complaining about patch 4.

Please wait for v5.5-rc1 and rebase on that and resend
after the merge window.

Yours,
Linus Walleij
