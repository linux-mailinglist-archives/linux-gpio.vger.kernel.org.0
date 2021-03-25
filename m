Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE89D348C60
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 10:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhCYJLU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 05:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhCYJLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:11:05 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A752C06175F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:11:04 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 15so2255653ljj.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pr+/f6IeJ4Npr54uktu8d3XUH8cijXHTmifckcXraMk=;
        b=gDXS73ZRj1/wn5Zqv7xyLSJJXU/MTs+ReNA2zmQK2VJdC3Q/pcrI2dHhGivT9gihTv
         EnKhpiLoXMDGDq6vJLWrdgmb4n0jNB+c8JQ4y9aclZR3ReRHR4ifLkzqhPd871/UU85i
         Sj6A3DmzGsN7sPl+uvtW4SgICxOXmMujENA8GzD3Xjsh2CnPewa2l1fjZnbpprFavCGX
         WMRnWfnOAV7yeRl1IQGDAt0ZWhEtZEuaDeeRxsmBB5t9LEUsBFH7JzdXygtBR7NBVdo0
         wJfXvd5Dc2DBobNqPcd+NV7Be4mG9OC+HGMfwAYY2n6OapH9stJGRbs7DpRQtrNwoqvP
         9MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pr+/f6IeJ4Npr54uktu8d3XUH8cijXHTmifckcXraMk=;
        b=OgsW5VQJ/IpaNzBueLHyXoUi0DbDCLbwWSSnPWKdKmKMe/xcLnMRepU6o6PAVed5n/
         Yo8hQbzc47w2ktSIK0nJXrAio4GKk6VBnwMmSWJl0e1Iur+MhWEavCrfUTS1xotgXQlX
         A2meliwVlrWRA+JF8k6g3vjTyKyKTWGESz/ytnm6/LdN2sYj+hwBhCwHTgzrA0sQjt/Y
         f6UUgGpu1subNRzrAus5vOIDLOdrRENkhl5/Y+GeP0ZysXHKdUwRcPWXkQywDK243xhd
         CqtoOwpBV2JkibTSppEGnzzCoLMwJCrFNj0AEV5BsTzRcRNwDAxbxFUmuv9v+RO3GHWP
         J75A==
X-Gm-Message-State: AOAM530un6gZy63rAx2FHAYN/aZMj440jP4NGhVH6BCXdugpMdEx0+Mp
        jXv6Ur6amSCRl6N99OR0A1WcTOnvKMBFez7lkhQ2Yme/Pmp481mG
X-Google-Smtp-Source: ABdhPJztdC0HGxneywAXMLYkZFyHGu3KVeZi6HFJuXEIJ1E0uHn6CkA2X3tydFPXVpmBzKuGzTM0iq3KfkoOiuBAn4U=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr5192688ljw.74.1616663463102;
 Thu, 25 Mar 2021 02:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210319090749.2711012-1-geert+renesas@glider.be>
In-Reply-To: <20210319090749.2711012-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:10:52 +0100
Message-ID: <CACRpkdYhTrJeV7UBwUrm=pXQnQSccVKKSGHEkq=GxZqHwqruHg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.13
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 10:07 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
>
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.13-tag1

Pulled into my "devel" branch!

Thnks!
Linus Walleij
