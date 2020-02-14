Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD5615D602
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 11:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgBNKtE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 05:49:04 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41004 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbgBNKtE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 05:49:04 -0500
Received: by mail-lj1-f196.google.com with SMTP id h23so10199708ljc.8
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1i4Q6/1RsyH8dGZF2vprm22L1oxGHlOcnNHReqoF9A0=;
        b=Ts4DSDY7UpRHKDbUuCSly0SJGu9e3cuorS05YoXAWoiHfbT6gDZLHgtavc4t6uYro2
         Jd8tKZgAGyBhN4SCSktaIRL6q1pQC6cNsNrG/hv0z/7DiwEjLZOuQG4ZMWSlDutuJMXz
         odHlhJ6Gf6gUix4lqMvr+gIMmhodCE0+cEmdy8WwSmZUPu8Gy9rRYcvrduPsfERBkXcf
         vgfVsRRfU6q7ad86bLwMrzpnaqLPKUpjHyb7QxWm8oLMUpszmFk2aq0scMy7Dc+yRMlb
         TpmDpcBxPHLReyZNxloQ/XqdAjdMKu9wStXmE3ts8+fwSi/F52kjw6t1YMmk8mZ2MBUV
         PRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1i4Q6/1RsyH8dGZF2vprm22L1oxGHlOcnNHReqoF9A0=;
        b=ICxsyj2wNrzv4Wvv+qfbWU4L70ddfvn0FSDKIadYRiT87DqqDgpi7SXdPSFIzJIVe8
         qMqs5NFxoXip4v6Uk9oMgYeY6Cik6bM+QrMx7dhMC5Gj1TIlk85hmC6NeTNQi4ae1nFU
         6jaZL9hg/C3DtS5OS38Gv+rg5QPMA8CofGhASR1CxdKcoZ0H1Qcq5JuO3p7LfAnohIPJ
         tB+rmu3uk0SLb6uKiQlzrx0bc+FBTT1MuNhhjSPIXIwCZsAnWSwKEl/LwtuzNk/Nfjo/
         bn++oF9/mBCrU6KHwVE9OWnlLWSJhq+7bIMyoWGQi6MLezYFV5moFbgivW3RD49zNpW9
         rwGQ==
X-Gm-Message-State: APjAAAWEsVBWhDtBBL6Wvl5UocHFigiKamd4dvj0y6J5TNRXHeQylFNn
        n6uT1hVABTRRpIMQlh8AZ4qNdPcH/YKayp9h+tG0wg==
X-Google-Smtp-Source: APXvYqz+6XkhlYSkMAKGVhZEHaoBs4DSOaPtmDqULEN8Q7rW85h657r4NxLb6Kf9TtTlfZhQ2GV+rviqE3OrEyKx/q4=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr1665644ljo.125.1581677342094;
 Fri, 14 Feb 2020 02:49:02 -0800 (PST)
MIME-Version: 1.0
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com> <1581166975-22949-3-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1581166975-22949-3-git-send-email-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:48:51 +0100
Message-ID: <CACRpkdYKNYaLcy4T=CixZSkzP6wOvisFt_H_gqhEoANz2Bm4KA@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: bcm2835: Refactor platform data
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 8, 2020 at 2:03 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> This prepares the platform data to be easier to extend for more GPIOs.
> Except of this there is no functional change.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied with Nicolas' Review tag.

Yours,
Linus Walleij
