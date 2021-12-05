Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5806C4688C4
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 01:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhLEAlR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Dec 2021 19:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhLEAlQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Dec 2021 19:41:16 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971A5C061751
        for <linux-gpio@vger.kernel.org>; Sat,  4 Dec 2021 16:37:50 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id t23so13917313oiw.3
        for <linux-gpio@vger.kernel.org>; Sat, 04 Dec 2021 16:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GYc91jfTky4WwCx9RL0QsktLqw+ztIoLTaFoG/6x6v4=;
        b=F+IzPtr4vAwIheVh2GBL/E43aPnJqVMbBMk47nMyC4S8BZmWNXZ2YqCF8aSsCvc/Oc
         UqO1IP7zHAXO5Ypu4+gj4q5FwRV5RSYAb0S022V0OLSrkNicq+cSd5S/5xEpcarXt/Da
         AGV25LV26eHfzsItc8i1zrFhGAjZn1KnKrw2XllUOLWZF2YyH4Q/o8sPFxXSfrCCp6dO
         rWSWl+EEZZ42K91gVz/D2bLUVjf9g4f3FqkPS8U3WlKrJgcH+nxRN6gxMLIMwDxE7Q6Q
         B6VqReXJLq8oWbuBT5vjV74A9OUOshvnq9MARvE7E2eS5WHrZYAVoGpvwjHJfPTJEh3a
         IoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GYc91jfTky4WwCx9RL0QsktLqw+ztIoLTaFoG/6x6v4=;
        b=SnUgcykbZoYr96aA4ZEb7f/Qf1IgFwBZZoawbtsE5wXThjPlcBur38ngslx8duo2Db
         1Sk6jtMbPZU1ehzrPMKlGlEelYMo97hbgXxMwxAO70Tk0Tarpalk8WjzB3lhUrp79m3D
         o5wp9e5HgolbCwxr/QEMobK7Qw2+fhb1zPsaqNEG9qgWUaRBL6yG5M999LuJUBTZsYRW
         B44P9rzXJ9in0VRebpldmKYt4O73hrhgByGwyyM2MuiUHWnsgUbQeMFthNIaPN5/BNM0
         YIA+ZGqD1xzeZoDOOTpUT1Ct/5pEXDI+qmivpu1XJJsR6gVXIQQvcxQ7fJBjAYi8MoYA
         vMdQ==
X-Gm-Message-State: AOAM533UHL64mxEw4Xw8CQE6+Es0jLOZy0n6V4iGMPJklspJgGL/xRC6
        6s5JJQCQcORuc6jrbzRscZahre/g9U00zZ01NjkArQ==
X-Google-Smtp-Source: ABdhPJxXW9fZnGj1KJj1dkHJzTt2xi8/FEBvkgE/wqjd13+GAIGvhqsL+DSfzyE4HJ5h+z5VRxRt0gi9TEH4mIsbg4k=
X-Received: by 2002:aca:120f:: with SMTP id 15mr16691330ois.132.1638664669979;
 Sat, 04 Dec 2021 16:37:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638534672.git.geert+renesas@glider.be>
In-Reply-To: <cover.1638534672.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Dec 2021 01:37:38 +0100
Message-ID: <CACRpkdYNpmjfTsgT8RzsCC7X03_YQ-h+eDGPKG9fLevv65tsoA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.17
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 3, 2021 at 1:33 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
>
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.17-tag1
>
> for you to fetch changes up to 7c50a407b8687ae3589c740d2347d9ae73887889:
>
>   pinctrl: renesas: Remove unneeded locking around sh_pfc_read() calls (2021-11-19 10:55:21 +0100)

Pulled in, excellent work as always!

Yours,
Linus Walleij
