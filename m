Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8466A44AC8F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343527AbhKIL2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343513AbhKIL2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:28:21 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D4B4C061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:25:35 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso27609410otg.9
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CDizYRLdhl/XpmR617V9H1nya21GLh5Jm8U5bQ4LhoU=;
        b=pcchXYWGxC8TUsHCp5znzNf5KqyQkyCyzfUCSvDkKHtx5mWHUOO8WNnGzpEBxmV+6x
         aS53nZCnimN8PLnkVqe+PR9PUrCbU4qVIArU7eio+orLNFpyUvA57zYi6QtFSL9yQwyK
         toptpZysma61dUrGogLMOO28VVX3X8hltPZU/6jiQzXHizfhRgzTVDI6omem/foZmPRr
         By/xAszBff15g/bTqwowz6AwZtZlD+LEJlB7UhaqxNA+cNQGVNdGq1MA4grHWL5Se8Hu
         nXf9RHpSS2PYZ1saAT1TJe5mHgonWHRqsxCU6t5J5uuEtdrLOdR8Z/RuPs7d9CmpsVrs
         Ij/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CDizYRLdhl/XpmR617V9H1nya21GLh5Jm8U5bQ4LhoU=;
        b=PLZsEnH06C4NY9h3lq1MFAeU5zwMzyKm2tUEcSoh4OkvsiMovyUP5SOgBsvFMkE4MC
         S/iLueDfvME2beYe0pTY/D3ayh+bR9Bn2p2rv5RyDhiyA0NjnFpa3Q2p1TcEWjLYCNm2
         M/BZCoYsvTwk2OCQbEqR7OFD8rry7yhGm7u/0petMZQZkPDCORpyRobr4IfWX7Go5Bje
         cGl3kMbMyc4yhYJ60pnNMugHt0PhXTUx1KMdIVDqtMV97F9xtfK+4p7T91Ogqhq8Ry4p
         ccQMa6gorXR5o9qMT6Hika8SiyFjn5BiRw8avAkHEAo933r4CdgJS8xYC58olrVcA8Jf
         ozCQ==
X-Gm-Message-State: AOAM533MGUhHomO4f5vpP3JLXMRiWUGM8TEveLs4L98TmWTFdP+F+fsC
        WU0TM6AAT3I2h1B0jwx8v7viuGe6Yapk5OvEjsSprg==
X-Google-Smtp-Source: ABdhPJyRH7wRwc40p2pr7KQ1rJshmkwLCVnX0dMDih0C93l57ktFNpTLf45fmsBytgVH+zEml5yVgY1zsZUMIy6VYk4=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr5349659otk.179.1636457135054;
 Tue, 09 Nov 2021 03:25:35 -0800 (PST)
MIME-Version: 1.0
References: <20211104133645.1186968-1-arnd@kernel.org>
In-Reply-To: <20211104133645.1186968-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:25:23 +0100
Message-ID: <CACRpkdadqcKr-Biq4oS-zeO0RLQHOXk+V3ORLeTbbRk2+XqE4Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra194: remove duplicate initializer again
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 4, 2021 at 2:36 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> An earlier bugfix removed a duplicate field initializer in
> a macro, but it seems that this came back with the following
> update:

Thanks Arnd, patch applied for fixes.

Yours,
Linus Walleij
