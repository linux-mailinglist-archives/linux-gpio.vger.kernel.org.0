Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F45D4768B2
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 04:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbhLPD32 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 22:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhLPD32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 22:29:28 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E271C06173E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:29:28 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id t19so34599546oij.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UsxS3cyMXTSd/5dEUxUXWzl1BGIjNb+A41isAFW684A=;
        b=TayLYKm7gCeuqQb9cm8r765MqSSpedezKlCFG8xuhGLQYCwJNyYDVMEG9leDr0u6CY
         fkNvIOlP9Na/Th6qkKNnc6x+bvfn8C8lupqPK7GiP7KRjyScMKhpEBkWEtgt9hUCE6gg
         7vVOEtnJeGFR/LuffNb47ewKOslDxgwk+YJldC6AIh79XDjMjwwiQemDK8YgxOgxHDdd
         fLAQDncAJH78sXCzbh0lMRemUmr0p4Dd9BWnRgL4sP1dI+kj1vRzNknASF59iFIsZqOA
         PgmFJivdme8GXgdMRXa2x1h9Ju02hqMcTCmAKSikTGvGiB8SDQ6n6+TMkJQQJkvDg/GI
         TpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UsxS3cyMXTSd/5dEUxUXWzl1BGIjNb+A41isAFW684A=;
        b=SD8SLgjiSFgSjW3IzTHQdqK9vtMwTmYZQzyy0t2vqh0tbkB6cbnXe+ijIu3FP4Aodg
         YRKDBE0JQQJVv5vAhusVOxic91dAKFz66vhs/ZR+xZo7SfLwaDVjHSvodZnwu/ObZpbr
         uZe/iTb29mhp4EWp4GvKvlT5k+hGdf8aHOy/ItWRNH4DEj22c8MEAcVY0HTM4wZPV5FE
         JyOTHBlc17w6B/U2HuaBCXNeo0BTjoC2kDKXOuZUt7o1amc+uoy6uuyi4ksePuKbM5an
         Hmbo3ZJb14MxNqw+h5hX3FMNOgUo9iuGAkMm/fm++ACdDFjTp7NEd3Mut4ql0osiAJjq
         0Jnw==
X-Gm-Message-State: AOAM533fOzKy8dUl6hFgznEZrMQWR+JCjlbtcIA6VyHW8QEv2Cf+7iyT
        cPQ3WJb0dXp2/0siGex/9dVduHgK0uAhMvw5FmAD+A==
X-Google-Smtp-Source: ABdhPJxJdoUfL7Na9pv4TPbOhdVT16g8SCas8hbxRD9wkYxYOAC6HLsTEj8L3HiugXvF3P9AS5qpGWRXfTs8rzXSWFE=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr2618437oih.162.1639625367674;
 Wed, 15 Dec 2021 19:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20211215214022.146391-1-julianbraha@gmail.com>
In-Reply-To: <20211215214022.146391-1-julianbraha@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Dec 2021 04:29:15 +0100
Message-ID: <CACRpkdYngi90omV64yj4OEQysKhVVaOpwXAThUtv51Rv9NvxNw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: aspeed: fix unmet dependencies on MFD_SYSCON
 for PINCTRL_ASPEED
To:     Julian Braha <julianbraha@gmail.com>
Cc:     andrew@aj.id.au, joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fazilyildiran@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 15, 2021 at 10:40 PM Julian Braha <julianbraha@gmail.com> wrote:

> When PINCTRL_ASPEED_G* is selected,
> and MFD_SYSCON is not selected,
> Kbuild gives the following warnings:

Patch applied as nonurgent fix.

Yours,
Linus Walleij
