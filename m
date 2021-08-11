Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98A03E8BC4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 10:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236083AbhHKI0S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 04:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236068AbhHKI0R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 04:26:17 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71195C0613D5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 01:25:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d4so3957868lfk.9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1pnCAwRASpn4fyPBkIzTBQEKpQcrtuBfGwIpH44ZSA=;
        b=qWzCe9dga955Cga5w7LhEv4Xk82pmQbdmUlVBdLOMkPX86nA8hsEPUdckpMeEV585/
         G/dHsMELydm5OjT26oiUny5UqrBwTXLpHaypWViqZiRfzgW9GyBz6wImoplFJnmPdjdk
         bNNETnaSu6mJlpsEDV1TY+nseYTNWxkdpkSG8R6Xj/sPBsX4+IWWcrcQ0eYfRbo034Hb
         9kqUs856OcyFHg57Tl4OIsE83+fin9YBLHRyuRn2mm/TCGPUX6bo4QZK8/PWJPQ1wiQK
         fZkbqvgtXKvYBnKcpuQKKBchXTBLHkVa8pIjfNXo4BQNKYHORgrE3Z5K2z7VX3kmUd/W
         TkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1pnCAwRASpn4fyPBkIzTBQEKpQcrtuBfGwIpH44ZSA=;
        b=L6ol90HsnXNk6luuz0sz/ZxZAheWBBgaH8bKST+/4QOPD8jJaW0l5fnQ8ZsSL19OvC
         6C/1Mty/4tbavTJOyi7vkCXQVbVoHkT3D9fbXlQSOR0/u/6s812xFWHIKpZ0y3O4YJ7V
         DzwPIzYH8kMUgKWMuipYwwqQhGsQYhXvDl3Jn5QYnTRrTzCaQeeDmD6WL1D1fTTMLG02
         LGhYAm0wQ4Dscx57q+Yxxa/gdIkC/zU2dNF54bQ7FvoL/ch8oXQ8xcOiHG671cLrietg
         ELLXcYQpH6655A2llQv9yFDYPJua4jsN/qgv1pVk1UWl6fP5koomqpzGwrZkyWZI/CF1
         UVFA==
X-Gm-Message-State: AOAM531KyTUJF+W7dvfQbuBw7jNfcPh7DrfdveXyN+OmSQ5X1Fedrndj
        yhxoDcvX8lVtNNhpMHLV+fgv3tOSyGUZy0Q4+/UpuA==
X-Google-Smtp-Source: ABdhPJwzK1TTNyIYN73hVN5UaP15UGCZnTRveq/TFlaH8lMiEvIy1pw/7ZC1PP0URr0ybbS+xbh4JHIR63GJoVn1YpQ=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr24358039lff.465.1628670352818;
 Wed, 11 Aug 2021 01:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210717174836.14776-1-paul@crapouillou.net> <20210717174836.14776-3-paul@crapouillou.net>
In-Reply-To: <20210717174836.14776-3-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 10:25:42 +0200
Message-ID: <CACRpkdbMH5=r5wcxUrqL1DYPvERD6X+19699NwOrRT68tTU2oA@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: ingenic: Add .max_register in regmap_config
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 17, 2021 at 7:48 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Compute the max register from the GPIO chip offset and number of GPIO
> chips.
>
> This permits to read all registers from debugfs.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied!

Yours,
Linus Walleij
