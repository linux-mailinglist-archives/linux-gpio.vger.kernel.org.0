Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E37168081
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 15:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgBUOmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 09:42:54 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36715 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgBUOmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:42:54 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so2446900ljg.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 06:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TfwhgDHEklncUQidyHCpGyvOwyCft49V7Fap/k80gu8=;
        b=RKc50qWQW5JUHoFyHSCc18gTHWep0/bdQ7X3lrnM61wt7aD4JHP7ydRJcxLKBtccpA
         5HKI6An997w+9x3Eu5GfnhcACLBcAZxJUHKFM5XkRUfSmIw2pX3T8soMHxPBc2ZVhZPk
         otxGRG0yTGT/yaPO7i5Sn0AkvbsA09CEvbFAuhO+HUGUEVVmCURiPVApBIQU5siRjq04
         xbFt4Q/mIAvMHcIA7+xdHWEjz6F1jfwEu/fSPBBjaHiUIcAKyVIgTPEZqVj8/Oi1peMK
         el5DLBPv/5P5oZ6B6f5A1KjXdmJ96YmIpBUKSI7posaQELJidKfJ9HhHZVsq8cLrd3zK
         4jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TfwhgDHEklncUQidyHCpGyvOwyCft49V7Fap/k80gu8=;
        b=NWzMoM4w5t9vgg1XoNs60I4z7l3+4WYMHS+uDYdm+BWJ5rR9ASpoL+GAc4TqfUnpPu
         CaP9noMwxHYtGMtxq0ECmgq2V0JL/1aPS7chbbY4V4gL8qLVsAtS5JSL2t8Y41l1qzAd
         JzIF74NJ06mUQwqMsqxEqYn1X0jNanAwKNVzbnLXoYumtjcYjqqNhUcdPACSaacuIHPz
         HE4CO8m3CFhMrx6hCl/xHsUusij9otW0G11RnLR/bcCr6XkeBubyQsBJcSIF1N9Yi8GQ
         oGum1SWrYJTg6K4SvW8goFDNOEBhWDouRURydOfA5SyOj6LklsbSHDNhmf4gqagbdpQs
         3C1A==
X-Gm-Message-State: APjAAAVtnCwrzm4GP5kFC75OVmW9gQV5cdNjPHDCX5YUFFwzCKSy6vFM
        6qITs1uVUIm+RsNwTAqDuz8dEX9bXQ6ocbTAfYRLZg==
X-Google-Smtp-Source: APXvYqzgoeW5K8DqPL4tqHNwBvjMIGmjMtAVsQtMYi5lx4Vk/lJjNQQy6wkBDm/+PCOZbQHMB3p9VjdLQVGYccMGcI0=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr23010571ljg.223.1582296172343;
 Fri, 21 Feb 2020 06:42:52 -0800 (PST)
MIME-Version: 1.0
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:42:41 +0100
Message-ID: <CACRpkdZS9V_XugLuvzhWfd9Pk8xO4SBakShZ+RMeyK4z8fGQhg@mail.gmail.com>
Subject: Re: [PATCH V4 1/4] dt-bindings: pinctrl: Convert i.MX8MQ to json-schema
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 8:57 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Convert the i.MX8MQ pinctrl binding to DT schema format using json-schema
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
>         - use uint32-matrix instead of uint32-array for fsl,pins.

Patch applied with Rob's Review tag.

Yours,
Linus Walleij
