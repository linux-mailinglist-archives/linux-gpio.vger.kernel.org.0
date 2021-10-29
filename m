Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613F843F788
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 08:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhJ2G5V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 02:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbhJ2G5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 02:57:21 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69895C061714
        for <linux-gpio@vger.kernel.org>; Thu, 28 Oct 2021 23:54:53 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id o83so12057419oif.4
        for <linux-gpio@vger.kernel.org>; Thu, 28 Oct 2021 23:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ePIHoriLIVjhSnt0MZ2sr1WXfIYtpmc6bctB4GvfYk4=;
        b=OmHAJEK0zMenmccOMKcd39WUjZj9QUxY9vCl1ZLJKSHtEpCU2CvRwDbSSrZkPutUU2
         gX+QqkSxQXFBC5O7dJRy43ietqnteApz22NzV73I/3OSfpy/Qf6R0eZ/pCSM38K865Ay
         c7ZxdBbTnxPm88SHFEV2cQuHvBbs0iAJNoxVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ePIHoriLIVjhSnt0MZ2sr1WXfIYtpmc6bctB4GvfYk4=;
        b=LrI1IXwEeHUkaaiE27A0TSBj87Z8nM38wWVqUDYtF1b92XfSRNF6FKO5QBJnFhCg2F
         A4JuuFrFnP1fXPg93rRkE3xwAe1YTUYDjTggBSOjcBm/7mDlZe+4+fX9NmIf69Xk8LqU
         G+FhpteqMEzD2JVGi5fNK7vgMDWEK8oKaJIrTYcAxDCn8HoAyMD0dqXitab12Z8DhgcF
         oyQcUey5OjYsW10tsu0kgK6AH/WlbJAltrTias42DWqIMz6oNrA5mlAsEGd+9P3t1TJg
         VfId1dXMD4hDzFhTwkMFPzhiUSNwmvJZigA6kggady1wAF43oaxC/ILSreadz/2o+gbx
         wLng==
X-Gm-Message-State: AOAM531wRzvL/XjEMsmVl5j7YvkukK1pQ5OeAf1uG2pzezih9S0+fKNW
        fb/D6iaQjhjnREN0OgPxD35dQ0BxRzrYkDYTHo8T5w==
X-Google-Smtp-Source: ABdhPJyHUrHkYGLOqR3AfqoEd3h8Vg+Y4D1mydhapVCma/WU0xYA2fXjbJHnOH9sVOH6bK0UdSXOBdl4bzfroyj0XWU=
X-Received: by 2002:a05:6808:2128:: with SMTP id r40mr4917340oiw.164.1635490492859;
 Thu, 28 Oct 2021 23:54:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 23:54:52 -0700
MIME-Version: 1.0
In-Reply-To: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
References: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 23:54:52 -0700
Message-ID: <CAE-0n50E2dmQeDaiggEgMgykrkGB3H38sbkTXDX3avR7XtSizw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add egpio feature support
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Rajendra Nayak (2021-10-26 05:07:35)
> From: Prasad Sodagudi <psodagud@codeaurora.org>
>
> egpio is a scheme which allows special power Island Domain IOs
> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> TLMM functions with Island Domain functions.
> With this scheme, an IO can be controlled both by the cpu running
> linux and the Island processor. This provides great flexibility to
> re-purpose the Island IOs for regular TLMM usecases.
>
> 2 new bits are added to ctl_reg, egpio_present is a read only bit
> which shows if egpio feature is available or not on a given gpio.
> egpio_enable is the read/write bit and only effective if egpio_present
> is 1. Once its set, the Island IO is controlled from Chip TLMM.
> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>
> To support this we add a new function 'egpio' which can be used to
> set the egpio_enable to 0, for any other TLMM controlled functions
> we set the egpio_enable to 1.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Does this supersede adding support for lpass pinctrl in this series[1]?

[1] https://lore.kernel.org/r/1635342097-2726-1-git-send-email-srivasam@codeaurora.org
