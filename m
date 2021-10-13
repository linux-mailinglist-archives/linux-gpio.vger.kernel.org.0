Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E669142CEFA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 01:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhJMXM2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 19:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhJMXM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 19:12:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16608C061746
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:10:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i24so18098173lfj.13
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7u46+ADThD6wTYw98HxB4YGpAE/UnEg06qqVREyT9cY=;
        b=D6WiObz+3nLXzSqSZovOzTjqqK8j0YG0ltC5cMhl/JvhDiqU2O0BC5BRHLcD57EmUJ
         bJnEkRWxd8WPBmdv6Unhbqe+Pxp9Advj+pkU2FzgnrIKQ/1nV6V92RPsU3Oj+4uzNAWG
         qMTZlt395Qwz0MZSGUcQxHit9sR346OqklmU2nlRMRrLmSky10t55EMVFPQ7UX7fQpHD
         7NIiUI43DtM8kj/5Jf8oYhLaR+6RKJUI4nXC1Bgo3OJhUUo25AZz+8mZlaz5B+/h0ian
         WOXbJhX+Fvt5GwYWAb+Pj5R7CndkeYzwS8qAKfHzwSctYN7A7BBJrOoYGgCcZvbLm21l
         VTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7u46+ADThD6wTYw98HxB4YGpAE/UnEg06qqVREyT9cY=;
        b=vcAtq9q16q0DtDDiV7OzbXbIZnBJK/GxFusgrSCausM3zqhwRiAOUE28pvpoHOhFGT
         yjW4Av802jO7gRd+fLTG4V1FOWcz8Ue0jjNjieDREHh8s8xEh8RuWdbAjQ7UgjSASzIj
         DJifONMN1Tcf6nV5rlp/uBi5f+1TYHaHQa63nqN1GoJP5GoCp9hhmrUIhnaqkj3i284e
         NO+6M1iG/uK8nDczKSJlI1CxBnXRVW2EyWMpA0HJlAVM9RQRGE2Hwhd7miKBBVBCvyXN
         BCfcwCZhiQmIP4TC/0k/v7x4Z5DzXhX1i4ALLlxVDUB4nOWewMFMwMV7ZRgo7iXqnAAz
         peHA==
X-Gm-Message-State: AOAM533uCm4FlDQBI7skbmrrqI7Cup+7Y8CcD5W3FUusWfHiOWpsAMWm
        KtK1ftyH4+ZzpcHEbJBEXX9L38iC8xKpUJGpONw6dQ==
X-Google-Smtp-Source: ABdhPJycAihuKPgSZtBcljGnX1RYFy+QiGg+RCx/ZF1nxi0VDu2CnCl6KHlENfZta/Jj3+GS4MRnrGI6gCYM9I5N4W8=
X-Received: by 2002:a2e:7f14:: with SMTP id a20mr2381541ljd.259.1634166622416;
 Wed, 13 Oct 2021 16:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211008205938.29925-1-zajec5@gmail.com>
In-Reply-To: <20211008205938.29925-1-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:10:11 +0200
Message-ID: <CACRpkdbUUScrtA=aLV_LV7t0N7aEaTJ7ELMn3op1b7M4qC+u4g@mail.gmail.com>
Subject: Re: [PATCH V3 linux-pinctrl 1/3] Revert "dt-bindings: pinctrl:
 bcm4708-pinmux: rework binding to use syscon"
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 8, 2021 at 10:59 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> This reverts commit 2ae80900f239484069569380e1fc4340fd6e0089.

Thanks Rafa=C5=82, I applied all three patches for fixes!

Yours,
Linus Walleij
